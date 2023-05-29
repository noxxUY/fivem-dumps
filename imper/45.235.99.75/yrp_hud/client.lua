local ESX = exports['es_extended']:getSharedObject()

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local vehiclesCars = {0,1,2,3,4,5,6,7,8,9,10,11,12,17,18,19,20};
local seatbeltIsOn = false

-- Hides TREW UI when it's on Pause Menu
Citizen.CreateThread(function()

    local isPauseMenu = false

	while true do
		Citizen.Wait(1)

		if IsPauseMenuActive() then -- ESC Key
			if not isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'toggleUi', value = false })
			end
		else
			if isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'toggleUi', value = true })
			end

			HideHudComponentThisFrame(1)  -- Wanted Stars
			HideHudComponentThisFrame(2)  -- Weapon Icon
			HideHudComponentThisFrame(3)  -- Cash
			HideHudComponentThisFrame(4)  -- MP Cash
			HideHudComponentThisFrame(6)  -- Vehicle Name
			HideHudComponentThisFrame(7)  -- Area Name
			HideHudComponentThisFrame(8)  -- Vehicle Class
			HideHudComponentThisFrame(9)  -- Street Name
			HideHudComponentThisFrame(13) -- Cash Change
			HideHudComponentThisFrame(17) -- Save Game
			HideHudComponentThisFrame(20) -- Weapon Stats
		end

		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleClass = GetVehicleClass(vehicle)

		-- Vehicle Seatbelt
		if IsPedInAnyVehicle(player, false) and GetIsVehicleEngineRunning(vehicle) then
			if IsControlJustReleased(0, Keys[Config.vehicle.keys.seatbelt]) and (has_value(vehiclesCars, vehicleClass) == true and vehicleClass ~= 8) then
				seatbeltIsOn = not seatbeltIsOn
			end
		end

	end
end)

function IsCar(veh)
	local vc = GetVehicleClass(veh)
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end

local vehicleCruiser
local seatbeltEjectSpeed = 45.0 
local seatbeltEjectAccel = 100.0
local currSpeed = 0.0
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}

Citizen.CreateThread(function()
	local wait = 3000
	while true do
		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local position = GetEntityCoords(player)
		local vehicleIsOn = GetIsVehicleEngineRunning(vehicle)
		local vehicleInfo

		if IsPedInAnyVehicle(player, false) and vehicleIsOn then
			wait = 300

			local vehicleClass = GetVehicleClass(vehicle)

			if Config.ui.showMinimap == false then
				DisplayRadar(true)
			end

			-- Vehicle Speed
			local vehicleSpeedSource = GetEntitySpeed(vehicle)
			local vehicleSpeed
			if Config.vehicle.speedUnit == 'MPH' then
				vehicleSpeed = math.ceil(vehicleSpeedSource * 2.237)
			else
				vehicleSpeed = math.ceil(vehicleSpeedSource * 2.2)
			end

			-- Vehicle Gradient Speed
			local vehicleNailSpeed

			if vehicleSpeed > Config.vehicle.maxSpeed then
				vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(Config.vehicle.maxSpeed * 205) / Config.vehicle.maxSpeed) )
			else
				vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(vehicleSpeed * 205) / Config.vehicle.maxSpeed) )
			end

			-- Vehicle Fuel and Gear
			local vehicleFuel
			vehicleFuel = GetVehicleFuelLevel(vehicle)

			local vehicleGear = GetVehicleCurrentGear(vehicle)

			if (vehicleSpeed == 0 and vehicleGear == 0) or (vehicleSpeed == 0 and vehicleGear == 1) then
				vehicleGear = 'N'
			elseif vehicleSpeed > 0 and vehicleGear == 0 then
				vehicleGear = 'R'
			end

			-- Vehicle Lights
			local vehicleVal,vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehicle)
			local vehicleIsLightsOn
			if vehicleLights == 1 and vehicleHighlights == 0 then
				vehicleIsLightsOn = 'normal'
			elseif (vehicleLights == 1 and vehicleHighlights == 1) or (vehicleLights == 0 and vehicleHighlights == 1) then
				vehicleIsLightsOn = 'high'
			else
				vehicleIsLightsOn = 'off'
			end

			-- Vehicle Siren
			local vehicleSiren

			if IsVehicleSirenOn(vehicle) then
				vehicleSiren = true
			else
				vehicleSiren = false
			end

			-- Vehicle Seatbelt
			if has_value(vehiclesCars, vehicleClass) == true and vehicleClass ~= 8 then

				local prevSpeed = currSpeed
                currSpeed = vehicleSpeedSource

                SetPedConfigFlag(PlayerPedId(), 32, true)

                if not seatbeltIsOn then
                	local vehIsMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0
                    local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()
                    if (vehIsMovingFwd and (prevSpeed > (seatbeltEjectSpeed/2.237)) and (vehAcc > (seatbeltEjectAccel*9.81))) then

                        SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
                        SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                        SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                    else
                        -- Update previous velocity for ejecting player
                        prevVelocity = GetEntityVelocity(vehicle)
                    end

                else
                	DisableControlAction(0, 75)
                end
			end

			vehicleInfo = {
				action = 'updateVehicle',

				status = true,
				speed = vehicleSpeed,
				nail = vehicleNailSpeed,
				gear = vehicleGear,
				fuel = vehicleFuel,
				lights = vehicleIsLightsOn,
				cruiser = vehicleCruiser,
				type = vehicleClass,
				siren = vehicleSiren,
				seatbelt = {},

				config = {
					speedUnit = Config.vehicle.speedUnit,
					maxSpeed = Config.vehicle.maxSpeed
				}
			}

			vehicleInfo['seatbelt']['status'] = seatbeltIsOn
		else
			wait = 3000
			vehicleCruiser = false
			vehicleNailSpeed = 0

            seatbeltIsOn = false

			vehicleInfo = {
				action = 'updateVehicle',

				status = false,
				nail = vehicleNailSpeed,
				seatbelt = { status = seatbeltIsOn },
				cruiser = vehicleCruiser,
				type = 0,
			}

			if Config.ui.showMinimap == false then
				DisplayRadar(false)
			end

		end

		SendNUIMessage(vehicleInfo)
		Citizen.Wait(wait)
	end
end)

function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

OldMoney               = {}
OldMoney['wallet']     = 0
OldMoney['bank']       = 0
OldMoney['blackMoney'] = 0
OldMoney['society']    = 0

RegisterNetEvent('esx:addedMoney')
AddEventHandler('esx:addedMoney' , function(m , native , current)
	if not native then
		OldMoney['wallet'] = OldMoney['wallet'] + m
		SendNUIMessage({ action = 'setMoney', id = 'wallet', value = OldMoney['wallet'] })
	else
		OldMoney['wallet'] = current
		SendNUIMessage({ action = 'setMoney', id = 'wallet', value = current })
	end
end)

RegisterNetEvent('esx:removedMoney')
AddEventHandler('esx:removedMoney' , function(m , native , current)
	if not native then
		OldMoney['wallet'] = OldMoney['wallet'] - m
		SendNUIMessage({ action = 'setMoney', id = 'wallet', value = OldMoney['wallet'] })
	else
		SendNUIMessage({ action = 'setMoney', id = 'wallet', value = current })
	end
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney' , function(m)
	OldMoney['wallet'] = tonumber(m)
	SendNUIMessage({ action = 'setMoney', id = 'wallet', value = OldMoney['wallet'] })
end)

RegisterNetEvent('esx:setPlayerData')
AddEventHandler('esx:setPlayerData' , function(type , m , native , current)
	if type == 'money' then
		OldMoney['wallet'] = m
		SendNUIMessage({ action = 'setMoney', id = 'wallet', value = OldMoney['wallet'] })
	elseif type == 'bank' then
		OldMoney['bank'] = m
		SendNUIMessage({ action = 'setMoney', id = 'bank', value = OldMoney['bank'] })
	elseif type == 'black_money' then
		OldMoney['blackMoney'] = m
		SendNUIMessage({ action = 'setMoney', id = 'blackMoney', value = OldMoney['blackMoney'] })
	end
end)

RegisterNetEvent('esx:addedBank')
AddEventHandler('esx:addedBank' , function(m)
	OldMoney['bank'] = OldMoney['bank'] + m
	SendNUIMessage({ action = 'addMoney', id = 'bank', value = OldMoney['bank'] })
end)

RegisterNetEvent('esx:removedBank')
AddEventHandler('esx:removedBank' , function(m)
	OldMoney['bank'] = OldMoney['bank'] - m
	SendNUIMessage({ action = 'setMoney', id = 'bank', value = OldMoney['bank'] })
end)

RegisterNetEvent('esx:displayBank')
AddEventHandler('esx:displayBank' , function(m)
	OldMoney['bank'] = m
	SendNUIMessage({ action = 'setMoney', id = 'bank', value = OldMoney['bank'] })
end)

-- player.lua update money
RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney' , function(account)
	if account.name == 'money' then
		OldMoney['wallet'] = account.money
		SendNUIMessage({ action = 'setMoney', id = 'wallet', value = tonumber(account.money) })
	elseif account.name == 'bank' then
		OldMoney['bank'] = account.money
		SendNUIMessage({ action = 'setMoney', id = 'bank', value = account.money })
	elseif account.name == 'black_money' then
		OldMoney['blackMoney'] = account.money
		SendNUIMessage({ action = 'setMoney', id = 'blackMoney', value = account.money })
	end
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney' , function(m , money)
	SendNUIMessage({ action = 'setMoney', id = 'wallet', value = money })
end)

local myJob = nil
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob' , function(job)
	if job ~= nil then
		myJob = job
		if job.label == job.grade_label then
			SendNUIMessage({ action = 'setText', id = 'job', value = job.grade_label })
		else
			SendNUIMessage({ action = 'setText', id = 'job', value = job.label .. ': ' .. job.grade_label })
		end
		
		if job.grade_name ~= nil and job.grade_name == 'boss' then
			if (Config.ui.showSocietyMoney == true) then
				SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })
			end
			
			ESX.TriggerServerCallback('esx_society:getSocietyMoney' , function(money)
				OldMoney['society'] = money
				SendNUIMessage({ action = 'setMoney', id = 'society', value = OldMoney['society'] })
			end , job.name)
		else
			SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
		end
	end
end)

-- Player status
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30000)
		
		local playerStatus
		local showPlayerStatus = 0
		playerStatus = { action = 'setStatus', status = {} }

		if myJob ~= nil and myJob.grade_name == 'boss' then
			if (Config.ui.showSocietyMoney == true) then
				SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })
			end
			
			ESX.TriggerServerCallback('esx_society:getSocietyMoney' , function(money)
				OldMoney['society'] = money
				SendNUIMessage({ action = 'setMoney', id = 'society', value = OldMoney['society'] })
			end , myJob.name)
		else
			SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
		end
		
		if Config.ui.showHunger == true then
			showPlayerStatus = (showPlayerStatus + 1)
			TriggerEvent('esx_status:getStatus' , 'hunger' , function(status)
				playerStatus['status'][showPlayerStatus] = {
					name  = 'hunger',
					value = math.floor(100 - status.getPercent())
				}
			end)
		end
		
		if Config.ui.showThirst == true then
			showPlayerStatus = (showPlayerStatus + 1)
			TriggerEvent('esx_status:getStatus' , 'thirst' , function(status)
				playerStatus['status'][showPlayerStatus] = {
					name  = 'thirst',
					value = math.floor(100 - status.getPercent())
				}
			end)
		end
		
		if showPlayerStatus > 0 then
			SendNUIMessage(playerStatus)
		end
	end
end)

AddEventHandler('onClientMapStart' , function(spawn)
	TriggerEvent('forzarhud:hud')
end)

AddEventHandler('playerSpawned' , function(spawn)
	TriggerEvent('forzarhud:hud')
end)

RegisterNetEvent('forzarhud:hud')
AddEventHandler('forzarhud:hud' , function()
	SendNUIMessage({ action = 'ui', config = Config.ui })
	SendNUIMessage({ action = 'setFont', url = Config.font.url, name = Config.font.name })
	SendNUIMessage({ action = 'setLogo', value = Config.serverLogo })
	if Config.ui.showVoice == true then
		if Config.voice.levels.current == 0 then
			NetworkSetTalkerProximity(Config.voice.levels.default)
		elseif Config.voice.levels.current == 1 then
			NetworkSetTalkerProximity(Config.voice.levels.shout)
		elseif Config.voice.levels.current == 2 then
			NetworkSetTalkerProximity(Config.voice.levels.whisper)
		end
	end
end)

local toggleui = false
RegisterCommand('toggleui', function()
	if not toggleui then
		SendNUIMessage({ action = 'element', task = 'disable', value = 'job' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'bank' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'wallet' })
	else
		if (Config.ui.showJob == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'job' })
		end
		if (Config.ui.showSocietyMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })
		end
		if (Config.ui.showBankMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'bank' })
		end
		if (Config.ui.showWalletMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'wallet' })
		end
	end

	toggleui = not toggleui
end)

local firstSpawn = true
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	if firstSpawn then
		firstSpawn = false
		TriggerServerEvent('yrp_hud:getServerInfo')
		TriggerEvent('forzarhud:hud')
	end
end)

RegisterNetEvent('yrp_hud:setPlayerInfo')
AddEventHandler('yrp_hud:setPlayerInfo', function(info)
	OldMoney['wallet'] = info['money']
	OldMoney['bank'] = info['bankMoney']
	OldMoney['job'] = info['job']

	SendNUIMessage({ action = 'setText', id = 'job', value = OldMoney['job'] })
	SendNUIMessage({ action = 'setMoney', id = 'wallet', value = OldMoney['wallet'] })
	SendNUIMessage({ action = 'setMoney', id = 'bank', value = OldMoney['bank'] })
end)
