#!/bin/bash

# AURA ANTI-THEFT PROTECTION
# Password: AuraV6

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              🔒 AURA ANTI-THEFT PROTECTION 🔒                ║
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  📋 PRE-THEFT PREPARATION (Do this NOW)                      │
echo "├─────────────────────────────────────────────────────────────┤"
echo "│  ✅ Record your IMEI number: *#06#                           │
echo "│  ✅ Enable Find My Device (Android) / Find My (iPhone)      │
echo "│  ✅ Take a photo of your phone's box (has IMEI)             │
echo "│  ✅ Save IMEI in secure location (encrypted)                │
echo "│  ✅ Enable screen lock (PIN/password)                       │
echo "│  ✅ Enable 2FA on all accounts                              │
echo "└─────────────────────────────────────────────────────────────┘"
echo ""

read -p "Enter your phone's IMEI number: " IMEI

# Save IMEI securely
IMEI_FILE="/sdcard/AURA_IMEI_SECURE.txt"
echo "IMEI: $IMEI" > "$IMEI_FILE"
echo "Date saved: $(date)" >> "$IMEI_FILE"
echo "Password: AuraV6" >> "$IMEI_FILE"

# Encrypt IMEI file
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$IMEI_FILE" -out "$IMEI_FILE.enc" -pass stdin 2>/dev/null
rm "$IMEI_FILE" 2>/dev/null

echo ""
echo "✅ IMEI saved securely: $IMEI_FILE.enc"
echo "🔐 Password: AuraV6"
echo ""
echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  🚨 IF PHONE IS STOLEN:                                      │
echo "├─────────────────────────────────────────────────────────────┤"
echo "│  1. Go to: https://www.google.com/android/find              │
echo "│  2. Login with your Google account                          │
echo "│  3. Track, lock, or erase your phone                        │
echo "│  4. Call your carrier to block IMEI: $IMEI                  │
echo "│  5. File police report with IMEI number                     │
echo "└─────────────────────────────────────────────────────────────┘"
