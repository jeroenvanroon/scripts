# UseMailboxModule.ps1

# Import the module from the current directory
$modulePath = Join-Path -Path (Get-Location) -ChildPath "MailboxModule.psm1"
Import-Module -Name $modulePath

# Prompt for user input
$UserPrincipalName = Read-Host "Enter the User Principal Name of the O365 - Exchange administrator"
$UserName = Read-Host "Enter the User Name of the mailbox user"
$AccessRights = Read-Host "Enter the Access Rights (default is Reviewer)"

# Connect to Exchange Online
Connect-Mailbox -UserPrincipalName $UserPrincipalName

# Get all mailboxes
#Get-AllMailboxes

# Get info for a specific mailbox
#Get-SpecificMailbox -UserName $UserName

# Get current permissions for a specific user
Get-MailboxPermissions -UserName $UserName

# Change permissions for a specific user
if (-not $AccessRights) {
    $AccessRights = "Reviewer"
}
Set-MailboxPermissions -UserName $UserName -AccessRights $AccessRights

# Get current permissions for a specific user
Get-MailboxPermissions -UserName $UserName

# Change permissions for all users
#Get-AllUserPermissions
