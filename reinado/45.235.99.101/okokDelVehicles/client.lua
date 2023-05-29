-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
-- ESX = nil

-- Citizen.CreateThread(function() 
-- 	while ESX == nil do
-- 		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
-- 		Citizen.Wait(0)
-- 	end
-- end)

ESX = exports['es_extended']:getSharedObject()

function _L(str)
    if not Locale then return "Locale error" end
    if not Locale[Config.locale] then return "Invalid locale" end
    if not Locale[Config.locale][str] then return "Invalid string" end
    return Locale[Config.locale][str]
end

Citizen.CreateThread(function()
	for i = 1, #Config.SafeZones, 1 do
		local blip = AddBlipForRadius(Config.SafeZones[i].x, Config.SafeZones[i].y, Config.SafeZones[i].z, Config.SafeZones[i].radius)
		SetBlipColour(blip, Config.SafeZones[i].color)
		SetBlipAlpha(blip, Config.SafeZones[i].alpha)
	end
end)

RegisterNetEvent("okokDelVehicles:delete")
AddEventHandler("okokDelVehicles:delete", function()
	local minuteCalculation = 1000
	local minutesPassed = 0
	local minutesLeft = Config.DeleteVehicleTimer

	while minutesPassed < Config.DeleteVehicleTimer do
		Citizen.Wait(1*minuteCalculation)
		minutesPassed = minutesPassed + 1
		minutesLeft = minutesLeft - 1
		if minutesLeft == 0 then
		-- TriggerEvent('chatMessage', "La Grua", {200,0,0}, "Se han eliminado todos los vehículos")
			ESX.ShowNotification('Los vehículos abandonados han sido eliminados')
		elseif minutesLeft == 5 then
			ESX.ShowNotification('Los vehículos abandonados serán eliminados en 5 segundos')
		elseif minutesLeft == 10 then
			ESX.ShowNotification('Los vehículos abandonados serán eliminados en 10 segundos')
		elseif minutesLeft == 15 then
			ESX.ShowNotification('Los vehículos abandonados serán eliminados en 15 segundos')
		elseif minutesLeft == 20 then
			ESX.ShowNotification('Los vehículos abandonados serán eliminados en 20 segundos')
		elseif minutesLeft == 25 then
			ESX.ShowNotification('Los vehículos abandonados serán eliminados en 25 segundos')
		elseif minutesLeft == 30 then
			ESX.ShowNotification('Los vehículos abandonados serán eliminados en 30 segundos')
		end
	end
	for vehicle in EnumerateVehicles() do
		local canDelete = true
		local carCoords = GetEntityCoords(vehicle)

		if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
			if not Config.DeleteVehiclesIfInSafeZone then
				for i = 1, #Config.SafeZones, 1 do
					dist = Vdist(Config.SafeZones[i].x, Config.SafeZones[i].y, Config.SafeZones[i].z, carCoords.x, carCoords.y, carCoords.z)
					if dist < Config.SafeZones[i].radius then
						canDelete = false
					end
				end
			end
			if canDelete then
				SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
				SetEntityAsMissionEntity(vehicle, false, false) 
				DeleteVehicle(vehicle)
				if (DoesEntityExist(vehicle)) then 
					DeleteVehicle(vehicle) 
				end
			end
		end
	end
end)

local entityEnumerator = {
	__gc = function(enum)
	if enum.destructor and enum.handle then
		enum.destructor(enum.handle)
	end
	enum.destructor = nil
	enum.handle = nil
end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end