#!/bin/bash

echo "========================================="
echo "   INSTALLING MISSING AURA TOOLS"
echo "========================================="

# Install AdvPhishing
cd ~
git clone https://github.com/Ignitetch/AdvPhishing.git

# Install PyPhisher
git clone https://gitlab.com/KasRoudra/PyPhisher.git
cd PyPhisher
pip3 install -r files/requirements.txt 2>/dev/null
cd ~

# Install MrPhish
git clone https://github.com/noob-hackers/mrphish.git

# Install Airgeddon (optional - needs root)
git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git

echo ""
echo "✅ All missing tools installed!"
echo ""
echo "Tools added:"
echo "  - AdvPhishing (OTP Capture)"
echo "  - PyPhisher (2FA Phishing)"
echo "  - MrPhish (OTP Bypass)"
echo "  - Airgeddon (WiFi MITM - needs root)"
