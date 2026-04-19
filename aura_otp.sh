#!/bin/bash
pip install pyotp 2>/dev/null
python3 -c "
import pyotp
import time
secret = 'AURAV6SECRETKEY123456'
totp = pyotp.TOTP(secret)
print(f'Current OTP: {totp.now()}')
"
