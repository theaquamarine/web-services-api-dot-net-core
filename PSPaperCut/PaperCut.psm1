Join-Path (Join-Path $PSScriptRoot Private) *.ps1 -Resolve  | ForEach-Object {. $_}
Join-Path (Join-Path $PSScriptRoot Public) *.ps1 -Resolve  | ForEach-Object {. $_}
