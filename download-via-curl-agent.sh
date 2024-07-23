#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Download Via Curl Agent
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ⬇️
# @raycast.argument1 { "type": "text", "placeholder": "Download URL" }
# @raycast.packageName Curl Download By Proxy

# Documentation:
# @raycast.description Download File By Curl Agent
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

url="$1"

if [ -z "$url" ]; then
  echo "🚨 Usage: $0 <URL>"
  exit 1
fi

echo "🔥 Download task begining..."
echo "👉🏻 URL is: $url"

export all_proxy="socks://127.0.0.1:7890"
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"

cd ~/Downloads
curl -w "\n\n⏩ Download Details:\nSpeed: %{speed_download} bytes/sec\nTotal Time: %{time_total} secs\nSize: %{size_download} bytes\n\n" -LO -s --progress-bar "$url"

unset ALL_PROXY
unset http_proxy
unset https_proxy

echo "🎉 Download completed and proxy unset!"
