
local blips = {
	{nombre="Waikiki", color=27, id=93, x=-2233.23, y=-623.67, z=15.62},
	{nombre="Tekila-la", color=27, id=93, x = -557.29, y = 283.2, z = 82.9},
}

local zone = nil
local blip = nil

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.color)
      SetBlipAsShortRange(info.blip, true)
	    BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.nombre)
      EndTextCommandSetBlipName(info.blip)
    end


    for _,new_zone in pairs(config.zones) do
		
      zone = AddBlipForRadius(new_zone.coords.x, new_zone.coords.y, new_zone.coords.z, new_zone.zone.radius)
      SetBlipSprite(zone, 9)
      SetBlipAlpha(zone, 100)
      SetBlipColour(zone, new_zone.zone.color)
      
      if (new_zone.blip.draw == true) then
        blip = AddBlipForCoord(new_zone.coords.x, new_zone.coords.y, new_zone.coords.z)
        SetBlipSprite(blip, new_zone.blip.id)
        SetBlipColour(blip, new_zone.blip.color)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(new_zone.blip.text)
        EndTextCommandSetBlipName(blip)
      end
      
    end

end)