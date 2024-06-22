#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Disable MongoDB Database Services
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🚫
# @raycast.packageName Disable Mongodb Database Services
# @raycast.needsConfirmation false

# Documentation:
# @raycast.description Disable MongoDB Database Services
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

echo "🚫 Disable MongoDB Database Services!";

port=$(pgrep mongod)

if [ -n "$port" ]; then
    kill -9 $port
    echo "✅ MongoDB Database Services Disabled!";
else
    echo "🚧 MongoDB Database Services Not Running!"
fi
