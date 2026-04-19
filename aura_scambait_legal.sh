#!/bin/bash

# LEGAL SCAMBAITING TOOLKIT
# Like Scammer Payback - Waste scammer time legally

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         🎣 LEGAL SCAMBAITING TOOLKIT 🎣                      ║
║         Like Scammer Payback on YouTube                          ║
╚════════════════════════════════════════════════════════════════════╝"
echo ""

echo "┌─────────────────────────────────────────────────────────────┐
│  📋 LEGAL SCAMBAITING TECHNIQUES                                │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  1. Waste their time (keep them on call for hours)          │
│  2. Use fake names and fake bank accounts                   │
│  3. Trace their infrastructure from emails                  │
│  4. Report scam websites to hosting providers               │
│  5. Report scam bank accounts to banks                      │
│  6. Report crypto wallets to exchanges                      │
│  7. Record everything as evidence                           │
│                                                              │
└─────────────────────────────────────────────────────────────────┘"

echo ""
echo "Select technique:"
echo "1. Call Time Waster Script"
echo "2. Fake Identity Generator"
echo "3. Scam Website Takedown Tool"
echo "4. Bank Account Reporter"
echo "5. Crypto Wallet Blacklister"
echo "6. Evidence Recorder"
read -p "Choice: " OPT

case $OPT in
    1) bash ~/aura_time_waster.sh ;;
    2) bash ~/aura_fake_id.sh ;;
    3) bash ~/aura_takedown.sh ;;
    4) bash ~/aura_bank_report.sh ;;
    5) bash ~/aura_crypto_report.sh ;;
    6) echo "Use screen recorder on your phone" ;;
esac
