#!/usr/bin/env python3

import phonenumbers
from phonenumbers import carrier, geocoder, timezone
import sys

print("=" * 60)
print("        AURA PHONE NUMBER OSINT (Educational)")
print("=" * 60)
print("")

if len(sys.argv) < 2:
    phone = input("Enter phone number (with country code, e.g., +2347012345678): ")
else:
    phone = sys.argv[1]

try:
    parsed = phonenumbers.parse(phone)
    
    print(f"📱 Number: {phone}")
    print(f"🌍 Country: {geocoder.description_for_number(parsed, 'en')}")
    print(f"📡 Carrier: {carrier.name_for_number(parsed, 'en')}")
    print(f"⏰ Timezone: {timezone.time_zones_for_number(parsed)}")
    print(f"✅ Valid: {phonenumbers.is_valid_number(parsed)}")
    print(f"🔢 Possible: {phonenumbers.is_possible_number(parsed)}")
    
except Exception as e:
    print(f"❌ Error: {e}")
    print("Make sure to include country code (e.g., +234 for Nigeria)")
