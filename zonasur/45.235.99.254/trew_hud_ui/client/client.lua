local ESX	 = nil

Citizen.CreateThread(function()
 	while ESX == nil do
 		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 		Citizen.Wait(0)
 	end

 	while ESX.GetPlayerData().job == nil do
 		Citizen.Wait(10)
 	end

 	ESX.PlayerData = ESX.GetPlayerData()
	
 	SendNUIMessage({action = 'ui', config = Config.ui})
    SendNUIMessage({action = 'setFont', url = Config.font.url, name = Config.font.name})
 	SendNUIMessage({action = 'setLogo', value = Config.serverLogo})
 	--TriggerEvent("trew_hud_ui:cargarinfo", ESX.PlayerData)
end)


local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }
-- Location update
--[[
Citizen.CreateThread(function()

	while true do
		Citizen.Wait(100)

		local player = GetPlayerPed(-1)

		local position = GetEntityCoords(player)

		if Config.ui.showLocation == true then
			local zoneNameFull = zones[GetNameOfZone(position.x, position.y, position.z)]
			local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(position.x, position.y, position.z))

			local locationMessage = nil

			if zoneNameFull then 
				locationMessage = streetName .. ', ' .. zoneNameFull
			else
				locationMessage = streetName
			end

			locationMessage = string.format(
				Locales[Config.Locale]['you_are_on_location'],
				locationMessage
			)

			SendNUIMessage({ action = 'setText', id = 'location', value = locationMessage })
		end
	end
end)
]]--


local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local AllWeapons = json.decode('{"melee":{"dagger":"0x92A27487","bat":"0x958A4A8F","bottle":"0xF9E6AA4B","crowbar":"0x84BD7BFD","unarmed":"0xA2719263","flashlight":"0x8BB05FD7","golfclub":"0x440E4788","hammer":"0x4E875F73","hatchet":"0xF9DCBF2D","knuckle":"0xD8DF3C3C","knife":"0x99B507EA","machete":"0xDD5DF8D9","switchblade":"0xDFE37640","nightstick":"0x678B81B1","wrench":"0x19044EE0","battleaxe":"0xCD274149","poolcue":"0x94117305","stone_hatchet":"0x3813FC08"},"handguns":{"pistol":"0x1B06D571","pistol_mk2":"0xBFE256D4","combatpistol":"0x5EF9FEC4","appistol":"0x22D8FE39","stungun":"0x3656C8C1","pistol50":"0x99AEEB3B","snspistol":"0xBFD21232","snspistol_mk2":"0x88374054","heavypistol":"0xD205520E","vintagepistol":"0x83839C4","flaregun":"0x47757124","marksmanpistol":"0xDC4DB296","revolver":"0xC1B3C3D1","revolver_mk2":"0xCB96392F","doubleaction":"0x97EA20B8","raypistol":"0xAF3696A1"},"smg":{"microsmg":"0x13532244","smg":"0x2BE6766B","smg_mk2":"0x78A97CD0","assaultsmg":"0xEFE7E2DF","combatpdw":"0xA3D4D34","machinepistol":"0xDB1AA450","minismg":"0xBD248B55","raycarbine":"0x476BF155"},"shotguns":{"pumpshotgun":"0x1D073A89","pumpshotgun_mk2":"0x555AF99A","sawnoffshotgun":"0x7846A318","assaultshotgun":"0xE284C527","bullpupshotgun":"0x9D61E50F","musket":"0xA89CB99E","heavyshotgun":"0x3AABBBAA","dbshotgun":"0xEF951FBB","autoshotgun":"0x12E82D3D"},"assault_rifles":{"assaultrifle":"0xBFEFFF6D","assaultrifle_mk2":"0x394F415C","carbinerifle":"0x83BF0278","carbinerifle_mk2":"0xFAD1F1C9","advancedrifle":"0xAF113F99","specialcarbine":"0xC0A3098D","specialcarbine_mk2":"0x969C3D67","bullpuprifle":"0x7F229F94","bullpuprifle_mk2":"0x84D6FAFD","compactrifle":"0x624FE830"},"machine_guns":{"mg":"0x9D07F764","combatmg":"0x7FD62962","combatmg_mk2":"0xDBBD7280","gusenberg":"0x61012683"},"sniper_rifles":{"sniperrifle":"0x5FC3C11","heavysniper":"0xC472FE2","heavysniper_mk2":"0xA914799","marksmanrifle":"0xC734385A","marksmanrifle_mk2":"0x6A6C02E0"},"heavy_weapons":{"rpg":"0xB1CA77B1","grenadelauncher":"0xA284510B","grenadelauncher_smoke":"0x4DD2DC56","minigun":"0x42BF8A85","firework":"0x7F7497E5","railgun":"0x6D544C99","hominglauncher":"0x63AB0442","compactlauncher":"0x781FE4A","rayminigun":"0xB62D1F67"},"throwables":{"grenade":"0x93E220BD","bzgas":"0xA0973D5E","smokegrenade":"0xFDBC8A50","flare":"0x497FACC3","molotov":"0x24B17070","stickybomb":"0x2C3731D9","proxmine":"0xAB564B93","snowball":"0x787F0BB","pipebomb":"0xBA45E8B8","ball":"0x23C9F95C"},"misc":{"petrolcan":"0x34A67B97","fireextinguisher":"0x60EC506","parachute":"0xFBAB5776"}}')

local vehiclesCars = {0,1,2,3,4,5,6,7,8,9,10,11,12,17,18,19,20};
local myJob = nil

RegisterNetEvent('trew_hud_ui:cargarinfo')
AddEventHandler('trew_hud_ui:cargarinfo', function()
	TriggerServerEvent('trew_hud_ui:getServerInfo')
 	TriggerEvent('forzarhud:hud')
end)

 -- Hides TREW UI when it's on Pause Menu
OldMoney = {}
OldMoney['wallet'] = 0
OldMoney['bank'] = 0
OldMoney['blackMoney'] = 0
OldMoney['society'] = 0

RegisterNetEvent('esx:addedMoney')
AddEventHandler('esx:addedMoney', function(m, native, current)
    if not native then
		OldMoney['wallet'] = OldMoney['wallet'] + m
 		SendNUIMessage({action = 'setMoney', id = 'wallet', value = OldMoney['wallet']})
    else
        OldMoney['wallet'] = current
 		SendNUIMessage({action = 'setMoney', id = 'wallet', value = current})
    end
end)

RegisterNetEvent('esx:removedMoney')
AddEventHandler('esx:removedMoney', function(m, native, current)
    if not native then
		OldMoney['wallet'] = OldMoney['wallet'] - m
 		SendNUIMessage({action = 'setMoney', id = 'wallet', value = OldMoney['wallet']})
    else
 		SendNUIMessage({action = 'setMoney', id = 'wallet', value = current})
    end
end)

RegisterNetEvent('esx:activateMoney')
AddEventHandler('esx:activateMoney', function(m)
	OldMoney['wallet'] = tonumber(m)
 	SendNUIMessage({action = 'setMoney', id = 'wallet', value = OldMoney['wallet']})
end)

RegisterNetEvent('esx:setPlayerData')
AddEventHandler('esx:setPlayerData', function(type, m, native, current)
    if type == 'money' then
        OldMoney['wallet'] = m
 		SendNUIMessage({action = 'setMoney', id = 'wallet', value = OldMoney['wallet']})
    elseif type == 'bank' then
        OldMoney['bank'] = m
 		SendNUIMessage({action = 'setMoney', id = 'bank', value = OldMoney['bank']})
    elseif type == 'black_money' then
 		OldMoney['blackMoney'] = m
 		SendNUIMessage({action = 'setMoney', id = 'blackMoney', value = OldMoney['blackMoney']})
    end
end)

RegisterNetEvent('esx:addedBank')
AddEventHandler('esx:addedBank', function(m)
    OldMoney['bank'] = OldMoney['bank'] + m
 	SendNUIMessage({action = 'addMoney', id = 'bank', value = OldMoney['bank']})
end)
 
RegisterNetEvent('esx:removedBank')
AddEventHandler('esx:removedBank', function(m)
    OldMoney['bank'] = OldMoney['bank'] - m
 	SendNUIMessage({action = 'setMoney', id = 'bank', value = OldMoney['bank']})
end)

RegisterNetEvent('esx:displayBank')
AddEventHandler('esx:displayBank', function(m)
    OldMoney['bank'] = m
 	SendNUIMessage({action = 'setMoney', id = 'bank', value = OldMoney['bank']})
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    if account.name == 'money' then
        OldMoney['wallet'] = account.money
 		SendNUIMessage({action = 'setMoney', id = 'wallet', value = tonumber(account.money)})
    elseif account.name == 'bank' then
        OldMoney['bank'] = account.money
 		SendNUIMessage({action = 'setMoney', id = 'bank', value = account.money})
    elseif account.name == 'black_money' then
        OldMoney['blackMoney'] = account.money
 		SendNUIMessage({action = 'setMoney', id = 'blackMoney', value = account.money})
    end
 end)

RegisterNetEvent('esx:activateMoney')
AddEventHandler('esx:activateMoney', function(m, money)
 	SendNUIMessage({ action = 'setMoney', id = 'wallet', value = money })
end)

Citizen.CreateThread(function()
    local isPauseMenu = false

 	while true do
 		Citizen.Wait(0)
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

local myJob = nil

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
 	if job ~= nil then
 		myJob = job
        if job.label == job.grade_label then
            SendNUIMessage({action = 'setText', id = 'job', value = job.grade_label})
        else
            SendNUIMessage({action = 'setText', id = 'job', value = job.label .. ': ' .. job.grade_label})
        end

        if job.grade_name ~= nil and job.grade_name == 'boss' then
            if (Config.ui.showSocietyMoney == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'society'}) end
			ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
				OldMoney['society'] = money
				SendNUIMessage({action = 'setMoney', id = 'society', value = OldMoney['society']})
			end, job.name)
		else
			SendNUIMessage({action = 'element', task = 'disable', value = 'society'})
		end
     end
end)


 -- Vehicle Info
local vehicleCruiser = false
local vehicleSignalIndicator = 'off'
local seatbeltEjectSpeed = 45.0
local seatbeltEjectAccel = 100.0
local seatbeltIsOn = false
local currSpeed = 0.0
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}


Citizen.CreateThread(function()
 	local bLastIsPedInAnyVehicle = false
 	while true do
 		Citizen.Wait(100)
 		local player = GetPlayerPed(-1)
 		local IsPedInAnyVehicle = IsPedInAnyVehicle(player, false)
 		local vehicleIsOn = false
 		local bUpdateUI = false
 		if IsPedInAnyVehicle and not bLastIsPedInAnyVehicle then
 			bUpdateUI = true
 		elseif not IsPedInAnyVehicle and bLastIsPedInAnyVehicle then
 			bUpdateUI = true
 		end
 		bLastIsPedInAnyVehicle = IsPedInAnyVehicle
 		local vehicleInfo = {}
 		if IsPedInAnyVehicle then
 			local vehicle = GetVehiclePedIsIn(player, false)
 			vehicleIsOn = GetIsVehicleEngineRunning(vehicle)
 			if vehicleIsOn then
 				local position = GetEntityCoords(player)
 				local vehicleClass = GetVehicleClass(vehicle)
 				local vehicleSpeedSource = GetEntitySpeed(vehicle)
 				local vehicleSpeed = 0
 				if Config.vehicle.speedUnit == 'MPH' then 
 					vehicleSpeed = math.ceil(vehicleSpeedSource * 2.237) 
 				else 
 					vehicleSpeed = math.ceil(vehicleSpeedSource * 3.6) 
 				end
 				-- Vehicle Gradient Speed
 				local vehicleNailSpeed = 0
 				if vehicleSpeed > Config.vehicle.maxSpeed then
 					vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(Config.vehicle.maxSpeed * 205) / Config.vehicle.maxSpeed) )
 				else
 					vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(vehicleSpeed * 205) / Config.vehicle.maxSpeed) )
 				end
 				-- Vehicle Fuel and Gear
 				local vehicleFuel = GetVehicleFuelLevel(vehicle)
 				local vehicleGear = GetVehicleCurrentGear(vehicle)
				
				local vehicleWheel = GetVehicleWheelHealth(vehicle, 0) / 10
				
 				if (vehicleSpeed == 0 and vehicleGear == 0) or (vehicleSpeed == 0 and vehicleGear == 1) then
 					vehicleGear = 'N'
 				elseif vehicleSpeed > 0 and vehicleGear == 0 then
 					vehicleGear = 'R'
 				end
 				-- Vehicle Lights
 				local vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehicle)
 				local vehicleIsLightsOn = false
 				if vehicleLights == 1 and vehicleHighlights == 0 then
 					vehicleIsLightsOn = 'normal'
 				elseif (vehicleLights == 1 and vehicleHighlights == 1) or (vehicleLights == 0 and vehicleHighlights == 1) then
 					vehicleIsLightsOn = 'high'
 				else
 					vehicleIsLightsOn = 'off'
 				end
 				-- Vehicle Siren
 				local vehicleSiren = false
 				if IsVehicleSirenOn(vehicle) then
 					vehicleSiren = true
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
				
				--Estado del autoshotgun
				damage = math.floor(GetVehicleEngineHealth(vehicle)) / 10
				
 				vehicleInfo = {
 					action = 'updateVehicle',
 					status = true,
 					speed = vehicleSpeed,
 					nail = vehicleNailSpeed,
 					gear = vehicleGear,
 					fuel = vehicleFuel,
					wheel = vehicleWheel,
 					lights = vehicleIsLightsOn,
 					signals = vehicleSignalIndicator,
 					cruiser = vehicleCruiser,
 					type = vehicleClass,
 					siren = vehicleSiren,
 					seatbelt = { status = seatbeltIsOn },
 					config = {
 						speedUnit = Config.vehicle.speedUnit,
 						maxSpeed = Config.vehicle.maxSpeed
 					},
					damage = damage,
 				}
 				SendNUIMessage(vehicleInfo)
 			else
 				vehicleCruiser = false
 				vehicleSignalIndicator = 'off'
 				seatbeltIsOn = false
 				vehicleInfo = {
 					action = 'updateVehicle',
 					status = false,
 					nail = 0,
 					seatbelt = { status = seatbeltIsOn },
 					cruiser = vehicleCruiser,
 					signals = vehicleSignalIndicator,
 					type = 0,
 				}
 				SendNUIMessage(vehicleInfo)
 				Citizen.Wait(300)
 			end
 		end
 		if bUpdateUI and IsPedInAnyVehicle and vehicleIsOn then -- is on vehicle
 		elseif bUpdateUI and not IsPedInAnyVehicle then -- not in vehicle
 			vehicleCruiser = false
 			vehicleSignalIndicator = 'off'
            seatbeltIsOn = false
 			vehicleInfo = {
 				action = 'updateVehicle',
 				status = false,
 				nail = 0,
 				seatbelt = { status = seatbeltIsOn },
 				cruiser = vehicleCruiser,
 				signals = vehicleSignalIndicator,
 				type = 0,
 			}
 			SendNUIMessage(vehicleInfo)
 		end
 	end
end)

 -- Player status

Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(5000)
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
 		if myJob ~= nil and myJob.grade_name == 'boss' then
 			ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
 				SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
 			end, myJob.name)
 		end
 		if Config.ui.showHunger == true then
 			showPlayerStatus = (showPlayerStatus+1)
 			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
 				playerStatus['status'][showPlayerStatus] = {
 					name = 'hunger',
 					value = math.floor(100-status.getPercent())
 				}
 			end)
 		end
 		if Config.ui.showThirst == true then
 			showPlayerStatus = (showPlayerStatus+1)
 			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
 				playerStatus['status'][showPlayerStatus] = {
					name = 'thirst',
					value = math.floor(100-status.getPercent())
				}
			end)
		end
		if showPlayerStatus > 0 then
			SendNUIMessage(playerStatus)
		end
	end
end)

-- Overall Info

RegisterNetEvent('trew_hud_ui:setInfo')
AddEventHandler('trew_hud_ui:setInfo', function(info)
	SendNUIMessage({ action = 'setText', id = 'job', value = info['job'] })
	SendNUIMessage({ action = 'setText', id = 'id', value = info['id'] })
	SendNUIMessage({ action = 'setMoney', id = 'wallet', value = info['money'] })
	SendNUIMessage({ action = 'setMoney', id = 'bank', value = info['bankMoney'] })
	SendNUIMessage({ action = 'setMoney', id = 'blackMoney', value = info['blackMoney'] })
	TriggerEvent('esx:getSharedObject', function(obj)
		ESX = obj
		ESX.PlayerData = ESX.GetPlayerData()
	end)
	if ESX.PlayerData.job ~= nil then
		if ESX.PlayerData.job.grade_name ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
			if (Config.ui.showSocietyMoney == true) then
				SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })
			end
			ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
				SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
			end, ESX.PlayerData.job.name)
		else
			SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
		end
	end
end)

--[[
-- Voice detection and distance

Citizen.CreateThread(function()
	if Config.ui.showVoice == true then
	    RequestAnimDict('facials@gen_male@variations@normal')
	    RequestAnimDict('mp_facial')
	    while true do
	        Citizen.Wait(300)
	        local playerID = PlayerId()
	        for _,player in ipairs(GetActivePlayers()) do
	            local boolTalking = NetworkIsPlayerTalking(player)
	            if player ~= playerID then
	                if boolTalking then
	                    PlayFacialAnim(GetPlayerPed(player), 'mic_chatter', 'mp_facial')
	                elseif not boolTalking then
	                    PlayFacialAnim(GetPlayerPed(player), 'mood_normal_1', 'facials@gen_male@variations@normal')
	                end
	            end
	        end
	    end
	end
end)


Citizen.CreateThread(function()
	if Config.ui.showVoice == true then
		local isTalking = false
		local voiceDistance = nil
		if Config.voice.levels.current == 0 then
			voiceDistance = 'normal'
		elseif Config.voice.levels.current == 1 then
			voiceDistance = 'shout'
		elseif Config.voice.levels.current == 2 then
			voiceDistance = 'whisper'
		end
		while true do
			Citizen.Wait(1)
			if NetworkIsPlayerTalking(PlayerId()) and not isTalking then 
				isTalking = not isTalking
				SendNUIMessage({ action = 'isTalking', value = isTalking })
			elseif not NetworkIsPlayerTalking(PlayerId()) and isTalking then 
				isTalking = not isTalking
				SendNUIMessage({ action = 'isTalking', value = isTalking })
			end
			if IsControlJustPressed(1, Keys[Config.voice.keys.distance]) then
				Config.voice.levels.current = (Config.voice.levels.current + 1) % 3
				if Config.voice.levels.current == 0 then
					voiceDistance = 'normal'
				elseif Config.voice.levels.current == 1 then
					voiceDistance = 'shout'
				elseif Config.voice.levels.current == 2 then
					voiceDistance = 'whisper'
				end
				SendNUIMessage({ action = 'setVoiceDistance', value = voiceDistance })
				if Config.voice.levels.current == 0 then
					voiceDistance = 'normal'
				elseif Config.voice.levels.current == 1 then
					voiceDistance = 'shout'
				elseif Config.voice.levels.current == 2 then
					voiceDistance = 'whisper'
				end
			end
		end
	end
end)
]]--

-- Weapons

Citizen.CreateThread(function()
	if Config.ui.showWeapons == true then
		local bLastArmed = false
		while true do
			Citizen.Wait(100)
			local player = GetPlayerPed(-1)
			local status = {}
			local bIsPedArmed = IsPedArmed(player, 7)
			if bIsPedArmed then
				local weapon = GetSelectedPedWeapon(player)
				local ammoTotal = GetAmmoInPedWeapon(player,weapon)
				local bool,ammoClip = GetAmmoInClip(player,weapon)
				local ammoRemaining = math.floor(ammoTotal - ammoClip)
				status['armed'] = true
				for key,value in pairs(AllWeapons) do
					for keyTwo,valueTwo in pairs(AllWeapons[key]) do
						if weapon == GetHashKey('weapon_'..keyTwo) then
							status['weapon'] = keyTwo
							if key == 'melee' then
								SendNUIMessage({ action = 'element', task = 'disable', value = 'weapon_bullets' })
								SendNUIMessage({ action = 'element', task = 'disable', value = 'bullets' })
							else
								if keyTwo == 'stungun' then
									SendNUIMessage({ action = 'element', task = 'disable', value = 'weapon_bullets' })
									SendNUIMessage({ action = 'element', task = 'disable', value = 'bullets' })
								else
									SendNUIMessage({ action = 'element', task = 'enable', value = 'weapon_bullets' })
									SendNUIMessage({ action = 'element', task = 'enable', value = 'bullets' })
								end
							end
						end
					end
				end
				SendNUIMessage({ action = 'setText', id = 'weapon_clip', value = ammoClip })
				SendNUIMessage({ action = 'setText', id = 'weapon_ammo', value = ammoRemaining })
			else
				status['armed'] = false
			end
			if bLastArmed ~= bIsPedArmed then
				SendNUIMessage({ action = 'updateWeapon', status = status })
				bLastArmed = bIsPedArmed
			end
		end
	end
end)


local kSeatBelt =  Config.vehicle.keys.seatbelt
local kCruiser =  Config.vehicle.keys.cruiser
local kSignalLeft =  Config.vehicle.keys.signalLeft
local kSignalRight =  Config.vehicle.keys.signalRight
local kSignalBoth = Config.vehicle.keys.signalBoth
-- Everything that neededs to be at WAIT 0

Citizen.CreateThread(function()
	while true do
		local player = GetPlayerPed(-1)
		local bIsPlayerOnVehicle = IsPedInAnyVehicle(player, false)
		if bIsPlayerOnVehicle then
			local vehicle = GetVehiclePedIsIn(player, false)
			local vehicleClass = GetVehicleClass(vehicle)
			if has_value(vehiclesCars, vehicleClass) then
				-- Vehicle Seatbelt
				if IsControlJustReleased(0, Keys[kSeatBelt]) and vehicleClass ~= 8 then
					seatbeltIsOn = not seatbeltIsOn
				end
				if (GetPedInVehicleSeat(vehicle, -1) == player) and GetIsVehicleEngineRunning(vehicle) then
					if IsControlJustPressed(1, Keys[kCruiser]) then
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
					if IsControlJustPressed(1, Keys[kSignalLeft]) then
						if vehicleSignalIndicator == 'off' then
							vehicleSignalIndicator = 'left'
						else
							vehicleSignalIndicator = 'off'
						end
						TriggerEvent('trew_hud_ui:setCarSignalLights', vehicleSignalIndicator)
					end
					if IsControlJustPressed(1, Keys[kSignalRight]) then
						if vehicleSignalIndicator == 'off' then
							vehicleSignalIndicator = 'right'
						else
							vehicleSignalIndicator = 'off'
						end
						TriggerEvent('trew_hud_ui:setCarSignalLights', vehicleSignalIndicator)
					end
					if IsControlJustPressed(1, Keys[kSignalBoth]) then
						if vehicleSignalIndicator == 'off' then
							vehicleSignalIndicator = 'both'
 						else
 							vehicleSignalIndicator = 'off'
 						end
 						TriggerEvent('trew_hud_ui:setCarSignalLights', vehicleSignalIndicator)
 					end
 				end
 			end
 			Citizen.Wait(0)
 		else
 			Citizen.Wait(400)
 		end
 	end
end)

--[[
AddEventHandler('onClientMapStart', function(spawn)
 	TriggerServerEvent('trew_hud_ui:getServerInfo')
 	TriggerEvent('forzarhud:hud')
end)

 RegisterNetEvent('esx:onPlayerSpawn')

AddEventHandler('esx:onPlayerSpawn', function(spawn) 
    TriggerServerEvent('trew_hud_ui:getServerInfo')
 	TriggerEvent('forzarhud:hud')
end)
]]--

AddEventHandler('playerSpawned', function(spawn) 
    TriggerServerEvent('trew_hud_ui:getServerInfo')
 	TriggerEvent('forzarhud:hud')
end)


RegisterNetEvent('forzarhud:hud')
AddEventHandler('forzarhud:hud', function()
 	SendNUIMessage({ action = 'ui', config = Config.ui })
 	SendNUIMessage({ action = 'setFont', url = Config.font.url, name = Config.font.name })
 	SendNUIMessage({ action = 'setLogo', value = Config.serverLogo })
end)

AddEventHandler('playerSpawned', function()
 	HideHudComponentThisFrame(7) -- Area
	HideHudComponentThisFrame(9) -- Street
 	HideHudComponentThisFrame(6) -- Vehicle
 	HideHudComponentThisFrame(3) -- SP Cash
 	HideHudComponentThisFrame(4) -- MP Cash
 	HideHudComponentThisFrame(13) -- Cash changes!
end)

 --[[
AddEventHandler('trew_hud_ui:setCarSignalLights', function(status)
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
AddEventHandler('trew_hud_ui:syncCarLights', function(driver, status)
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
]]--

function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

local toggleui = false

RegisterCommand('hud', function()
 	if not toggleui then
 		SendNUIMessage({ action = 'element', task = 'disable', value = 'money' })
 		SendNUIMessage({ action = 'element', task = 'disable', value = 'status' })
 		SendNUIMessage({ action = 'element', task = 'disable', value = 'job' })
 		--SendNUIMessage({ action = 'element', task = 'disable', value = 'voice' }) 
 		--SendNUIMessage({ action = 'element', task = 'disable', value = 'location' })
 		SendNUIMessage({ action = 'element', task = 'disable', value = 'speedometer' })
 		exports["tm1_mafias"]:HUD_(false)
 		--exports["1974_time"]:HUD(false)
		--TriggerEvent('1974_time:hud', false)
		TriggerEvent('chat:hide', false)
		TriggerEvent('esx_policejob:hud', false)
		DisplayRadar(false)
 	else
 		SendNUIMessage({ action = 'element', task = 'enable', value = 'money' })
 		SendNUIMessage({ action = 'element', task = 'enable', value = 'status' })
 		SendNUIMessage({ action = 'element', task = 'enable', value = 'job' })
 		--SendNUIMessage({ action = 'element', task = 'enable', value = 'voice' })
 		--SendNUIMessage({ action = 'element', task = 'enable', value = 'location' })
 		SendNUIMessage({ action = 'element', task = 'enable', value = 'speedometer' })
 		exports["tm1_mafias"]:HUD_(true)
 		--exports["1974_time"]:HUD(true)
		--TriggerEvent('1974_time:hud', true)
		TriggerEvent('chat:hide', true)
		TriggerEvent('esx_policejob:hud', true)
		DisplayRadar(true)
 	end
 	toggleui = not toggleui
end)
 
exports('createStatus', function(args)
	local statusCreation = { action = 'createStatus', status = args['status'], color = args['color'], icon = args['icon'] }
 	SendNUIMessage(statusCreation)
end)
 

exports('setStatus', function(args)
 	local playerStatus = { action = 'setStatus', status = {
 		{ name = args['name'], value = args['value'] }
 	}}
 	SendNUIMessage(playerStatus)
end)


-- Date and time update

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if Config.ui.showDate == true then
			local year, month, dayOfWeek, hour, minute = GetLocalTime()
			SendNUIMessage({ action = 'setText', id = 'date', value = 'FECHA: '..dayOfWeek..'/'..month..'/'..year..' - '..GetClockHours()..':'..GetClockMinutes() })
		end
	end
end)


function trewDate()
	local timeString = nil

	--local day = _U('day_' .. GetClockDayOfMonth())
	--local weekDay = _U('weekDay_' .. GetClockDayOfWeek())
	--local month = _U('month_' .. GetClockMonth())
	--local day = _U('day_' .. GetClockDayOfMonth())
	--local year = GetClockYear()
	
	local year, month, dayOfWeek, hour, minute = GetLocalTime()


	--local hour = GetClockHours()
	--local minutes = GetClockMinutes()
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
	elseif Config.date.format == 'simple' then
		timeString = string.format(
			date_format,
			day, month
		)

	elseif Config.date.format == 'simpleWithHours' then
		timeString = string.format(
			date_format,
			time, day, month
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