ESX               = nil
local PlayerData  = {}
local notifIn     = false
local notifOut    = false
local closestZone = 1

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject' , function(obj)
			ESX = obj
		end)
		Citizen.Wait(360)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded' , function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob' , function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
	for k , v in ipairs(Config.ZonasRojas) do
		local blip = AddBlipForRadius(v.x , v.y , v.z , v.r)
		SetBlipHighDetail(blip , true)
		SetBlipColour(blip , v.color)
		SetBlipAlpha(blip , v.alpha)
		SetBlipAsShortRange(blip , true)
	end
	
	for k , v in ipairs(Config.ZonasSegura) do
		local blip = AddBlipForRadius(v.x , v.y , v.z , v.r)
		SetBlipHighDetail(blip , true)
		SetBlipColour(blip , 80)
		SetBlipAlpha(blip , 70)
		SetBlipAsShortRange(blip , true)
	end

	for k , v in ipairs(Config.ZonasBlancas) do
		local blip = AddBlipForRadius(v.x , v.y , v.z , v.r)
		SetBlipHighDetail(blip , true)
		SetBlipColour(blip , v.color)
		SetBlipAlpha(blip , v.alpha)
		SetBlipAsShortRange(blip , true)
	end
end)

Citizen.CreateThread(function()
	while true do
		local playerPed   = PlayerPedId()
		local x , y , z   = table.unpack(GetEntityCoords(playerPed , true))
		local minDistance = 100000
		for k , v in ipairs(Config.ZonasSegura) do
			dist = Vdist(v.x , v.y , 0.0 , x , y , z)
			if dist < minDistance then
				minDistance = dist
				closestZone = k
			end
		end

        local x , y , z = table.unpack(GetEntityCoords(playerPed , true))
        local dist      = Vdist(Config.ZonasSegura[closestZone].x , Config.ZonasSegura[closestZone].y , 0.0 , x , y , z)
		
        if dist <= Config.ZonasSegura[closestZone].r + 6 then
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
        local msec = 1000
        if notifIn then
			msec = 0
			if notifIn and not isInZona then 
				isInZona = not isInZona

				exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', '¡Estás en una Zona Segura!')
				SetCanAttackFriendly(PlayerPedId(), false , false)
				NetworkSetFriendlyFireOption(false)
			end

			for k,v in pairs(ESX.Game.GetPlayersInArea(GetEntityCoords(PlayerPedId()), 30.0)) do
				local src = GetPlayerServerId(v)
				local name = GetPlayerName(v)
				local otherPed = GetPlayerPed(GetPlayerFromServerId(src))

				-- Local Player vs Other Player
				SetEntityNoCollisionEntity(PlayerPedId(), otherPed, true)
				
				-- Other Player vs Local Player
				SetEntityNoCollisionEntity(otherPed, PlayerPedId(), true)
			end

			for _, vehicles in pairs(ESX.Game.GetVehiclesInArea(GetEntityCoords(PlayerPedId()), 30.0)) do
				local localVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
				local localPed = PlayerPedId()

				-- Local Player vs Other Vehicles
				SetEntityNoCollisionEntity(localPed, vehicles, true)
				-- Local Vehicle vs Other Vehicles
				SetEntityNoCollisionEntity(localVehicle, vehicles, true)

				-- Other Vehicles vs Local Player
				SetEntityNoCollisionEntity(vehicles, localPed, true)
				-- Other Vehicles vs Local Vehicle
				SetEntityNoCollisionEntity(vehicles, localVehicle, true)
			end

			DisablePlayerFiring(PlayerPedId(), true)
			SetPlayerCanDoDriveBy(PlayerPedId(), false)
			DisableControlAction(2, 37, true)
			DisableControlAction(0, 106, true)
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 69, true)
			DisableControlAction(0, 70, true)
			DisableControlAction(0, 92, true)
			DisableControlAction(0, 114, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 331, true)
			DisableControlAction(0, 68, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 264, true)

			if IsDisabledControlJustPressed(2, 37) then
				SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
				TriggerEvent('inventory:changeWeaponStatus')
			end

			if IsDisabledControlJustPressed(0, 106) then 
				SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
				TriggerEvent('inventory:changeWeaponStatus')
			end
		else
			if not notifIn and isInZona then
				msec = 0
				isInZona = not isInZona
				-- if IsPedInAnyVehicle(PlayerPedId(), false) then
				-- 	local passengers = {}
				-- 	local veh = GetVehiclePedIsUsing(PlayerPedId())
				-- 	local maxpeds = GetVehicleMaxNumberOfPassengers(veh)
				-- 	for i = -1, maxpeds do
				-- 		if not IsVehicleSeatFree(veh, i) then
				-- 			local ped = GetPlayerServerId(NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(veh, i)))
				-- 			table.insert(passengers , {
				-- 				serverId  = ped,
				-- 			})
				-- 		end
				-- 	end
				-- end
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de una Zona Segura!', 3500)
				exports['mythic_notify']:DoCustomHudText('info', 'INFO: Podrás colisionar con otros jugadores.', 5000)

				SetCanAttackFriendly(PlayerPedId() , true , false)
				NetworkSetFriendlyFireOption(true)

				if IsPedInAnyVehicle(PlayerPedId()) then
					SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 0.0)
				end

				--TriggerServerEvent("mindiw_tools:sendPlayerToBucket", 0, isPedInAnyVeh, passengers)
			end
		end
		Citizen.Wait(msec)
	end
end)