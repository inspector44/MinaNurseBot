#!/bin/bash

# Set your variables here
TOKEN="YOUR_TOKEN_HERE"
CHAT_ID="YOUR_CHAT_ID_HERE"

# Get the status and assign it to the result variable
result=$(/usr/local/bin/mina client status | grep -E "Block height:|Local uptime:|Peers:|Sync status:|Block producers running:|Next block will be produced in:|External IP:")

# Send the result to the specified Telegram channel
/usr/bin/curl -s -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$result"
