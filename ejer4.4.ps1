Clear-Host

[int]$num = Read-Host "Introduce un numero entero positivo"

for ($i = 1; $i -le $num; $i += 2) {
    if ($i -lt $num) {
        Write-Host "$i," -NoNewline
    }
    else {
        Write-Host $i
    }
}
