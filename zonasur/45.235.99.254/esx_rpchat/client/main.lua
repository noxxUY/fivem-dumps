--[[

  ESX RP Chat

--]]

RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then	
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  end
end)

RegisterNetEvent('sendProximityMessageMe')
AddEventHandler('sendProximityMessageMe', function(name, message)
	local playerid = PlayerId()
	local ped = GetPlayerPed(playerid)
	local coords = GetEntityCoords(ped)

	for k, v in pairs(GetActivePlayers()) do
		local v_ped = GetPlayerPed(v)
		local v_coords = GetEntityCoords(v_ped)

		if GetDistanceBetweenCoords(v_coords.x, v_coords.y, v_coords.z, coords.x, coords.y, coords.z) < 7.000 then
			-- call a server event from here, with GetPlayerServerId(v), containing the name, message, etc.
			TriggerServerEvent('server:sendChatMe', GetPlayerServerId(v), name, message)
		end
	end
end)

RegisterNetEvent('sendProximityMessageLocal')
AddEventHandler('sendProximityMessageLocal', function(src, message)
   local playerid = PlayerId()
   local ped = GetPlayerPed(playerid)
   local coords = GetEntityCoords(ped)

   for k, v in pairs(GetActivePlayers()) do
      local v_ped = GetPlayerPed(v)
      local v_coords = GetEntityCoords(v_ped)

      if GetDistanceBetweenCoords(v_coords.x, v_coords.y, v_coords.z, coords.x, coords.y, coords.z) < 7.000 then
         -- call a server event from here, with GetPlayerServerId(v), containing the name, message, etc.
		 TriggerServerEvent('server:sendChatLocal', GetPlayerServerId(v), message)
      end
   end
end)

RegisterNetEvent('sendProximityMessageDo')
AddEventHandler('sendProximityMessageDo', function(name, message)
   local playerid = PlayerId()
   local ped = GetPlayerPed(playerid)
   local coords = GetEntityCoords(ped)

   for k, v in pairs(GetActivePlayers()) do
      local v_ped = GetPlayerPed(v)
      local v_coords = GetEntityCoords(v_ped)

      if GetDistanceBetweenCoords(v_coords.x, v_coords.y, v_coords.z, coords.x, coords.y, coords.z) < 7.000 then
         -- call a server event from here, with GetPlayerServerId(v), containing the name, message, etc.
		 TriggerServerEvent('server:sendChatDo', GetPlayerServerId(v), name, message)
      end
   end
end)