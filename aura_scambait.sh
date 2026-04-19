#!/bin/bash
echo "========================================="
echo "       AURA SCAMBAITING TOOLKIT"
echo "       Fight Scammers Legally"
echo "========================================="
echo ""
echo "1. Email Analyzer (Trace scammer IP)"
echo "2. Link Safety Checker"
echo "3. Bitcoin Wallet Tracker"
echo "4. Fake Identity Generator"
echo "5. WhatsApp Number Checker"
echo "6. Caller ID Spoof Detector"
echo "7. Time Waster Scripts"
echo "8. Scam Website Takedown"
echo "9. Bank Account Reporter"
echo "10. Crypto Wallet Blacklister"
echo "0. Back"
echo ""
read -p "Choice: " OPT
case $OPT in
    1) bash ~/aura_email_analyzer.sh ;;
    2) bash ~/aura_link_checker.sh ;;
    3) bash ~/aura_bitcoin_tracker.sh ;;
    4) bash ~/aura_fake_id.sh ;;
    5) bash ~/aura_whatsapp_check.sh ;;
    6) bash ~/aura_callerid_check.sh ;;
    7) bash ~/aura_time_waster.sh ;;
    8) bash ~/aura_takedown.sh ;;
    9) bash ~/aura_bank_report.sh ;;
    10) bash ~/aura_crypto_report.sh ;;
    0) bash ~/aura.sh ;;
    *) echo "Invalid" ;;
esac
