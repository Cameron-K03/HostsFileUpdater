# Hosts File Updater

Scripts to update the hosts file for blocking malicious/advertising websites.

## Overview

This repository contains scripts to download the latest hosts file from StevenBlack/hosts and replace the current hosts file on your system. The scripts also create a backup of the existing hosts file before updating.

## Scripts

- `Backup-And-Update-HostsFile.ps1`: PowerShell script for Windows.
- `backup_and_update_hosts.sh`: Shell script for Linux/macOS.

## Setup

### Windows

1. Save `Backup-And-Update-HostsFile.ps1` to a directory of your choice (e.g., `C:\Scripts\`).
2. Open Task Scheduler and create a new task to run the script daily.
3. Use the following settings for the task:
   - Program/script: `powershell.exe`
   - Add arguments: `-ExecutionPolicy Bypass -File "C:\Scripts\Backup-And-Update-HostsFile.ps1"`

### Linux/macOS

1. Save `backup_and_update_hosts.sh` to a directory of your choice (e.g., `/usr/local/bin/`).
2. Make the script executable:
   ```sh
   chmod +x /usr/local/bin/backup_and_update_hosts.sh
# Hosts File Updater

Scripts to update the hosts file for blocking malicious/advertising websites.

## Overview

This repository contains scripts to download the latest hosts file from StevenBlack/hosts and replace the current hosts file on your system. The scripts also create a backup of the existing hosts file before updating.

## Scripts

- `Backup-And-Update-HostsFile.ps1`: PowerShell script for Windows.
- `backup_and_update_hosts.sh`: Shell script for Linux/macOS.

## Setup

### Windows

1. Save `Backup-And-Update-HostsFile.ps1` to a directory of your choice (e.g., `C:\Scripts\`).
2. Open Task Scheduler and create a new task to run the script daily.
3. Use the following settings for the task:
   - Program/script: `powershell.exe`
   - Add arguments: `-ExecutionPolicy Bypass -File "C:\Scripts\Backup-And-Update-HostsFile.ps1"`

### Linux/macOS

1. Save `backup_and_update_hosts.sh` to a directory of your choice (e.g., `/usr/local/bin/`).
2. Make the script executable:
   ```sh
   chmod +x /usr/local/bin/backup_and_update_hosts.sh
