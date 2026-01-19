Clear-Host

$clave = "contraseña"
$entrada = ""

while ($entrada -ne $clave) {
    $entrada = Read-Host "Introduce la contraseña"

    if ($entrada -ne $clave) {
        Write-Host "Contraseña incorrecta"
    }
}

Write-Host "Contraseña correcta. Acceso permitido"
