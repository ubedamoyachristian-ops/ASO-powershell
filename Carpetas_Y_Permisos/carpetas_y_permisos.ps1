Clear-Host

$csvDeps = Import-Csv -Path ".\Desktop\archivos\departamentos.csv" -Delimiter ";"

if (-not (Test-Path "C:\Empresa")) {
    New-Item -Path "C:\Empresa" -ItemType Directory
}

foreach ($linea in $csvDeps) {
    $rutaDep = "C:\Empresa\$($linea.departamento)"
    if (-not (Test-Path $rutaDep)) {
        New-Item -Path $rutaDep -ItemType Directory
    }
}

$aclEmpresa = Get-Acl -Path "C:\Empresa"
$aclEmpresa.SetAccessRuleProtection($true, $false)

$reglaAdminGlobal = New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$reglaLecturaSolo = New-Object System.Security.AccessControl.FileSystemAccessRule("Usuarios del dominio", "Read", "ContainerInherit,ObjectInherit", "None", "Allow")

$aclEmpresa.SetAccessRule($reglaAdminGlobal)
$aclEmpresa.SetAccessRule($reglaLecturaSolo)
Set-Acl -Path "C:\Empresa" -AclObject $aclEmpresa

$nombresDeps = $csvDeps.departamento

foreach ($depActual in $nombresDeps) {
    $rutaDep = "C:\Empresa\$depActual"
    $aclDep = Get-Acl -Path $rutaDep
    $aclDep.SetAccessRuleProtection($true, $false)

    $reglaAdminDep = New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
    $aclDep.SetAccessRule($reglaAdminDep)

    $reglaPropio = New-Object System.Security.AccessControl.FileSystemAccessRule($depActual, "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
    $aclDep.SetAccessRule($reglaPropio)

    foreach ($otroDep in $nombresDeps) {
        if ($otroDep -ne $depActual) {
            $reglaOtros = New-Object System.Security.AccessControl.FileSystemAccessRule($otroDep, "Read", "ContainerInherit,ObjectInherit", "None", "Allow")
            $aclDep.AddAccessRule($reglaOtros)
        }
    }

    Set-Acl -Path $rutaDep -AclObject $aclDep
}

New-SmbShare -Name "Empresa" -Path "C:\Empresa" -FullAccess "Administradores" -ReadAccess "Usuarios del dominio" | Out-Null