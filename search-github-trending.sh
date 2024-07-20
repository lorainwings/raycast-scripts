#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search Github Trending
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔍
# @raycast.argument1 { "type": "text", "placeholder": "Language" }
# @raycast.argument2 { "type": "dropdown", "placeholder": "Data Range", "data": [{ "title": "Today", "value": "daily" }, { "title": "This Week", "value": "weekly" }, { "title": "This Month", "value": "monthly" }] }
# @raycast.argument3 { "type": "text", "placeholder": "Spoken Language", "optional": true }
# @raycast.packageName Search Github Trending

# Documentation:
# @raycast.description Search Github Trending
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

language=$1
since=$2
spoken_language_code=$3

# -z 判断变量值的长度为空
if [ -z "$spoken_language_code" ]; then
  open "https://github.com/trending/$language?since=$since"
else
  open "https://github.com/trending/$language?since=$since&spoken_language_code=$spoken_language_code"
fi
exit 0
