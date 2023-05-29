ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)	
 
 Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(748468471179902993)

        --Aquí tendrás que poner el nombre de la imagen para el icono "grande".
		SetDiscordRichPresenceAsset('rich_discord3')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Servidor Argentino de RolePlay GTAV')
       
        --Here you will have to put the image name for the "small" icon.
        --SetDiscordRichPresenceAssetSmall('discord_informacion')

        --Here you can add hover text for the "small" icon.
        --SetDiscordRichPresenceAssetSmallText('Unite al mejor servidor GTAV')
		
		SetDiscordRichPresenceAction(0, "Conectarse", "fivem://connect/cfx.re/join/9lmk5y") 
        SetDiscordRichPresenceAction(1, "Discord", "https://discord.gg/zonasur")

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)

Citizen.CreateThread(function()
	
	while true do
		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		
		players = {}
		
		ESX.TriggerServerCallback('discord:getPlayers', function(xPlayers)
			for i=1, #xPlayers, 1 do
				table.insert(players, i)
			end
		end)	
		Citizen.Wait(15000)
		SetRichPresence("ID: "..pId.." | "..pName.. " - [".. #players .. "/300]")
	end
end)
