# Script
$url = "https://github.com/werbhat/Script/releases/download/Enum/Enum.ps1"; $destination = "$env:USERPROFILE\Enum.ps1"; Invoke-WebRequest -Uri $url -OutFile $destination; Invoke-Expression -Command $destination
