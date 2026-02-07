$personalOU = "OU=PERSONAL,OU=Empresa,DC=empresa,DC=local"

$usuariosPersonal = Get-ADUser -Filter * -SearchBase $personalOU

foreach ($u in $usuariosPersonal) {
    $samAccount = $u.SamAccountName
    $profilePath = "\\$env:COMPUTERNAME\Empresa_users$\" + $samAccount + "\Perfil"
    
    Set-ADUser -Identity $samAccount -ProfilePath $profilePath
}