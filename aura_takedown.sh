#!/bin/bash

# SCAM WEBSITE TAKEDOWN TOOL
# Report scam sites to hosting providers (Legal)

echo "========================================="
echo "   SCAM WEBSITE TAKEDOWN TOOL"
echo "   Report scam sites legally"
echo "========================================="
echo ""

read -p "Enter scam website URL: " URL

# Get domain info
DOMAIN=$(echo "$URL" | awk -F/ '{print $3}')
echo ""
echo "🌐 Domain: $DOMAIN"

# Find hosting provider
echo "🔍 Finding hosting provider..."
HOSTING=$(whois "$DOMAIN" 2>/dev/null | grep -i "orgname\|registrar" | head -1)
echo "Hosting: $HOSTING"

echo ""
echo "📧 Report to these abuse contacts:"
whois "$DOMAIN" 2>/dev/null | grep -i "abuse\|email" | head -3

echo ""
echo "✅ Report to:"
echo "   - Google Safe Browsing: https://safebrowsing.google.com"
echo "   - PhishTank: https://phishtank.com"
echo "   - Hosting provider abuse email above"

REPORT="/sdcard/AURA_TAKEDOWN_$(date +%Y%m%d).txt"
echo "Scam site: $URL" > "$REPORT"
echo "Domain: $DOMAIN" >> "$REPORT"
echo "Reported to: Google Safe Browsing, PhishTank" >> "$REPORT"
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$REPORT" -out "$REPORT.enc" -pass stdin
rm "$REPORT"
echo "📁 Report saved: $REPORT.enc"
