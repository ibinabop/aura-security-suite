#!/bin/bash

echo "========================================="
echo "       CLOUDFLARED TUNNEL"
echo "========================================="
echo ""
echo "Before starting:"
echo "1. Open a NEW Termux window"
echo "2. Start your phishing tool (Zphisher, etc.)"
echo "3. Choose 'Localhost' when asked"
echo "4. Come back here and press Enter"
echo ""
read -p "Press Enter to start tunnel..."

echo ""
echo "Starting Cloudflared tunnel..."
echo "Your public URL will appear below:"
echo ""

cloudflared tunnel --url http://localhost:8080
