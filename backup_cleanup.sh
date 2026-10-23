
#!/bin/bash

# Automated Backup and Disk Cleanup Script

SOURCE_DIR="$HOME/BACKUP_and_CLEANUP/backup_source"
BACKUP_DIR="$HOME/BACKUP_and_CLEANUP/backups"
CLEANUP_DIR="$HOME/BACKUP_and_CLEANUP/cleanup_test"
LOG_DIR="$HOME/BACKUP_and_CLEANUP/logs"
LOG_FILE="$LOG_DIR/backup_cleanup.log"

RETENTION_DAYS=7

mkdir -p "$BACKUP_DIR" "$LOG_DIR"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_message "Backup and cleanup process started."

# Validate source and cleanup directories
if [ ! -d "$SOURCE_DIR" ]; then
    log_message "ERROR: Backup source directory does not exist."
    exit 1
fi

if [ ! -d "$CLEANUP_DIR" ]; then
    log_message "ERROR: Cleanup directory does not exist."
    exit 1
fi

# Create a timestamped compressed backup
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

if tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .; then
    log_message "SUCCESS: Backup created at $BACKUP_FILE"
else
    log_message "ERROR: Backup creation failed."
    exit 1
fi

# Find and delete files older than the retention period
log_message "Checking for files older than $RETENTION_DAYS days."

find "$CLEANUP_DIR" -maxdepth 1 -type f -mtime +"$RETENTION_DAYS" -print -delete |
while IFS= read -r file; do
    log_message "CLEANUP: Deleted old file: $file"
done

log_message "Backup and cleanup process completed."

