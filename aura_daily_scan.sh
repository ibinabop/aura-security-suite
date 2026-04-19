#!/bin/bash

# AURA DAILY SECURITY SCAN
# Runs automatically every day

DATE=$(date +%Y%m%d)
REPORT_DIR="/sdcard/AURA_DAILY_SCANS"
mkdir -p "$REPORT_DIR"

REPORT="$REPORT_DIR/scan_$DATE.txt"

echo "AURA Daily Security Scan - $(date)" > "$REPORT"
echo "Password: AuraV6" >> "$REPORT"
echo "-----------------------------------" >> "$REPORT"

# Check for suspicious files
echo "📁 Suspicious files:" >> "$REPORT"
find ~/ -name "*.sh" -type f 2>/dev/null | head -20 >> "$REPORT"

# Check disk usage
echo "" >> "$REPORT"
echo "💾 Disk usage:" >> "$REPORT"
df -h >> "$REPORT" 2>/dev/null

# Check running processes
echo "" >> "$REPORT"
echo "⚙️ Running processes:" >> "$REPORT"
ps aux | head -20 >> "$REPORT" 2>/dev/null

# Encrypt report
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$REPORT" -out "$REPORT.enc" -pass stdin 2>/dev/null
rm "$REPORT" 2>/dev/null

echo "✅ Daily scan complete: $REPORT.enc"
