# 1. Stop the NTP service
net stop w32time

# 2. Run the following command
w32tm /config /syncfromflags:manual /manualpeerlist:"0.nl.pool.ntp.org, 1.nl.pool.ntp.org, 2.nl.pool.ntp.org, 3.nl.pool.ntp.org"

# 3. Trust the time server
w32tm /config /reliable:yes

# 4. Start the NTP service
net start w32time

# 5. Check the configuration
w32tm /query /configuration

# 6. Force time resync
w32tm /resync

# Troubleshooting commands
# Show timezone
w32tm /tz

# NTP Peers/Stratum
w32tm /query /peers

# Sync information
w32tm /query /peers /verbose 

# Monitor status
w32tm /monitor

# Read registry values
reg query HKLM\system\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer