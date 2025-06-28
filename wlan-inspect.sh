#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Wlan Inspect
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🐛
# @raycast.argument1 { "type": "text", "placeholder": "Enter IP Address" }
# @raycast.argument2 { "type": "text", "placeholder": "Enter Port" }
# @raycast.packageName wlan.inspect

# Documentation:
# @raycast.description Wlan Inspect
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain

ip=$1
port=$2


if [ -z "$ip" ]; then
  echo "🚨 使用方法: $0 <IP地址> <端口>"
  exit 1
fi

if [ -z "$port" ]; then
  echo "🚨 必须指定端口"
  exit 1
fi

echo "🔄 正在通过 iTerm 执行 adb pair $ip:$port ..."

# 使用 osascript 在 iTerm 中执行命令
osascript <<EOF
tell application "iTerm"
  activate
  tell current window
    create tab with default profile
    tell current session
      write text "adb pair $ip:$port"
    end tell
  end tell
end tell
EOF

echo "✅ 命令已在 iTerm 中启动"




