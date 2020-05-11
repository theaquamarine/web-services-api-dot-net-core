if (Test-Path (Join-Path $PSScriptRoot Private)) {
    Join-Path (Join-Path $PSScriptRoot Private) *.ps1 -Resolve  | ForEach-Object {. $_}
}
if (Test-Path (Join-Path $PSScriptRoot Public)) {
    Join-Path (Join-Path $PSScriptRoot Public) *.ps1 -Resolve  | ForEach-Object {. $_}
}
