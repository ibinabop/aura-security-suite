#!/bin/bash

echo "========================================="
echo "       PHISHING TOOLS MENU"
echo "========================================="
echo ""
echo "1. Zphisher (30+ templates) - RECOMMENDED"
echo "2. BlackEye (Multi-platform)"
echo "3. SocialFish (Instagram/Facebook)"
echo "4. Python Phishing Server (Custom)"
echo ""
read -p "Select option (1-4): " OPT

case $OPT in
    1)
        if [ -d "$HOME/zphisher" ]; then
            cd ~/zphisher && bash zphisher.sh
        else
            echo "Installing Zphisher..."
            git clone https://github.com/htr-tech/zphisher.git
            cd zphisher && bash zphisher.sh
        fi
        ;;
    2)
        if [ -d "$HOME/blackeye" ]; then
            cd ~/blackeye && bash blackeye.sh
        else
            echo "BlackEye not installed"
        fi
        ;;
    3)
        cd ~/SocialFish && python SocialFish.py 2>/dev/null || echo "SocialFish not installed"
        ;;
    4)
        python3 ~/aura_phish_fixed.py
        ;;
    *) echo "Invalid option" ;;
esac
