#show all groups user is member of in AD
(Get-AdUser $username -Property MemberOf).MemberOf
