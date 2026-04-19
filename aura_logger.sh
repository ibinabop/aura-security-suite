#!/bin/bash
# AURA SECURITY LOGGER
LOG_DIR="/sdcard/AURA_LOGS"
mkdir -p "$LOG_DIR"
DATE=$(date +%Y%m%d_%H%M%S)
LOG_FILE="$LOG_DIR/AURA_LOG_$DATE.txt"
echo "AURA SECURITY LOG - $(date)" > "$LOG_FILE"
echo "Password: AuraV6" >> "$LOG_FILE"
echo "-----------------------------------" >> "$LOG_FILE"
history >> "$LOG_FILE" 2>/dev/null
pkg list-installed 2>/dev/null >> "$LOG_FILE"
ps aux >> "$LOG_FILE" 2>/dev/null
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$LOG_FILE" -out "$LOG_FILE.enc" -pass stdin 2>/dev/null
rm "$LOG_FILE" 2>/dev/null
echo "✅ Log saved: $LOG_FILE.enc"
