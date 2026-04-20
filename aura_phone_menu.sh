#!/bin/bash

while true; do
clear
echo "========================================="
echo "       AURA PHONE SECURITY MENU"
echo "========================================="
echo ""
echo "1. Anti-Theft Protection (IMEI Saver)"
echo "2. SIM Swap Protection Guide"
echo "3. Anti-Stalking Protection"
echo "4. IMEI Blocker (For stolen phones)"
echo "5. Find My Device (Open in browser)"
echo "6. View Saved IMEI"
echo "0. Back to Main Menu"
echo ""
read -p "Select option (0-6): " OPT

case $OPT in
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
