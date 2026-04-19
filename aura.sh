#!/bin/bash

# AURA MASTER CONTROL PANEL - COMPLETE v16
# All working tools for Termux

while true; do
clear
echo "================================================================================"
echo "                        🔥 AURA MASTER CONTROL PANEL 🔥"
echo "                         💀 SHADOW PROTOCOL v16 💀"
echo "================================================================================"
echo ""
echo "=============================="
echo "  PHISHING TOOLS"
echo "=============================="
echo "1. Phishing Tools Menu (Zphisher/BlackEye/SocialFish)"
echo ""
echo "=============================="
echo "  TUNNELING TOOLS"
echo "=============================="
echo "2. Cloudflared Tunnel (RECOMMENDED)"
echo "3. Bore Tunnel"
echo "4. Check Active Tunnels"
echo ""
echo "=============================="
echo "  OSINT & RECON"
echo "=============================="
echo "5. Sherlock (Username search)"
echo "6. PhoneInfoga (Phone OSINT)"
echo "7. theHarvester (Email/Domain)"
echo "8. IP-Tracer (IP location)"
echo "9. Nmap (Port scanner)"
echo ""
echo "=============================="
echo "  EXPLOITATION & PAYLOADS"
echo "=============================="
echo "10. Metasploit Framework"
echo "11. Generate Payload (msfvenom)"
echo "12. Python Reverse Shell"
echo ""
echo "=============================="
echo "  PASSWORD CRACKING"
echo "=============================="
echo "13. John the Ripper"
echo "14. Wordlist Manager"
echo ""
echo "=============================="
echo "  DEFENSE & UTILITIES"
echo "=============================="
echo "15. Backup System"
echo "16. File Integrity"
echo "17. Encrypt File"
echo "18. Decrypt File"
echo ""
echo "=============================="
echo "  WIFI MITM & SECURITY"
echo "=============================="
echo "19. Aircrack-ng (WiFi Cracking)"
echo "20. Airgeddon (Complete WiFi MITM)"
echo ""
echo "=============================="
echo "  PHONE SECURITY"
echo "=============================="
echo "21. Phone Security Menu"
echo ""
echo "=============================="
echo "  ADVANCED HIJACKING"
echo "=============================="
echo "22. CookieStealers (Session Hijacking)"
echo "23. Browser Token Extractor"
echo ""
echo "=============================="
echo "  SYSTEM"
echo "=============================="
echo "24. Security Dashboard"
echo "25. Emergency Kit"
echo "26. Combat System"
echo ""
echo "0. Exit"
echo ""
read -p "Select option (0-26): " OPT

case $OPT in
    1) bash ~/aura_phish.sh ;;
    2) cloudflared tunnel --url http://localhost:8080 ;;
    3) bore local 8080 --to bore.pub ;;
    4) ps aux | grep -E "cloudflared|bore" | grep -v grep ;;
    5) cd ~/sherlock && python sherlock.py ;;
    6) cd ~/PhoneInfoga && ./phoneinfoga scan -n +1234567890 ;;
    7) cd ~/theHarvester && python theHarvester.py ;;
    8) cd ~/IP-Tracer && trace -t 8.8.8.8 ;;
    9) read -p "Enter target IP: " t; nmap -sV $t ;;
    10) bash ~/aura_msf.sh ;;
    11) bash ~/aura_msfvenom.sh ;;
    12) bash ~/aura_reverse_shell.sh ;;
    13) bash ~/aura_john.sh ;;
    14) bash ~/aura_wordlist.sh ;;
    15) bash ~/aura_backup.sh ;;
    16) bash ~/aura_fim.sh ;;
    17) bash ~/aura_encrypt.sh ;;
    18) bash ~/aura_decrypt.sh ;;
    19) aircrack-ng --help ;;
    20) bash ~/aura_airgeddon.sh ;;
    21) bash ~/aura_phone_menu.sh ;;
    22) bash ~/aura_cookie.sh ;;
    23) bash ~/aura_token_extract.sh ;;
    24) bash ~/aura_dashboard.sh ;;
    25) bash ~/aura_emergency_kit.sh ;;
    26) bash ~/aura_combat.sh ;;
    0) exit 0 ;;
    *) echo "Invalid option" ;;
esac
echo ""
read -p "Press Enter to continue..."
done
