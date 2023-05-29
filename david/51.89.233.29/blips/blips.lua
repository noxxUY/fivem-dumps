local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

	 {name="Tequilala", colour=7, id=93, x = -564.91, y = 276.28, z = 83.12},
	 {name="Local - Moteros", colour=6, id=93, x = 981.86, y = -103.19, z = 74.85},
     {name="Puti", colour=27, id=121, x = 128.95, y = -1298.96, z = 29.23},
	 {name="Iglesia Don Pochito", colour=21, id=492, x = -790.27, y = -7.95, z = 40.77},
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.name)
      EndTextCommandSetBlipName(info.blip)
    end
end)