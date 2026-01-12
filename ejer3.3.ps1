Clear-Host
[int]$num1 = Read-Host "Introduce un numero"
[int]$num2 = Read-Host "Introduce otro numero"

if ($num1 -gt $num2) {
    Write-Host "El primer numero es mayor que el segundo"
}
elif ($num1 -lt $num2) {
    Write-Host "El primer numero es menor que el segundo"
}
else {
    Write-Host "Los dos numeros son iguales"
}