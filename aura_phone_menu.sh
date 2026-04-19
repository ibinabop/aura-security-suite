#!/bin/bash

# AURA PHONE SECURITY MENU
# Password: AuraV6

while true; do
clear
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              📱 AURA PHONE SECURITY MENU 📱                  ║
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  1. Anti-Theft Protection (IMEI Saver)                       │
│  2. SIM Swap Protection Guide                                     │
│  3. Anti-Stalking Protection                                      │
│  4. IMEI Blocker (For stolen phones)                              │
│  5. Find My Device (Open in browser)                              │
│  6. View Saved IMEI                                               │
│  0. Back to Main Menu                                             │
└─────────────────────────────────────────────────────────────────┘"
echo ""
read -p "Select option: " OPTION

case $OPTION in
    1) bash ~/aura_antitheft.sh ;;
    2) bash ~/aura_sim_protect.sh ;;
    3) bash ~/aura_antistalk.sh ;;
    4) bash ~/aura_imei_block.sh ;;
    5) termux-open "https://www.google.com/android/find" ;;
    6) ls -la /sdcard/AURA_IMEI*.enc ;;
    0) bash ~/aura.sh ;;
    *) echo "Invalid option" ;;
esac
echo ""
read -p "Press Enter to continue..."
done
