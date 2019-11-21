$user = Read-Host "Enter username"
Get-ADUser $user -Properties | Set-ADUser -ProfilePath $null
#sets the path to null
