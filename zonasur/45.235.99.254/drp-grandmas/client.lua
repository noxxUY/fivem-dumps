ESX = nil

local tratando = false

Camillas = {
	-1673752417,
	-1091386327,
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function Draw3DText(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.55, 0.55)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 68)
end


local coords = { 
	--{ x = -801.13, y = -1236.834, z = 6.899134, h = 51.283252716064 }, --viceroy
	{x=-802.1786,y=-1249.447,z=6.904578, h=322.27044677734},
	--{ x = 322.3934, y = -589.5675, z = 42.84586, h = 71.283294677734 }, --pillbox
	--{x=353.9844, y=-1386.701, z=32.07359, h=233.86724853516}, --central medical v2
	--{ x = 348.7387, y = -571.2012, z = 28.35573, h = 69.991729736328}, pillbox addiction
	{ x = 1818.338, y = 3678.366, z = 33.87346, h = 300.0 }, --sandy
	--{ x = 1821.8, y = 3680.542, z = 33.83691, h = 300.0 }, --sandy 2
	{ x = -259.5654, y = 6312.401, z = 31.98951, h = 136.25981140137 }, --paleto
}

local coords2 = { 
	{ x = 1603.64, y = 3571.661, z = 38.2655, h = 30.000005122046}, --Doc clandestino sandy
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if tratando then
			DisableAllControlActions(0)
			EnableControlAction(0, 1, true)
			EnableControlAction(0, 2, true)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
		local ped = PlayerPedId()
		local plyCoords = GetEntityCoords(ped)
		for k,v in pairs(coords) do		
			local distance = #(vector3(v.x, v.y, v.z) - plyCoords)

            if not IsPedInAnyVehicle(ped, true) then
                if distance < 2.5 then
			        Draw3DText(v.x, v.y, v.z + 0.5, '~g~[E]~w~ - Para chequeo Medico $10,000')
                        if IsControlJustReleased(0, 38) then
                            if (GetEntityHealth(ped) < 200) and not IsEntityDead(ped) then
								ESX.TriggerServerCallback('drp-grandmas:getMoney', function(money)
									if money then
										TriggerEvent('dpemotes:broyale', true)
										TriggerEvent('CarryPeople:broyale', true)
										TriggerEvent('TakeHostage:broyale', true)
										TriggerServerEvent('CarryPeople:Camilla', true)
										ESX.ShowNotification("Pagaste ~g~$5.000~w~ por una Curacion")
										tratando = true
										TriggerEvent('dpemotes:broyale', true)
										--curando()
										for k, v  in pairs(Camillas) do
											bush = GetClosestObjectOfType(plyCoords, 2.0, v, false)
											if DoesEntityExist(bush) then
												AttachEntityToEntity(ped, bush, 1, 0.0, 0.0, 1.15, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
												local ad = "anim@gangops@morgue@table@"
												LoadAnim(ad)
												TaskPlayAnim(ped,ad,'body_search',2.0,2.0, -1, 1, 0, false, false, false)
												FreezeEntityPosition(ped, true)
											end
										end	
										exports['progressBars']:startUI(60000, "Curando, no te muevas...")
										Wait(60000)
										tratando = false
										TriggerEvent('dpemotes:broyale', false)
										ClearPedSecondaryTask(ped)
										ClearPedTasksImmediately(ped)
										DetachEntity(ped, true, false)
										SetEntityHealth(ped, 200)
										--EnableControlAction(0, 38, true)
										FreezeEntityPosition(ped, false)
										--EnableAllControlActions(2)
										TriggerEvent('dpemotes:broyale', false)
										TriggerEvent('CarryPeople:broyale', false)
										TriggerEvent('TakeHostage:broyale', false)
										TriggerServerEvent('CarryPeople:Camilla', false)
									else
										ESX.ShowNotification('~r~No tienes suficiente dinero.')
									end
								end, 5000)
							elseif IsEntityDead(ped) then
								ESX.TriggerServerCallback('drp-grandmas:getMoney', function(money)
									if money then
										TriggerEvent('dpemotes:broyale', true)
										TriggerEvent('CarryPeople:broyale', true)
										TriggerEvent('TakeHostage:broyale', true)
										TriggerServerEvent('CarryPeople:Camilla', true)
										SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true)
										ESX.ShowNotification("Pagaste ~g~$10.000~w~ por una Atencion Complicada")
										tratando = true
										
										--local coords = vector4(1818.338, 3678.365, 34.973, 118.54)
										--RespawnPed(ped, coords, coords.w)
										--Wait(3000)
										for k, v  in pairs(Camillas) do
											bush = GetClosestObjectOfType(plyCoords, 2.0, v, false)
											if DoesEntityExist(bush) then
												local coords = GetEntityCoords(bush)
												RespawnPed(ped, coords, 0.0)
												Wait(3000)
												AttachEntityToEntity(ped, bush, 1, 0.0, 0.0, 1.15, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
												local ad = "anim@gangops@morgue@table@"
												LoadAnim(ad)
												TaskPlayAnim(ped,ad,'body_search',2.0,2.0, -1, 1, 0, false, false, false)
												FreezeEntityPosition(ped, true)
											end
										end	
										exports['progressBars']:startUI(60000, "Curando, no te muevas...")
										Wait(60000)
										tratando = false
										ClearPedSecondaryTask(ped)
										ClearPedTasksImmediately(ped)
										DetachEntity(ped, true, false)
										local id = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
										--TriggerServerEvent('esx_thief:status_dead', id)
										TriggerEvent('esx_ambulancejob:revive_zs')
										--EnableControlAction(0, 38, true)
										FreezeEntityPosition(ped, false)
										--EnableAllControlActions(2)
										TriggerEvent('dpemotes:broyale', false)
										TriggerEvent('CarryPeople:broyale', false)
										TriggerEvent('TakeHostage:broyale', false)
										TriggerServerEvent('CarryPeople:Camilla', false)
									else
										ESX.ShowNotification('~r~No tienes suficiente dinero.')
									end	
								end, 10000)
							else
								ESX.ShowNotification('~y~No necesitas atención médica.')
							end
                        end
                    end
                end
			--local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.Pos.y, v.Pos.z, false)
		end	
        --local distance = #(vector3(coords.x, coords.y, coords.z) - plyCoords)
    end
end)

function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Wait(10)
	end
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
		local ped = PlayerPedId()	
		local plyCoords = GetEntityCoords(ped)	
		for k,v in pairs(coords2) do		
			local distance = #(vector3(v.x, v.y, v.z) - plyCoords)

            if not IsPedInAnyVehicle(ped, true) then
                if distance < 2.0 then
			        Draw3DText(v.x, v.y, v.z + 0.5, '~g~[E]~w~ - Para chequeo Medico')
					--local Cargado = exports['CarryPeople']:Cargado()
                        if IsControlJustReleased(0, 38) and not Cargado then
							if exports['tm1_mafias']:GetGroup() then
								if (GetEntityHealth(ped) < 200) and not IsEntityDead(ped) then
									ExecuteCommand('entorno Se veria medico tratando pacientes en zona sospechosa!')
									tratando = true
									TriggerEvent('dpemotes:broyale', true)
									TriggerEvent('CarryPeople:broyale', true)
									TriggerEvent('TakeHostage:broyale', true)
									TriggerServerEvent('CarryPeople:Camilla', true)
									--curando()
									for k, v  in pairs(Camillas) do
										bush = GetClosestObjectOfType(plyCoords, 2.0, v, false)
										if DoesEntityExist(bush) then
											AttachEntityToEntity(ped, bush, 1, 0.0, 0.0, 1.65, 0.0, 0.0, 90.0, true, true, false, true, 1, true)
											local ad = "anim@gangops@morgue@table@"
											LoadAnim(ad)
											TaskPlayAnim(ped,ad,'body_search',2.0,2.0, -1, 1, 0, false, false, false)
											FreezeEntityPosition(ped, true)
										end
									end	
									exports['progressBars']:startUI(60000, "Curando, no te muevas...")
									Wait(60000)
									tratando = false
									ClearPedSecondaryTask(ped)
									ClearPedTasksImmediately(ped)
									DetachEntity(ped, true, false)
									SetEntityHealth(ped, 200)
									FreezeEntityPosition(ped, false)
									TriggerEvent('dpemotes:broyale', false)
									TriggerEvent('CarryPeople:broyale', false)
									TriggerEvent('TakeHostage:broyale', false)
									TriggerServerEvent('CarryPeople:Camilla', false)
								elseif IsEntityDead(ped) then
									SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true)
									tratando = true
									TriggerEvent('dpemotes:broyale', true)
									TriggerEvent('CarryPeople:broyale', true)
									TriggerEvent('TakeHostage:broyale', true)
									TriggerServerEvent('CarryPeople:Camilla', true)
									local coords = vector4(1603.639, 3571.661, 39.415, 120.0)
									RespawnPed(ped, coords, coords.w)
									Wait(3000)
									for k, v  in pairs(Camillas) do
										bush = GetClosestObjectOfType(plyCoords, 2.0, v, false)
										if DoesEntityExist(bush) then
											AttachEntityToEntity(ped, bush, 1, 0.0, 0.0, 1.65, 0.0, 0.0, 90.0, true, true, false, true, 1, true)
											local ad = "anim@gangops@morgue@table@"
											LoadAnim(ad)
											TaskPlayAnim(ped,ad,'body_search',2.0,2.0, -1, 1, 0, false, false, false)
											FreezeEntityPosition(ped, true)
										end
									end	
									exports['progressBars']:startUI(60000, "Curando, no te muevas...")
									Wait(60000)
									tratando = false
									ClearPedSecondaryTask(ped)
									ClearPedTasksImmediately(ped)
									DetachEntity(ped, true, false)
									local id = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
									TriggerEvent('esx_ambulancejob:revive_zs')
									FreezeEntityPosition(ped, false)
									TriggerEvent('dpemotes:broyale', false)
									TriggerEvent('CarryPeople:broyale', false)
									TriggerEvent('TakeHostage:broyale', false)
									TriggerServerEvent('CarryPeople:Camilla', false)
								else
									ESX.ShowNotification('~y~No necesitas atención médica.')
								end	
							else
								ESX.ShowNotification('~r~Aqui solo atendemos gente pesada!\nTomatela de aca antes que mi gente te ponga un plomaso!')
							end
                        end
                    end
                end
			--local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.Pos.y, v.Pos.z, false)
		end	
        --local distance = #(vector3(coords.x, coords.y, coords.z) - plyCoords)
    end
end)

function RespawnPed(ped, coords, heading)
	--SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
end