#!/bin/bash
# AURA VPN CHECKER
PUBLIC_IP=$(curl -s ifconfig.me)
echo "🌍 Current IP: $PUBLIC_IP"
curl -s "ipinfo.io/$PUBLIC_IP" | grep -E '"city"|"country"|"org"'
