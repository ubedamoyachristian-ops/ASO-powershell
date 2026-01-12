Clear-Host

Write-Host "****** CALCULADORA ********"
Write-Host "1. Sumar"
Write-Host "2. Restar"
Write-Host "3. Multiplicar"
Write-Host "4. Dividir"

[int]$opcion = Read-Host "¿Qué desea hacer? Elige una opción"

[int]$num1 = Read-Host "Introduce el primer numero"
[int]$num2 = Read-Host "Introduce el segundo numero"

switch ($opcion) {
    1 {
        $resultado = $num1 + $num2
        Write-Host "Resultado: $resultado"
    }
    2 {
        $resultado = $num1 - $num2
        Write-Host "Resultado: $resultado"
    }
    3 {
        $resultado = $num1 * $num2
        Write-Host "Resultado: $resultado"
    }
    4 {
        if ($num2 -ne 0) {
            $resultado = $num1 / $num2
            Write-Host "Resultado: $resultado"
        }
        else {
            Write-Host "No se puede dividir entre 0"
        }
    }
    default {
        Write-Host "Opción no válida"
    }
}
