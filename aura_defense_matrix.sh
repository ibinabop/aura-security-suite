#!/bin/bash
echo "Running all defense layers..."
bash ~/aura_backup.sh 2>/dev/null
bash ~/aura_fim.sh 2>/dev/null
bash ~/aura_processmon.sh 2>/dev/null
echo "Defense matrix complete"
