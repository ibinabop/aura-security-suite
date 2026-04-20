#!/bin/bash

echo "========================================="
echo "       PASSWORD CRACKING MENU"
echo "========================================="
echo ""
echo "1. John the Ripper"
echo "2. Wordlist Manager"
echo "0. Back to Main Menu"
echo ""
read -p "Select option (0-2): " OPT

case $OPT in
    1) bash ~/aura_john.sh ;;
    2) bash ~/aura_wordlist.sh ;;
    0) bash ~/aura.sh ;;
    *) echo "Invalid option" ;;
esac
