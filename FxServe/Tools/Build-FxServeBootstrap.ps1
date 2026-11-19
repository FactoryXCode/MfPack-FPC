[CmdletBinding()]
param(
 [string]$FxServeRoot=(Join-Path (Split-Path $PSScriptRoot -Parent) 'FxServe'),
 [string]$ResourceCompiler=''
)
$ErrorActionPreference='Stop'
if(-not$ResourceCompiler){
 $kits=Get-ChildItem 'C:\Program Files (x86)\Windows Kits\10\bin' -Directory | Sort-Object Name -Descending
 $ResourceCompiler=$kits|ForEach-Object {Join-Path $_.FullName 'x64\rc.exe'}|Where-Object {Test-Path -LiteralPath $_}|Select-Object -First 1
}
if(-not$ResourceCompiler){throw 'Specify the installed Windows SDK rc.exe with -ResourceCompiler.'}
$build=Join-Path $FxServeRoot 'Build\SelfContained'
New-Item -ItemType Directory -Path $build -Force|Out-Null
Add-Type -AssemblyName System.IO.Compression
$zipPath=Join-Path $build 'FxServe.Bootstrap.zip'
$output=[IO.File]::Create($zipPath)
$zip=[IO.Compression.ZipArchive]::new($output,[IO.Compression.ZipArchiveMode]::Create,$false,[Text.Encoding]::UTF8)
try{
 $files=@((Get-Item (Join-Path $FxServeRoot 'FxServe.ini')))+@(Get-ChildItem (Join-Path $FxServeRoot 'www') -File -Recurse|Where-Object {$_.Name-notmatch'(?i)^readme' -and $_.Name-notlike'*.m4s' -and $_.Name-notin@('live.json','init.mp4','cast-access.log') -and $_.Extension-ne'.log' -and $_.Name-notlike'*.before-*' -and $_.Name-notlike'*.viewer-update.*'})
 foreach($file in $files){
  $relative=$file.FullName.Substring($FxServeRoot.Length).TrimStart('\').Replace('\','/')
  $entry=$zip.CreateEntry($relative,[IO.Compression.CompressionLevel]::Optimal)
  $entryStream=$entry.Open();$inputStream=[IO.File]::OpenRead($file.FullName)
  try{$inputStream.CopyTo($entryStream)}finally{$inputStream.Dispose();$entryStream.Dispose()}
 }
}finally{$zip.Dispose()}
$rcPath=Join-Path $build 'FxServe.Bootstrap.rc'
('FXSERVE_BOOTSTRAP RCDATA "'+$zipPath.Replace('\','\\')+'"')|Set-Content -LiteralPath $rcPath -Encoding ascii
& $ResourceCompiler /nologo /fo (Join-Path $build 'FxServe.Bootstrap.res') $rcPath
if($LASTEXITCODE-or(Get-Item (Join-Path $build 'FxServe.Bootstrap.res')).Length-lt100){throw 'Bootstrap resource compilation failed'}
Write-Host ('Built bootstrap with '+$files.Count+' configuration/static web files.')
