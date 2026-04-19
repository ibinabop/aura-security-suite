#!/bin/bash
echo "Checking for active connections..."
netstat -an 2>/dev/null | grep ESTABLISHED | head -10
echo "Detection complete"
