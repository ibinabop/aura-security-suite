#!/bin/bash

# AURA ANTI-STALKING PROTECTION
# Password: AuraV6

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              🛡️ AURA ANTI-STALKING PROTECTION 🛡️             ║
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  📱 HOW TO PROTECT YOUR PHONE FROM TRACKING                  │
│  ├─────────────────────────────────────────────────────────────┤
│  │                                                              │
│  │  ANDROID:                                                    │
│  │  ✅ Settings → Location → Disable when not needed            │
│  │  ✅ Settings → Google → Ads → Opt out of personalization     │
│  │  ✅ Settings → Security → Google Play Protect → On           │
│  │  ✅ Check for unknown devices in Google account              │
│  │                                                              │
│  │  IPHONE:                                                     │
│  │  ✅ Settings → Privacy → Location → Never for suspicious apps│
│  │  ✅ Settings → Privacy → Tracking → Off for all              │
│  │  ✅ Settings → Apple ID → Find My → On                       │
│  │                                                              │
│  │  BOTH:                                                       │
│  │  ✅ Use a VPN (ProtonVPN free)                               │
│  │  ✅ Use encrypted messaging (Signal)                         │
│  │  ✅ Check for spyware (Malwarebytes)                         │
│  │  ✅ Factory reset if you suspect compromise                  │
└─────────────────────────────────────────────────────────────────┘"
echo ""

# Check for suspicious apps
echo "🔍 Checking for suspicious apps..."
if [ -d "/data/data" ]; then
    echo "📱 Installed packages (review for suspicious ones):"
    pm list packages 2>/dev/null | head -20
fi

REPORT="/sdcard/AURA_ANTISTALK_$(date +%Y%m%d).txt"
echo "Anti-Stalking Report - $(date)" > "$REPORT"
echo "Checked for suspicious activity" >> "$REPORT"
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$REPORT" -out "$REPORT.enc" -pass stdin 2>/dev/null
rm "$REPORT" 2>/dev/null

echo ""
echo "📁 Report saved: $REPORT.enc"
echo "🔐 Password: AuraV6"
