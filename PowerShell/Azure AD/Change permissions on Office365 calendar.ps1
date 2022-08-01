#Set credentials
$LiveCred = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $LiveCred -Authentication Basic -AllowRedirection

#Import session
Import-PSSession $Session

#Change execution policy
Set-ExecutionPolicy RemoteSigned

#Get all mailboxes
Get-mailbox

#Get current permissions for specific user
Get-MailboxFolderPermission user.name:\Calendar

#Change permissions for specific user
Set-MailboxFolderPermission -Identity user.name:\Agenda -User Default -AccessRights Reviewer

#Change for all users
Get-Mailbox | ForEach-Object {Get-MailboxFolderPermission $_":\Agenda"} | Where {$_.User -like "Default"} | Select Identity, User, AccessRights