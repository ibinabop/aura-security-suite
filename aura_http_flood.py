#!/usr/bin/env python3
import requests, threading, time
print("HTTP Flood Simulator - Test your own server only")
target = input("Enter target URL (your server): ")
threads = int(input("Threads (1-20): "))
def flood():
    while True:
        try:
            requests.get(target, timeout=5)
            print("Request sent")
        except:
            print("Failed")
        time.sleep(0.01)
for i in range(threads):
    threading.Thread(target=flood).start()
