#!/bin/bash

echo "========================================="
echo "     SCAN FOR WIFI NETWORKS"
echo "  (Requires root + external adapter)"
echo "========================================="
echo ""

# List interfaces
echo "Available interfaces:"
ip link show | grep -E "^[0-9]+:" | cut -d: -f2

echo ""
read -p "Enter interface (e.g., wlan0): " INTERFACE

echo ""
echo "Starting scan on $INTERFACE..."
echo "Press Ctrl+C to stop"

# Run airodump-ng (requires root)
sudo airodump-ng $INTERFACE
