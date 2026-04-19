#!/bin/bash

echo "========================================="
echo "       WIFI SECURITY & MITM MENU"
echo "========================================="
echo ""
echo "WORKING TOOLS (No root needed):"
echo "1. Airgeddon (Complete WiFi MITM Suite) - RECOMMENDED"
echo "2. Aircrack-ng (WiFi Cracking - works on .cap files)"
echo "3. Zphisher (Social Engineering)"
echo "4. Cloudflared Tunnel (For phishing)"
echo ""
echo "TOOLS THAT NEED ROOT (Will not work):"
echo "5. Wifite (Requires root - SKIP)"
echo ""
read -p "Select option (1-5): " OPT

case $OPT in
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
        echo "Aircrack-ng commands:"
        echo "  aircrack-ng --help"
        echo "  aircrack-ng -w wordlist.txt capture.cap"
        aircrack-ng --help
        ;;
    3)
        cd ~/zphisher && bash zphisher.sh
        ;;
    4)
        cloudflared tunnel --url http://localhost:8080
        ;;
    5)
        echo "Wifite requires root. Your phone is not rooted."
        echo "Use Airgeddon instead (option 1)"
        ;;
    *) echo "Invalid option" ;;
esac
