#!/bin/bash

# AURA INCIDENT RESPONSE
# Use this if you detect a security breach

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              🚨 AURA INCIDENT RESPONSE 🚨                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  📋 INCIDENT RESPONSE PROCEDURES                             │
echo "├─────────────────────────────────────────────────────────────┤"
echo "│  1. DISCONNECT from network immediately                     │
echo "│  2. Run: bash ~/aura_fim.sh (check file changes)            │
echo "│  3. Run: bash ~/aura_processmon.sh (check processes)        │
echo "│  4. Run: bash ~/aura_logger.sh (capture logs)               │
echo "│  5. Change ALL passwords                                     │
echo "│  6. Contact authorities if crime occurred                   │
echo "└─────────────────────────────────────────────────────────────┘"
echo ""

# Create emergency evidence package
EVIDENCE_DIR="/sdcard/AURA_EVIDENCE_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$EVIDENCE_DIR"

echo "📦 Creating evidence package..."

# Capture current state
ps aux > "$EVIDENCE_DIR/processes.txt" 2>/dev/null
netstat -an > "$EVIDENCE_DIR/connections.txt" 2>/dev/null
history > "$EVIDENCE_DIR/command_history.txt" 2>/dev/null

# Package and encrypt
tar -czf "$EVIDENCE_DIR.tar.gz" "$EVIDENCE_DIR" 2>/dev/null
echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$EVIDENCE_DIR.tar.gz" -out "$EVIDENCE_DIR.enc" -pass stdin 2>/dev/null

rm -rf "$EVIDENCE_DIR" "$EVIDENCE_DIR.tar.gz" 2>/dev/null

echo "✅ Evidence package created: $EVIDENCE_DIR.enc"
echo "🔐 Password: AuraV6"
