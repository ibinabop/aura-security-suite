#!/bin/bash

# AURA IMEI BLOCKING GUIDE
# For reporting STOLEN phones ONLY

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              🚫 AURA IMEI BLOCKING GUIDE 🚫                  ║
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

echo "┌─────────────────────────────────────────────────────────────┐
│  📋 HOW TO BLOCK A STOLEN PHONE BY IMEI                           │
│  ├─────────────────────────────────────────────────────────────┤
│  │                                                              │
│  │  STEP 1: Get your IMEI (from box or dial *#06#)              │
│  │                                                              │
│  │  STEP 2: Call your mobile carrier:                           │
│  │    - MTN Nigeria: 180                                        │
│  │    - Glo Nigeria: 121                                        │
│  │    - Airtel Nigeria: 111                                     │
│  │    - 9mobile Nigeria: 200                                    │
│  │                                                              │
│  │    - USA: Contact your carrier (Verizon, T-Mobile, AT&T)    │
│  │    - UK: Contact your carrier (EE, Vodafone, O2, Three)     │
│  │    - India: Contact your carrier (Jio, Airtel, Vi)          │
│  │                                                              │
│  │  STEP 3: Report to police with IMEI                          │
│  │  STEP 4: Check https://www.google.com/android/find          │
│  └─────────────────────────────────────────────────────────────┘"
echo ""

read -p "Enter your IMEI to save for emergency: " IMEI
BLOCK_FILE="/sdcard/AURA_IMEI_BLOCK.txt"
echo "IMEI to block: $IMEI" > "$BLOCK_FILE"
echo "Date: $(date)" >> "$BLOCK_FILE"
echo "Call carrier immediately if phone stolen" >> "$BLOCK_FILE"

echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$BLOCK_FILE" -out "$BLOCK_FILE.enc" -pass stdin 2>/dev/null
rm "$BLOCK_FILE" 2>/dev/null

echo ""
echo "✅ IMEI saved: $BLOCK_FILE.enc"
echo "🔐 Password: AuraV6"
