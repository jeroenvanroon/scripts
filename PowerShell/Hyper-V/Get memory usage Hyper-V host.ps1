$computername = "VM01"

Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $computername |
Select PSComputername,
@{Name="OS";Expression = {$_.Caption}},
@{Name = "TotalMemoryGB";Expression={$_.totalVisibleMemorySize/1MB -as [int]}},
@{Name = "FreeMemoryGB";Expression={[Math]::Round($_.FreePhysicalMemory/1MB,2)}},
@{Name = "PctMemoryFree";Expression = {[Math]::Round(($_.FreePhysicalMemory/$_.totalVisibleMemorySize) *100,2)}},
@{Name = "TotalVirtualMemoryGB";Expression={$_.totalVirtualMemorySize/1MB -as [int]}},
@{Name = "FreeVirtualMemoryGB";Expression={[Math]::Round($_.FreeVirtualMemory/1MB,2)}},
@{Name = "PctVirtualMemoryFree";Expression = {[Math]::Round(($_.FreeVirtualMemory/$_.totalVirtualMemorySize) *100,2)}}