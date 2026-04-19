#!/bin/bash
echo "========================================="
echo "       BROWSER TOKEN EXTRACTOR"
echo "   Extract YOUR OWN browser tokens"
echo "========================================="
echo ""
echo "This tool extracts YOUR OWN browser cookies/tokens"
echo "For educational purposes only"
echo ""
# Try different Chrome/Kiwi paths
CHROME_PATHS=(
    "/data/data/com.android.chrome/app_chrome/Default/Cookies"
    "/data/data/com.android.chrome/app_chrome/Default/Cookies-journal"
    "/data/data/com.kiwibrowser.browser/app_webview/Default/Cookies"
)
for path in "${CHROME_PATHS[@]}"; do
    if [ -f "$path" ]; then
        echo "✅ Found cookies at: $path"
        echo ""
        echo "Extracting cookies..."
        sqlite3 "$path" "SELECT host_key, name, value FROM cookies LIMIT 10;" 2>/dev/null
        echo ""
    fi
done
if [ ! -f "/data/data/com.android.chrome/app_chrome/Default/Cookies" ]; then
    echo "❌ Chrome/Kiwi browser not found or no cookies"
    echo "Make sure Chrome/Kiwi browser is installed and used"
fi
