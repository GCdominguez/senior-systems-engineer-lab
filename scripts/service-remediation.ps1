<#
.SYNOPSIS
Checks and remediates a required Windows service.

.DESCRIPTION
Validates that a service exists and is running. If stopped, attempts to start it.
Returns exit code 0 for success and 1 for failure.
#>

param(
    [string]$ServiceName = "wuauserv"
)

$LogPath = ".\service-remediation.log"
$Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

try {
    $service = Get-Service -Name $ServiceName -ErrorAction Stop

    if ($service.Status -ne "Running") {
        Start-Service -Name $ServiceName -ErrorAction Stop
        "$Timestamp - Started service: $ServiceName" | Out-File $LogPath -Append
    }
    else {
        "$Timestamp - Service already running: $ServiceName" | Out-File $LogPath -Append
    }

    exit 0
}
catch {
    "$Timestamp - Failed to remediate service: $ServiceName. Error: $_" | Out-File $LogPath -Append
    exit 1
}
