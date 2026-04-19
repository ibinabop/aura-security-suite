#!/bin/bash

# AURA SECURITY SUITE INSTALLER
# One command to rule them all

echo ""
echo "========================================="
echo "   🔥 AURA SECURITY SUITE INSTALLER 🔥"
echo "========================================="
echo ""
echo "Author: Aura V6"
echo "GitHub: github.com/Aura V6/aura-security-suite"
echo ""

# Check if Termux
if [ ! -d "/data/data/com.termux" ]; then
    echo "❌ This installer is for Termux only!"
    echo "Download Termux from: https://f-droid.org/en/packages/com.termux/"
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "📦 Updating Termux packages..."
pkg update && pkg upgrade -y

echo "📦 Installing dependencies..."
pkg install -y git python php nmap curl wget net-tools

echo "📦 Cloning external tools..."
cd ~
git clone https://github.com/htr-tech/zphisher.git 2>/dev/null
git clone https://github.com/sherlock-project/sherlock.git 2>/dev/null
git clone https://github.com/laramies/theHarvester.git 2>/dev/null
git clone https://github.com/sundowndev/PhoneInfoga.git 2>/dev/null
git clone https://github.com/rajkumardusad/IP-Tracer.git 2>/dev/null

echo "📦 Installing Aura scripts..."
# Copy from the cloned repository directory
cp "$SCRIPT_DIR"/aura*.sh ~/ 2>/dev/null
cp "$SCRIPT_DIR"/aura*.py ~/ 2>/dev/null
chmod +x ~/aura*.sh
chmod +x ~/aura*.py

echo ""
echo "✅ INSTALLATION COMPLETE!"
echo ""
echo "🚀 To start: bash ~/aura.sh"
echo "📖 For help: bash ~/aura.sh and select option 0"
echo ""
echo "⚠️  LEGAL DISCLAIMER: Educational use only!"
echo ""
