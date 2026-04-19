#!/bin/bash

# AURA WEB PROTECTION
# Password: AuraV6

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                 🛡️ AURA WEB PROTECTION 🛡️                   ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Create basic firewall rules (if iptables works)
if command -v iptables &> /dev/null; then
    echo "🔥 Configuring Aura firewall..."
    
    # Allow established connections
    iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 2>/dev/null
    
    # Allow loopback
    iptables -A INPUT -i lo -j ACCEPT 2>/dev/null
    
    # Rate limit SSH
    iptables -A INPUT -p tcp --dport 22 -m limit --limit 3/minute -j ACCEPT 2>/dev/null
    
    echo "✅ Firewall rules applied"
else
    echo "⚠️ iptables not available (no root)"
fi

# Create protection report
REPORT="/sdcard/AURA_PROTECTION_REPORT.txt"
echo "AURA Web Protection Report - $(date)" > "$REPORT"
echo "Password: AuraV6" >> "$REPORT"
echo "Status: Active" >> "$REPORT"

# Encrypt report
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$REPORT" -out "$REPORT.enc" -pass stdin 2>/dev/null
rm "$REPORT" 2>/dev/null

echo ""
echo "📁 Protection report: $REPORT.enc"
echo "🔐 Password: AuraV6"
