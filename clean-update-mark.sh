#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clean Update Mark
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🗑️
# @raycast.packageName Clean Update Mark
# @raycast.needsConfirmation true

# Documentation:
# @raycast.description Clean System And Appstore Update Mark
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

echo "🗑️ Clean up the update tags of the appstore and system..."

defaults write com.apple.appstored.plist BadgeCount 0
defaults write com.apple.systempreferences AttentionPrefBundleIDs 0
Killall Dock

echo "✅ Clean Task Done!"
