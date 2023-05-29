-- @vars
ESX = exports['es_extended']:getSharedObject()
local showIds = false
local imFrozen = false

-- @threads
CreateThread(function()
    while true do
        local msec = 1000
        if (showIds) then
            local activePlayers = GetActivePlayers()

            for i,v in pairs(activePlayers) do
                local playerPed = GetPlayerPed(v)
                local playerCoords = GetEntityCoords(playerPed)

                if (playerPed ~= PlayerPedId()) then
                    if #(GetEntityCoords(PlayerPedId()) - playerCoords) < 500.0 then
                        msec = 0
                        Create3D(vec3(playerCoords.xy, playerCoords.z+1.2), "["..GetPlayerServerId(NetworkGetEntityOwner(playerPed)).."] "..GetPlayerName(v).." [~r~"..(GetEntityHealth(playerPed)-100).."~w~] [~b~"..GetPedArmour(playerPed).."~w~]")
                    end
                end
            end
        end
        Wait(msec)
    end
end)


-- @events
RegisterNetEvent('bm_staff:showPlayersIds', function()
    showIds = not showIds
end)

RegisterNetEvent('bm_staff:eat', function()
    TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)
end)

RegisterNetEvent('set:nafta', function()
    local veh = GetVehiclePedIsIn(PlayerPedId())

    exports['LegacyFuel']:SetFuel(veh, 200)
end)

RegisterNetEvent('bm_staff:heal', function()
    local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

RegisterNetEvent('bm_staff:freeze', function(adminId)
    imFrozen = not imFrozen

    if not imFrozen then
        FreezeEntityPosition(PlayerPedId(), false)
        DisablePlayerFiring(PlayerPedId(), false)
        DisableControlAction(0, 24, false)
    else
        FreezeEntityPosition(PlayerPedId(), true)
        CreateThread(function()
            while imFrozen do
                DisablePlayerFiring(PlayerPedId(), true)
                DisableControlAction(0, 24, true)
                Wait(0)
            end
        end)
    end
    TriggerServerEvent('bm_staff:freezeMessage', adminId, imFrozen)
end)

-- @funcs
function Create3D(coords, text)
    local x, y, z = table.unpack(coords)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scales
    if (#(GetEntityCoords(PlayerPedId()) - coords) < 3) then
        scales = scale*fov
    else
        scales = 0.5
    end
    if onScreen then
        SetTextScale(0.0*scales, 0.55*scales)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(5)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function takeControl(ent)
    if (NetworkHasControlOfEntity(ent)) then
        return true
    end

    while not (NetworkHasControlOfEntity(ent)) do
        NetworkRequestControlOfEntity(ent)
        Wait(0)
    end

    if (not NetworkHasControlOfEntity(ent)) then
        return false
    end

    local netHandle = NetworkGetNetworkIdFromEntity(ent)
    ReqControlId(netHandle)
    SetNetworkIdCanMigrate(netHandle, true)
    
    return true
end

function ReqControlId(id)
    if (not NetworkHasControlOfNetworkId(id)) then
        NetworkRequestControlOfNetworkId(id)
    end

    return true and NetworkHasControlOfNetworkId(id)
end