# Make sure you are connected to Exchange Online
Connect-ExchangeOnline

# Search for the emailaddress
# -eq stands for equels, so the emailaddress must be exactly the same as the given string
Get-EXOMailbox -filter {EmailAddresses -eq "exchange-support@lazydev.onmicrosoft.com"}