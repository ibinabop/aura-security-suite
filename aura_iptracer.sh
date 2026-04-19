#!/bin/bash
echo "========================================="
echo "       IP-TRACER - Track IP Location"
echo "========================================="
echo ""
read -p "Enter IP address to trace: " IP
if command -v trace &> /dev/null; then
    trace -t $IP
elif command -v ip-tracer &> /dev/null; then
    ip-tracer -t $IP
else
    echo "IP-Tracer not found. Installing..."
    cd ~
    git clone https://github.com/rajkumardusad/IP-Tracer.git
    cd IP-Tracer
    chmod +x install && ./install
    trace -t $IP
fi
