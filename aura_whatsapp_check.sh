#!/bin/bash

# CHECK IF NUMBER HAS WHATSAPP
# Educational - For YOUR own number or scammer research

echo "========================================="
echo "   WHATSAPP NUMBER CHECKER"
echo "========================================="
echo ""

read -p "Enter phone number (with country code): " NUMBER

echo ""
echo "🔍 Checking: $NUMBER"
echo ""

# Use whatsapp API (public)
curl -s "https://api.whatsapp.com/check?phone=$NUMBER" 2>/dev/null | grep -q "WhatsApp" && echo "✅ Has WhatsApp" || echo "❌ Not on WhatsApp"

REPORT="/sdcard/AURA_WA_${NUMBER}_$(date +%Y%m%d).txt"
echo "Number: $NUMBER" > "$REPORT"
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$REPORT" -out "$REPORT.enc" -pass stdin
rm "$REPORT"
echo "📁 Report saved: $REPORT.enc"
