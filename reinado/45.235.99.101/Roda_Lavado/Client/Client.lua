ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)


function OpenUi(action, porcentaje, nombre)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = action, 
        porcentaje = porcentaje or 5, 
        nombre = nombre or 'ReinadoRP',
    })
end

RegisterNUICallback("exit" , function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'exit'
    })
end)

RegisterNUICallback("sendserver" , function(data, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent('Roda_Lavado:LavarDinero', data.money, data.porcentaje)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if NetworkIsSessionStarted() then
            TriggerServerEvent('Roda_Lavado:GetRoles')
            break
        end
    end
end)

local rol = nil  
local porcentaje = 0
local position = nil
local autorizado = nil
local posicion = nil
RegisterNetEvent('Roda_Lavado:SendRoles')
AddEventHandler('Roda_Lavado:SendRoles', function (roles, watch)
    rol = roles.rol
    porcentaje = roles.porcentaje
    posicion = roles.pos
    position = roles.pos.xyz
    autorizado = watch
    print('autorized?', autorizado)
	print(rol)
end)

RegisterNetEvent('Roda_Lavado:Nothing')
AddEventHandler('Roda_Lavado:Nothing', function (none)
    autorizado = none
end)



Citizen.CreateThread(function()
    while true do
        local wait = 500

        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)
    
            if autorizado then 
                local dist = #(pedC - position)
                if dist < 10 then
                    wait = 0
                    DrawMarker(2, posicion.x, posicion.y, posicion.z + 0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
                    if dist < 3 then
                        ESX.ShowFloatingHelpNotification('Pulsa ~b~E~w~ para lavar dinero', vector3(posicion.x, posicion.y, posicion.z + 0.50))
                        if dist < 2 then
                            if IsControlJustPressed(0, 38) then
							
                                OpenUi('open', porcentaje, GetPlayerName(PlayerId()))
                                
                            end
                        end
                    end
                end
            end
        Citizen.Wait(wait)
    end
end)



Citizen.CreateThread(function()
    while true do
        local wait = 500

        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)
		local ubicacion = vector3(572.5090, -3127.2183, 18.7686)
    
            if autorizado then 
                local dist = #(pedC - ubicacion)
                if dist < 10 then
                    wait = 0
                    DrawMarker(2, 572.5090, -3127.2183, 18.7686 + 0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
                    if dist < 3 then
                        ESX.ShowFloatingHelpNotification('Pulsa ~b~E~w~ Para lavar!', vector3(572.5090, -3127.2183, 18.7686 + 0.50))
                        if dist < 2 then
                            if IsControlJustPressed(0, 38) then
								
								TriggerServerEvent('Lavado_Pelado:Mensajito')
								SetEntityCoords(PlayerPedId(), 572.4562, -3126.9492, 17.9686)
								SetEntityHeading(PlayerPedId(), 181.3576)
						
								TriggerEvent("mythic_progbar:client:progress", {
									name = "unique_action_name",
									duration = 111600,
									label = "Lavando Dinerito",
									useWhileDead = true,
									canCancel = false,
									controlDisables = {
										disableMovement = true,
										disableCarMovement = true,
										disableMouse = false,
										disableCombat = true,
									},
									animation = {
										animDict = "amb@prop_human_atm@male@idle_a",
										anim = "idle_b",
									},
									prop = {
										model = "bkr_prop_money_wrapped_01",
									}
								}, function(status)
									if not status then
										-- Do Something If Event Wasn't Cancelled
									end
								end)
								
								Wait(111500)
								
								local ped = PlayerPedId()
								local pedC = GetEntityCoords(ped)
								
								if(Vdist( pedC.x, pedC.y, pedC.z, 572.5090, -3127.2183, 18.7686) < 8.0) then
										OpenUi('open', porcentaje, GetPlayerName(PlayerId()))
								else
                                    
                                        ESX.ShowNotification('¿Que haces Pelado? ¿Quisiste bugear?')
								end
								
                            end
                        end
                    end
                end
            end
        Citizen.Wait(wait)
    end
end)


RegisterCommand('activarlavado', function ()
    TriggerServerEvent('Roda_Lavado:GetRoles')
end)