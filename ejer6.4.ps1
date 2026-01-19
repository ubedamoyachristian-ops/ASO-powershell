Clear-Host

$secreto = 42
[int]$intento = -1

while ($intento -ne $secreto) {
    $intento = Read-Host "Adivina el numero (0 a 100)"

    if ($intento -lt $secreto) {
        Write-Host "El numero es MAYOR"
    }
    elseif ($intento -gt $secreto) {
        Write-Host "El numero es MENOR"
    }
    else {
        Write-Host "¡Enhorabuena! Has adivinado el numero"
    }
}
