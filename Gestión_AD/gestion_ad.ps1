Clear-Host

# 1. Definimos rutas de archivos y variables base
$rutaDptos = ".\Desktop\archivos\departamentos.csv"
$rutaEmpleados = ".\Desktop\archivos\empleados.csv"
$passBase = ConvertTo-SecureString "aso2025." -AsPlainText -Force
$dominio = "DC=empresa,DC=local"

# 2. Creamos la UO "Empresa"
$ouEmpresaName = "Empresa"
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$ouEmpresaName'")) {
New-ADOrganizationalUnit -Name $ouEmpresaName -Path $dominio
    Write-Host "UO Empresa creada."
}

$ouEmpresaPath = "OU=$ouEmpresaName,$dominio"

# 3. Procesamos Departamentos (UOs y Grupos)
$departamentos = Import-Csv -Path $rutaDptos -Delimiter ";"

foreach ($dpto in $departamentos) {
    $nombreDpto = $dpto.departamento
    $descDpto = $dpto.descripcion

    # Creamos la UO del departamento dentro de Empresa
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$nombreDpto'")) {
        New-ADOrganizationalUnit -Name $nombreDpto -Path $ouEmpresaPath -Description $descDpto
        Write-Host "UO $nombreDpto creada."
    }

    # Creamos el Grupo Global para el departamento 
    $pathDpto = "OU=$nombreDpto,$ouEmpresaPath"
    $groupName = "$nombreDpto"
    if (-not (Get-ADGroup -Filter "Name -eq '$groupName'")) {
        New-ADGroup -Name $groupName -GroupScope Global -Path $pathDpto -Description "Grupo para $nombreDpto"
        Write-Host "Grupo $groupName creado."
    }
}

# 4. Procesamos Empleados (Usuarios)
$empleados = Import-Csv -Path $rutaEmpleados -Delimiter ";"

foreach ($emp in $empleados) {
    # Formateamos el login: nombre.apellido 
    # Eliminamos espacios
    $nombreLimpio = $emp.nombre -replace ' ', ''
    $apellidoLimpio = $emp.apellido -replace ' ', ''
    $samAccount = "$($nombreLimpio).$($apellidoLimpio)".ToLower()
    
    $pathUsuario = "OU=$($emp.departamento),$ouEmpresaPath"
    $grupoDpto = "$($emp.departamento)"

    # Creamos Usuario 
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$samAccount'")) {
        $userParams = @{
            Name = "$($emp.nombre) $($emp.apellido)"
            SamAccountName = $samAccount
            UserPrincipalName = "$samAccount@empresa.local"
            Path = $pathUsuario
            AccountPassword = $passBase
            Enabled = $true
            ChangePasswordAtLogon = $true
            DisplayName = "$($emp.nombre) $($emp.apellido)"
            Surname = $emp.apellido
            GivenName = $emp.nombre
        }
        New-ADUser @userParams
        
        # Añadimos al usuario al grupo de su departamento 
        Add-ADGroupMember -Identity $grupoDpto -Members $samAccount
        Write-Host "Usuario $samAccount creado y añadido a $grupoDpto."
    }
}