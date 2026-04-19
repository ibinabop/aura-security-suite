#!/bin/bash

# CALLER ID SPOOF DETECTOR
# Identify if a call is spoofed

echo "========================================="
echo "   CALLER ID SPOOF DETECTOR"
echo "========================================="
echo ""

echo "If you receive a suspicious call:"
echo ""
echo "1. Don't share any personal info"
echo "2. Hang up and call back on official number"
echo "3. Check if number matches official records"
echo "4. Use reverse phone lookup"
echo ""
echo "🔍 Reverse phone lookup:"
read -p "Enter suspicious number: " NUMBER

curl -s "https://api.veriphone.io/v2/verify?phone=$NUMBER" 2>/dev/null | python3 -c "
import sys,json
try:
    data=json.load(sys.stdin)
    print(f'Country: {data.get(\"country_code\", \"Unknown\")}')
    print(f'Carrier: {data.get(\"carrier\", \"Unknown\")}')
    print(f'Valid: {data.get(\"status\", \"Unknown\")}')
except:
    print('Check failed')
"
