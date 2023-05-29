Citizen.CreateThread(function()
  while true do
      
      Citizen.Wait(10*1000) -- Checkea cada 5 segundos
      
      SetDiscordAppId(1075833994928734228) -- ID Del BOT

      local player = PlayerId()
        local name = GetPlayerName(player)
		local id = GetPlayerServerId(player)
		SetRichPresence(name ..  " | " .. #GetActivePlayers() .. " Jugadores cerca | ID: " .. id)
     

      SetDiscordRichPresenceAsset("mylogo") -- nombre logo grande
      SetDiscordRichPresenceAssetText(name) -- Nombre en el logo grande

      SetDiscordRichPresenceAssetSmall("mylogo") -- nombre logo pequeño
      SetDiscordRichPresenceAssetSmallText("ID: ".. id) -- logo pequeño

  end
end)