#!/bin/bash
echo "========================================="
echo "       JOHN THE RIPPER - Password Cracker"
echo "========================================="
echo ""
echo "Usage:"
echo "  zip2john file.zip > hash.txt"
echo "  john --wordlist=rockyou.txt hash.txt"
echo ""
echo "Current wordlist: $HOME/rockyou.txt"
echo ""
john
