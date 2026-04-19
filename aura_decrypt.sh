#!/bin/bash
read -p "Enter file to decrypt (.enc): " FILE
if [ -f "$FILE" ]; then
    OUTPUT="${FILE%.enc}"
    echo -n "AuraV6" | openssl enc -d -aes-256-cbc -in "$FILE" -out "$OUTPUT" -pass stdin 2>/dev/null
    echo "Decrypted: $OUTPUT"
else
    echo "File not found"
fi
