#need to have column header with ComputerName in properly converted .csv file
#https://stackoverflow.com/questions/56431019/erroraction-with-get-adcomputer-not-hiding-errors
$computersQuery = $null
$csv_path = $null
$computername = $null
$csv_path = Read-Host "Enter full path and filename of csv (needs to be csv of one colum, with ComputerName as column header):"
$computersQuery = Import-CSV $csv_path
foreach ($i in $computersQuery)
{
    Try
        {
            $computername = $($i.computername)
            If (Get-ADComputer $computername -ErrorAction SilentlyContinue)
            {
                Write-Host $computername
            }
            else
            {
                Write-Host "Unknown error with" $computername
            }
        }
    Catch
        {
            Write-Host $computername "not found"
        }
}
