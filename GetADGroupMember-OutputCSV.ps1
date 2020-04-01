$groupName = $null
$outputName = $null
$groupName = Read-Host "Enter full name of AD group to query, including spaces"
$outputName = Read-Host "Enter name of file to save as (will be saved in current directory)"
Get-ADGroupMember $groupName | Select-Object samaccountname | ConvertTo-Csv -NoTypeInformation | Out-File $outputName
