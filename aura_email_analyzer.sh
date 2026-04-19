#!/bin/bash

# EMAIL HEADER ANALYZER
# Paste email headers to find scammer's real IP

echo "========================================="
echo "     EMAIL HEADER ANALYZER"
echo "   Find scammer's real IP address"
echo "========================================="
echo ""

echo "Paste the email headers (then press Ctrl+D twice):"
HEADERS=$(cat)

# Extract IP addresses
echo ""
echo "🔍 Extracted IP addresses:"
echo "$HEADERS" | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -u

# Check if IP is VPN/proxy
echo ""
echo "🌍 IP Location Lookup:"
for IP in $(echo "$HEADERS" | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -u | head -3); do
    echo "IP: $IP"
    curl -s "ipinfo.io/$IP" | grep -E '"city"|"country"|"org"'
    echo ""
done

# Save report
REPORT="/sdcard/AURA_EMAIL_ANALYSIS_$(date +%Y%m%d_%H%M%S).txt"
echo "$HEADERS" > "$REPORT"
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$REPORT" -out "$REPORT.enc" -pass stdin
rm "$REPORT"
echo "📁 Report saved: $REPORT.enc"
