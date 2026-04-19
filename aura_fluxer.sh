#!/bin/bash
echo "========================================="
echo "       WIFI MITM & AUDITING TOOLS"
echo "========================================="
echo ""
echo "Available working tools:"
echo "1. Airgeddon (Complete WiFi MITM Suite)"
echo "2. Wifite (Automated WiFi Auditor)"
echo "3. Zphisher (Social Engineering MITM)"
echo ""
read -p "Select tool (1-3): " TOOL

case $TOOL in
    1)
        if [ -d "$HOME/airgeddon" ]; then
            cd ~/airgeddon && bash airgeddon.sh
        else
            echo "Installing Airgeddon..."
            git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git
            cd airgeddon && bash airgeddon.sh
        fi
        ;;
    2)
        if [ -d "$HOME/wifite2" ]; then
            cd ~/wifite2 && python wifite.py
        else
            echo "Installing Wifite..."
            git clone https://github.com/derv82/wifite2.git
            cd wifite2 && python setup.py install && wifite
        fi
        ;;
    3)
        cd ~/zphisher && bash zphisher.sh
        ;;
    *) echo "Invalid option" ;;
esac
