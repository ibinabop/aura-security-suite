#!/bin/bash

echo "========================================="
echo "     AURA PHONE NUMBER OSINT TOOL"
echo "========================================="
echo ""

read -p "Enter phone number (+234XXXXXXXXX): " PHONE

echo ""
echo "🔍 Looking up: $PHONE"
echo ""

# Method 1: Python phonenumbers library
echo "--- Basic Information ---"
python3 -c "
import phonenumbers
from phonenumbers import carrier, geocoder
try:
    num = '$PHONE'
    parsed = phonenumbers.parse(num)
    print(f'Country: {geocoder.description_for_number(parsed, "en")}')
    print(f'Carrier: {carrier.name_for_number(parsed, "en")}')
    print(f'Valid: {phonenumbers.is_valid_number(parsed)}')
except:
    print('Invalid number format - use country code')
" 2>/dev/null

# Method 2: Online API (free, limited)
echo ""
echo "--- Online Check (Public Data) ---"
curl -s "https://api.veriphone.io/v2/verify?phone=$PHONE" 2>/dev/null | python3 -c "
import sys,json
try:
    data=json.load(sys.stdin)
    print(f'Status: {data.get(\"status\", \"Unknown\")}')
    print(f'Country: {data.get(\"country_code\", \"Unknown\")}')
except:
    print('No online data available')
"

# Save report
REPORT="/sdcard/AURA_PHONE_${PHONE}_$(date +%Y%m%d).txt"
echo "Phone OSINT Report for: $PHONE" > "$REPORT"
echo "Date: $(date)" >> "$REPORT"
echo "🔐 Password: AuraV6" >> "$REPORT"

echo ""
echo "📁 Report saved: $REPORT"
echo "⚠️  Only use on YOUR OWN numbers"
