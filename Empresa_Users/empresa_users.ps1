$rootPath = "C:\Empresa_users"
$domainOU = "OU=Empresa,DC=empresa,DC=local"

if (!(Test-Path $rootPath)) {
    New-Item -Path $rootPath -ItemType Directory -Force
}

$rootAcl = Get-Acl $rootPath
$rootAcl.SetAccessRuleProtection($true, $false)
$rootAdminRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$rootDomainUsersRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Usuarios del dominio", "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")
$rootAcl.AddAccessRule($rootAdminRule)
$rootAcl.AddAccessRule($rootDomainUsersRule)
Set-Acl $rootPath $rootAcl

if (!(Get-SmbShare -Name "Empresa_users$" -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name "Empresa_users$" -Path $rootPath -FullAccess "Todos" | Out-Null
}

$usuarios = Get-ADUser -Filter * -SearchBase $domainOU

foreach ($u in $usuarios) {
    $samAccount = $u.SamAccountName
    $userPath = Join-Path $rootPath $samAccount
    
    if (!(Test-Path $userPath)) {
        New-Item -Path $userPath -ItemType Directory -Force
    }

    $acl = Get-Acl $userPath
    $acl.SetAccessRuleProtection($true, $false)

    $userAccount = New-Object System.Security.Principal.NTAccount($samAccount)
    $acl.SetOwner($userAccount)

    $adminRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($adminRule)

    $userRule = New-Object System.Security.AccessControl.FileSystemAccessRule($samAccount, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($userRule)

    Set-Acl $userPath $acl

    $homeDir = "\\Empresa-dc1\Empresa_users$\$samAccount"
    Set-ADUser -Identity $samAccount -ScriptPath "carpetas.bat" -HomeDrive "Z:" -HomeDirectory $homeDir
}