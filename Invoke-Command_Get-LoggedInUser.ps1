#Check user logged on
$ComputerName = Read-Host "Enter computer name"
Invoke-Command -ComputerName $ComputerName {wmic computersystem get username}
