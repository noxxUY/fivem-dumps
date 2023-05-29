local verAlertas = true
local elementscalls = {}

AddEventHandler('facciones:alertas:on', function() verAlertas = true end)
AddEventHandler('facciones:alertas:off', function() verAlertas = false end)

function getSpeed() return speedlimit end
function getStreet() return currentStreetName end
function getStreetandZone(coords)
	local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
	local currentStreetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
	currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
	playerStreetsLocation = currentStreetName .. ", " .. zone
	return playerStreetsLocation
end

function refreshPlayerWhitelisted()
	if not ESX.PlayerData then return false end
	if not ESX.PlayerData.job then return false end
	if Config.Debug then return true end
	for k,v in ipairs({'police', 'gna'}) do
		if v == ESX.PlayerData.job.name then
			return true
		end
	end
	return false
end

function BlacklistedWeapon(playerPed)
	for i = 1, #Config.WeaponBlacklist do
		local weaponHash = GetHashKey(Config.WeaponBlacklist[i])
		if GetSelectedPedWeapon(playerPed) == weaponHash then
			return true -- Is a blacklisted weapon
		end
	end
	return false -- Is not a blacklisted weapon
end

function GetAllPeds()
	local getPeds = {}
	local findHandle, foundPed = FindFirstPed()
	local continueFind = (foundPed and true or false)
	local count = 0
	while continueFind do
		local pedCoords = GetEntityCoords(foundPed)
		if GetPedType(foundPed) ~= 28 and not IsEntityDead(foundPed) and not IsPedAPlayer(foundPed) and #(playerCoords - pedCoords) < 80.0 then
			getPeds[#getPeds + 1] = foundPed
			count = count + 1
		end
		continueFind, foundPed = FindNextPed(findHandle)
	end
	EndFindPed(findHandle)
	return count
end

function zoneChance(type, zoneMod, street)
	if Config.DebugChance then return true end
	if not street then street = currentStreetName end
	playerCoords = GetEntityCoords(PlayerPedId())
	local zone, sendit = GetLabelText(GetNameOfZone(playerCoords.x, playerCoords.y, playerCoords.z)), false
	nearbyPeds = 5
	--[[if not nearbyPeds then
		nearbyPeds = GetAllPeds()
	elseif nearbyPeds < 1 then if Config.Debug then print(('^1[%s] Nobody is nearby to send a report^7'):format(type)) end
		return false
	end]]
	if zoneMod == nil then zoneMod = 1 end
	zoneMod = (math.ceil(zoneMod+0.5))
	local hour = GetClockHours()
	if hour >= 21 or hour <= 4 then
		zoneMod = zoneMod * 1.6
		zoneMod = math.ceil(zoneMod+0.5)
	end
	zoneMod = zoneMod / (nearbyPeds / 3)
	zoneMod = (math.ceil(zoneMod+0.5))
	local sum = math.random(1, zoneMod)
	local chance = string.format('%.2f',(1 / zoneMod) * 100)..'%'

	if sum > 1 then
		if Config.Debug then print(('^1[%s] %s (%s) - %s nearby peds^7'):format(type, zone, chance, nearbyPeds)) end
		sendit = false
	else
		if Config.Debug then print(('^2[%s] %s (%s) - %s nearby peds^7'):format(type, zone, chance, nearbyPeds)) end
		sendit = true
	end
	return sendit
end

function createBlip(data)
	Citizen.CreateThread(function()
		local alpha, blip = 255
		local sprite, colour, scale = 161, 84, 1.0
		if data.sprite then sprite = data.sprite end
		if data.colour then colour = data.colour end
		if data.scale then scale = data.scale end
		local entId = NetworkGetEntityFromNetworkId(data.netId)
		if data.netId and entId > 0 then
			blip = AddBlipForEntity(entId)
			SetBlipHighDetail(gunshotBlip, true)
			SetBlipColour(gunshotBlip, 1)
			SetBlipAlpha(gunshotBlip, alpha)
			SetBlipAsShortRange(gunshotBlip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(data.displayCode..' - '..data.dispatchMessage)
			EndTextCommandSetBlipName(blip)
			Citizen.Wait(data.length)
			RemoveBlip(blip)
			Citizen.Wait(0)
			blip = AddBlipForCoord(GetEntityCoords(entId))
		else
			data.netId = nil
			blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
		end
        SetBlipHighDetail(gunshotBlip, true)
        SetBlipColour(gunshotBlip, 1)
        SetBlipAlpha(gunshotBlip, alpha)
        SetBlipAsShortRange(gunshotBlip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(data.displayCode..' - '..data.dispatchMessage)
		EndTextCommandSetBlipName(blip)
		while alpha ~= 0 do
			if data.netId then Citizen.Wait((data.length / 1000) * 5) else Citizen.Wait((data.length / 1000) * 20) end
			alpha = alpha - 1
			SetBlipAlpha(blip, alpha)
			if alpha == 0 then
				RemoveBlip(blip)
				return
			end
		end
	end)
end

local lastCallLocation = nil
local alerta = 0
RegisterNetEvent('facciones-alertas:clNotifico')
AddEventHandler('facciones-alertas:clNotifico', function(pData)

	if verAlertas == false then return end

	if pData ~= nil then
		local sendit = false
		for i=1, #pData.recipientList do
			if pData.recipientList[i] == ESX.PlayerData.job.name then sendit = true break end
		end
		if sendit then
			Citizen.Wait(1500)
			if not pData.length then pData.length = 4000 end
			alerta = alerta + 1
			lastCallLocation = { code = "Disparos Recientes", coords = pData.coords }
			table.insert(elementscalls, { title = '[#'..alerta..'] Disparos Recientes', description = 'Click para marcar en GPS', arrow = true,
				onSelect = function()
					SetWaypointOff()
					SetNewWaypoint(pData.coords.x, pData.coords.y)
					exports.ox_lib:defaultNotify({
						description = 'Marcaste la alerta "Disparos Recientes" en el GPS',
						position = 'center-right',
						status = 'success'
					})
				end
			})
			pData.street = getStreetandZone(vector3(pData.coords.x, pData.coords.y, pData.coords.z))
			exports.ox_lib:notify({
				title = 'Central 911',
				description = "Se registraron disparos en "..pData.street.."",
				position = 'center-left',
				style = {
					backgroundColor = '#141517',
					color = '#909296'
				},
				icon = 'building-shield',
				iconColor = '#3035c5',
				duration = 10000
			})
			PlaySound(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 0, 0, 1)
			waypoint = vector2(pData.coords.x, pData.coords.y)
			createBlip(pData)
			Citizen.Wait(pData.length+2000)
			waypoint = nil
		end
	end
end)

RegisterCommand('alert_gps', function()
	if waypoint then SetWaypointOff() SetNewWaypoint(waypoint.x, waypoint.y) end
end, false)

RegisterKeyMapping('alert_gps', 'PFA - Marcar alerta en GPS', 'keyboard', 'O')

RegisterCommand('lastcalls', function()
    if verAlertas then
        if isPlayerWhitelisted then
            if lastCallLocation and lastCallLocation.coords and lastCallLocation.code then
                exports.ox_lib:registerContext({
                    id = 'outlawalert-calls',
                    title = 'Central - Alertas',
                    options = elementscalls
                })
                exports.ox_lib:showContext('outlawalert-calls')
            else
                ESX.ShowNotification("No hay información de alertas", "error")
            end
        end
    else
        ESX.ShowNotification("Tenes que activar las alertas para utilizar esta función", "warning")
    end
end, false)

Citizen.CreateThread(function()
	local vehicleWhitelist = {[0]=true,[1]=true,[2]=true,[3]=true,[4]=true,[5]=true,[6]=true,[7]=true,[8]=true,[9]=true,[10]=true,[11]=true,[12]=true,[17]=true,[19]=true,[20]=true}
	local sleep = 500
	while true do
		if not notLoaded then
			playerPed = PlayerPedId()
			if (not isPlayerWhitelisted or Config.Debug) then
				for k, v in pairs(Config.Timer) do
					if v > 0 then Config.Timer[k] = v - 1 end
				end

				if GetVehiclePedIsUsing(playerPed) ~= 0 then
					local vehicle = GetVehiclePedIsUsing(playerPed, true)
						if vehicleWhitelist[GetVehicleClass(vehicle)] then
						local driver = GetPedInVehicleSeat(vehicle, -1)
						if Config.Timer['Shooting'] == 0 and not BlacklistedWeapon(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and IsPedArmed(playerPed, 4) then
							sleep = 50
							if IsPedShooting(playerPed) and zoneChance('Driveby', 2, currentStreetName) then
								local veh = vehicleData(vehicle)
								data = {dispatchCode = 'driveby', caller = _U('caller_local'), coords = playerCoords, netId = veh.id, length = 6000,
								info = ('[%s] %s%s'):format(veh.plate, veh.doors, veh.class), info2 = veh.colour}
								TriggerServerEvent('wf-alerts:svNotify', data)
								Config.Timer['Shooting'] = Config.Shooting.Success
							else
								Config.Timer['Shooting'] = Config.Shooting.Fail
							end
						elseif Config.Timer['Speeding'] == 0 and playerPed == driver and speedlimit then
							sleep = 100
							if (GetEntitySpeed(vehicle) * 30.6) >= (speedlimit + (math.random(30,60))) then
								if zoneChance('Speeding', 4, currentStreetName) then
									Citizen.Wait(400)
									if IsPedInAnyVehicle(playerPed, true) and ((GetEntitySpeed(vehicle) * 3.6) >= (speedlimit + (math.random(30,60)))) then
										local veh = vehicleData(vehicle)
										data = {dispatchCode = 'speeding', caller = _U('caller_local'), coords = playerCoords, netId = veh.id,
										info = ('[%s] %s%s'):format(veh.plate, veh.doors, veh.class), info2 = veh.colour}
										TriggerServerEvent('wf-alerts:svNotify', data)
										Config.Timer['Speeding'] = Config.Speeding.Success
									end
								else
									Config.Timer['Speeding'] = Config.Speeding.Fail
								end
							end
						elseif Config.Timer['Autotheft'] == 0 and (IsPedGettingIntoAVehicle(playerPed) and GetSeatPedIsTryingToEnter(playerPed) == -1) and ((driver > 0 and not IsPedAPlayer(driver)) or IsVehicleAlarmActivated(vehicle)) then
							sleep = 100
							local veh = vehicleData(vehicle)
							ESX.TriggerServerCallback('linden_outlawalert:isVehicleOwned', function(hasowner) veh.owned = hasowner end, veh.plate)
							if not veh.owned then
								if zoneChance('Autotheft', 2, currentStreetName) then
									data = {dispatchCode = 'autotheft', caller = _U('caller_local'), coords = playerCoords, netId = veh.id,
									info = ('[%s] %s %s'):format(veh.plate, veh.name..',', veh.class), info2 = veh.colour}
									TriggerServerEvent('wf-alerts:svNotify', data)
									Config.Timer['Autotheft'] = Config.Autotheft.Success
								else
									Config.Timer['Autotheft'] = Config.Autotheft.Fail
								end
							end
						else sleep = 100 end
					end
				else
					if Config.Timer['Shooting'] == 0 and not BlacklistedWeapon(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and IsPedArmed(playerPed, 4) then
						sleep = 50
						if IsPedShooting(playerPed) and zoneChance('Shooting', 2, currentStreetName) then
							data = {dispatchCode = 'shooting', caller = _U('caller_local'), coords = playerCoords, netId = NetworkGetNetworkIdFromEntity(playerPed), length = 6000}
							TriggerServerEvent('wf-alerts:svNotify', data)
							Config.Timer['Shooting'] = Config.Shooting.Success
						else
							Config.Timer['Shooting'] = Config.Shooting.Fail
						end
					elseif Config.Timer['Melee'] == 0 and IsPedInMeleeCombat(playerPed) and HasPedBeenDamagedByWeapon(GetMeleeTargetForPed(playerPed), 0, 1) then
						sleep = 50
						if zoneChance('Melee', 3, currentStreetName) then
							data = {dispatchCode = 'melee', caller = _U('caller_local'), coords = playerCoords, netId = NetworkGetNetworkIdFromEntity(playerPed), length = 4000}
							TriggerServerEvent('wf-alerts:svNotify', data)
							Config.Timer['Melee'] = Config.Melee.Success
						else
							Config.Timer['Melee'] = Config.Melee.Fail
						end
					else sleep = 100 end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)