Clear-Host
$nombre = $env:USERNAME
Write-Host "Hola $nombre"
$directorio = $env:USERPROFILE
Write-Host = "Tu directorio de trabajo es $directorio"
$nombre_dominio = $env:USERDOMAIN
Write-Host = "Perteneces al dominio $nombre_dominio"
$nombre_equipo = $env:COMPUTERNAME
Write-Host = "Tu equipo se llama $nombre_equipo"