local open = false
local ESX  = nil
 
-- ESX
-- Added this so you can include the rest of the Usage-stuff found on the GitHub page
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type )
	open = true
	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type
	})
end)

-- Key events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		
		if IsControlJustReleased(0, 166) then
            -- (Taken from the Usage-guide on the GitHub page)
            -- Look at your own ID-card
			openMenu()
        end
		
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
	end
end)

function openMenu()

	ESX.UI.Menu.CloseAll()

	local elements = {}
	
	table.insert(elements, {label = "Ver DNI", value = 'checkID'})
	table.insert(elements, {label = "Mostrar DNI", value = 'showID'})
	
	ESX.TriggerServerCallback('jsfour-idcard:getLicencias', function(results)
		for i=1, #results, 1 do		
			if results[i].type ~= 'dmv' and results[i].type ~= 'drive_heli' and results[i].type ~= 'boat' then
				if results[i].type == 'drive' then
					table.insert(elements, {label = 'Ver Carnet Conducir', value = 'checkDriver'})
					table.insert(elements, {label = 'Mostrar Carnet Conducir', value = 'showDriver'})
				end
				if results[i].type == 'weapon' then
					table.insert(elements, {label = 'Ver licencia de Armas', value = 'checkFirearms'})
					table.insert(elements, {label = 'Mostrar licencia de Armas', value = 'showFirearms'})
				end
				if results[i].type == 'gym' then
					table.insert(elements, {label = 'Ver Carnet GYM', value = 'checkGym'})
					table.insert(elements, {label = 'Mostrar Carnet GYM', value = 'showGym'})
				end
				if results[i].type == 'abogado' then
					table.insert(elements, {label = 'Ver Matricula Abogado', value = 'checkAbogado'})
					table.insert(elements, {label = 'Mostrar Matricula Abogado', value = 'showAbogado'})
				end
			end
		end
		
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'id_card_menu',
		{
			title    = 'Licencias',
			align = 'bottom-right',
			elements = elements--[[{
			{label = 'Ver tu documento', value = 'checkID'},
			{label = 'Mostrar tu documento', value = 'showID'},
			{label = 'Ver tu licencia de conducir', value = 'checkDriver'},
			{label = 'Mostrar tu licencia de conducir', value = 'showDriver'},
			{label = 'Ver tu licencia de armas', value = 'checkFirearms'},
			{label = 'Mostrar tu licencia de armas', value = 'showFirearms'},
			{label = 'Ver tu Carnet de Gym', value = 'checkGym'},
			{label = 'Mostrar tu Carnet de Gym', value = 'showGym'},
			}]]
		},
		function(data, menu)
		
			local val = data.current.value
		
			--TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), val)
		
			if val == 'checkID' then
				menu.close()
				Cerrar()
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
				Ver()
			elseif val == 'checkDriver' then
				menu.close()
				Cerrar()
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'drive')
				Ver()
			elseif val == 'checkFirearms' then
				menu.close()
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
				Ver()
			elseif val == 'checkGym' then
				menu.close()
				Cerrar()
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'gym')
				Ver()
			elseif val == 'checkAbogado' then
				menu.close()
				Cerrar()
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'abogado')
				Ver()
			else
				local player, distance = ESX.Game.GetClosestPlayer()
			
				if distance ~= -1 and distance <= 3.0 then
					--TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), val)
					if val == 'showID' then
						menu.close()
						Cerrar()
						TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
						Mostrar()
					elseif val == 'showDriver' then
						menu.close()
						Cerrar()
						TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'drive')
						Mostrar()
					elseif val == 'showFirearms' then
						menu.close()
						Cerrar()
						TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
						Mostrar()
					elseif val == 'showGym' then
						menu.close()
						Cerrar()
						TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'gym')
						Mostrar()
					elseif val == 'showAbogado' then
						menu.close()
						Cerrar()
						TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'abogado')
						Mostrar()
					end
				else
				ESX.ShowNotification('Ninguna persona cerca.')
				end
			end
		end,
		function(data, menu)
			menu.close()
			Cerrar()
		end
		)	
	end)
end

local dniopen = false
local badgeProp = nil

function Mostrar()
	local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    badgeProp = CreateObject(GetHashKey('prop_cs_swipe_card'), coords.x, coords.y, coords.z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(ped, 28422)
        
    AttachEntityToEntity(badgeProp, ped, boneIndex, 0.065, 0.029, -0.035, 80.0, -1.90, 75.0, true, true, false, true, 1, true)
	
	local ad = "paper_1_rcm_alt1-8"
	LoadAnim(ad)
	
    TaskPlayAnim(ped,ad,'player_one_dual-8',2.0,2.0, -1, 51, 0, false, false, false)
	
	dniopen = true
	DniAbierto()
end

function Ver()
	local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    badgeProp = CreateObject(GetHashKey('prop_cs_swipe_card'), coords.x, coords.y, coords.z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(ped, 36029)
        
    AttachEntityToEntity(badgeProp, ped, boneIndex, 0.08, 0.04, 0.05, -130.0, -50.0, 0.0, true, true, false, true, 1, true)
	
	local ad = "missfam4"
	LoadAnim(ad)
	
    TaskPlayAnim(ped,ad,'base',2.0,2.0, -1, 51, 0, false, false, false)
	
	dniopen = true
	DniAbierto()
end

function DniAbierto()
	while dniopen do
	Wait(5)
		if IsControlJustPressed(0, 202) then
			Cerrar()
		end
	end
end

function Cerrar()
	local ped = PlayerPedId()
	ClearPedSecondaryTask(ped)
    DeleteObject(badgeProp)
	dniopen = false
end

function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Wait(10)
	end
end