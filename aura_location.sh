#!/bin/bash

echo "========================================="
echo "       AURA LOCATION TOOLS"
echo "   Educational - Test on YOURSELF only"
echo "========================================="
echo ""

echo "WORKING TOOLS:"
echo "1. IP-Tracer (Trace IP location)"
echo "2. GeoIP Lookup"
echo "3. IPInfo (curl)"
echo "4. SayCheese (Webcam capture - test yourself)"
echo "5. Nmap Network Scan"
echo ""

read -p "Select option: " OPT

case $OPT in
    1)
        read -p "Enter IP: " IP
        cd ~/IP-Tracer && trace -t $IP
        ;;
    2)
        read -p "Enter IP: " IP
        geoiplookup $IP
        ;;
    3)
        read -p "Enter IP: " IP
        curl ipinfo.io/$IP
        ;;
    4)
        cd ~/saycheese && bash saycheese.sh
        ;;
    5)
        read -p "Enter IP range (e.g., 192.168.1.0/24): " RANGE
        nmap -sn $RANGE
        ;;
    *) echo "Invalid" ;;
esac
