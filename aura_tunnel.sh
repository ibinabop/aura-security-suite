#!/bin/bash

echo "========================================="
echo "       TUNNELING TOOLS MENU"
echo "========================================="
echo ""
echo "1. Cloudflared Tunnel (RECOMMENDED)"
echo "2. Bore Tunnel"
echo "3. Check Active Tunnels"
echo "0. Back to Main Menu"
echo ""
read -p "Select option (0-3): " OPT

case $OPT in
    1) cloudflared tunnel --url http://localhost:8080 ;;
    2) bore local 8080 --to bore.pub ;;
    3) ps aux | grep -E "cloudflared|bore" | grep -v grep ;;
    0) bash ~/aura.sh ;;
    *) echo "Invalid option" ;;
esac
