----------------------------------------------------------------------------------
RegisterNetEvent("esx_admin:killPlayer")
AddEventHandler("esx_admin:killPlayer", function()
  SetEntityHealth(PlayerPedId(), 0)
end)

RegisterNetEvent("esx_admin:freezePlayer")
AddEventHandler("esx_admin:freezePlayer", function(input)
    local player = PlayerId()
	local ped = PlayerPedId()
    if input == 'freeze' then
        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, true)
    elseif input == 'unfreeze' then
        SetEntityCollision(ped, true)
	    FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    end
end)

RegisterNetEvent('homer:as')
AddEventHandler('homer:as',function(coords)

	SetEntityCoords(PlayerPedId(),coords.x,coords.y,coords.z)
end)

--Thanks to qalle for this code | https://github.com/qalle-fivem/esx_marker
RegisterNetEvent("esx_admin:tpm")
AddEventHandler("esx_admin:tpm", function()
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                break
            end

            Citizen.Wait(5)
        end
        TriggerEvent('chatMessage', _U('teleported', ''..Config.prefix..''))
    else
        TriggerEvent('chatMessage', _U('set_waypoint', ''..Config.prefix..''))
    end
end)

RegisterNetEvent('homer:tpeoaLS')
AddEventHandler('homer:tpeoaLS',function()
	local target = PlayerPedId()
	SetEntityCoords(target,226.44,-860.99,30.05)
end)

RegisterNetEvent('homer:tpeoaSandy')
AddEventHandler('homer:tpeoaSandy',function()
	local target = PlayerPedId()
	SetEntityCoords(target,1850.9354248047, 3671.4821777344, 33.827138519287)
end)

RegisterNetEvent('homer:tpeoaPaleto')
AddEventHandler('homer:tpeoaPaleto',function()
	local target = PlayerPedId()

	SetEntityCoords(target,-231.19290161133, 6316.2075195313, 31.569858169556)

end)

-- Crear suggestions en chat para los comandos
AddEventHandler('onClientResourceStart', function (resourceName)
    if (GetCurrentResourceName() == resourceName) then
        TriggerEvent('chat:addSuggestion', '/setjob', 'Dar trabajo.', {
            { name="ID", help="ID del usuario." },
			{ name="Trabajo", help="Nombre del trabajo." },
			{ name="Grado", help="Grado del trabajo." }
        })

        TriggerEvent('chat:addSuggestion', '/car', 'Spawnear un coche.', {
			{ name="Modelo", help="Modelo del coche." }
        })

		TriggerEvent('chat:addSuggestion', '/barridas', 'Mandar barridas a usuario.', {
			{ name="ID", help="ID del usuario." },
			{ name="Cantidad", help="Cantidad de barridas." },
			{ name="Razón", help="Razón de las barridas." },
        })

		TriggerEvent('chat:addSuggestion', '/finbarridas', 'Sacar barridas a usuario.', {
			{ name="ID", help="ID del usuario." }
        })

		TriggerEvent('chat:addSuggestion', '/heal', 'Curate o cura a otra persona, esto cura: Vida, hambre y sed..', {
			{ name="ID", help="ID del usuario." }
        })

        TriggerEvent('chat:addSuggestion', '/fichaje', 'Entrar o salir de servicio de staff.', {
			{ name="Tipo", help="ON / OFF." }
        })
    end
end)

-- Recargo las sugerencias OnStop
AddEventHandler('onClientResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        TriggerEvent('chat:removeSuggestion', '/setjob')
        TriggerEvent('chat:removeSuggestion', '/car')
		TriggerEvent('chat:removeSuggestion', '/barridas')
		TriggerEvent('chat:removeSuggestion', '/finbarridas')
		TriggerEvent('chat:removeSuggestion', '/heal')
		TriggerEvent('chat:removeSuggestion', '/fichaje')
    end
end)