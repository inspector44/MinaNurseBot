# NodeNurseBot

Creating a Telegram Bot
1- Open Telegram and search for the "BotFather" user 
2- Start a chat and send the command /newbot (Or click the /newbot)
3- Follow the on-screen instructions to name your bot and choose a username for it.
4- Once the bot is created, BotFather will provide you with a TOKEN which looks something like this: 110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw. Save this token for later.

Creating a Telegram Channel
1- In Telegram, click on the pencil icon (or the three dots) in the top right corner.
2- Choose 'New Channel'.
3- Name your channel and provide an optional description.
4- Set your channel to either public or private. Note: If you choose 'Public', you'll get a public link which others can use to join your channel.
5- Once the channel is created, click on the channel name at the top, then click on 'Administrators'.
6- Add your previously created bot to the channel as an administrator. Make sure to grant it the necessary permissions, especially 'Send Messages'.

Finding the Chat ID of the Channel
1- Send a message in the channel.
2- Open a browser and visit the following URL (replace YOUR_TOKEN_HERE with the bot token you got from BotFather): https://api.telegram.org/botYOUR_TOKEN_HERE/getUpdates
3- Look for the "chat" object in the returned JSON. The id field inside this object is your channel's chat ID. It should look something like -1001234567890. Save this ID for later.

Setting Up the Cron Job
1- Open a terminal on your machine.
2- Enter sudo crontab -e to edit the root user's crontab.
3- Add the following line at the end of the file (replace YOUR_TOKEN_HERE with your bot token and YOUR_CHAT_ID_HERE with your channel's chat ID):
*/5 * * * * result=$(/usr/local/bin/mina client status | grep -E "Block height:|Local uptime:|Peers:|Sync status:|Block producers running:|Next block will be produced in:|External IP:") && /usr/bin/curl -s -X POST https://api.telegram.org/botYOUR_TOKEN_HERE/sendMessage -d chat_id=YOUR_CHAT_ID_HERE -d text="$result"
4- Save and exit the editor.
5- run "service cron restart"

Test & Monitor
1- Wait for the next 5-minute interval and monitor your Telegram channel to see if the logs are being sent.
2- If there are any issues, double-check the crontab command, the token, and the chat ID.

