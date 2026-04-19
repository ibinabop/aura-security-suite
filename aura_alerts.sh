#!/bin/bash

# AURA REAL-TIME ALERT SYSTEM
# Password: AuraV6

ALERT_LOG="/sdcard/AURA_ALERTS.log"
EMAIL_ALERT="aura@security.local"  # Change to your email

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              🚨 AURA REAL-TIME ALERTS 🚨                     ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Monitor for new files in home directory
echo "🔍 Monitoring for suspicious activity..."

# Check for new .sh files in last 5 minutes
NEW_FILES=$(find ~/ -name "*.sh" -type f -mmin -5 2>/dev/null)
if [ -n "$NEW_FILES" ]; then
    echo "⚠️ ALERT: New script files detected!"
    echo "$NEW_FILES" >> "$ALERT_LOG"
fi

# Check for failed login attempts (if auth.log exists)
if [ -f "$PREFIX/var/log/auth.log" ]; then
    FAILED_LOGINS=$(grep "Failed password" "$PREFIX/var/log/auth.log" | tail -5)
    if [ -n "$FAILED_LOGINS" ]; then
        echo "⚠️ ALERT: Failed login attempts detected!"
        echo "$FAILED_LOGINS" >> "$ALERT_LOG"
    fi
fi

# Encrypt alert log
if [ -f "$ALERT_LOG" ]; then
    echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$ALERT_LOG" -out "$ALERT_LOG.enc" -pass stdin 2>/dev/null
    rm "$ALERT_LOG" 2>/dev/null
    echo "📁 Alerts saved: $ALERT_LOG.enc"
else
    echo "✅ No alerts detected"
fi
