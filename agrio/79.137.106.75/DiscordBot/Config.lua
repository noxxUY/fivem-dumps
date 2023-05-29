DiscordWebhookSystemInfos = "https://discord.com/api/webhooks/827599874731933706/rYrEJ-mQgjaUqIYTEGxCKtv3b54oQh5m7HgMXQyJEspM_-loN2E1NIHUpQpG7rltApUa"
DiscordWebhookKillinglogs = "https://discord.com/api/webhooks/827599874731933706/rYrEJ-mQgjaUqIYTEGxCKtv3b54oQh5m7HgMXQyJEspM_-loN2E1NIHUpQpG7rltApUa"
DiscordWebhookChat = "https://discord.com/api/webhooks/829153333964963871/T6JFDm3oBYUtcHySPCcTV4a0yT16fRLoUYlM9ubT-rcrIYgaZhROgKqAvGzdKDpc-zoo"

SystemAvatar = 'https://i.imgur.com/IZI95m5.jpg'

UserAvatar = 'https://i.imgur.com/KIcqSYs.png'

SystemName = 'SNOWI-LOGS IC'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				   {'/twt', '**[twt]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				   {'/ems', '**[ems]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				   {'/policia', '**[policia]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				   {'/mec', '**[mec]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/anycomand',
					   '/anycomand',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/twt',"https://discord.com/api/webhooks/829153333964963871/T6JFDm3oBYUtcHySPCcTV4a0yT16fRLoUYlM9ubT-rcrIYgaZhROgKqAvGzdKDpc-zoo"},
					  {'/ems', "https://discord.com/api/webhooks/829153333964963871/T6JFDm3oBYUtcHySPCcTV4a0yT16fRLoUYlM9ubT-rcrIYgaZhROgKqAvGzdKDpc-zoo"},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

