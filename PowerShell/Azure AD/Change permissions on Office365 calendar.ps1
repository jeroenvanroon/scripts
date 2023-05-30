Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -UserPrincipalName user.name@tenant.com

#Get all mailboxes
Get-mailbox

#Get info specific mailbox
Get-Mailbox -Identity "user.name" | Format-List

#Get current permissions for specific user
Get-MailboxFolderPermission user.name:\Calendar

#Change permissions for specific user
Set-MailboxFolderPermission -Identity user.name:\Agenda -User Default -AccessRights Reviewer

#Change for all users
Get-Mailbox | ForEach-Object {Get-MailboxFolderPermission $_":\Agenda"} | Where {$_.User -like "Default"} | Select Identity, User, AccessRights