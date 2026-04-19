#!/bin/bash
echo "Running processes:" > /sdcard/processes.txt
ps aux >> /sdcard/processes.txt 2>/dev/null
echo "Process log saved to /sdcard/processes.txt"
