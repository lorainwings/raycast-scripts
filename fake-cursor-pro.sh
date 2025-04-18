#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Fake Cursor Vip
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ⚙️
# @raycast.packageName Fake Cursor Pro Vip

# Documentation:
# @raycast.description Fake Cursor Pro Vip
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain

set -e

echo "⚙️ Start to Fake Cursor VIP!"

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

main() {
  echo $token | curl -fsSL https://raw.githubusercontent.com/yuaotian/go-cursor-help/master/scripts/install.sh | sudo -S bash
}

check

main

echo "✅ Fake Cursor Vip Done!"
