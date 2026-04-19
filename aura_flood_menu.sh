#!/bin/bash
echo "💀 FLOOD SIMULATION MENU (Educational)"
echo "1. HTTP Flood"
echo "2. Ping Flood"
read -p "Choice: " opt
case $opt in
    1) python ~/aura_http_flood.py ;;
    2) read -p "Target IP: " ip; ping -f $ip ;;
esac
