#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Enable MySQL Database Services
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📑
# @raycast.argument1 { "type": "password", "placeholder": "Enter Password" }
# @raycast.packageName Enable Mysql Database Services
# @raycast.needsConfirmation false

# Documentation:
# @raycast.description Enable MySQL Database Services
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

echo "📑 Enable MySQL Database Services!";

PASSWORD=$1

echo $PASSWORD | sudo -S /usr/local/mysql/support-files/mysql.server start; 

echo "✅ MySQL Database Services Enabled!";