#!/bin/bash

echo "========================================="
echo "        SYSTEM TOOLS MENU"
echo "========================================="
echo ""
echo "1. Security Dashboard"
echo "2. Emergency Recovery Kit"
echo "3. Combat System"
echo "0. Back to Main Menu"
echo ""
read -p "Select option (0-3): " OPT

case $OPT in
    1) bash ~/aura_dashboard.sh ;;
    2) bash ~/aura_emergency_kit.sh ;;
    3) bash ~/aura_combat.sh ;;
    0) bash ~/aura.sh ;;
    *) echo "Invalid option" ;;
esac
