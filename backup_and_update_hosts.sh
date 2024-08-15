#!/bin/bash
# Script: backup_and_update_hosts.sh
# Description: Backs up the current hosts file and then downloads the latest hosts file from StevenBlack/hosts and replaces the current hosts file.
# Scheduling: edit the crontab with 0 0 * * * /path/to/backup_and_update_hosts.sh to run daily at midnight.

HOSTS_URLS=(
    "https://easylist.to/easylist/easyprivacy.txt"
    "https://easylist.to/easylist/easylist.txt"
    "https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts"
    "https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-hosts.txt"
    "https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt"
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
)
HOSTS_PATH="/etc/hosts"
TEMP_HOSTS_PATH="/tmp/hosts"
TEMP_COMBINED_HOSTS_PATH="/tmp/combined-hosts"
BACKUP_DIR="/etc/hosts-backups"

# backup function
backup_hosts_file() {
    # Create backup 
    mkdir -p "$BACKUP_DIR"
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    BACKUP_PATH="$BACKUP_DIR/hosts-$TIMESTAMP.bak"
    cp "$HOSTS_PATH" "$BACKUP_PATH"
    echo "Hosts file backed up to: $BACKUP_PATH"
}

# update the hosts file
update_hosts_file() {
    curl -o "$TEMP_HOSTS_PATH" "$HOSTS_URL"
    cp "$TEMP_HOSTS_PATH" "$HOSTS_PATH"
    rm "$TEMP_HOSTS_PATH"
    echo "Hosts file updated successfully."
}

backup_hosts_file
update_hosts_file
