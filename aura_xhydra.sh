#!/bin/bash
echo "========================================="
echo "       X-HYDRA - Login Cracker"
echo "========================================="
echo ""
cd ~/X-hydra
echo "Looking for main script..."
if [ -f "xhydra.py" ]; then
    python xhydra.py
elif [ -f "hydra.py" ]; then
    python hydra.py
elif [ -f "run.sh" ]; then
    bash run.sh
else
    echo "Available files:"
    ls -la
    echo ""
    echo "X-hydra is a login cracker supporting multiple protocols"
    echo "Usage: python xhydra.py -t target.com -l admin -P wordlist.txt"
fi
