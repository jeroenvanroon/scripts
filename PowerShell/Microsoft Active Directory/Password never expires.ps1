#Get all accounts who are expiring
get-aduser -filter * -properties Name, PasswordNeverExpires | where { $_.passwordNeverExpires -eq "false" } |  Select-Object DistinguishedName,Name,Enabled | Export-csv c:\pw_never_expires.csv -NoTypeInformation

#Change all accounts in specific OU
Get-ADUser -Filter * -SearchBase "OU=OUD,OU=OUD,DC=Domain,DC=Local" | Set-ADUser -PasswordNeverExpires:$True