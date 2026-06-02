param(
  [Parameter(Mandatory=$true)]
  [string]$TargetPath
)

$source = Join-Path $PSScriptRoot "..\vault-template"
if (Test-Path -LiteralPath $TargetPath) {
  Write-Error "Target path already exists: $TargetPath"
  exit 1
}

Copy-Item -LiteralPath $source -Destination $TargetPath -Recurse
Write-Host "Created Obsidian vault at $TargetPath"
