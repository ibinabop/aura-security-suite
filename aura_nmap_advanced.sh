#!/bin/bash
echo "========================================="
echo "       NMAP ADVANCED SCAN"
echo "========================================="
echo ""
echo "1. Quick scan (top 100 ports)"
echo "2. OS Detection"
echo "3. Version scan"
echo "4. All ports (slow)"
echo "5. Ping sweep (find devices)"
read -p "Choice: " OPT
read -p "Enter target IP/range: " IP

case $OPT in
    1) nmap -F $IP ;;
    2) sudo nmap -O $IP ;;
    3) nmap -sV $IP ;;
    4) nmap -p- $IP ;;
    5) nmap -sn $IP ;;
    *) echo "Invalid" ;;
esac
