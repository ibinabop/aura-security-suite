#!/bin/bash

echo "========================================="
echo "     SETUP MONITOR MODE"
echo "========================================="
echo ""

read -p "Enter interface: " INTERFACE

echo "Killing interfering processes..."
sudo airmon-ng check kill

echo "Starting monitor mode..."
sudo airmon-ng start $INTERFACE

echo ""
echo "Monitor mode started on ${INTERFACE}mon"
