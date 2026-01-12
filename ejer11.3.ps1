Clear-Host

[int]$edad = Read-Host "Introduce la edad del cliente"

if ($edad -lt 4) {
    Write-Host "La entrada es GRATIS"
}
elseif ($edad -ge 4 -and $edad -le 18) {
    Write-Host "El precio de la entrada es 5 €"
}
else {
    Write-Host "El precio de la entrada es 10 €"
}
