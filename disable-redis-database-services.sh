#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Disable Redis Database Services
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🚫
# @raycast.argument1 { "type": "password", "placeholder": "Enter Password", "optional": true }
# @raycast.packageName Disable Redis Database Services
# @raycast.needsConfirmation false

# Documentation:
# @raycast.description Disable Redis Database Services
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

echo "🚫 Disable Redis Database Services!"

token=$1
port=$(pgrep redis || true)

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
  if [ -n "$port" ]; then
    # redis-cli shutdown
    kill -9 $port
    echo "✅ Redis Database Services Disabled!"
  else
    echo "🚧 Redis Database Services Not Running!"
  fi
}

check
close
