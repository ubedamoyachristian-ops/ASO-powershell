Clear-Host

[int]$num = Read-Host "Introduce un numero entero positivo"

for ($i = $num; $i -ge 0; $i--) {
    if ($i -eq 0) {
        Write-Host $i
    }
    else {
        Write-Host "$i," -NoNewline
    }
}
