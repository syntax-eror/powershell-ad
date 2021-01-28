Get-AdGroup -Filter * | % { Get-AdGroupMember $_.Name | Select-Object -ExpandProperty SamAccountName | Out-File -FilePath "$($_.Name).txt" -Encoding ASCII }

Get-ChildItem -Path "." -include "*.txt" | Where-Object { $_.Length -eq 0 }  | remove-item #remove empty file entries
