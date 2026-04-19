#!/bin/bash

# SAVE YOUR PHONE'S IMEI NOW (Before it's stolen)

echo "========================================="
echo "     SAVE YOUR IMEI - EMERGENCY USE"
echo "========================================="
echo ""
echo "Dial *#06# on your phone NOW"
echo "Write down the IMEI number"
echo ""

read -p "Enter IMEI number: " IMEI

# Save in multiple secure locations
echo "$IMEI" > /sdcard/imei_backup.txt
echo "$IMEI" > ~/imei_backup.txt

# Encrypt both
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in /sdcard/imei_backup.txt -out /sdcard/imei_backup.enc -pass stdin 2>/dev/null
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in ~/imei_backup.txt -out ~/imei_backup.enc -pass stdin 2>/dev/null

rm /sdcard/imei_backup.txt ~/imei_backup.txt 2>/dev/null

echo ""
echo "✅ IMEI saved to:"
echo "   /sdcard/imei_backup.enc"
echo "   ~/imei_backup.enc"
echo "🔐 Password: AuraV6"
echo ""
echo "⚠️ If phone is stolen, use this IMEI to block it"
