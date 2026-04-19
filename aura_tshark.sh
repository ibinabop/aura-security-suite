#!/bin/bash
echo "========================================="
echo "       TSHARK (Wireshark CLI)"
echo "========================================="
echo "Note: tshark requires root for packet capture"
echo ""
echo "Without root, use these alternatives:"
echo "- nmap for port scanning"
echo "- curl for HTTP requests"
echo "- ping for connectivity tests"
echo ""
read -p "Enter URL to test: " URL
curl -I $URL
