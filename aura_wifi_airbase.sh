#!/bin/bash
echo "========================================="
echo "     FAKE ACCESS POINT (airbase-ng)"
echo "========================================="
echo ""
read -p "Enter Interface: " INTERFACE
read -p "Enter SSID name: " SSID
echo ""
echo "Creating fake AP: $SSID"
echo "Press Ctrl+C to stop"
sudo airbase-ng --essid "$SSID" $INTERFACE
