#!/bin/bash
read -p "Enter file to encrypt: " FILE
if [ -f "$FILE" ]; then
    echo -n "AuraV6" | openssl enc -aes-256-cbc -salt -in "$FILE" -out "$FILE.enc" -pass stdin
    echo "Encrypted: $FILE.enc"
else
    echo "File not found"
fi
