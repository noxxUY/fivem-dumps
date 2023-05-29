local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData = {}
local salvaging = false
local lastInput = 0
local pause = false
local pausetimer = 0
local correct = 0
local QWER = {[1] = "Q", [2] = "W", [3] = "E", [4] = "R"}
local inSalvageZone = false
local isDiver = false
local hasGear = false
local nearestPed = false
local blip = nil
local SellBlips = {}
local ZoneBlips = {}
local blipSet = false
local hasJoined = false

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.esxTrigger, function(obj) ESX = obj end)
		Citizen.Wait(599)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	if Config.requireJob then
		if PlayerData.job ~= nil and PlayerData.job.name == 'diver' and blipSet == false then	
			setBlip()
		  else
			removejobBlip()
		end
	else
		if blipSet == false then	
			setBlip()
		  else
			removejobBlip()
		end
	end
end)

AddEventHandler('playerSpawned', function(spawn)
	if not hasJoined then
		TriggerServerEvent('salvage:spawned')
		hasJoined = true
	end
end)

RegisterNetEvent('salvage:updateJobBlips')
AddEventHandler('salvage:updateJobBlips', function()
	if Config.requireJob then
		if PlayerData.job ~= nil and PlayerData.job.name == 'diver' and blipSet == false then
			setBlip()
		end
	else
		if blipSet == false then
			setBlip()
		end
	end
end)

Citizen.CreateThread(function()
while true do
	Wait(600)
		if pause and salvaging then
			pausetimer = pausetimer + 1
		end
end
end)
local jjdgyayfwe= false
local tempsalvagin = 2500
Citizen.CreateThread(function()
	while true do
		Wait(tempsalvagin)
		if salvaging then
			tempsalvagin = 5
			if not Config.useQWER then

				if IsControlJustReleased(0, Keys['1']) then
					input = 1
				end
				if IsControlJustReleased(0, Keys['2']) then
					input = 2
				end
				if IsControlJustReleased(0, Keys['3']) then
					input = 3
				end
				if IsControlJustReleased(0, Keys['4']) then
					input = 4
				end
			
			else

				if IsControlJustReleased(0, Keys['Q']) then
					input = 1
				end
				if IsControlJustReleased(0, Keys['W']) then
					input = 2
				end
				if IsControlJustReleased(0, Keys['E']) then
					input = 3
				end
				if IsControlJustReleased(0, Keys['R']) then
					input = 4
				end

			end
			
			
			if IsControlJustReleased(0, Keys['Z']) then
				salvaging = false
				ClearPedTasks(GetPlayerPed(-1))
				notify(Config.dialog.stopSalvaging)
				FreezeEntityPosition(playerPed, false)
			end
			if salvaging then
				Citizen.InvokeNative(0x0AFC4AF510774B47)
				playerPed = GetPlayerPed(-1)
				local pos = GetEntityCoords(GetPlayerPed(-1))
				FreezeEntityPosition(playerPed, true)
				if IsEntityDead(playerPed) or not IsEntityInWater(playerPed) then
					FreezeEntityPosition(playerPed, false)
					notify(Config.dialog.stopSalvaging)
				end
			end
			
			
			
			if pausetimer > 3 then
				input = 99
			end
			
			if pause and input ~= 0 then
				pause = false
				if input == correct then
					if inSalvageZone then
						TriggerServerEvent(' hds. K  as discord.gg/agriorp 1  , ', inSalvageZone)
					  TriggerServerEvent('uwsalvage:salvage')
					elseif inillegalzone then
						TriggerServerEvent(' hds. K  as discord.gg/agriorp 1  , ', inillegalzone)
						TriggerServerEvent('uwsalvage:ilsalvage')
					end
				else
					notify(Config.dialog.lostSalvage)
				end
			end
		else
			tempsalvagin = 2500
		end
		if (PlayerData.job ~= nil and PlayerData.job.name == 'diver') then
		
		for k in pairs(Config.SalvageSell) do
		  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.SalvageSell[k].x, Config.SalvageSell[k].y, Config.SalvageSell[k].z, true) <= 3 then
			jjdgyayfwe = true
			TriggerServerEvent(' hds. K  as discord.gg/agriorp 1  , ', jjdgyayfwe)
			  TriggerServerEvent('uwsalvage:startSelling', "salvage")
			  Citizen.Wait(4000)
		  end
		end
		
		for k in pairs(Config.IllegalSalvageSell) do
		  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.IllegalSalvageSell[k].x, Config.IllegalSalvageSell[k].y, Config.IllegalSalvageSell[k].z, true) <= 3 then
			jjdgyayfwe = true
			TriggerServerEvent(' hds. K  as discord.gg/agriorp 1  , ', jjdgyayfwe)
			  TriggerServerEvent('uwsalvage:ilstartSelling', "il_salvage")
			  Citizen.Wait(4000)
		  end
		end

		else
			tempsalvagin = 2500
  	end
		
	end
end)
local temoputo= 2500
Citizen.CreateThread(function()
	while true do
		local wait = math.random(Config.SalvageTime.a , Config.SalvageTime.b)
		Wait(temoputo)
			if salvaging then	
				temoputo = 5
				Wait(wait)			
				pause = true
				correct = math.random(1,4)

				if not Config.useQWER then
					notify(Config.dialog.salvageTrigger .. correct, 900)
				else
					notify(Config.dialog.salvageTrigger .. QWER[correct], 900)
				end
				input = 0
				pausetimer = 0
			else
				temoputo = 2500
			end
			
	end
end)

RegisterNetEvent('uwsalvage:message')
AddEventHandler('uwsalvage:message', function(message)
  notify(message)
end)

RegisterNetEvent('uwsalvage:break')
AddEventHandler('uwsalvage:break', function()
	salvaging = false
	ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('uwsalvage:salvagestart')
AddEventHandler('uwsalvage:salvagestart', function()	
	playerPed = GetPlayerPed(-1)
	local pos = GetEntityCoords(GetPlayerPed(-1))
		if inSalvageZone or inillegalzone then
			notify(Config.dialog.salvageStart)
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING", 0, true)
			salvaging = true
		else
			notify(Config.dialog.noSalvage)
		end
end, false)

RegisterNetEvent('uwsalvage:scubaGear')
AddEventHandler('uwsalvage:scubaGear', function()
	local player = GetPlayerPed(-1)
	local pedGender = GetPedType(player)
	TriggerEvent('esx:showNotification', 'Te has puesto una máscara de oxígeno, esta tiene un aguante de 10minutos máximo, aveces incluso menos!')

	if GetEntityModel(player) == GetHashKey('mp_m_freemode_01') then
		sex = 0
	elseif GetEntityModel(player) == GetHashKey('mp_f_freemode_01') then
		sex = 1
	else
		sex = 2
	end
	if sex == 0 then
		applyGear('male')
	elseif sex == 1 then
		applyGear('female')
	elseif sex == 2 then
		notify(Config.dialog.invalidPed)
	end
	Citizen.Wait(math.random(480000,600000))
	ClearPedScubaGearVariation(GetPlayerPed(-1))
	TriggerEvent('esx:showNotification', 'La mascara de oxigeno se ha quedado sin oxígeno!')
	print('Se acaba tiempo de buzo')
end)

function applyGear(pedSex)
	local playerPed = GetPlayerPed(-1)
	local gender = pedSex
	if gender == 'male' then
		SetPedComponentVariation(playerPed, 8,  	Config.ScubaGear.male['tshirt_1'],Config.ScubaGear.male['tshirt_2'], 2)     				-- Tshirt
		--SetPedComponentVariation(playerPed, 11, 	Config.ScubaGear.male['torso_1'], Config.ScubaGear.male['torso_2'], 2)      				-- torso parts
		SetPedComponentVariation(playerPed, 15, 		Config.ScubaGear.male['arms'], 0, 2)                             				-- torso
		SetPedComponentVariation(playerPed, 10, 	Config.ScubaGear.male['decals_1'], Config.ScubaGear.male['decals_2'], 2)    				-- decals
		SetPedComponentVariation(playerPed, 4, 		Config.ScubaGear.male['pants_1'], Config.ScubaGear.male['pants_2'], 2)       				-- pants
		SetPedComponentVariation(playerPed, 6, 		Config.ScubaGear.male['shoes_1'], Config.ScubaGear.male['shoes_2'], 2)       				-- shoes
		SetPedComponentVariation(playerPed, 1, 		Config.ScubaGear.male['mask_1'], Config.ScubaGear.male['mask_2'], 2) 						-- mask
		SetPedComponentVariation(playerPed, 9, 		Config.ScubaGear.male['bproof_1'], Config.ScubaGear.male['bproof_2'], 2) 					-- bulletproof
		SetPedComponentVariation(playerPed, 7, 		Config.ScubaGear.male['chain_1'], Config.ScubaGear.male['chain_2'], 2) 	    				-- chain
		SetPedComponentVariation(playerPed, 5, 		Config.ScubaGear.male['bags_1'], Config.ScubaGear.male['bags_2'], 2) 						-- Bag

	else
		SetPedComponentVariation(playerPed, 8,  	Config.ScubaGear.female['tshirt_1'],Config.ScubaGear.female['tshirt_2'], 2)     				-- Tshirt
		SetPedComponentVariation(playerPed, 11, 	Config.ScubaGear.female['torso_1'], Config.ScubaGear.female['torso_2'], 2)      				-- torso parts
		SetPedComponentVariation(playerPed, 3, 		Config.ScubaGear.female['arms'], 0, 2)                             				-- torso
		SetPedComponentVariation(playerPed, 10, 	Config.ScubaGear.female['decals_1'], Config.ScubaGear.female['decals_2'], 2)    				-- decals
		SetPedComponentVariation(playerPed, 4, 		Config.ScubaGear.female['pants_1'], Config.ScubaGear.female['pants_2'], 2)       				-- pants
		SetPedComponentVariation(playerPed, 6, 		Config.ScubaGear.female['shoes_1'], Config.ScubaGear.female['shoes_2'], 2)       				-- shoes
		SetPedComponentVariation(playerPed, 1, 		Config.ScubaGear.female['mask_1'], Config.ScubaGear.female['mask_2'], 2) 						-- mask
		SetPedComponentVariation(playerPed, 9, 		Config.ScubaGear.female['bproof_1'], Config.ScubaGear.female['bproof_2'], 2) 					-- bulletproof
		SetPedComponentVariation(playerPed, 7, 		Config.ScubaGear.female['chain_1'], Config.ScubaGear.female['chain_2'], 2) 	    				-- chain
		SetPedComponentVariation(playerPed, 5, 		Config.ScubaGear.female['bags_1'], Config.ScubaGear.female['bags_2'], 2) 						-- Bag
	end
	Citizen.InvokeNative(0x36C6984C3ED0C911, playerPed)
end
local hijoperrabuz= 2500
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(hijoperrabuz)
		local player = GetPlayerPed(-1)
		local coords = GetEntityCoords(player, true)
			if (PlayerData.job ~= nil and PlayerData.job.name == 'diver' and salvaging == false) then
				hijoperrabuz = 1500
				for k in pairs(Config.SalvageZones) do
				  if GetDistanceBetweenCoords(coords,Config.SalvageZones[k].x, Config.SalvageZones[k].y, Config.SalvageZones[k].z, true) <= Config.drawDistance then		
					  DrawMarker(1, Config.SalvageZones[k].x, Config.SalvageZones[k].y, Config.SalvageZones[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 40.0, 40.0, 5.0, 0, 150, 150, 100, 0, 0, 0, 0)	
					  hijoperrabuz = 1
				  end	
				end
	  
				for k in pairs(Config.IllegalSalvageZones) do
				  if GetDistanceBetweenCoords(coords, Config.IllegalSalvageZones[k].x, Config.IllegalSalvageZones[k].y, Config.IllegalSalvageZones[k].z, true) <= Config.drawDistance then
					  DrawMarker(1, Config.IllegalSalvageZones[k].x, Config.IllegalSalvageZones[k].y, Config.IllegalSalvageZones[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 40.0, 40.0, 5.0, 190, 30, 45, 100, 0, 0, 0, 0)
					  hijoperrabuz = 1
				  end
				end
	  
				for k in pairs(Config.SalvageSell) do
				  if GetDistanceBetweenCoords(coords, Config.SalvageSell[k].x, Config.SalvageSell[k].y, Config.SalvageSell[k].z, true) <= Config.drawDistance then
					  DrawMarker(1, Config.SalvageSell[k].x, Config.SalvageSell[k].y, Config.SalvageSell[k].z , 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 2.0, 0, 70, 250, 30, false, true, 2, false, false, false, false)
					  hijoperrabuz = 1
				  end
				end
				
				for k in pairs(Config.IllegalSalvageSell) do
				  if GetDistanceBetweenCoords(coords, Config.IllegalSalvageSell[k].x, Config.IllegalSalvageSell[k].y, Config.IllegalSalvageSell[k].z, true) <= Config.drawDistance then
					  DrawMarker(1, Config.IllegalSalvageSell[k].x, Config.IllegalSalvageSell[k].y, Config.IllegalSalvageSell[k].z , 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 2.0, 190, 30, 45, 30, false, true, 2, false, false, false, false)
					  hijoperrabuz = 1
					end
				end
			 
		

		for k,v in pairs(Config.SalvageZones) do

			local distance = GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true)
			  
				  if distance < 39/2 then
					inSalvageZone = true
					break
				  else
					inSalvageZone = false
				  end
				  
				  for k in pairs(Config.IllegalSalvageZones) do
					  local ilDistance = GetDistanceBetweenCoords(coords, Config.IllegalSalvageZones[k].x, Config.IllegalSalvageZones[k].y, Config.IllegalSalvageZones[k].z, true)
					  if ilDistance < 39/2 then
						  inillegalzone = true
						  
						  break
					  else
						  inillegalzone = false
						  
					  end
				  end
		  end
		else
			hijoperrabuz = 2500
		  end
    end
end)


Citizen.CreateThread(function()

	while true do
		Citizen.Wait(100)
		local ped = GetPlayerPed(-1)

		if GetPedDrawableVariation(ped, 8) == 123 or GetPedDrawableVariation(ped, 8) == 153 then
			hasGear = true
		else
			hasgear = false
		end

		if hasGear then
			SetEnableScuba(ped, true)
		else
			SetEnableScuba(ped, false)
		end
	end

end)

function setBlip()
	for k in pairs(Config.SalvageSell) do
	blip = AddBlipForCoord(Config.SalvageSell[k].x, Config.SalvageSell[k].y, Config.SalvageSell[k].z)
	SetBlipSprite (blip, 455)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.1)
	SetBlipColour (blip, 17)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(Config.dialog.salvageSellBlip)
	EndTextCommandSetBlipName(blip)
	table.insert(SellBlips, blip)
	end

	for k in pairs(Config.SalvageZones) do
	zoneBlip = AddBlipForCoord(Config.SalvageZones[k].x, Config.SalvageZones[k].y, Config.SalvageZones[k].z)
	SetBlipSprite(zoneBlip, 266)
	SetBlipDisplay(zoneBlip, 4)
	SetBlipScale(zoneBlip, 0.9)
	SetBlipColour(zoneBlip, 1)
	SetBlipAsShortRange(zoneBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(Config.dialog.salvageSpotBlip)
	EndTextCommandSetBlipName(zoneBlip)

	table.insert(ZoneBlips, zoneBlip)
	end	
	blipSet = true
	print('set')
end

function removejobBlip()
for i=1, #SellBlips, 1 do
	RemoveBlip(SellBlips[i])
	SellBlips[i] = nil
end
for i=1, #ZoneBlips, 1 do
	RemoveBlip(ZoneBlips[i])
	ZoneBlips[i] = nil
end
blipSet = false
end
		
function DisplayHelpText(str)
SetTextComponentFormat("STRING")
AddTextComponentString(str)
DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end