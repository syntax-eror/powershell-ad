<#
.SYNOPSIS
GetADComputerLDAPFilter takes part of an AD computer name and then displays a list of all computers in AD matching that name, sorted by Last Logon Date.
.DESCRIPTION
This script takes input, filters it through LDAPFilter to match any part of the name, then sorts
.PARAMETER ADLookupName
The name to query
.EXAMPLE
Get-ADComputerLDAPFilter ACCT
#>
<#[CmdletBinding()]
param (
    [Parameter(Mandatory=$True)]
    [string]$ADLookupName  #this makes the string $ADlookupname mandatory, if this is a script where it doesn't already ask for it, it will prompt for this value
)
#>

$ADLookupName = Read-Host "Enter all or part of computer name"
Write-Verbose "Looking for all computers with $ADLookupName as part of their name"
Get-ADComputer -LDAPFilter "(name=*$ADLookupName*)" -Properties Created, LastLogonDate | Sort-Object LastLogonDate -Descending
