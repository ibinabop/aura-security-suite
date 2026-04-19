#!/bin/bash

# Check if YOUR phone is online (using Google Find My Device API)
# Requires Google account authentication

echo "========================================="
echo "     CHECK YOUR PHONE STATUS"
echo "========================================="
echo ""

echo "Open in browser: https://www.google.com/android/find"
echo ""
echo "This will show:"
echo "  ✅ Real-time location on map"
echo "  ✅ Battery percentage"
echo "  ✅ WiFi network"
echo "  ✅ Last active time"
echo ""

# Save tracking session
SESSION_FILE="/sdcard/AURA_TRACK_SESSION_$(date +%Y%m%d_%H%M%S).txt"
echo "Tracking session started: $(date)" > "$SESSION_FILE"
echo "Use Find My Device to locate phone" >> "$SESSION_FILE"

echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$SESSION_FILE" -out "$SESSION_FILE.enc" -pass stdin 2>/dev/null
rm "$SESSION_FILE" 2>/dev/null

echo "📁 Session saved: $SESSION_FILE.enc"
