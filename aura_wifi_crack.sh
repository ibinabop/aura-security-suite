#!/bin/bash

echo "========================================="
echo "     CRACK WIFI HANDSHAKE"
echo "========================================="
echo ""

read -p "Enter capture file (.cap): " CAPTURE
read -p "Enter wordlist path: " WORDLIST

echo ""
echo "Cracking $CAPTURE with wordlist $WORDLIST..."
echo ""

aircrack-ng -w $WORDLIST $CAPTURE
