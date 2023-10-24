#!/bin/bash

# Set your variables here
TOKEN="YOUR_TOKEN_HERE"
CHAT_ID="YOUR_CHAT_ID_HERE"

ip=$(curl http://api.ipify.org)

# Get the status and assign it to the result variable
result=$(/usr/local/bin/mina client status | grep -E "Sync status:")

# Send the result to the specified Telegram channel


if [ "$result" != "Sync status:                                   Synced" ]
then
        /usr/bin/curl -s -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$(hostname) ${ip} 故障"
fi
