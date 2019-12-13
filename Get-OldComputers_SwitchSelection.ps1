<#

.SYNOPSIS
Get-OldComputers takes user input and uses this to query AD for old computers, which can then be displayed or removed depending on the option selected.

.DESCRIPTION
Prompts for partial name of a computer and the last logon date, then returns all computers containing that name that have not logged in since the date specified.

#>

$ADLookupName = Read-Host "Enter any part of computer name"
$UserDate = Read-Host "Enter date to begin searching back from in MM/DD/YYYY format, computers older than this will be searched" #word this better, enter date to begin searching?

Switch (Read-Host "`n1 = Query computers and display on the screen`n2 = Query and remove`nEnter selection") #switch set up to let user choose to just display machines, or remove them
{
    1 {Get-ADComputer -LDAPFilter "(name=*$ADLookupName*)" -Properties LastLogonDate | Where {$_.LastLogonDate -le "$UserDate"} | Sort-Object -Property Name}
    2 {Get-ADComputer -LDAPFilter "(name=*$ADLookupName*)" -Properties LastLogonDate | Where {$_.LastLogonDate -le "$UserDate"} | Sort-Object -Property Name | Remove-ADComputer -WhatIf}

    Default {Write-Host "Invalid entry, type 1 or 2"} #if 1 or 2 is not entered, display this default message
}
