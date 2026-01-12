Clear-Host

[double]$puntuacion = Read-Host "Introduce tu puntuación (0.0, 0.4, 0.6 o más)"

$base = 2400

if ($puntuacion -eq 0.0) {
    $nivel = "Inaceptable"
    $dinero = $base * $puntuacion
}
elseif ($puntuacion -eq 0.4) {
    $nivel = "Aceptable"
    $dinero = $base * $puntuacion
}
elseif ($puntuacion -ge 0.6) {
    $nivel = "Meritorio"
    $dinero = $base * $puntuacion
}
else {
    Write-Host "Puntuación no válida"
    exit
}

Write-Host "Nivel de rendimiento: $nivel"
Write-Host "Cantidad de dinero a recibir: $dinero €"
