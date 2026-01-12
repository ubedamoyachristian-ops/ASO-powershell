Clear-Host
[int] $horas = Read-Host "Introduce el número de horas trabajadas"
[int] $costeHora = Read-Host "Introduce el coste por hora"

$salario = $horas * $costeHora

Write-Host "El salario a pagar es: $salario €"
