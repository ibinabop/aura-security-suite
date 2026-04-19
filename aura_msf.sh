#!/bin/bash

echo "========================================="
echo "       METASPLOIT FRAMEWORK"
echo "========================================="
echo ""

# Try to fix missing gems first
if [ -d "/data/data/com.termux/files/usr/opt/metasploit-framework" ]; then
    echo "Fixing Metasploit dependencies..."
    cd /data/data/com.termux/files/usr/opt/metasploit-framework
    bundle install --without test development 2>/dev/null
    echo "Launching msfconsole..."
    ruby msfconsole
else
    echo "❌ Metasploit not found in expected location"
    echo "Try reinstalling with:"
    echo "cd ~/metasploit_in_termux && ./metasploit.sh"
fi
