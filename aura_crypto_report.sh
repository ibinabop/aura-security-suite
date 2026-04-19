#!/bin/bash

# CRYPTO WALLET BLACKLISTER
# Report scam wallets to exchanges

echo "========================================="
echo "   CRYPTO WALLET BLACKLISTER"
echo "========================================="
echo ""

read -p "Enter scammer's wallet address: " WALLET

echo ""
echo "📧 Report to these exchanges:"
echo "   - Binance: abuse@binance.com"
echo "   - Coinbase: compliance@coinbase.com"
echo "   - Kraken: support@kraken.com"
echo ""
echo "Include: Wallet address: $WALLET"
echo "Include: Transaction evidence"
echo "Include: Police report"

echo ""
echo "🔍 Check wallet on blockchain explorer:"
echo "   Bitcoin: https://www.blockchain.com/explorer/addresses/btc/$WALLET"
echo "   Ethereum: https://etherscan.io/address/$WALLET"

REPORT="/sdcard/AURA_CRYPTO_${WALLET:0:10}_$(date +%Y%m%d).txt"
echo "Wallet: $WALLET" > "$REPORT"
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$REPORT" -out "$REPORT.enc" -pass stdin
rm "$REPORT"
echo "📁 Report saved: $REPORT.enc"
