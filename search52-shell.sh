#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search 52Pojie Shell
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🍭
# @raycast.argument1 { "type": "text", "placeholder": "SearchKeyword" }
# @raycast.argument2 { "type": "text", "placeholder": "Cookie", "optional": true }
# @raycast.packageName Search 52Pojie Shell

# Documentation:
# @raycast.description Search 52Pojie Shell
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain

# debug mode
# set -x
set -e

keyword="$1"
cookie="$2"
searchURL="https://www.52pojie.cn/search.php?mod=forum"

catch() {
  echo "🔴 $1"
  open -na "Google Chrome" --args --new-window "https://www.bing.com/search?q=$keyword++site%3Awww.52pojie.cn"
  return 1
}

check() {
  # -n 检查字符串是否不为空, 不为空进入条件
  if [[ -n "$cookie" ]]; then
    echo "$cookie" >cache/.cookie
  else
    # -f 判断文件是否存在
    if [[ -f "cache/.cookie" ]]; then
      cookie=$(<cache/.cookie)
    fi
    # -z 检查字符串是否为空, 空值进入条件
    if [[ -z "$cookie" ]]; then
      catch "🔴 请提供Cookie参数!"
      exit 1
    fi
  fi
}

getFormHash() {
  html=$(curl -sS "$searchURL" -b "$cookie")
  hash=$(echo "$html" | LC_ALL=C IGNORECASE=1 sed -n 's/.*name="formhash" value="\([^"]*\)".*/\1/p')
  if [[ -z "$hash" ]]; then
    catch "🚨 获取formhash失败!"
    exit 1
  fi
  echo "$hash"
}

UTF2GBK() {
  local utf8_str="$1"
  encoded_str=$(python3 helper/utf2gbk.py "$utf8_str")
  echo "$encoded_str"
}

getSearchId() {
  local kw=$1
  header=$(curl -sS -D - "$searchURL" \
    -d "formhash=${hash}" \
    -d "srchtxt=${kw}" \
    -d "searchsubmit=yes" \
    -b "$cookie")
  location=$(echo "$header" | grep -i 'location:' | sed -n 's/.*location:\s*\(.*\)/\1/p')
  searchid=$(echo "$location" | grep -o 'searchid=[0-9]*' | sed 's/searchid=//')
  if [[ -z "$searchid" ]]; then
    catch "🚨 获取searchid失败!"
    exit 1
  fi
  echo "$searchid"
}

main() {
  check
  hash=$(getFormHash)
  kw=$(UTF2GBK "$keyword")
  searchid=$(getSearchId "$kw")
  open -na "Google Chrome" --args --new-window "$searchURL&searchid=$searchid&orderby=dateline&ascdesc=desc&searchsubmit=yes&kw=$kw"
}

main
