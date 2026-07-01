param(
  [switch]$SkipInstaller
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$modelSource = Join-Path $root "models\parakeet-v3"
$modelTarget = Join-Path $env:APPDATA "AFK\models\parakeet-v3"
$installer = Join-Path $root "AFK Setup 1.0.0.exe"

$required = @(
  "encoder-model.int8.onnx",
  "decoder_joint-model.int8.onnx",
  "vocab.txt",
  "config.json"
)

foreach ($file in $required) {
  $path = Join-Path $modelSource $file
  if (-not (Test-Path -LiteralPath $path)) {
    throw "Missing speech model file: $path"
  }
}

New-Item -ItemType Directory -Force -Path $modelTarget | Out-Null
Copy-Item -LiteralPath (Join-Path $modelSource "*") -Destination $modelTarget -Recurse -Force

Write-Host "Installed AFK speech model to $modelTarget"

if (-not $SkipInstaller) {
  if (-not (Test-Path -LiteralPath $installer)) {
    throw "Missing installer: $installer"
  }
  Start-Process -FilePath $installer -Wait
}
