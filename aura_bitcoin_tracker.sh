#!/bin/bash

# BITCOIN WALLET TRACKER
# Track scammer's Bitcoin transactions (public blockchain)

echo "========================================="
echo "   BITCOIN WALLET TRACKER"
echo "   Follow scam transactions"
echo "========================================="
echo ""

read -p "Enter Bitcoin wallet address: " WALLET

echo ""
echo "🔍 Tracking wallet: $WALLET"
echo ""

# Query blockchain explorer
echo "📊 Transaction History:"
curl -s "https://blockchain.info/rawaddr/$WALLET" 2>/dev/null | python3 -c "
import sys,json
try:
    data=json.load(sys.stdin)
    print(f'Total Received: {data.get(\"total_received\",0)/100000000:.8f} BTC')
    print(f'Total Sent: {data.get(\"total_sent\",0)/100000000:.8f} BTC')
    print(f'Final Balance: {data.get(\"final_balance\",0)/100000000:.8f} BTC')
    print(f'Transaction Count: {data.get(\"n_tx\",0)}')
except:
    print('Error fetching data - wallet may be invalid')
"

echo ""
echo "🔗 View on blockchain: https://www.blockchain.com/explorer/addresses/btc/$WALLET"

REPORT="/sdcard/AURA_BTC_${WALLET:0:10}_$(date +%Y%m%d).txt"
echo "Wallet: $WALLET" > "$REPORT"
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$REPORT" -out "$REPORT.enc" -pass stdin
rm "$REPORT"
echo "📁 Report saved: $REPORT.enc"
