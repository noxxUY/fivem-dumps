Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(945585354784800798)
		SetDiscordRichPresenceAsset('logo')
        SetDiscordRichPresenceAssetText('Servidor Fivem')
        SetDiscordRichPresenceAssetSmall('info')
        SetDiscordRichPresenceAssetSmallText('discord.gg/imperialroleplay') --Small picture hover text
		     SetDiscordRichPresenceAction(0, "Unirse al discord!", "https://discord.gg/imperialroleplay") 
        SetDiscordRichPresenceAction(1, "Unirse al servidor!", "")  
        -- Amount of online players (Don't touch)
        
        -- Your own playername (Don't touch)
        local playerName = GetPlayerName(PlayerId())



        -- Sets the string with variables as RichPresence (Don't touch)
        SetRichPresence(string.format("%s", playerName))
        
        -- It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)
