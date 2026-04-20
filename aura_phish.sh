#!/bin/bash

echo "========================================="
echo "       PHISHING TOOLS MENU"
echo "========================================="
echo ""
echo "1. Zphisher (30+ templates)"
echo "2. BlackEye (Multi-platform)"
echo "3. SocialFish (Instagram/Facebook)"
echo "4. Python Phishing Server (Custom)"
echo "5. AdvPhishing (OTP Capture)"
echo "6. PyPhisher (2FA Phishing)"
echo "7. MrPhish (OTP Bypass)"
echo "0. Back to Main Menu"
echo ""
read -p "Select option (0-7): " OPT

case $OPT in
    1) cd ~/zphisher && bash zphisher.sh ;;
    2) cd ~/blackeye && bash blackeye.sh ;;
    3) cd ~/SocialFish && python SocialFish.py 2>/dev/null ;;
    4) python3 ~/aura_phish_fixed.py ;;
    5) cd ~/AdvPhishing && bash AdvPhishing.sh ;;
    6) cd ~/PyPhisher && python3 pyphisher.py ;;
    7) cd ~/mrphish && bash mrphish ;;
    0) bash ~/aura.sh ;;
    *) echo "Invalid option" ;;
esac
