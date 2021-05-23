# Set up path and user variables
$AESKeyFilePath = "C:\Program Files (x86)\OpenConnect-GUI\aeskey.bin"
$SecurePwdFilePath = "C:\Program Files (x86)\OpenConnect-GUI\secure.bin"
$userUPN = "WINDOWS10\admin"

# use key and password to create local secure password
$AESKey = Get-Content -Path $AESKeyFilePath 
$pwdTxt = Get-Content -Path $SecurePwdFilePath
$securePass = $pwdTxt | ConvertTo-SecureString -Key $AESKey

# Crete a new psCredential object with required username and password
$adminCreds = New-Object System.Management.Automation.PSCredential($userUPN, $securePass)

# Use the $adminCreds for some task
Start-Process powershell.exe  -Credential $adminCreds -ArgumentList "Start-Process -FilePath 'C:\Program Files (x86)\OpenConnect-GUI\openconnect-gui.exe' -Verb runas"
