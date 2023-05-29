-- @vars
ESX = exports['es_extended']:getSharedObject()
local jailTime = nil

-- @threads
CreateThread(function()
    while true do
        local msec = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if (jailTime) then
            msec = 0
            create3D(vec3(playerCoords.xy, playerCoords.z+0.5), "Tiempo restante: ~g~"..jailTime.."~w~ segundos")

            -- @ Si quieres bloquear mas teclas las puedes buscar en esta página: https://docs.fivem.net/docs/game-references/controls/
            DisableControlAction(0, 289, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 19, true)
            DisableControlAction(0, 73, true)
            DisableControlAction(0, 47, true)
            DisableControlAction(0, 24, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 263, true)
            DisableControlAction(0, 249, true)
            DisableControlAction(0, 23, true)
        end
        Wait(msec)
    end
end) -- necesito coger una función de el

-- @eventstr
RegisterNetEvent('bm_jail:sendToJail', function()
    local modelHash = GetHashKey(Config.ped)
    RequestModel(Config.ped)
    while not HasModelLoaded(Config.ped) do
        Wait(0)
    end
    SetPlayerModel(PlayerId(), modelHash)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetModelAsNoLongerNeeded(modelHash)
    SetPedComponentVariation(PlayerPedId(), 8, 0, 0, 2)
    SetEntityCoords(PlayerPedId(), Config.spawnPoint.xyz)
    SetEntityHeading(PlayerPedId(), Config.spawnPoint.w)
    SetEntityInvincible(PlayerPedId(), true)
end)

RegisterNetEvent('bm_jail:release', function()
    DoScreenFadeOut(1000)
    Wait(1000)
    SetEntityCoords(PlayerPedId(), Config.finishCoords.xyz)
    SetEntityHeading(PlayerPedId(), Config.finishCoords.w)
    SetEntityInvincible(PlayerPedId(), false)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0

        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                TriggerEvent('esx:restoreLoadout')
            end)
        end)

    end)
    DoScreenFadeIn(1000)
end)

RegisterNetEvent('bm_jail:setTime', function(time)
    jailTime = time
end)

-- @funcs
function create3D(coords, text)
    local x, y, z = table.unpack(coords)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*1
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
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