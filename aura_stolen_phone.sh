#!/bin/bash

# AURA STOLEN PHONE RESPONSE SYSTEM
# Use IMMEDIATELY if your phone is stolen

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║           🚨 AURA STOLEN PHONE RESPONSE 🚨                   ║
╚════════════════════════════════════════════════════════════════════╝"
echo ""

echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  📍 STEP 1: TRACK YOUR PHONE                                 │
├─────────────────────────────────────────────────────────────┤
echo "│  Android: https://www.google.com/android/find               │
│  iPhone:  https://www.icloud.com/find                           │
│  Samsung: https://findmymobile.samsung.com                      │
└─────────────────────────────────────────────────────────────────┘"
echo ""

echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  🔒 STEP 2: LOCK & SECURE                                    │
├─────────────────────────────────────────────────────────────┤
echo "│  ✅ Lock phone remotely                                      │
│  ✅ Display message with your contact number                     │
│  ✅ Enable "Lost Mode"                                            │
└─────────────────────────────────────────────────────────────────┘"
echo ""

echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  📞 STEP 3: CONTACT CARRIER                                  │
├─────────────────────────────────────────────────────────────┤
echo "│  Call your mobile provider to:                              │
│  ✅ Block the SIM card                                           │
│  ✅ Block the IMEI                                               │
│  ✅ Freeze your account                                          │
└─────────────────────────────────────────────────────────────────┘"
echo ""

echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  👮 STEP 4: FILE POLICE REPORT                               │
├─────────────────────────────────────────────────────────────┤
echo "│  ✅ Provide IMEI number                                     │
│  ✅ Provide serial number                                        │
│  ✅ Provide last known location                                  │
└─────────────────────────────────────────────────────────────────┘"
echo ""

# Save IMEI for emergency
read -p "Enter your phone's IMEI (dial *#06# to get it): " IMEI
IMEI_FILE="/sdcard/AURA_IMEI_SAFE.txt"
echo "IMEI: $IMEI" > "$IMEI_FILE"
echo "Date saved: $(date)" >> "$IMEI_FILE"
echo "🔐 Password: AuraV6" >> "$IMEI_FILE"

echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$IMEI_FILE" -out "$IMEI_FILE.enc" -pass stdin 2>/dev/null
rm "$IMEI_FILE" 2>/dev/null

echo ""
echo "✅ IMEI saved securely: $IMEI_FILE.enc"
echo "🔐 Password: AuraV6"
echo ""
echo "⚠️ KEEP THIS FILE SAFE - You need IMEI to block stolen phone"
