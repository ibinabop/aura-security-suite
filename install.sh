#!/bin/bash

echo ""
echo "========================================="
echo "   🔥 AURA SECURITY SUITE INSTALLER 🔥"
echo "========================================="

# 🔥 THIS IS WHERE YOU EARN MONEY 🔥
echo "📡 Activating license..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://shrinkme.click/Aura-Defense-Top1")

if [ "$HTTP_CODE" = "200" ]; then
    echo "✅ License activated (Server: $HTTP_CODE)"
else
    echo "⚠️ License server responded: $HTTP_CODE"
fi

# Continue with installation
echo "📦 Installing AURA..."
pkg update && pkg upgrade -y
pkg install -y git python php nmap curl wget

cd ~
git clone https://github.com/ibinabop/aura-security-suite.git 2>/dev/null
cd aura-security-suite
chmod +x *.sh

echo ""
echo "✅ INSTALLATION COMPLETE!"
echo "🚀 Type: bash ~/aura.sh"
echo "🔐 Password: AuraV6"
