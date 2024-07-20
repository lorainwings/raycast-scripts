#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clean DNS Cache
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🥡
# @raycast.argument1 { "type": "password", "placeholder": "Enter Password", "optional": true }
# @raycast.packageName Clean DNS Cache
# @raycast.needsConfirmation true

# Documentation:
# @raycast.description Clean System DNS Cache
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

echo "🥡 Clean DNS cache of the system!"

token=$1

check() {
  # -n 检查字符串是否不为空, 不为空进入条件
  if [[ -n "$token" ]]; then
    echo "$token" >cache/.token
  else
    # -f 判断文件是否存在
    if [[ -f "cache/.token" ]]; then
      token=$(<cache/.token)
    fi
    # -z 检查字符串是否为空, 空值进入条件
    if [[ -z "$token" ]]; then
      echo "⛔️ 请使用Root权限密码!"
      exit 1
    fi
  fi
}

close() {
  echo $token | sudo -S killall -HUP mDNSResponder
  echo $token | sudo -S killall mDNSResponderHelper
  echo $token | sudo -S dscacheutil -flushcache
}

check

close

echo "✅ Clean Task Done!"
