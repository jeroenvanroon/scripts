#Make sure correct modules are installed
Install-Module MSOnline
Install-Module -Name AzureAD

#Connect to Azure
Connect-MsolService
Connect-AzureAd

#Change username
set-msoluserprincipalname -newuserprincipalname <newname> -userprincipalname <oldname>