#!/bin/bash

echo "========================================="
echo "       DEFENSE & UTILITIES MENU"
echo "========================================="
echo ""
echo "1. Backup System"
echo "2. File Integrity (FIM)"
echo "3. Encrypt File"
echo "4. Decrypt File"
echo "0. Back to Main Menu"
echo ""
read -p "Select option (0-4): " OPT

case $OPT in
    1) bash ~/aura_backup.sh ;;
    2) bash ~/aura_fim.sh ;;
    3) bash ~/aura_encrypt.sh ;;
    4) bash ~/aura_decrypt.sh ;;
    0) bash ~/aura.sh ;;
    *) echo "Invalid option" ;;
esac
