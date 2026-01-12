Clear-Host

$ruta = Read-Host "Introduce la ruta del directorio"

if (Test-Path $ruta -PathType Container) {
    Write-Host "Es un directorio. Contenido:"
    Get-ChildItem $ruta -Recurse
}
else {
    Write-Host "No es un directorio o no existe"
}
