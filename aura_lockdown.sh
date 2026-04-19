#!/bin/bash
echo "EMERGENCY LOCKDOWN - Disabling network..."
if command -v ifconfig &> /dev/null; then
    ifconfig wlan0 down 2>/dev/null
fi
echo "Lockdown complete - Network disabled"
