#!/bin/bash

# SMS TEST TOOL
# Test YOUR own SMS receiving capability

echo "========================================="
echo "   SMS TEST TOOL"
echo "   Test YOUR own number only"
echo "========================================="
echo ""

read -p "Enter YOUR phone number: " NUMBER
read -p "Number of test messages (1-10): " COUNT

if [ $COUNT -gt 10 ]; then
    COUNT=10
fi

echo ""
echo "📱 Sending $COUNT test messages to YOUR number..."

# Use free SMS API (demo only)
for i in $(seq 1 $COUNT); do
    curl -s "https://textbelt.com/text" -d "phone=$NUMBER" -d "message=Test message $i from Aura Security" -d key=textbelt > /dev/null
    echo "Message $i sent"
    sleep 1
done

echo ""
echo "✅ Test complete - Check YOUR phone"
