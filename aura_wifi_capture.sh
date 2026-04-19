#!/bin/bash

echo "========================================="
echo "     CAPTURE WIFI HANDSHAKE"
echo "========================================="
echo ""

read -p "Enter BSSID (MAC address): " BSSID
read -p "Enter Channel: " CHANNEL
read -p "Enter Interface: " INTERFACE
read -p "Output filename: " OUTPUT

echo ""
echo "Capturing handshake on $INTERFACE..."
echo "Target: $BSSID on channel $CHANNEL"
echo "Press Ctrl+C when handshake is captured"

sudo airodump-ng --bssid $BSSID --channel $CHANNEL -w $OUTPUT $INTERFACE
