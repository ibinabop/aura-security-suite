#!/bin/bash

# AURA SECURITY DASHBOARD
# Complete security overview

while true; do
clear
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              🔥 AURA SECURITY DASHBOARD 🔥                   ║
║                   💀 SHADOW PROTOCOL v6 💀                         ║
╚════════════════════════════════════════════════════════════════════╝"
echo ""

# System Status
echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  🖥️ SYSTEM STATUS                                             │"
echo "├─────────────────────────────────────────────────────────────┤"
UPTIME=$(uptime | awk -F 'up ' '{print $2}' | awk -F ',' '{print $1}')
echo "│  ⏱️ Uptime: $UPTIME"
echo "│  📅 Date: $(date)"
echo "│  💾 Storage: $(df -h /data | awk 'NR==2 {print $5}') used"
echo "└─────────────────────────────────────────────────────────────┘"
echo ""

# Backup Status
echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  💾 BACKUP STATUS                                             │"
echo "├─────────────────────────────────────────────────────────────┤"
BACKUP_COUNT=$(ls -d /sdcard/AURA_BACKUP_* 2>/dev/null | wc -l)
if [ $BACKUP_COUNT -gt 0 ]; then
    echo "│  ✅ $BACKUP_COUNT backups found"
    LATEST=$(ls -td /sdcard/AURA_BACKUP_* 2>/dev/null | head -1)
    echo "│  📁 Latest: $(basename $LATEST)"
else
    echo "│  ❌ No backups found. Run: bash ~/aura_backup.sh"
fi
echo "└─────────────────────────────────────────────────────────────┘"
echo ""

# Report Status
echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  📊 REPORT STATUS                                             │
├─────────────────────────────────────────────────────────────┤"
REPORT_COUNT=$(ls /sdcard/AURA_*.enc 2>/dev/null | wc -l)
echo "│  📁 $REPORT_COUNT encrypted reports"
echo "│  🔐 All protected with password: AuraV6"
echo "└─────────────────────────────────────────────────────────────┘"
echo ""

# Quick Actions
echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  🚀 QUICK ACTIONS                                             │
├─────────────────────────────────────────────────────────────┤"
echo "│  b - Run Backup          s - Run Security Scan"
echo "│  n - Network Status      l - View Logs"
echo "│  d - Defense Matrix      p - Phone Security"
echo "│  m - Main Menu           x - Exit"
echo "└─────────────────────────────────────────────────────────────┘"
echo ""
read -p "Select action: " ACTION

case $ACTION in
    b) bash ~/aura_backup.sh ;;
    s) bash ~/aura_scan.sh ;;
    n) bash ~/aura_netmon.sh ;;
    l) ls -la /sdcard/AURA_*.enc ;;
    d) bash ~/aura_defense_matrix.sh ;;
    p) bash ~/aura_phone_menu.sh ;;
    m) bash ~/aura.sh ;;
    x) exit 0 ;;
    *) echo "Invalid option" ;;
esac
echo ""
read -p "Press Enter to continue..."
done
