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

ESX = nil
local PlayerData              = {}
local training = false
local resting = false
local membership = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
		
		PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

function hintToDisplay(text)
	ESX.ShowHelpNotification(text)
end

local blips = {
	{title="Gimnasio", colour=7, id=311, x = -1201.2257, y = -1568.8670, z = 4.6101},
}
	
Citizen.CreateThread(function()
	for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 1.0)
		SetBlipColour(info.blip, 47)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)

RegisterNetEvent('esx_gym:trueMembership')
AddEventHandler('esx_gym:trueMembership', function()
	membership = true
end)

RegisterNetEvent('esx_gym:falseMembership')
AddEventHandler('esx_gym:falseMembership', function()
	membership = false
end)

-- LOCATION (START)

local arms = { --Hacer brazos (pesas)
    {x = -1202.9837,y = -1565.1718,z = 3.63115}
}

local pushup = { -- Flexiones
    {x = -1203.3242,y = -1570.6184,z = 3.631155}
}

local yoga = { -- Hacer yoga
    {x = -1204.7958,y = -1560.1906,z = 3.63115}
}

local situps = { -- Abdominales
    {x = -1206.1055,y = -1565.1589,z = 3.63115}
}

local chins = { -- Dominadas
    {x = -1200.1284,y = -1570.9903,z = 3.63115}
}

local gym = {
    {x = -1195.6551,y = -1577.7689,z = 3.631155}
}

--GYM EN MANSIONES SIN CREDENCIALS

local arms2 = { --Hacer brazos (pesas) Mansion Mlibu
	--{x = -3220.28,y = 787.9,z = 14.04}, --malibu
	{x=170.8606,y=1717.615,z=227.39}, --forest_mansion
	--{x=-82.9640,y=934.5417,z=233.02}, --brofx_06
	{x=-63.2036, y=819.2404, z=227.78}, --brofx_03
	--{x=-1163.63,y=365.0737,z=71.314}, --brofx_05
	--{x=-3336.58,y=1801.864,z=33.894}, --StartMansion
	{x=-273.412,y=-735.705,z=125.47}, --penthouse
	{x=442.1475,y=-981.641,z=25.478},--policia
}

local pushup2 = { -- Flexiones Mansion malibu
    --{x = -3222.94,y = 788.67,z = 14.03}, --malibu
	{x=173.2343,y=1719.426,z=227.39}, --forest_mansion
	--{x=-82.0479,y=937.4179,z=233.03}, --brofx_06
	{x=-62.6426, y=822.8038, z=227.78}, --brofx_03
	--{x=-1166.30,y=371.6002,z=71.314}, --brofx_05
	--{x=-3329.56,y=1804.282,z=33.894}, --StartMansion
	{x=-274.873,y=-740.303,z=125.47},--penthouse
	{x=445.1873,y=-978.656,z=25.475},--police
}

-- LOCATION (END)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
		if not training then
			for k in pairs(arms) do
				DrawMarker(25, arms[k].x, arms[k].y, arms[k].z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 148, 148, 184, 100, 0, 0, 0, 0)
			end
			
			
			for k in pairs(arms2) do
				DrawMarker(3, arms2[k].x, arms2[k].y, arms2[k].z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 0, 0, 100, true, 0, 0, 0)
			end
			
			for k in pairs(pushup2) do
				DrawMarker(3, pushup2[k].x, pushup2[k].y, pushup2[k].z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5,255, 0, 0, 100, true, 0, 0, 0)
			end
			

			for k in pairs(pushup) do
				DrawMarker(25, pushup[k].x, pushup[k].y, pushup[k].z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5,148, 148, 184, 100, 0, 0, 0, 0)
			end
			
			for k in pairs(yoga) do
				DrawMarker(25, yoga[k].x, yoga[k].y, yoga[k].z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 148, 148, 184, 100, 0, 0, 0, 0)
			end

			for k in pairs(situps) do
				DrawMarker(25, situps[k].x, situps[k].y, situps[k].z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 148, 148, 184, 100, 0, 0, 0, 0)
			end

			for k in pairs(gym) do
				DrawMarker(29, gym[k].x, gym[k].y, gym[k].z + 1.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5,255, 0, 0, 200, false, false, 2, true, nil, nil, false)
			end

			for k in pairs(chins) do
				DrawMarker(25, chins[k].x, chins[k].y, chins[k].z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 148, 148, 184, 100, 0, 0, 0, 0)
			end
		end	
		
		for k in pairs(gym) do
		
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, gym[k].x, gym[k].y, gym[k].z)

            if dist <= 1.5 then
				hintToDisplay('Presiona ~INPUT_CONTEXT~ para abrir el menu del ~b~gimnasio')
				
				if IsControlJustPressed(0, Keys['E']) then
					OpenGymMenu()
				end			
            end
		end
		
		for k in pairs(arms) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, arms[k].x, arms[k].y, arms[k].z)

            if dist <= 1.5 and not training then
				hintToDisplay('Presiona ~INPUT_CONTEXT~ para ejercitar tus ~g~brazos')
				
				if IsControlJustPressed(0, Keys['E']) and not training then
					if resting == false then
						training = true
						--TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification("Preparando ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
						ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriversLicense)
							if hasDriversLicense then
								local playerPed = GetPlayerPed(-1)
								TaskStartScenarioInPlace(playerPed, "world_human_muscle_free_weights", 0, true)
								Citizen.Wait(30000)
								ClearPedTasksImmediately(playerPed)
								--TriggerServerEvent('skill:GymUpdate')
								exports["esx_kr_skillsystem"]:UpdateSkill("Stamina", Config.Subir)
								--exports["esx_yisus_skillsystem"]:UpdateSkill("Fuerza", 1)
								training = false
								ESX.ShowNotification("Necesitas descansar ~r~30 segundos ~w~antes de realizar otro.")
								resting = true
								CheckTraining()
							else
								training = false
								ESX.ShowNotification("Necesitas ser socio para hacer este ~r~ejercicio")
							end
						end, GetPlayerServerId(PlayerId()), 'gym')
					else
						ESX.ShowNotification("Necesitas un descanso...")
					end
				end			
            end
		end
		
		
		for k in pairs(arms2) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, arms2[k].x, arms2[k].y, arms2[k].z)
            if dist <= 1.5 and not training then
				hintToDisplay('Presiona ~INPUT_CONTEXT~ para ejercitar tus ~g~brazos')
				if IsControlJustPressed(0, Keys['E']) and not training then
					if resting == false then
						training = true
						ESX.ShowNotification("Preparando ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
						local playerPed = GetPlayerPed(-1)
						TaskStartScenarioInPlace(playerPed, "world_human_muscle_free_weights", 0, true)
						Citizen.Wait(30000)
						ClearPedTasksImmediately(playerPed)
						exports["esx_kr_skillsystem"]:UpdateSkill("Stamina", Config.Subir)
						training = false
						ESX.ShowNotification("Necesitas descansar ~r~30 segundos ~w~antes de realizar otro.")
						resting = true
						CheckTraining()
					else
						ESX.ShowNotification("Necesitas un descanso...")
					end
				end			
            end
		end
		
		
		for k in pairs(chins) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chins[k].x, chins[k].y, chins[k].z)

            if dist <= 1.5 and not training and not training then
				hintToDisplay('Presiona ~INPUT_CONTEXT~ para hacer ~g~dominadas')
				
				if IsControlJustPressed(0, Keys['E']) and not training then
					if resting == false then
						training = true
						--TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification("Preparando ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
						ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriversLicense)
							if hasDriversLicense then
								local playerPed = GetPlayerPed(-1)
								TaskStartScenarioInPlace(playerPed, "prop_human_muscle_chin_ups", 0, true)
								Citizen.Wait(30000)
								ClearPedTasksImmediately(playerPed)
								--TriggerServerEvent('skill:GymUpdate')
								exports["esx_kr_skillsystem"]:UpdateSkill("Stamina", Config.Subir)
								training = false
								ESX.ShowNotification("Necesitas descansar ~r~30 segundos ~w~antes de realizar otro.")
								resting = true
								CheckTraining()
							else
								training = false
								ESX.ShowNotification("Necesitas ser socio para hacer este ~r~ejercicio")
							end
						end, GetPlayerServerId(PlayerId()), 'gym')
					else
						ESX.ShowNotification("Necesitas un descanso...")
					end
				end			
            end
		end
		
		for k in pairs(pushup) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pushup[k].x, pushup[k].y, pushup[k].z)

            if dist <= 1.5 and not training then
				hintToDisplay('Presiona ~INPUT_CONTEXT~ para hacer ~g~flexiones')
				
				if IsControlJustPressed(0, Keys['E']) and not training then
					if resting == false then
						training = true
						--TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification("Preparando ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
						ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriversLicense)
							if hasDriversLicense then
								local playerPed = GetPlayerPed(-1)
								TaskStartScenarioInPlace(playerPed, "world_human_push_ups", 0, true)
								Citizen.Wait(30000)
								ClearPedTasksImmediately(playerPed)
								--TriggerServerEvent('skill:GymUpdate')
								exports["esx_kr_skillsystem"]:UpdateSkill("Stamina", Config.Subir)
								training = false
								ESX.ShowNotification("Necesitas descansar ~r~30 segundos ~w~antes de realizar otro.")
								resting = true
								CheckTraining()
							else
								training = false
								ESX.ShowNotification("Necesitas ser socio para hacer este ~r~ejercicio")
							end
						end, GetPlayerServerId(PlayerId()), 'gym')
					else
						ESX.ShowNotification("Necesitas un descanso...")
					end					
				end			
            end
		end
		
		
		for k in pairs(pushup2) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pushup2[k].x, pushup2[k].y, pushup2[k].z)

            if dist <= 1.5 and not training then
				hintToDisplay('Presiona ~INPUT_CONTEXT~ para hacer ~g~flexiones')
				
				if IsControlJustPressed(0, Keys['E']) and not training then
					if resting == false then
						training = true
						--TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification("Preparando ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
						--ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriversLicense)
							--if hasDriversLicense then
								local playerPed = GetPlayerPed(-1)
								TaskStartScenarioInPlace(playerPed, "world_human_push_ups", 0, true)
								Citizen.Wait(30000)
								ClearPedTasksImmediately(playerPed)
								--TriggerServerEvent('skill:GymUpdate')
								exports["esx_kr_skillsystem"]:UpdateSkill("Stamina", Config.Subir)
								training = false
								ESX.ShowNotification("Necesitas descansar ~r~30 segundos ~w~antes de realizar otro.")
								resting = true
								CheckTraining()
							--else
								--training = false
								--ESX.ShowNotification("Necesitas ser socio para hacer este ~r~ejercicio")
							--end
						--end, GetPlayerServerId(PlayerId()), 'gym')
					else
						ESX.ShowNotification("Necesitas un descanso...")
					end					
				end			
            end
		end
		
		
		for k in pairs(yoga) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, yoga[k].x, yoga[k].y, yoga[k].z)

            if dist <= 1.5 and not training then
				hintToDisplay('Presiona ~INPUT_CONTEXT~ para hacer ~g~yoga')
				
				if IsControlJustPressed(0, Keys['E']) and not training then
					if resting == false then
						training = true
						--TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification("Preparando ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
						ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriversLicense)
							if hasDriversLicense then
								local playerPed = GetPlayerPed(-1)
								TaskStartScenarioInPlace(playerPed, "world_human_yoga", 0, true)
								Citizen.Wait(30000)
								ClearPedTasksImmediately(playerPed)
								--TriggerServerEvent('skill:GymUpdate')
								exports["esx_kr_skillsystem"]:UpdateSkill("Stamina", Config.Subir)
								training = false
								ESX.ShowNotification("Necesitas descansar ~r~30 segundos ~w~antes de realizar otro.")
								resting = true
								CheckTraining()
							else
								training = false
								ESX.ShowNotification("Necesitas ser socio para hacer este ~r~ejercicio")
							end
						end, GetPlayerServerId(PlayerId()), 'gym')
					else
						ESX.ShowNotification("Necesitas un descanso...")
					end	
				end			
            end
		end
		
		for k in pairs(situps) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, situps[k].x, situps[k].y, situps[k].z)

            if dist <= 1.5 and not training then
				hintToDisplay('Presiona ~INPUT_CONTEXT~ para hacer ~g~abdominales')
				
				if IsControlJustPressed(0, Keys['E']) and not training then
					if resting == false then
						training = true
						--TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification("Preparando ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
						ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriversLicense)
							if hasDriversLicense then
								local playerPed = GetPlayerPed(-1)
								TaskStartScenarioInPlace(playerPed, "world_human_sit_ups", 0, true)
								Citizen.Wait(30000)
								ClearPedTasksImmediately(playerPed)
								--TriggerServerEvent('skill:GymUpdate')
								exports["esx_kr_skillsystem"]:UpdateSkill("Stamina", Config.Subir)
								--exports["esx_yisus_skillsystem"]:UpdateSkill("Resistencia", 1)
								training = false
								ESX.ShowNotification("Necesitas descansar ~r~30 segundos ~w~antes de realizar otro.")
								resting = true
								CheckTraining()
							else
								training = false
								ESX.ShowNotification("Necesitas ser socio para hacer este ~r~ejercicio")
							end
						end, GetPlayerServerId(PlayerId()), 'gym')
					else
						ESX.ShowNotification("Necesitas un descanso...")
					end	
				end			
            end
		end
    end
end)

function CheckTraining()
	if resting == true then
		Citizen.Wait(30000)
		resting = false
	end
	
	if resting == false then
		ESX.ShowNotification("Ya puedes volver a hacer ejercicio")
	end
end

function OpenGymMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_menu',
        {
            title    = 'Gym',
			align    = 'bottom-right',
            elements = {
				{label = 'Tienda', value = 'shop'},
				{label = 'Membresía', value = 'ship'},
				{label = 'Dar de Baja', value = 'baja'}
            }
        },
        function(data, menu)
            if data.current.value == 'shop' then
				OpenGymShopMenu()
            elseif data.current.value == 'ship' then
				OpenGymShipMenu()
			elseif data.current.value == 'baja' then
				TriggerServerEvent('esx_gym:baja')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenGymShopMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_shop_menu',
        {
            title    = 'Gym - Tienda',
			align    = 'bottom-right',
            elements = {
				{label = 'Batido de proteínas ($500)', value = 'protein_shake'},
				{label = 'Agua ($300)', value = 'water'},
				{label = 'Barrita energética ($250)', value = 'sportlunch'},
				{label = 'Powerade ($300)', value = 'powerade'},
            }
        },
        function(data, menu)
            if data.current.value == 'protein_shake' then
				TriggerServerEvent('esx_gym:buyProteinshake')
            elseif data.current.value == 'water' then
				TriggerServerEvent('esx_gym:buyWater')
            elseif data.current.value == 'sportlunch' then
				TriggerServerEvent('esx_gym:buySportlunch')
            elseif data.current.value == 'powerade' then
				TriggerServerEvent('esx_gym:buyPowerade')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenGymShipMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_ship_menu',
        {
            title    = 'Gimnasio - Hazte socio',
			align    = 'bottom-right',
            elements = {
				{label = 'Hacerse socio ($5000)', value = 'membership'},
            }
        },
        function(data, menu)
            if data.current.value == 'membership' then
				TriggerServerEvent('esx_gym:buyMembership')
				
				ESX.UI.Menu.CloseAll()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenBaja()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_ship_menu',
        {
            title    = 'Gimnasio - Dar de Baja',
			align    = 'bottom-right',
            elements = {
				{label = 'Dar de Baja del GYM', value = 'baja'},
            }
        },
        function(data, menu)
            if data.current.value == 'baja' then
				TriggerServerEvent('esx_gym:baja')
				
				ESX.UI.Menu.CloseAll()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end