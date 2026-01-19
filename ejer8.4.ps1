Clear-Host

[int]$altura = Read-Host "Introduce un numero entero"

for ($i = 1; $i -le $altura; $i++) {

    $linea = ""

    for ($j = $i * 2 - 1; $j -ge 1; $j -= 2) {
        $linea += "$j "
    }

    Write-Host $linea.Trim()
}
