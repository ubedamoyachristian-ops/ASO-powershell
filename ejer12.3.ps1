Clear-Host

Write-Host "Bienvenido a Bella Napoli"
$tipo = Read-Host "¿Quieres pizza vegetariana? (S/N)"

$tipo = $tipo.ToUpper()

$ingredientes = @("Mozzarella", "Tomate")

if ($tipo -eq "S") {
    Write-Host "Ingredientes vegetarianos disponibles:"
    Write-Host "1. Pimiento"
    Write-Host "2. Tofu"
    $opcion = Read-Host "Elige un ingrediente (1 o 2)"
    
    switch ($opcion) {
        "1" { $ingredientes += "Pimiento" }
        "2" { $ingredientes += "Tofu" }
        default { Write-Host "Opción no válida"; exit }
    }
    $tipoPizza = "Vegetariana"
}
elseif ($tipo -eq "N") {
    Write-Host "Ingredientes no vegetarianos disponibles:"
    Write-Host "1. Peperoni"
    Write-Host "2. Jamón"
    Write-Host "3. Salmón"
    $opcion = Read-Host "Elige un ingrediente (1, 2 o 3)"
    
    switch ($opcion) {
        "1" { $ingredientes += "Peperoni" }
        "2" { $ingredientes += "Jamón" }
        "3" { $ingredientes += "Salmón" }
        default { Write-Host "Opción no válida"; exit }
    }
    $tipoPizza = "No vegetariana"
}
else {
    Write-Host "Respuesta no válida. Debes escribir S o N"
    exit
}

Write-Host "`nTu pizza es $tipoPizza y lleva los siguientes ingredientes:"
foreach ($i in $ingredientes) {
    Write-Host "- $i"
}
