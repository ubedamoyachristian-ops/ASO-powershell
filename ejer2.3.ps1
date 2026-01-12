Clear-Host
[int] $num1 = Read-Host "Introduce el primer número"
[int] $num2 = Read-Host "Introduce el segundo número"

$suma = $num1 + $num2
$resta = $num1 - $num2
$multiplicacion = $num1 * $num2

if ($num2 -ne 0) {
    $division = $num1 / $num2
    $resto = $num1 % $num2
} else {
    $division = "No se puede dividir entre 0"
    $resto = "No se puede calcular el resto"
}

Write-Host "Suma: $suma"
Write-Host "Resta: $resta"
Write-Host "Multiplicación: $multiplicacion"
Write-Host "División: $division"
Write-Host "Resto: $resto"
