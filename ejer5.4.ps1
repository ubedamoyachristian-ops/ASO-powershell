Clear-Host

[int]$num = Read-Host "Introduce un numero"

for ($i = 1; $i -le 10; $i++) {
    Write-Host "$num x $i = $($num * $i)"
}
