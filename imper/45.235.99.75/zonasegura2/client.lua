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
		for k , v in ipairs(Config.Safezones) do
			dist = Vdist(v.x , v.y , 0.0 , x , y , z)
			if dist < minDistance then
				minDistance = dist
				closestZone = k
			end
		end

        local x , y , z = table.unpack(GetEntityCoords(playerPed , true))
        local dist      = Vdist(Config.Safezones[closestZone].x , Config.Safezones[closestZone].y , 0.0 , x , y , z)
		
        if dist <= Config.Safezones[closestZone].r + 6 then
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

exports['413x-notify']:Alert("info", "Entraste en Zona Segura", "", 2000)	
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
			DisableControlAction(0, 45, true)
			DisableControlAction(0, 80, true)
			DisableControlAction(0, 140, true)
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

			end

			if IsDisabledControlJustPressed(0, 106) then 
				SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)

			end
		else
			if not notifIn and isInZona then
				isInZona = not isInZona

exports['413x-notify']:Alert("info", "Saliste de Zona Segura", "", 2000)	
				SetCanAttackFriendly(PlayerPedId() , true , false)
				NetworkSetFriendlyFireOption(true)

				if IsPedInAnyVehicle(PlayerPedId()) then
					SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 0.0)
				end
			end
		end
	end
end)