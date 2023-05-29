local ESX	 = nil

-- ESX
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(1000)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

local Keys = {
	["ESC"] = 322, ["."] = 81, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}



-- Hides TREW UI when it's on Pause Menu
Citizen.CreateThread(function()

    local isPauseMenu = false

	while true do
		Citizen.Wait(1000)

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


	end
end)
RegisterNetEvent('actuEstadoAnimo', function(a)
	if a == 'normal' then
	
	SendNUIMessage({ action = 'estadoAnim', value = 'normal' })
elseif a == 'enfadado' then
	SendNUIMessage({ action = 'estadoAnim', value = 'shout' })
end
end)
--[[

MumbleSetServerAddress("51.178.28.54",40000)
settings = {}
settings.voice = {
    tipos = {
        def = 5.0,
        gri = 12.0,
        sus = 1.0,
        cu = 0
    },
    key = {
        dis = 243,
    }
}
local v = 0
local voiceUP = true
RegisterNetEvent('snowiVoiceShutDown', function(a)
    print(a)
if a == false then
voiceUP = false
elseif a == true then
    voiceUP = true
end end
)
local debugMode = false
RegisterCommand('voiceDebug', function()
if debugMode == true then
debugMode =false
print('Debug voice ->',debugMode)
else debugMode = true
print('Debug voice ->', debugMode)
end end)
AddEventHandler('onClientMapStart', function()
	print('Client map ')
    v = v+1
    TriggerServerEvent('snowiVoice',v)
        
		if settings.voice.tipos.cu == 0 then
			NetworkSetTalkerProximity(settings.voice.tipos.def)
		elseif settings.voice.tipos.cu == 1 then
			NetworkSetTalkerProximity(settings.voice.tipos.gri)
		elseif settings.voice.tipos.cu == 2 then
			NetworkSetTalkerProximity(settings.voice.tipos.sus)
		end
end)

AddEventHandler('playerSpawned', function()
	    NetworkSetTalkerProximity(5.0)
		print('5.0 spawned')
end)


Citizen.CreateThread(function()
	    RequestAnimDict('facials@gen_male@variations@normal')
	    RequestAnimDict('mp_facial')
	    while true do
	        Citizen.Wait(500)
	        local playerID = PlayerId()

	        for _,player in ipairs(GetActivePlayers()) do
	            local boolTalking = NetworkIsPlayerTalking(player)

	            if player ~= playerID then
	                if boolTalking then
	                    PlayFacialAnim(GetPlayerPed(player), 'mic_chatter', 'mp_facial')
	                elseif not boolTalking then
	                    PlayFacialAnim(GetPlayerPed(player), 'mood_normal_1', 'facials@gen_male@variations@normal')
	                end
                else
                    if boolTalking then
	                    PlayFacialAnim(GetPlayerPed(-1), 'mic_chatter', 'mp_facial')
	                elseif not boolTalking then
	                    PlayFacialAnim(GetPlayerPed(-1), 'mood_normal_1', 'facials@gen_male@variations@normal')
	                end
	            end
	        end
            


	    end
end)

Citizen.CreateThread(function()
		local isTalking = false
		local voiceDistance  = nil
		while true do
			Citizen.Wait(1)
            if voiceUP == true then
				if NetworkIsPlayerTalking(PlayerId()) and not isTalking then 
					isTalking = not isTalking
					SendNUIMessage({ action = 'isTalking', value = isTalking })
				elseif not NetworkIsPlayerTalking(PlayerId()) and isTalking then 
					isTalking = not isTalking
					SendNUIMessage({ action = 'isTalking', value = isTalking })
				end
			if IsControlJustPressed(1, settings.voice.key.dis) then
                print('Se suponeq ue hablo')
				settings.voice.tipos.cu = (settings.voice.tipos.cu + 1) % 3
				if settings.voice.tipos.cu == 0 then
                    print('Aqui normal')
					NetworkSetTalkerProximity(settings.voice.tipos.def)
					voiceDistance  = 'normal'
				elseif settings.voice.tipos.cu == 1 then
					NetworkSetTalkerProximity(settings.voice.tipos.gri)
					voiceDistance = 'shout'
				elseif settings.voice.tipos.cu == 2 then
					NetworkSetTalkerProximity(settings.voice.tipos.sus)
					voiceDistance = 'whisper'
				end
				print('Send niu ', voiceDistance)
                SendNUIMessage({ action = 'setVoiceDistance', value = voiceDistance })
			end
			if settings.voice.tipos.cu == 0 then
				voiceDistance  = 'normal'
			elseif settings.voice.tipos.cu == 1 then
				voiceDistance = 'shout'
			elseif settings.voice.tipos.cu == 2 then
				voiceDistance = 'whisper'
			end
        else
            if debugMode == true then
                print('Voice no esta activado y no habla / cambia rangos de proximidad', voiceUP)
            end
        end
		end
end)
--]]

-- Vehicle Info
--[[
local vehicleCruiser
local vehicleSignalIndicator = 'off'
local seatbeltEjectSpeed = 45.0 
local seatbeltEjectAccel = 100.0
local seatbeltIsOn = false
local currSpeed = 0.0
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}

Citizen.CreateThread(function()
	
	while true do

		Citizen.Wait(100)
		local dorm = true

		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local position = GetEntityCoords(player)
		local vehicleIsOn = GetIsVehicleEngineRunning(vehicle)
		local vehicleInfo

		if IsPedInAnyVehicle(player, false) and vehicleIsOn then
dorm = false

			if Config.ui.showMinimap == false then
				DisplayRadar(true)
				display = true
			end

			-- Vehicle Speed
			local vehicleSpeedSource = GetEntitySpeed(vehicle)
			local vehicleSpeed
			if Config.vehicle.speedUnit == 'MPH' then
				vehicleSpeed = math.ceil(vehicleSpeedSource * 2.237)
			else
				vehicleSpeed = math.ceil(vehicleSpeedSource * 3.6)
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

			if Config.vehicle.useLegacyFuel == true then
				vehicleFuel = exports['LegacyFuel']:GetFuel(vehicle)
			else
				vehicleFuel = GetVehicleFuelLevel(vehicle)
			end

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















			-- Vehicle Seatbelt
			local vehicleClass = GetVehicleClass(vehicle)
			if vehicleClass ~= 13 then

				local prevSpeed = currSpeed
                currSpeed = vehicleSpeedSource

                SetPedConfigFlag(PlayerPedId(), 32, true)



			end

			

			vehicleInfo = {
				action = 'updateVehicle',

				status = true,
				speed = vehicleSpeed,
				nail = vehicleNailSpeed,
				gear = vehicleGear,
				fuel = vehicleFuel,
				lights = vehicleIsLightsOn,
				signals = vehicleSignalIndicator,
				cruiser = vehicleCruiser,

				seatbelt = Config.vehicle.seatbelt,

				config = {
					speedUnit = Config.vehicle.speedUnit,
					maxSpeed = Config.vehicle.maxSpeed
				}
			}

			vehicleInfo['seatbelt']['status'] = seatbeltIsOn
		else

			
			vehicleCruiser = false
			vehicleNailSpeed = 0
			vehicleSignalIndicator = 'off'

            seatbeltIsOn = false

			vehicleInfo = {
				action = 'updateVehicle',

				status = false,
				nail = vehicleNailSpeed,
				seatbelt = { status = seatbeltIsOn },
				cruiser = vehicleCruiser,
				signals = vehicleSignalIndicator,
			}

			if Config.ui.showMinimap == false then
				DisplayRadar(false)
				display = false
			end

		end

		SendNUIMessage(vehicleInfo)




if dorm == true then
	Citizen.Wait(3000)
end
	end
end)




-- Player status
Citizen.CreateThread(function()

	while true do
		Citizen.Wait(7000)

		local playerStatus 
		local showPlayerStatus = 0
		playerStatus = { action = 'setStatus', status = {} }

		if Config.ui.showHealth == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['isdead'] = false

			playerStatus['status'][showPlayerStatus] = {
				name = 'health',
				value = GetEntityHealth(GetPlayerPed(-1)) - 100
			}

			if IsEntityDead(GetPlayerPed(-1)) then
				playerStatus.isdead = true
			end
		end

		if Config.ui.showArmor == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['status'][showPlayerStatus] = {
				name = 'armor',
				value = GetPedArmour(GetPlayerPed(-1)),
			}
		end

		if Config.ui.showStamina == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['status'][showPlayerStatus] = {
				name = 'stamina',
				value = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
			}
		end

		if Config.ui.showHunger == true then
			showPlayerStatus = (showPlayerStatus+1)

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				playerStatus['status'][showPlayerStatus] = {
					name = 'hunger',
					value = status.getPercent()
				}
			end)
		end

		if Config.ui.showStress == true then
			showPlayerStatus = (showPlayerStatus+1)

			TriggerEvent('esx_status:getStatus', 'stress', function(status)
				playerStatus['status'][showPlayerStatus] = {
					name = 'stress',
					value = status.getPercent()
				}
			end)
		end

		if Config.ui.showThirst == true then
			showPlayerStatus = (showPlayerStatus+1)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				playerStatus['status'][showPlayerStatus] = {
					name = 'thirst',
					value = status.getPercent()
				}
			end)
		end

		if showPlayerStatus > 0 then
			SendNUIMessage(playerStatus)
		end

	end
end)

-- Everything that neededs to be at WAIT 0
Citizen.CreateThread(function ()

	while true do
		Citizen.Wait(5)
		local duermee = true

		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleClass = GetVehicleClass(vehicle)

		-- Vehicle Seatbelt
		if IsPedInAnyVehicle(player, false) and GetIsVehicleEngineRunning(vehicle) then
			duermee = false
			if IsControlJustReleased(0, Keys[Config.vehicle.keys.seatbelt]) and vehicleClass ~= 8 then
				seatbeltIsOn = not seatbeltIsOn
			end
		end

		-- Vehicle Cruiser
		if IsControlJustPressed(1, Keys[Config.vehicle.keys.cruiser]) and GetPedInVehicleSeat(vehicle, -1) == player then
			duermee = false
			
			local vehicleSpeedSource = GetEntitySpeed(vehicle)

			if vehicleCruiser == 'on' then
				vehicleCruiser = 'off'
				SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))
				
			else
				vehicleCruiser = 'on'
				SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
			end
		end





		-- Vehicle Signal Lights
		--[[if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalLeft]) then
			if vehicleSignalIndicator == 'off' then
				vehicleSignalIndicator = 'left'
			else
				vehicleSignalIndicator = 'off'
			end

			TriggerEvent('trew_hud_ui:setCarSignalLights', vehicleSignalIndicator)
		end

		if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalRight]) then
			if vehicleSignalIndicator == 'off' then
				vehicleSignalIndicator = 'right'
			else
				vehicleSignalIndicator = 'off'
			end

			TriggerEvent('trew_hud_ui:setCarSignalLights', vehicleSignalIndicator)
		end

		if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalBoth]) then
			if vehicleSignalIndicator == 'off' then
				vehicleSignalIndicator = 'both'
			else
				vehicleSignalIndicator = 'off'
			end

			TriggerEvent('trew_hud_ui:setCarSignalLights', vehicleSignalIndicator)
		end
if duermee == true then
	Citizen.Wait(3000)
end

	end
end)--]]








--[[function trewDate()
	local timeString = nil

	local day = _U('day_' .. GetClockDayOfMonth())
	local weekDay = _U('weekDay_' .. GetClockDayOfWeek())
	local month = _U('month_' .. GetClockMonth())
	local day = _U('day_' .. GetClockDayOfMonth())
	local year = GetClockYear()


	local hour = GetClockHours()
	local minutes = GetClockMinutes()
	local time = nil
	local AmPm = ''


	if Config.date.AmPm == true then

		if hour >= 13 and hour <= 24 then
			hour = hour - 12
			AmPm = 'PM'
		else
			if hour == 0 or hour == 24 then
				hour = 12
			end
			AmPm = 'AM'
		end

	end

	if hour <= 9 then
		hour = '0' .. hour
	end
	if minutes <= 9 then
		minutes = '0' .. minutes
	end

	time = hour .. ':' .. minutes .. ' ' .. AmPm




	local date_format = Locales[Config.Locale]['date_format'][Config.date.format]

	if Config.date.format == 'default' then
		timeString = string.format(
			date_format,
			day, month, year
		)
	elseif Config.date.format == 'withWeekday' then
		timeString = string.format(
			date_format,
			weekDay, day, month, year
		)
	elseif Config.date.format == 'withHours' then
		timeString = string.format(
			date_format,
			time, day, month, year
		)
	elseif Config.date.format == 'withWeekdayAndHours' then
		timeString = string.format(
			date_format,
			time, weekDay, day, month, year
		)
	end


	

	return timeString
end





RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer) 
	local data = xPlayer

	-- Job
	local job = data.job
	local jobname

	if job.label == job.grade_label or job.grade_name == 'sgc' then
		jobname = job.grade_label
	else
		jobname = job.label .. ': ' .. job.grade_label
	end 

	SendNUIMessage({ action = 'setText', id = 'job', value = jobname })

	-- Money
	local acc = data.accounts
	local bankMoney = '0'
	local blackMoney = '0'
	local agrio_coins = '0'
	local walletMoney = data.money

	for k,v in pairs(acc) do
		local acc = v
		if acc.name == 'bank' then
			if acc.money then
				bankMoney = acc.money
			end
		elseif acc.name == 'black_money' then
			if acc.money then
				blackMoney = acc.money
			end
		elseif acc.name == 'agrio_coins' then
			if acc.money then
				agrio_coins = acc.money
			end
		elseif acc.name == 'walletMoney' then
			if acc.money then
				walletMoney = acc.money
			end
		end
	end

	SendNUIMessage({ action = 'setMoney', id = 'bank', value = bankMoney })
	SendNUIMessage({ action = 'setMoney', id = 'agrio_coins', value = agrio_coins })
	SendNUIMessage({ action = 'setMoney', id = 'blackMoney', value = blackMoney })
	SendNUIMessage({ action = 'setMoney', id = 'wallet', value = walletMoney })

	if job.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
		end, job.name)				
	end
	if job.name == 'armeriaSur' or  job.name == 'armasNorte' or  job.name == 'armasmenor' or job.name == 'armeriaSandy' then
		if job.grade == 3 then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
		end, job.name)				
	end
	end

	HideHudComponentThisFrame(7) -- Area
	HideHudComponentThisFrame(9) -- Street
	HideHudComponentThisFrame(6) -- Vehicle
	HideHudComponentThisFrame(3) -- SP Cash
	HideHudComponentThisFrame(4) -- MP Cash
	HideHudComponentThisFrame(13) -- Cash changes

	-- UI Config
	SendNUIMessage({ action = 'ui', config = Config.ui })

	-- Font
	SendNUIMessage({ action = 'setFont', url = Config.font.url, name = Config.font.name })

	-- Logo
	SendNUIMessage({ action = 'setLogo', value =Config.serverLogo })

end)


RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
	while ESX == nil do
		Citizen.Wait(5000)
	end
	if ESX.PlayerData.job and ESX.PlayerData.job.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job.name == society then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
		end, ESX.PlayerData.job.name)
	end
	if ESX.PlayerData.job.name == 'armeriaSur' or  ESX.PlayerData.job.name == 'armasNorte' or  ESX.PlayerData.job.name == 'armasmenor' or ESX.PlayerData.job.name == 'armeriaSandy' then
		if ESX.PlayerData.job.grade == 3 then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
		end, ESX.PlayerData.job.name)				
	end
	end
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)

	local jobname

	ESX.PlayerData.job = job

	if job.label == job.grade_label or job.grade_name == 'sgc' then
		jobname = job.grade_label
	else
		jobname = job.label .. ': ' .. job.grade_label
	end 

	if (ESX.PlayerData.job.grade_name == 'boss') and (Config.ui.showSocietyMoney == true) then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
		end, ESX.PlayerData.job.name)		
		SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })
	else
		SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
	end
	if ESX.PlayerData.job.name == 'armeriaSur' or  ESX.PlayerData.job.name == 'armasNorte' or  ESX.PlayerData.job.name == 'armasmenor' or ESX.PlayerData.job.name == 'armeriaSandy' then
		if ESX.PlayerData.job.grade == 3 then
			ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
				SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
			end, ESX.PlayerData.job.name)		
			SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })		
	end
	end

	SendNUIMessage({ action = 'setText', id = 'job', value = jobname })
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(acc)
	if acc.name == 'bank' then
		SendNUIMessage({ action = 'setMoney', id = 'bank', value = acc.money })
	elseif acc.name == 'black_money' then
		SendNUIMessage({ action = 'setMoney', id = 'blackMoney', value = acc.money })
	elseif acc.name == 'agrio_coins' then
		SendNUIMessage({ action = 'setMoney', id = 'agrio_coins', value = acc.money })
	elseif acc.name == 'money' then
		SendNUIMessage({ action = 'setMoney', id = 'wallet', value = acc.money })
	end
end)

RegisterNetEvent('esx:activateMoney')
AddEventHandler('esx:activateMoney', function(money)
	SendNUIMessage({ action = 'setMoney', id = 'wallet', value = money })
end)


RegisterNetEvent('trew_hud_ui:setLogo')
AddEventHandler('trew_hud_ui:setLogo', function(image)
	SendNUIMessage({ action = 'setLogo', value = image })
end)


AddEventHandler('trew_hud_ui:setCarSignalLights', function (status)
	local driver = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	local hasTrailer,vehicleTrailer = GetVehicleTrailerVehicle(driver,vehicleTrailer)
	local leftLight
	local rightLight

	if status == 'left' then
		leftLight = false
		rightLight = true
		if hasTrailer then driver = vehicleTrailer end

	elseif status == 'right' then
		leftLight = true
		rightLight = false
		if hasTrailer then driver = vehicleTrailer end

	elseif status == 'both' then
		leftLight = true
		rightLight = true
		if hasTrailer then driver = vehicleTrailer end

	else
		leftLight = false
		rightLight = false
		if hasTrailer then driver = vehicleTrailer end

	end

	TriggerServerEvent('trew_hud_ui:syncCarLights', status)

	SetVehicleIndicatorLights(driver, 0, leftLight)
	SetVehicleIndicatorLights(driver, 1, rightLight)
end)



RegisterNetEvent('trew_hud_ui:syncCarLights')
AddEventHandler('trew_hud_ui:syncCarLights', function (driver, status)

	if GetPlayerFromServerId(driver) ~= PlayerId() then
		local driver = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(driver)), false)

		if status == 'left' then
			leftLight = false
			rightLight = true

		elseif status == 'right' then
			leftLight = true
			rightLight = false

		elseif status == 'both' then
			leftLight = true
			rightLight = true

		else
			leftLight = false
			rightLight = false
		end

		SetVehicleIndicatorLights(driver, 0, leftLight)
		SetVehicleIndicatorLights(driver, 1, rightLight)

	end
end)

RegisterCommand('adm', function(source, args, rawCommand)
	TriggerServerEvent('trew_hud_ui:admNotifyCheck', args)
end)


local toggleui = false
RegisterCommand('toggleui', function()
	if not toggleui then
		SendNUIMessage({ action = 'element', task = 'disable', value = 'job' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'bank' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'blackMoney' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'agrio_coins' })
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
		if (Config.ui.showBlackMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'blackMoney' })
		end
		if (Config.ui.showagrio_coins == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'agrio_coins' })
		end
		if (Config.ui.showWalletMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'wallet' })
		end
	end

	toggleui = not toggleui
end)

--]]
