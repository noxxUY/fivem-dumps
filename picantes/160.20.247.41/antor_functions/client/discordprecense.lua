Citizen.CreateThread(function()
	while true do
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(1082444769755660298)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('logods')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('🌴𝑷𝑰𝑪𝑨𝑵𝑻𝑬𝑺𝑹𝑷🌴')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('picanteroleplay')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('🔥Mas picante que la mujer de tu amigo🔥')


        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "🧉Discord🧉", "https://discord.gg/VXQGpm3EYB")
        SetDiscordRichPresenceAction(1, "🧉Fivem🧉", "fivem://connect/cfx.re/join/oorgmv")

        -- It updates every minute just in case.
		Citizen.Wait(60000)
	end
end)