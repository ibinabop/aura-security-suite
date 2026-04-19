#!/bin/bash
# AURA SECURITY SUITE INSTALLER
# Author: ibinabop
# GitHub: github.com/ibinabop/aura-security-suite

echo "========================================="
echo "   🔥 AURA SECURITY SUITE INSTALLER 🔥"
echo "========================================="

pkg update && pkg upgrade -y
pkg install -y git python php nmap curl wget

cd ~
git clone https://github.com/htr-tech/zphisher.git 2>/dev/null
git clone https://github.com/sherlock-project/sherlock.git 2>/dev/null
git clone https://github.com/laramies/theHarvester.git 2>/dev/null

cp aura-security-suite/aura*.sh ~/ 2>/dev/null
chmod +x ~/aura*.sh

echo "✅ Installation complete!"
echo "Run: bash ~/aura.sh"
