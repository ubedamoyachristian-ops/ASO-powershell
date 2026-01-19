Clear-Host

[int]$altura = Read-Host "Introduce un numero entero"

for ($i = 1; $i -le $altura; $i++) {
    Write-Host ("*" * $i)
}
