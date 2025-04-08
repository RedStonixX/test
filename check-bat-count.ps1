# Dossier contenant les scripts NSClient++
$scriptPath = "C:\Program Files\Centreon NSClient++\scripts"

# Vérifie si le dossier existe
if (-not (Test-Path $scriptPath)) {
    Write-Output "UNKNOWN: Le dossier '$scriptPath' n'existe pas."
    exit 3
}

# Récupère les fichiers .bat
$batFiles = Get-ChildItem -Path $scriptPath -Filter *.bat -File -ErrorAction SilentlyContinue

# Compte
$count = $batFiles.Count

# Message de sortie
Write-Output "OK: $count fichier(s) .bat trouvé(s) dans '$scriptPath'"
exit 0
