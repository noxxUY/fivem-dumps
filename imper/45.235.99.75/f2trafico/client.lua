Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local notifIn     = false
local notifOut    = false
local closestZone = 1
Citizen.CreateThread(function()
	while true do
		local playerPed   = PlayerPedId()
		local x , y , z   = table.unpack(GetEntityCoords(playerPed , true))
		local minDistance = 100000
		for k , v in ipairs(Config.Safezones2) do
			dist = Vdist(v.x , v.y , 0.0 , x , y , z)
			if dist < minDistance then
				minDistance = dist
				closestZone = k
			end
		end

        local x , y , z = table.unpack(GetEntityCoords(playerPed , true))
        local dist      = Vdist(Config.Safezones2[closestZone].x , Config.Safezones2[closestZone].y , 0.0 , x , y , z)
		
        if dist <= Config.Safezones2[closestZone].r + 6 then
            notifIn = true
        else
            notifIn = false
        end
        
		Citizen.Wait(500)
	end
end)

Citizen.CreateThread(function()
	local isInZona = false
	while true do
		Citizen.Wait(0)
        
        if notifIn then
			if notifIn and not isInZona then 
				isInZona = not isInZona

   -- exports.pNotify:SendNotification({text = "<b>¡Estás en una Zona Segura!</b> 🔔", type = "info", timeout = 3000, layout = "bottomcenter", queue = "right"})
				--SetCanAttackFriendly(PlayerPedId(), false , false)
				--NetworkSetFriendlyFireOption(false)
			end


			--DisablePlayerFiring(PlayerPedId(), true)
			--SetPlayerCanDoDriveBy(PlayerPedId(), false)
			DisableControlAction(0, 289, true)



			if IsDisabledControlJustPressed(0, 289) then 
				--SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)

			end
		else
			if not notifIn and isInZona then
				isInZona = not isInZona

				    --exports.pNotify:SendNotification({text = "<b>¡Saliste de Zona Segura!</b> 🔔", type = "info", timeout = 3000, layout = "bottomcenter", queue = "right"})

				--SetCanAttackFriendly(PlayerPedId() , true , false)
				--NetworkSetFriendlyFireOption(true)

				if IsPedInAnyVehicle(PlayerPedId()) then
					SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 0.0)
				end
			end
		end
	end
end)