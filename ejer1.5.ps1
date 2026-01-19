Clear-Host

function Sumar($a, $b) {
    return $a + $b
}

function Restar($a, $b) {
    return $a - $b
}

function Multiplicar($a, $b) {
    return $a * $b
}

function Dividir($a, $b) {
    if ($b -eq 0) {
        return "No se puede dividir entre 0"
    }
    return $a / $b
}

$opcion = ""

while ($opcion -ne "5") {

    Write-Host "`n****** CALCULADORA ********"
    Write-Host "1. Sumar"
    Write-Host "2. Restar"
    Write-Host "3. Multiplicar"
    Write-Host "4. Dividir"
    Write-Host "5. Salir"

    $opcion = Read-Host "¿Qué desea hacer? Elige una opción"

    if ($opcion -eq "5") { break }

    [int]$num1 = Read-Host "Introduce el primer numero"
    [int]$num2 = Read-Host "Introduce el segundo numero"

    switch ($opcion) {
        "1" { Write-Host "Resultado: $(Sumar $num1 $num2)" }
        "2" { Write-Host "Resultado: $(Restar $num1 $num2)" }
        "3" { Write-Host "Resultado: $(Multiplicar $num1 $num2)" }
        "4" { Write-Host "Resultado: $(Dividir $num1 $num2)" }
        default { Write-Host "Opción no válida" }
    }
}
