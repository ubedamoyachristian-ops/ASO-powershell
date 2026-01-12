Clear-Host

$clave = "contraseña"

$entrada = Read-Host "Introduce la contraseña"

if ($clave.ToLower() -eq $entrada.ToLower()) {
    Write-Host "La contraseña es correcta"
}
else {
    Write-Host "La contraseña es incorrecta"
}
