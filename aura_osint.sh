#!/bin/bash

echo "========================================="
echo "       OSINT & RECON MENU"
echo "========================================="
echo ""
echo "1. Sherlock (Username search)"
echo "2. PhoneInfoga (Phone OSINT)"
echo "3. theHarvester (Email/Domain)"
echo "4. IP-Tracer (IP location)"
echo "5. Nmap (Port scanner)"
echo "0. Back to Main Menu"
echo ""
read -p "Select option (0-5): " OPT

case $OPT in
    1) cd ~/sherlock && python sherlock.py ;;
    2) cd ~/PhoneInfoga && ./phoneinfoga scan -n +1234567890 ;;
    3) cd ~/theHarvester && python theHarvester.py ;;
    4) cd ~/IP-Tracer && trace -t 8.8.8.8 ;;
    5) read -p "Enter target IP: " t; nmap -sV $t ;;
    0) bash ~/aura.sh ;;
    *) echo "Invalid option" ;;
esac
