#!/bin/bash

echo "========================================="
echo "       NGROK - Secure Tunneling"
echo "========================================="
echo ""

# Check if token is configured
if ! ngrok config check 2>/dev/null | grep -q "valid configuration"; then
    echo "⚠️ Ngrok not configured. Run: ngrok config add-authtoken YOUR_TOKEN"
    echo "Get token from: https://dashboard.ngrok.com/auth"
    exit 1
fi

echo "Your ngrok is ready!"
echo ""
echo "Options:"
echo "1. Start HTTP tunnel (port 8080) - for phishing tools"
echo "2. Start HTTP tunnel (custom port)"
echo "3. Show active tunnels"
echo "4. Stop all tunnels"
echo "5. Ngrok web interface (http://127.0.0.1:4040)"
echo ""
read -p "Choice: " OPT

case $OPT in
    1) 
        echo ""
        echo "🔥 Starting ngrok on port 8080..."
        echo "Share this URL with your target:"
        ngrok http 8080
        ;;
    2) 
        read -p "Enter port number: " PORT
        echo ""
        echo "🔥 Starting ngrok on port $PORT..."
        ngrok http $PORT
        ;;
    3) 
        curl -s http://127.0.0.1:4040/api/tunnels | python -m json.tool 2>/dev/null || echo "No active tunnels"
        ;;
    4) 
        pkill ngrok
        echo "✅ All tunnels stopped"
        ;;
    5) 
        echo "Open in browser: http://127.0.0.1:4040"
        ;;
    *) echo "Invalid option" ;;
esac
