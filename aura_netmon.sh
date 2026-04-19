#!/bin/bash
PUBLIC_IP=$(curl -s ifconfig.me)
echo "Public IP: $PUBLIC_IP"
ping -c 1 -W 2 8.8.8.8 >/dev/null 2>&1 && echo "Internet: Connected" || echo "Internet: Disconnected"
