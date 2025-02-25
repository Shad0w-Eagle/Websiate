# Check if current script is running with administrator privileges
if (([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544") {
    # If script is already running as administrator, proceed with desired actions
    mkdir C:\Windows\uas-bypass
} else {
    # Look for any existing elevated processes like 'explorer.exe' or 'powershell.exe'
    $elevatedProcesses = Get-WmiObject Win32_Process | Where-Object { 
        $_.GetOwner().User -ne $null -and $_.Name -in @("explorer.exe", "powershell.exe")
    }

    # If elevated process found, execute desired action
    if ($elevatedProcesses) {
        Write-Host "Elevated process found, proceeding with task..."

        # Insert your task here, for example:
        mkdir C:\Windows\uas-bypass
    } else {
        # If no elevated processes found, you can trigger 'runas' or other actions
        Write-Host "No elevated process found, trying to trigger admin task..."
        
        # Trigger UAC to run as administrator if no elevated process is running
        $startInfo = New-Object System.Diagnostics.ProcessStartInfo
        $startInfo.FileName = "powershell.exe"
        $startInfo.Verb = "runas"  # This will prompt for admin rights
        $startInfo.Arguments = "-Command {mkdir C:\Windows\uas-bypass}"
        [System.Diagnostics.Process]::Start($startInfo)
    }
}
