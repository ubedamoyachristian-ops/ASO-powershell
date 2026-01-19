Clear-Host
$opcion = ""

while ($opcion -ne "x") {

    Write-Host "`n----- MENÚ -----"
    Write-Host "a) Crear una carpeta"
    Write-Host "b) Crear un fichero nuevo"
    Write-Host "c) Cambiar el nombre de un fichero o carpeta"
    Write-Host "d) Borrar un archivo o carpeta"
    Write-Host "e) Verificar si existe un fichero o carpeta"
    Write-Host "f) Mostrar el contenido de un directorio"
    Write-Host "g) Mostrar la fecha y hora actuales"
    Write-Host "x) Salir"

    $opcion = Read-Host "Elige una opción"

    switch ($opcion) {

        "a" {
            $ruta = Read-Host "Introduce el nombre de la carpeta"
            New-Item -ItemType Directory -Path $ruta
        }

        "b" {
            $ruta = Read-Host "Introduce el nombre del fichero"
            New-Item -ItemType File -Path $ruta
        }

        "c" {
            $ruta = Read-Host "Introduce el nombre actual"
            $nuevo = Read-Host "Introduce el nuevo nombre"
            Rename-Item $ruta $nuevo
        }

        "d" {
            $ruta = Read-Host "Introduce el fichero o carpeta a borrar"
            Remove-Item $ruta -Recurse -Force
        }

        "e" {
            $ruta = Read-Host "Introduce la ruta"
            if (Test-Path $ruta) {
                Write-Host "Existe"
            }
            else {
                Write-Host "No existe"
            }
        }

        "f" {
            $ruta = Read-Host "Introduce la ruta del directorio"
            Get-ChildItem $ruta
        }

        "g" {
            Get-Date
        }

        "x" {
            Write-Host "Saliendo del programa..."
        }

        default {
            Write-Host "Opción no válida"
        }
    }
}
