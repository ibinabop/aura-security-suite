#!/bin/bash
echo "Scanning for suspicious files..."
find ~/ -name "*.sh" -type f 2>/dev/null | head -20
echo "Scan complete"
