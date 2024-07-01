#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clean DNS Cache
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🥡
# @raycast.argument1 { "type": "password", "placeholder": "Enter Password" }
# @raycast.packageName Clean DNS Cache
# @raycast.needsConfirmation true

# Documentation:
# @raycast.description Clean System DNS Cache 
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

echo "🥡 Clean DNS cache of the system!"

PASSWORD=$1

echo $PASSWORD | sudo -S killall -HUP mDNSResponder;
echo $PASSWORD | sudo -S killall mDNSResponderHelper;
echo $PASSWORD | sudo -S dscacheutil -flushcache;

echo "✅ Clean Task Done!";