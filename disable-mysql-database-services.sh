#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Disable MySQL Database Services
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ⛔️
# @raycast.argument1 { "type": "password", "placeholder": "Enter Password" }
# @raycast.packageName Disable Mysql Database Services
# @raycast.needsConfirmation false

# Documentation:
# @raycast.description Disable MySQL Database Services
# @raycast.author wings_lorain
# @raycast.authorURL https://raycast.com/wings_lorain
set -e

echo "⛔️ Disable MySQL Database Services!";

PASSWORD=$1

echo $PASSWORD | sudo -S /usr/local/mysql/support-files/mysql.server stop;

echo "✅ MySQL Database Services Disabled!";