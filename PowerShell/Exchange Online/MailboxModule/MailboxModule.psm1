# MailboxModule.psm1

function Connect-Mailbox {
    param (
        [string]$UserPrincipalName
    )
    Import-Module ExchangeOnlineManagement
    Connect-ExchangeOnline -UserPrincipalName $UserPrincipalName
}

function Get-AllMailboxes {
    Get-Mailbox
}

function Get-SpecificMailbox {
    param (
        [string]$UserName
    )
    Get-Mailbox -Identity $UserName | Format-List
}

function Get-MailboxPermissions {
    param (
        [string]$UserName
    )
    Get-MailboxFolderPermission "${UserName}:\Calendar"
    Get-MailboxFolderPermission "${UserName}:\Agenda"
}

function Set-MailboxPermissions {
    param (
        [string]$UserName,
        [string]$AccessRights = "Reviewer"
    )
    Set-MailboxFolderPermission -Identity "${UserName}:\Calendar" -User Default -AccessRights $AccessRights
    Set-MailboxFolderPermission -Identity "${UserName}:\Agenda" -User Default -AccessRights $AccessRights
}

function Get-AllUserPermissions {
    Get-Mailbox | ForEach-Object { 
        Get-MailboxFolderPermission "$($_):\Calendar"
        Get-MailboxFolderPermission "$($_):\Agenda"
    } | Where-Object { $_.User -like "Default" } | Select-Object Identity, User, AccessRights
}
