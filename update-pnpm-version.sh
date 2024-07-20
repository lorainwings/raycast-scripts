#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Update Pnpm Version
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🆙
# @raycast.packageName Update Pnpm Version

# Documentation:
# @raycast.description Update Pnpm Version
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain

set -e

echo "🔥 Update pnpm version..."

export all_proxy="socks://127.0.0.1:7890"
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"

curl -fsSL https://get.pnpm.io/install.sh | sh -

unset ALL_PROXY
unset http_proxy
unset https_proxy

echo "🎉 Pnpm update completed and proxy unset!"

exit 0
