# Script: Update-HostsFile.ps1
# Description: Backs up the current hosts file and then downloads the latest hosts file from StevenBlack/hosts and replaces the current hosts file.
# Scheduling: use Task Scheduler to run script daily. 


$hostsUrl = @(
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist.to/easylist/easylist.txt",
    "https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts",
    "https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-hosts.txt",
    "https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt",
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
)
$hostsPath = "C:\Windows\System32\drivers\etc\hosts"
$tempHostsPath = "$env:TEMP\hosts"
$tempCombinedHostsPath = "$env:TEMP\combined-hosts"
$backupDir = "C:\Windows\System32\drivers\etc\hosts-backups"

# Function for backup
function Backup-HostsFile {
    try {
        # Create backup directory if it doesn't exist
        if (-not (Test-Path -Path $backupDir)) {
            New-Item -ItemType Directory -Path $backupDir
        }

        $timestamp = Get-Date -Format "yyyyMMddHHmmss"
        $backupPath = Join-Path -Path $backupDir -ChildPath "hosts-$timestamp.bak"

        # Backup the current hosts file
        Copy-Item -Path $hostsPath -Destination $backupPath -Force
        Write-Output "Hosts file backed up to: $backupPath"
    } catch {
        Write-Output "Error backing up hosts file: $_"
        throw $_
    }
}

# Function for updating
function Update-HostsFile {
    try {
        Invoke-WebRequest -Uri $hostsUrl -OutFile $tempHostsPath
        Copy-Item -Path $tempHostsPath -Destination $hostsPath -Force
        Write-Output "Hosts file updated successfully."
    } catch {
        Write-Output "Error updating hosts file: $_"
        throw $_
    } finally {
        Remove-Item -Path $tempHostsPath -Force
    }
}

Backup-HostsFile
Update-HostsFile