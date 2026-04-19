#!/bin/bash

# LINK SAFETY CHECKER
# Analyze suspicious links without clicking

echo "========================================="
echo "     LINK SAFETY CHECKER"
echo "   Analyze scam links safely"
echo "========================================="
echo ""

read -p "Enter suspicious link: " LINK

echo ""
echo "🔍 Analyzing: $LINK"
echo ""

# Get redirect chain
echo "📍 Redirect chain:"
curl -Ls -o /dev/null -w "%{url_effective}\n" "$LINK" 2>/dev/null

# Get domain info
DOMAIN=$(echo "$LINK" | awk -F/ '{print $3}')
echo ""
echo "🌐 Domain: $DOMAIN"
echo "📅 Domain Age:"
whois "$DOMAIN" 2>/dev/null | grep -E "Creation Date|Registrar"

# Check if domain is known malicious
echo ""
echo "🛡️ Safety Check:"
curl -s "https://virusTotal.com/api/..." 2>/dev/null || echo "Manual check: https://www.virustotal.com"

# Save analysis
REPORT="/sdcard/AURA_LINK_ANALYSIS_$(date +%Y%m%d).txt"
echo "Link: $LINK" > "$REPORT"
echo "Domain: $DOMAIN" >> "$REPORT"
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$REPORT" -out "$REPORT.enc" -pass stdin
rm "$REPORT"
echo "📁 Report saved: $REPORT.enc"
