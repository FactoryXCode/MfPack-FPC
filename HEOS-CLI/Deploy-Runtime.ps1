[CmdletBinding()]
param([string]$Root=$PSScriptRoot,[string[]]$Directories=@())
$ErrorActionPreference='Stop';$archive=Join-Path $Root 'Redist\sqlite-dll-win-x64-3530000.zip'
if(-not$Directories.Count){$Directories=@((Join-Path $Root 'Examples\HEOSRemoteApi\bin\x86_64-win64'),(Join-Path $Root 'AVR\Samples\HEOSRemote\bin\x86_64-win64'))}
$stage=Join-Path $Root 'Build\SqliteRuntime';Expand-Archive -LiteralPath $archive -DestinationPath $stage -Force
foreach($directory in $Directories){New-Item -ItemType Directory -Path $directory -Force|Out-Null;Copy-Item -LiteralPath (Join-Path $stage 'sqlite3.dll') -Destination (Join-Path $directory 'sqlite3.dll') -Force;Write-Output "Deployed SQLite to $directory"}
