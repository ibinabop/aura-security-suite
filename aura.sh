#!/bin/bash

# AURA MASTER CONTROL PANEL - COMPLETE v18
# Password: AuraV6

while true; do
clear
echo "================================================================================"
echo "                        🔥 AURA MASTER CONTROL PANEL 🔥"
echo "                         💀 SHADOW PROTOCOL v18 💀"
echo "================================================================================"
echo ""
echo "┌─────────────────────────────────────────────────────────────────────────────┐"
echo "│ 1. 🎣 PHISHING TOOLS MENU                                                    │
│ 2. 🌐 TUNNELING TOOLS                                                            │
│ 3. 🔍 OSINT & RECON                                                              │
│ 4. 💀 EXPLOITATION & PAYLOADS                                                    │
│ 5. 🔓 PASSWORD CRACKING                                                          │
│ 6. 🛡️ DEFENSE & UTILITIES                                                        │
│ 7. 📡 WIFI SECURITY                                                              │
│ 8. 📱 PHONE SECURITY                                                             │
│ 9. 💀 ADVANCED HIJACKING                                                         │
│10. 🔓 2FA BYPASS TOOLS                                                           │
│11. 📊 SYSTEM TOOLS                                                               │
│                                                                                  │
│ 0. Exit                                                                          │
└─────────────────────────────────────────────────────────────────────────────────┘"
echo ""
read -p "Select option (0-11): " OPT

case $OPT in
    1) bash ~/aura_phish.sh ;;
    2) bash ~/aura_tunnel.sh ;;
    3) bash ~/aura_osint.sh ;;
    4) bash ~/aura_exploit.sh ;;
    5) bash ~/aura_password.sh ;;
    6) bash ~/aura_defense.sh ;;
    7) bash ~/aura_wifi.sh ;;
    8) bash ~/aura_phone_menu.sh ;;
    9) bash ~/aura_hijack.sh ;;
    10) bash ~/aura_2fa.sh ;;
    11) bash ~/aura_system.sh ;;
    0) exit 0 ;;
    *) echo "Invalid option" ;;
esac
echo ""
read -p "Press Enter to continue..."
done
