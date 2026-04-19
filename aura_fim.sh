#!/bin/bash
FIM_DIR="/sdcard/AURA_FIM"
mkdir -p "$FIM_DIR"
BASELINE_FILE="$FIM_DIR/baseline.txt"
if [ ! -f "$BASELINE_FILE" ]; then
    find ~/ -type f -exec md5sum {} \; 2>/dev/null > "$BASELINE_FILE"
    echo "Baseline created"
else
    echo "Baseline exists - run compare manually"
fi
