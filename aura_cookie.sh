#!/bin/bash

echo "========================================="
echo "       COOKIESTEALERS - Session Hijacking"
echo "========================================="
echo ""

cd ~/CookieStealers

echo "Available tools in CookieStealers:"
echo ""
echo "1. Facebook Cookie Stealer"
echo "2. Instagram Cookie Stealer"
echo "3. Twitter Cookie Stealer"
echo "4. X-hydra (Login Cracker)"
echo "5. FluxER (WiFi MITM)"
echo ""
read -p "Select tool (1-5): " TOOL

case $TOOL in
    1)
        if [ -d "facebook" ]; then
            cd facebook
            echo "Facebook Cookie Stealer"
            echo "Look for main script:"
            ls -la
            # Try to run common script names
            if [ -f "stealer.py" ]; then
                python stealer.py
            elif [ -f "main.py" ]; then
                python main.py
            elif [ -f "index.html" ]; then
                echo "Starting phishing server..."
                php -S 127.0.0.1:8080
            else
                echo "No script found. Contents:"
                ls -la
            fi
        else
            echo "Facebook tool not found"
        fi
        ;;
    2)
        if [ -d "instagram" ]; then
            cd instagram
            echo "Instagram Cookie Stealer"
            ls -la
            if [ -f "stealer.py" ]; then
                python stealer.py
            elif [ -f "main.py" ]; then
                python main.py
            else
                echo "No script found"
            fi
        else
            echo "Instagram tool not found"
        fi
        ;;
    3)
        if [ -d "twitter" ]; then
            cd twitter
            echo "Twitter Cookie Stealer"
            ls -la
            if [ -f "stealer.py" ]; then
                python stealer.py
            elif [ -f "main.py" ]; then
                python main.py
            else
                echo "No script found"
            fi
        else
            echo "Twitter tool not found"
        fi
        ;;
    4)
        cd X-hydra
        echo "X-hydra Login Cracker"
        if [ -f "xhydra.py" ]; then
            python xhydra.py
        elif [ -f "hydra.py" ]; then
            python hydra.py
        else
            ls -la
        fi
        ;;
    5)
        cd FluxER
        echo "FluxER WiFi MITM"
        if [ -f "fluxer.sh" ]; then
            bash fluxer.sh
        else
            ls -la
        fi
        ;;
    *) echo "Invalid option" ;;
esac
