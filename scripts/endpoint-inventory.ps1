<#
.SYNOPSIS
Collects basic Windows endpoint inventory data.

.DESCRIPTION
This script gathers OS, hardware, architecture, disk, and service data.
It is intended as a lightweight endpoint inventory example for Windows fleet management.
#>

$os = Get-CimInstance Win32_OperatingSystem
$computer = Get-CimInstance Win32_ComputerSystem
$bios = Get-CimInstance Win32_BIOS
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"

$inventory = [PSCustomObject]@{
    ComputerName     = $env:COMPUTERNAME
    LoggedInUser     = $env:USERNAME
    Manufacturer     = $computer.Manufacturer
    Model            = $computer.Model
    SerialNumber     = $bios.SerialNumber
    OSName           = $os.Caption
    OSVersion        = $os.Version
    BuildNumber      = $os.BuildNumber
    Architecture     = $os.OSArchitecture
    LastBootTime     = $os.LastBootUpTime
    TotalMemoryGB    = [math]::Round($computer.TotalPhysicalMemory / 1GB, 2)
    FreeDiskGB       = [math]::Round($disk.FreeSpace / 1GB, 2)
    TotalDiskGB      = [math]::Round($disk.Size / 1GB, 2)
    WindowsUpdateSvc = (Get-Service -Name wuauserv -ErrorAction SilentlyContinue).Status
    SpoolerSvc       = (Get-Service -Name Spooler -ErrorAction SilentlyContinue).Status
}

$inventory | Format-List
$inventory | ConvertTo-Json -Depth 4 | Out-File ".\endpoint-inventory.json"
