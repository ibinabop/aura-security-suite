#!/bin/bash
echo "========================================="
echo "       PACKET CAPTURE (tcpdump)"
echo "========================================="
echo "Note: Requires root for packet capture"
echo ""
echo "Without root, use alternative methods:"
echo "1. Use nmap for network discovery"
echo "2. Use ping to test connectivity"
echo "3. Use curl for HTTP tests"
echo ""
read -p "Press Enter to run a network scan instead..."
nmap -sn 192.168.1.0/24
