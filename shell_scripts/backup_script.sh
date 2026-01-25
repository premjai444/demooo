#!/bin/bash

# ==========================
# Configuration
# ==========================
SOURCE_DIR="$HOME/test_data"
BACKUP_DIR="$HOME/backups"
LOG_FILE="$HOME/backup.log"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_$DATE.tar.gz"

# ==========================
# Functions
# ==========================

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" | tee -a "$LOG_FILE"
}

check_dirs() {
    if [ ! -d "$SOURCE_DIR" ]; then
        log "ERROR: Source directory does not exist: $SOURCE_DIR"
        exit 1
    fi

    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_DIR"
        log "Created backup directory: $BACKUP_DIR"
    fi
}

take_backup() {
    tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

    if [ $? -eq 0 ]; then
        log "Backup successful: $BACKUP_DIR/$BACKUP_FILE"
    else
        log "ERROR: Backup failed"
        exit 1
    fi
}

cleanup_old_backups() {
    # Delete backups older than 7 days (optional)
    find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete
    log "Old backups cleanup completed (older than 7 days)"
}

# ==========================
# Main
# ==========================

log "===== Backup Started ====="

check_dirs
take_backup
cleanup_old_backups

log "===== Backup Finished ====="

exit 0

