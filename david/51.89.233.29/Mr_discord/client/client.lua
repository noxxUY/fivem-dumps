Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(546998180257202186)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('discordbot')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('CallejerosRP')
       
        --Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('discordbot')

        --Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('CallejerosRP')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)