#!/bin/bash

echo "========================================="
echo "       2FA BYPASS TOOLS MENU"
echo "========================================="
echo ""
echo "1. AdvPhishing (OTP Capture)"
echo "2. PyPhisher (2FA Phishing)"
echo "3. MrPhish (OTP Bypass)"
echo "0. Back to Main Menu"
echo ""
read -p "Select option (0-3): " OPT

case $OPT in
    1) cd ~/AdvPhishing && bash AdvPhishing.sh ;;
    2) cd ~/PyPhisher && python3 pyphisher.py ;;
    3) cd ~/mrphish && bash mrphish ;;
    0) bash ~/aura.sh ;;
    *) echo "Invalid option" ;;
esac
