DiscordWebhookSystemInfos = ''
DiscordWebhookKillinglogs = 'https://discord.com/api/webhooks/1062853405686628433/fFD1DV5rOO-lFEmT7Tb5NLpJ3yhfYWnlt-lOb-XUA8zFrQlrLqm9U-RDaGEqJKhGfa4b'
DiscordWebhookChat = 'https://discord.com/api/webhooks/1062853516013604984/Qh_ZkF_GkX0dnSWXheqw-YIBuSlQwOoeFeX6wZg3BFylnPzO4EonVWHjZ0opyhrq_urE'

SystemAvatar = 'https://wiki.fivem.net/w/images/d/db/FiveM-Wiki.png'

UserAvatar = 'https://i.imgur.com/KIcqSYs.png'

SystemName = 'Imperial RP'


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
				    {'/me', '**[ME]:**'},
				    {'/fix', '**[FIX]:**'},
				    {'/dv', '**[DV]:**'},
				    {'/do', '**[DO]:**'},
				    {'/twt', '**[TWEET]:**'},
				    {'/news', '**[WEAZEL NEWS]:**'},
				    {'/ad', '**[ADVERTISEMENT]:**'},
				    {'/repair', '**[MECHANIC]:**'},
				    {'/dispatch', '**[DISPATCH]:**'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},

				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/jail',					  
					   '/unjail',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/911', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},
					  {'/dispatch', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},
					  {'/me', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},
					  {'/fix', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},
					  {'/dv', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},
					  {'/twt', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},
					  {'/do', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},
					  {'/news', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},
					  {'/ad', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},
					  {'/repair', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},
					  {'/anon', 'https://discord.com/api/webhooks/875905615875170364/hWBp9x0XksMsTPO4R-MutE6ltUUmNOMV29WO6bS5ZyW2ZhMPxZh7cvSOahhBAOn3CWiY'},

					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/anon',
			   '/twt',
			  }

