#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Remove Others Branchs
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Remove Others Branchs

# Documentation:
# @raycast.description Remove Others Branchs
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain

echo "Remove Others Branchs"
# 通过 AppleScript 获取当前 iTerm2 窗口的路径
current_path=$(
  osascript <<EOF
tell application "iTerm2"
  tell current session of current window
    return get working directory
  end tell
end tell
EOF
)

# 输出结果（Raycast 会显示在 UI 中）
echo "当前 iTerm2 路径: $current_path"
