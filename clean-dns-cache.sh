#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clean DNS Cache
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🥡
# @raycast.packageName Clean DNS Cache
# @raycast.needsConfirmation true

# Documentation:
# @raycast.description Clean System DNS Cache 
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

echo "🥡 Clean DNS cache of the system!"

sudo killall -HUP mDNSResponder;
sudo killall mDNSResponderHelper;
sudo dscacheutil -flushcache;

echo "✅ Clean Task Done!";