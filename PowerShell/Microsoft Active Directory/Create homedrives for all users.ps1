# Define the base path for home directories and the file share server
$homeDriveBasePath = "\\Server\Homedrives"

# Retrieve users from Active Directory
$users = Get-ADUser -Filter * -Property SamAccountName, HomeDirectory

# Loop through each user
foreach ($user in $users) {
    $homeDirectoryPath = Join-Path $homeDriveBasePath $user.SamAccountName
    
    # Create the home directory if it doesn't exist
    if (-not (Test-Path $homeDirectoryPath)) {
        New-Item -Path $homeDirectoryPath -ItemType Directory
        Write-Host "Created home directory for $($user.SamAccountName) at $homeDirectoryPath"
        
        # Set NTFS permissions so that only the user has full control of their folder
        $acl = Get-Acl $homeDirectoryPath
        $userIdentity = "$($user.SamAccountName)"
        $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($userIdentity, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
        $acl.SetAccessRule($accessRule)
        Set-Acl -Path $homeDirectoryPath -AclObject $acl

        Write-Host "Set permissions for $($user.SamAccountName)"
    } else {
        Write-Host "Home directory already exists for $($user.SamAccountName)"
    }
    
    # Update the user's home directory path in AD (optional, if needed)
    Set-ADUser -Identity $user.SamAccountName -HomeDirectory $homeDirectoryPath -HomeDrive "M:"
}