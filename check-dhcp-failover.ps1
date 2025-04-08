# Importer le module DHCP
Import-Module DhcpServer

# Vérifier si le service DHCP est en cours d'exécution
$service = Get-Service -Name 'DHCPServer'
if ($service.Status -ne 'Running') {
    Write-Output "CRITICAL: Le service DHCP n'est pas en cours d'exécution."
    exit 2
}

# Vérifier la configuration du basculement
$failover = Get-DhcpServerv4Failover
if ($failover -eq $null) {
    Write-Output "WARNING: Aucune configuration de basculement DHCP trouvée."
    exit 1
} else {
    Write-Output "OK: Le service DHCP est en cours d'exécution et la configuration de basculement est présente."
    exit 0
}
