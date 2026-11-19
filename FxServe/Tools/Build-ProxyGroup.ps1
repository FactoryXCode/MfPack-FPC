[CmdletBinding()]
param(
 [Parameter(Mandatory=$true)][string]$BuildDirectory,
 [ValidateSet('FPC','Lazarus','Delphi')][string]$Toolchain='FPC',
 [string]$Root=(Split-Path (Split-Path $PSScriptRoot -Parent) -Parent),
 [string]$OriginalRoot='D:\PROJECTS\MfPack',
 [string]$CompilerPath='C:\FPC\3.2.2\bin\i386-win32\fpc.exe',
 [string]$LazarusRoot='C:\lazarus',
 [string]$DelphiRoot='C:\Program Files (x86)\Embarcadero\Studio\15.0',
 [string]$CandidateDirectory='',
 [string]$TestDirectory='',
 [string[]]$Tests=@(),
 [string[]]$Programs=@(),
 [switch]$CompileOnly,
 [switch]$Incremental,
 [ValidateSet('FxServe','FxRecord')][string]$Group='FxServe',
 [switch]$SkipBase
)
$ErrorActionPreference='Stop'
$BuildDirectory=[IO.Path]::GetFullPath($BuildDirectory)
New-Item -ItemType Directory -Path $BuildDirectory -Force | Out-Null
$testRoot=Join-Path $Root 'Proxy Servers\Tests'
if($TestDirectory){$testRoot=$TestDirectory}
$sourceRoot=Join-Path $Root 'src'
$sampleRoot=Join-Path $Root ('Proxy Servers\'+$Group)
if($Toolchain-eq'Delphi'){$sourceRoot=Join-Path $OriginalRoot 'src';$sampleRoot=Join-Path $OriginalRoot ('Proxy Servers\'+$Group)}
if($CandidateDirectory){$sampleRoot=Join-Path $CandidateDirectory $Group}
$paths=@($sampleRoot,(Join-Path $sampleRoot ($Group+'Admin')),(Join-Path (Split-Path $sampleRoot -Parent) 'compat'),$sourceRoot,(Join-Path $sourceRoot 'debug'))
function XmlText([string]$Value){[Security.SecurityElement]::Escape($Value)}
function BuildProgram([string]$Name,[string]$Source,[bool]$Gui){
 $unitDir=Join-Path $BuildDirectory ($Name+'-units')
 if($Incremental -and $Toolchain-eq'FPC'){$unitDir=Join-Path $BuildDirectory 'test-units'}
 New-Item -ItemType Directory -Path $unitDir -Force | Out-Null
 $log=Join-Path $BuildDirectory ($Name+'.compile.log')
 if($Toolchain-eq'Delphi'){
  $search=($paths+@((Join-Path $DelphiRoot 'lib\win64\release'),$testRoot))-join';'
  $argsList=@('-B','-GD','-DDEBUG','-$C+','-$R+','-$Q+','-NSSystem;Winapi;System.Win',"-U$search","-I$sourceRoot;$testRoot","-NU$unitDir","-NO$unitDir","-E$BuildDirectory",$Source)
  $quoted=$argsList|ForEach-Object {'"'+$_+'"'}
  $process=Start-Process -FilePath (Join-Path $DelphiRoot 'bin\dcc64.exe') -ArgumentList $quoted -WorkingDirectory (Split-Path -Parent $Source) -WindowStyle Hidden -Wait -PassThru -RedirectStandardOutput $log -RedirectStandardError ($log+'.error')
  $code=$process.ExitCode
 }elseif($Toolchain-eq'Lazarus'){
  $package=''
  if($Gui){$package='<RequiredPackages><Item><PackageName Value="LCL"/></Item></RequiredPackages>'}
  $main=XmlText $Source;$output=XmlText (Join-Path $BuildDirectory ($Name+'.exe'))
  $include=XmlText ($sourceRoot+';'+$testRoot);$search=XmlText ($paths-join';');$units=XmlText $unitDir
  $project=Join-Path $BuildDirectory ($Name+'.lpi')
  @"
<?xml version="1.0" encoding="UTF-8"?>
<CONFIG><ProjectOptions><Version Value="12"/><General><SessionStorage Value="InProjectDir"/><UseAppBundle Value="False"/></General>$package<BuildModes><Item Name="Default" Default="True"/></BuildModes><Units><Unit><Filename Value="$main"/><IsPartOfProject Value="True"/></Unit></Units></ProjectOptions><CompilerOptions><Version Value="11"/><Target><Filename Value="$output"/></Target><SearchPaths><IncludeFiles Value="$include"/><OtherUnitFiles Value="$search"/><UnitOutputDirectory Value="$units"/></SearchPaths><Parsing><SyntaxOptions><SyntaxMode Value="DelphiUnicode"/></SyntaxOptions></Parsing><CodeGeneration><TargetCPU Value="x86_64"/><TargetOS Value="win64"/></CodeGeneration><Other><CustomOptions Value="-O2 -dDEBUG -Sa"/></Other></CompilerOptions></CONFIG>
"@ | Set-Content -LiteralPath $project -Encoding UTF8
  & (Join-Path $LazarusRoot 'lazbuild.exe') "--pcp=$BuildDirectory\lazarus-profile" "--lazarusdir=$LazarusRoot" "--compiler=$LazarusRoot\fpc\3.2.2\bin\x86_64-win64\fpc.exe" --build-all $project 2>&1 | Set-Content -LiteralPath $log
  $code=$LASTEXITCODE
 }else{
  $mode='-Mdelphiunicode';if($Gui){$mode='-Mobjfpc'}
  $argsList=@('-B','-O2','-Px86_64','-Twin64',$mode,'-dDEBUG','-Sa',"-Fi$sourceRoot","-Fi$testRoot","-FU$unitDir","-FE$BuildDirectory")
  if($Incremental){$argsList=$argsList|Where-Object {$_-ne'-B'}}
  foreach($path in $paths){$argsList+='-Fu'+$path}
  if($Gui){$argsList+=@(& "$Root\lcl-build-options.ps1" -LazarusRoot $LazarusRoot)}
  & $CompilerPath @argsList $Source 2>&1 | Set-Content -LiteralPath $log
  $code=$LASTEXITCODE
 }
 if($code-ne0){Select-String -LiteralPath $log -Pattern ' Error:| Fatal:'|ForEach-Object Line;throw "$Name compilation failed: $code"}
 Write-Host "$Toolchain built $Name."
}
function RunProgram([string]$Name,[string]$Arguments=''){
 $options=@{FilePath=(Join-Path $BuildDirectory ($Name+'.exe'));WindowStyle='Hidden';PassThru=$true;RedirectStandardOutput=(Join-Path $BuildDirectory ($Name+'.run.log'));RedirectStandardError=(Join-Path $BuildDirectory ($Name+'.run.error'))}
 if($Arguments){$options.ArgumentList=$Arguments}
 $process=Start-Process @options
 if(-not $process.WaitForExit(30000)){$process.Kill();throw "$Name timed out after 30 seconds"}
 $process.WaitForExit()
 [ordered]@{Program=$Name;Toolchain=$Toolchain;Arguments=$Arguments;ExitCode=$process.ExitCode;ExecutableSha256=(Get-FileHash -LiteralPath $options.FilePath -Algorithm SHA256).Hash;CompletedUtc=[DateTime]::UtcNow.ToString('o')}|ConvertTo-Json|Set-Content -LiteralPath (Join-Path $BuildDirectory ($Name+'.run.result.json')) -Encoding UTF8
 if($process.ExitCode-ne0){Get-Content -LiteralPath $options.RedirectStandardOutput;throw "$Name runtime failed: $($process.ExitCode)"}
 Get-Content -LiteralPath $options.RedirectStandardOutput | Write-Host
}
if($Programs.Count){
 foreach($name in $Programs){
  $source=Join-Path $sampleRoot ($name+'.dpr');$gui=$name-ne'FxServe'
  if($name-eq($Group+'Admin')){$source=Join-Path $sampleRoot ($name+'\'+$name+'.dpr')}
  BuildProgram $name $source $gui
 }
}elseif($Tests.Count){
 foreach($name in $Tests){
  $source=Join-Path $sampleRoot ('Tests\'+$name+'.dpr')
  if(-not(Test-Path -LiteralPath $source)){$source=Join-Path $sampleRoot ('NativeAviCheck\'+$name+'.dpr')}
  if(-not(Test-Path -LiteralPath $source)){$source=Join-Path $sampleRoot ($Group+'Admin\Checks\'+$name+'.dpr')}
  if(-not(Test-Path -LiteralPath $source)){$source=Join-Path $testRoot ($name+'.dpr')}
  BuildProgram $name $source ($name-in@('PublicUiChecks','FxServeUiSmoke','AdminChecks'))
  if(-not $CompileOnly){RunProgram $name}
 }
}else{
 BuildProgram ('All'+$Group+'Compile') (Join-Path $testRoot ('All'+$Group+'Compile.lpr')) $true
 RunProgram ('All'+$Group+'Compile')
}
