#!/bin/bash
echo "========================================="
echo "       WORDLIST MANAGER"
echo "========================================="
echo ""
if [ -f "$HOME/rockyou.txt" ]; then
    SIZE=$(du -h $HOME/rockyou.txt | cut -f1)
    echo "✅ rockyou.txt found ($SIZE)"
else
    echo "Downloading rockyou.txt..."
    curl -L -o $HOME/rockyou.txt https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
fi
echo ""
echo "Wordlist location: $HOME/rockyou.txt"
