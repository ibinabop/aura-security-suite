#!/bin/bash

# SCAM BANK ACCOUNT REPORTER
# Report scam accounts to banks (Legal)

echo "========================================="
echo "   SCAM BANK ACCOUNT REPORTER"
echo "========================================="
echo ""

read -p "Enter scammer's bank account number: " ACCOUNT
read -p "Enter bank name: " BANK

echo ""
echo "📧 Report to $BANK fraud department:"
echo "Subject: Fraudulent account - $ACCOUNT"
echo "Body: This account is being used for scams"
echo "Include: Evidence, your contact info, police report"

echo ""
echo "✅ Also report to:"
echo "   - FBI IC3: https://ic3.gov"
echo "   - Local police"
echo "   - EFCC (Nigeria)"

REPORT="/sdcard/AURA_BANK_REPORT_$(date +%Y%m%d).txt"
echo "Account: $ACCOUNT" > "$REPORT"
echo "Bank: $BANK" >> "$REPORT"
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$REPORT" -out "$REPORT.enc" -pass stdin
rm "$REPORT"
echo "📁 Report saved: $REPORT.enc"
