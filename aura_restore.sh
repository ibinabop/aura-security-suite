#!/bin/bash
echo "Available backups:"
ls -la /sdcard/ | grep AURA_BACKUP
read -p "Enter backup name: " BACKUP_NAME
if [ -d "/sdcard/$BACKUP_NAME" ]; then
    rsync -avz "/sdcard/$BACKUP_NAME/HOME_BACKUP/" ~/ 2>/dev/null
    echo "Restore complete"
else
    echo "Backup not found"
fi
