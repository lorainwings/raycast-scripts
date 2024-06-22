#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Enable MongoDB Database Services
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📦
# @raycast.packageName Enable Mongodb Database Services
# @raycast.needsConfirmation false

# Documentation:
# @raycast.description Enable MongoDB Database Services
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

echo "📦 Enable MongoDB Database Services!";

mongod --config /usr/local/etc/mongod.conf;

echo "✅ MongoDB Database Services Enabled!";