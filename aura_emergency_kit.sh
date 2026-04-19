#!/bin/bash

# AURA EMERGENCY RECOVERY KIT
# One-command recovery for all Aura tools

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║           🚨 AURA EMERGENCY RECOVERY KIT 🚨                  ║
╚══════════════════════════════════════════════════════════════╝"
echo ""

echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  📦 RECOVERY OPTIONS                                          │
├─────────────────────────────────────────────────────────────┤"
echo "│  1. Restore Latest Backup                                    │
│  2. Reinstall All Aura Scripts                                    │
│  3. Export All Encrypted Reports                                  │
│  4. Create Emergency Report                                       │
│  5. Exit                                                          │
└─────────────────────────────────────────────────────────────────┘"
echo ""
read -p "Select option: " OPT

case $OPT in
    1) bash ~/aura_restore.sh ;;
    2) bash ~/aura_install_all.sh ;;
    3) cp /sdcard/AURA_*.enc ~/storage/downloads/ 2>/dev/null
       echo "✅ Reports copied to Downloads" ;;
    4) bash ~/aura_lockdown.sh ;;
    5) exit 0 ;;
    *) echo "Invalid option" ;;
esac
