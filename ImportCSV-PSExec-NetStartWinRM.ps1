$laptopswinrm = $null
$csv_path = $null
$psexec_path = $null
$laptopname = $null
$csv_path = Write-Host "Enter full path and filename of csv (needs to be csv of one colum, with ComputerName as column header):"
$psexec_path = Write-Host "Enter full path and filename location of psexec:"
$laptopswinrm = Import-CSV $csv_path
foreach ($i in $laptopswinrm)
    {
        $laptopname = $($i.ComputerName)
        Write-Host " "
        Write-Host "=============================================================================="
        Write-Host "Checking:" $laptopname
        $psexec_path \\$laptopname cmd /c "net start winrm"
        Write-Host "=============================================================================="
        Write-Host " "
    }
