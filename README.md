# powershell-admin
Before I describe this method let me clarify I am not the original author of the code used to do the encryption/decryption part, I simply downloaded it, refined a bit and adapted to my needs.

run OpenConnect-GUI with powershell

1) Copy init_script.ps1 and run_script.ps1 into C:\Program Files (x86)\OpenConnect-GUI\

2) Create encrypted password from Administrator powershell session

 powershell -executionpolicy bypass -File 'C:\Program Files (x86)\OpenConnect-GUI\init_script.ps1'

3) Run from regular user

 powershell -executionpolicy bypass -File 'C:\Program Files (x86)\OpenConnect-GUI\run_script.ps1'

This is not the best way. Password from PSCredential can be retrieved:

$adminCreds.GetNetworkCredential().password

This saves the password then the user as a result can execute any program without entering the administrator password

Or use this program

https://sourceforge.net/projects/surun/
