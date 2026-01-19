Clear-Host

$nombre = Read-Host "Introduce tu nombre"
[int]$numero = Read-Host "Introduce un numero entero"

for ($i = 1; $i -le $numero; $i++) {
    Write-Host $nombre
}
