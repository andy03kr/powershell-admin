# powershell-admin
run OpenConnect-GUI with powershell

1) Copy init_script.ps1 and run_script.ps1 into C:\Program Files (x86)\OpenConnect-GUI\
2) Create encrypted password from Administrator powershell session
 powershell -executionpolicy bypass -File 'C:\Program Files (x86)\OpenConnect-GUI\init_script.ps1'
3) Run from regular user
 powershell -executionpolicy bypass -File 'C:\Program Files (x86)\OpenConnect-GUI\run_script.ps1'

This is not the best way. Password from PSCredential can be retrieved:
$adminCreds.GetNetworkCredential().password

Command runas is a real "hole" if called with parameter /savecred
This saves the password then the user, as a result, can execute any program without entering the administrator password
Although in the case of openconnect-gui, this method did not work.
