#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/sdcard/AURA_BACKUP_$DATE"
mkdir -p "$BACKUP_DIR"
rsync -avz --progress ~/ "$BACKUP_DIR/HOME_BACKUP/" 2>/dev/null
echo "Backup completed on $(date)" > "$BACKUP_DIR/backup_log.txt"
echo "AURA BACKUP COMPLETE - Location: $BACKUP_DIR"
