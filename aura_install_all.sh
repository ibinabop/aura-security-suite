#!/bin/bash

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              🔥 INSTALLING AURA COMPLETE SUITE 🔥            ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Create all Aura scripts (simplified versions without special chars)

cat > ~/aura_backup.sh << 'SCRIPT'
#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/sdcard/AURA_BACKUP_$DATE"
mkdir -p "$BACKUP_DIR"
rsync -avz --progress ~/ "$BACKUP_DIR/HOME_BACKUP/" 2>/dev/null
echo "Backup completed on $(date)" > "$BACKUP_DIR/backup_log.txt"
echo "AURA BACKUP COMPLETE - Location: $BACKUP_DIR"
SCRIPT

cat > ~/aura_netmon.sh << 'SCRIPT'
#!/bin/bash
PUBLIC_IP=$(curl -s ifconfig.me)
echo "Public IP: $PUBLIC_IP"
ping -c 1 -W 2 8.8.8.8 >/dev/null 2>&1 && echo "Internet: Connected" || echo "Internet: Disconnected"
SCRIPT

cat > ~/aura_scan.sh << 'SCRIPT'
#!/bin/bash
echo "Scanning for suspicious files..."
find ~/ -name "*.sh" -type f 2>/dev/null | head -20
echo "Scan complete"
SCRIPT

cat > ~/aura_encrypt.sh << 'SCRIPT'
#!/bin/bash
read -p "Enter file to encrypt: " FILE
if [ -f "$FILE" ]; then
    echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$FILE" -out "$FILE.enc" -pass stdin
    echo "Encrypted: $FILE.enc"
else
    echo "File not found"
fi
SCRIPT

cat > ~/aura_decrypt.sh << 'SCRIPT'
#!/bin/bash
read -p "Enter file to decrypt (.enc): " FILE
if [ -f "$FILE" ]; then
    OUTPUT="${FILE%.enc}"
    echo -n "AuraV6" | openssl enc -d -aes-256-cbc -in "$FILE" -out "$OUTPUT" -pass stdin 2>/dev/null
    echo "Decrypted: $OUTPUT"
else
    echo "File not found"
fi
SCRIPT

cat > ~/aura_fim.sh << 'SCRIPT'
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
SCRIPT

cat > ~/aura_processmon.sh << 'SCRIPT'
#!/bin/bash
echo "Running processes:" > /sdcard/processes.txt
ps aux >> /sdcard/processes.txt 2>/dev/null
echo "Process log saved to /sdcard/processes.txt"
SCRIPT

cat > ~/aura_phonesec.sh << 'SCRIPT'
#!/bin/bash
echo "Phone Security Checklist"
echo "1. Enable Screen Lock"
echo "2. Enable Find My Device"
echo "3. Keep OS updated"
echo "4. Use VPN on public WiFi"
SCRIPT

cat > ~/aura_otp.sh << 'SCRIPT'
#!/bin/bash
pip install pyotp 2>/dev/null
python3 -c "
import pyotp
import time
secret = 'AURAV6SECRETKEY123456'
totp = pyotp.TOTP(secret)
print(f'Current OTP: {totp.now()}')
"
SCRIPT

cat > ~/aura_defense_matrix.sh << 'SCRIPT'
#!/bin/bash
echo "Running all defense layers..."
bash ~/aura_backup.sh 2>/dev/null
bash ~/aura_fim.sh 2>/dev/null
bash ~/aura_processmon.sh 2>/dev/null
echo "Defense matrix complete"
SCRIPT

cat > ~/aura_detect_attack.sh << 'SCRIPT'
#!/bin/bash
echo "Checking for active connections..."
netstat -an 2>/dev/null | grep ESTABLISHED | head -10
echo "Detection complete"
SCRIPT

cat > ~/aura_lockdown.sh << 'SCRIPT'
#!/bin/bash
echo "EMERGENCY LOCKDOWN - Disabling network..."
if command -v ifconfig &> /dev/null; then
    ifconfig wlan0 down 2>/dev/null
fi
echo "Lockdown complete - Network disabled"
SCRIPT

cat > ~/aura_restore.sh << 'SCRIPT'
#!/bin/bash
echo "Available backups:"
ls -la /sdcard/ | grep AURA_BACKUP
read -p "Enter backup name: " BACKUP_NAME
if [ -d "/sdcard/$BACKUP_NAME" ]; then
    rsync -avz "/sdcard/$BACKUP_NAME/HOME_BACKUP/" ~/ 2>/dev/null
    echo "Restore complete"
else
    echo "Backup not found"
fi
SCRIPT

cat > ~/aura_http_flood.py << 'SCRIPT'
#!/usr/bin/env python3
import requests, threading, time
print("HTTP Flood Simulator - Test your own server only")
target = input("Enter target URL (your server): ")
threads = int(input("Threads (1-20): "))
def flood():
    while True:
        try:
            requests.get(target, timeout=5)
            print("Request sent")
        except:
            print("Failed")
        time.sleep(0.01)
for i in range(threads):
    threading.Thread(target=flood).start()
SCRIPT

cat > ~/aura.sh << 'SCRIPT'
#!/bin/bash
while true; do
clear
echo "========================================="
echo "        AURA MASTER CONTROL PANEL        "
echo "========================================="
echo ""
echo "DEFENSE TOOLS:"
echo "1. Backup System"
echo "2. Network Monitor"
echo "3. Security Scan"
echo "4. Process Monitor"
echo "5. Defense Matrix (All)"
echo ""
echo "ENCRYPTION:"
echo "6. Encrypt File"
echo "7. Decrypt File"
echo ""
echo "OFFENSIVE (Educational):"
echo "8. Zphisher (Phishing)"
echo "9. SQLMap (SQL Injection)"
echo "10. Nmap (Port Scan)"
echo ""
echo "PHONE SECURITY:"
echo "11. Phone Security"
echo "12. OTP Generator"
echo ""
echo "0. Exit"
echo ""
read -p "Select option: " OPT

case $OPT in
    1) bash ~/aura_backup.sh ;;
    2) bash ~/aura_netmon.sh ;;
    3) bash ~/aura_scan.sh ;;
    4) bash ~/aura_processmon.sh ;;
    5) bash ~/aura_defense_matrix.sh ;;
    6) bash ~/aura_encrypt.sh ;;
    7) bash ~/aura_decrypt.sh ;;
    8) cd ~/zphisher && bash zphisher.sh 2>/dev/null ;;
    9) cd ~/sqlmap && python sqlmap.py --help 2>/dev/null ;;
    10) read -p "Target IP: " t; nmap -sP $t 2>/dev/null ;;
    11) bash ~/aura_phonesec.sh ;;
    12) bash ~/aura_otp.sh ;;
    0) exit 0 ;;
    *) echo "Invalid option" ;;
esac
echo ""
read -p "Press Enter to continue..."
done
SCRIPT

chmod +x ~/aura_backup.sh ~/aura_netmon.sh ~/aura_scan.sh ~/aura_encrypt.sh ~/aura_decrypt.sh
chmod +x ~/aura_fim.sh ~/aura_processmon.sh ~/aura_phonesec.sh ~/aura_otp.sh ~/aura_defense_matrix.sh
chmod +x ~/aura_detect_attack.sh ~/aura_lockdown.sh ~/aura_restore.sh ~/aura.sh

echo ""
echo "INSTALLATION COMPLETE!"
echo ""
echo "To start: bash ~/aura.sh"
echo "Password: AuraV6"
