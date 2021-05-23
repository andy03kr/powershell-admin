# Prompt you to enter the username and password
$credObject = Get-Credential

# The credObject now holds the password in a ‘securestring’ format
$passwordSecureString = $credObject.password

# Define a location to store the AESKey
$AESKeyFilePath = "C:\Program Files (x86)\OpenConnect-GUI\aeskey.bin"
# Define a location to store the file that hosts the encrypted password
$credentialFilePath = "C:\Program Files (x86)\OpenConnect-GUI\secure.bin"

# Generate a random AES Encryption Key.
$AESKey = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($AESKey)

# Store the AESKey into a file. This file should be protected! (e.g. ACL on the file to allow only select people to read)
# Any existing AES Key file will be overwritten
Set-Content $AESKeyFilePath $AESKey
$password = $passwordSecureString | ConvertFrom-SecureString -Key $AESKey
Set-Content $credentialFilePath $password
