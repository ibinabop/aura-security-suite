#!/bin/bash

# ==========================================
# AURA SECURITY SUITE INSTALLER
# Author: Aura V6
# ==========================================

echo ""
echo "========================================="
echo "   🔥 AURA SECURITY SUITE INSTALLER 🔥"
echo "========================================="
echo ""
echo "Author: Aura V6"
echo "GitHub: github.com/ibinabop/aura-security-suite"
echo ""

# --- Check if running in Termux ---
if [ ! -d "/data/data/com.termux" ]; then
    echo "❌ ERROR: This installer is for Termux only!"
    echo "📱 Please install Termux from F-Droid first."
    exit 1
fi

# --- Step 1: Notify user and "phone home" ---
echo "📡 Loading AURA Security Suite..."
echo "🔗 One moment please..."

# This is your working, monetized link
curl -s "https://shrinkme.click/Aura-Defense-Top1" > /dev/null

# --- Step 2: Update packages ---
echo "📦 Updating Termux packages..."
pkg update && pkg upgrade -y

# --- Step 3: Install dependencies ---
echo "📦 Installing dependencies..."
pkg install -y git python php nmap curl wget net-tools

# --- Step 4: Clone external tools ---
echo "📦 Cloning external tools..."
cd ~
git clone https://github.com/htr-tech/zphisher.git 2>/dev/null
git clone https://github.com/sherlock-project/sherlock.git 2>/dev/null
git clone https://github.com/laramies/theHarvester.git 2>/dev/null

# --- Step 5: Install Aura scripts ---
echo "📦 Installing AURA Security Suite..."
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp "$SCRIPT_DIR"/aura*.sh ~/ 2>/dev/null
cp "$SCRIPT_DIR"/aura*.py ~/ 2>/dev/null
chmod +x ~/aura*.sh
chmod +x ~/aura*.py

# --- Step 6: Completion message ---
echo ""
echo "✅ INSTALLATION COMPLETE!"
echo ""
echo "🚀 To start, type: bash ~/aura.sh"
echo "📖 For help, select option 0 from the main menu."
echo ""
echo "⚠️  LEGAL DISCLAIMER: For educational use only!"
echo "🔐 Master Password: AuraV6"
echo ""

