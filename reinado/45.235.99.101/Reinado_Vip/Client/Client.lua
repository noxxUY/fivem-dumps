ESX = exports['es_extended']:getSharedObject()
RegisterCommand('cp', function(_, args, rawCommand)
    local tipo = args[1]
    local coords = GetEntityCoords(PlayerPedId())
    local x = tonumber(string.format("%.2f", coords.x))
    local y = tonumber(string.format("%.2f", coords.y))
    local z = tonumber(string.format("%.2f", coords.z))
    local formato = '{x = ' .. x .. ', y= ' .. y .. ', z= ' .. z .. '}'

    if tipo == '1' then
        formato = '{x = ' .. x .. ', y= ' .. y .. ', z= ' .. z .. '},'
    elseif tipo == '2' then
        formato = 'vec3(' .. x .. ', ' .. y .. ', ' .. z .. ')'
    elseif tipo == '3' then
        formato = '' .. x .. ', ' .. y .. ', ' .. z .. ''
    end
    SendNUIMessage({coords = formato})
    -- print(GetLabelText(GetDisplayNameFromVehicleModel('ninef2')))
end)

RegisterCommand('attach', function()
    if isVip then 
        AttachWeapons()
    else
        print('No eres vip')
    end
end)

pedsInfo = nil
carsInfo = nil
helicopterInfo = nil
weaponsInfo = nil
isVip = false
RegisterNetEvent('Roda_VipSystem:SendRolInfo')
AddEventHandler('Roda_VipSystem:SendRolInfo', function(roles)

    if not roles then
        print('novip')
        return
    end
    isVip = true
    print('Eres vip')
    pedBoolean = roles.pedInfo.usePed
    carBoolean = roles.carsInfo.useCars
    helicopterBoolean = roles.helicopterInfo.useHelicopter
    weaponsBoolean = roles.weaponsInfo.useWeapons
    if pedBoolean then pedsInfo = roles.pedInfo end
    if carBoolean then carsInfo = roles.carsInfo end
    if helicopterBoolean then helicopterInfo = roles.helicopterInfo end
    if weaponsBoolean then weaponsInfo = roles.weaponsInfo end

end)

RegisterCommand('activarvip', function()
    TriggerServerEvent('Roda_VipSystem:GetRolInfo')
end)

CreateThread(function()
    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
            TriggerServerEvent('Roda_VipSystem:GetRolInfo')
            break
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 500

        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)
        if isVip then
            if pedBoolean then

                local dist = #(pedC - vector3(pedsInfo.pedSpawnPoint.x,pedsInfo.pedSpawnPoint.y,pedsInfo.pedSpawnPoint.z))
                if dist < 5 then
                    wait = 0
                    DrawMarker(2, vector3(pedsInfo.pedSpawnPoint.x,pedsInfo.pedSpawnPoint.y,pedsInfo.pedSpawnPoint.z + 0.20), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
                    if dist < 3 then
                        ESX.ShowFloatingHelpNotification(pedsInfo.texto, vector3(pedsInfo.pedSpawnPoint.x,pedsInfo.pedSpawnPoint.y,pedsInfo.pedSpawnPoint.z + 0.50))

                        if dist < 2 then
                            if IsControlJustPressed(0, 38) then
                                CreateMenu(pedsInfo)
                            end
                        end
                    end
                end
            end
            if carBoolean then
                local dist = #(pedC - vector3(carsInfo.carSpawnPoint.x,carsInfo.carSpawnPoint.y,carsInfo.carSpawnPoint.z))
                if dist < 5 then
                    wait = 0
                    DrawMarker(2, vector3(carsInfo.carSpawnPoint.x,carsInfo.carSpawnPoint.y,carsInfo.carSpawnPoint.z + 0.20), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
                    if dist < 3 then
                        ESX.ShowFloatingHelpNotification(carsInfo.texto, vector3(carsInfo.carSpawnPoint.x,carsInfo.carSpawnPoint.y,carsInfo.carSpawnPoint.z + 0.50))

                        if dist < 2 then
                            if IsControlJustPressed(0, 38) then
                                CreateMenu(carsInfo)
                            end
                        end
                    end
                end
            end
            if helicopterBoolean then
                local dist = #(pedC - vector3(helicopterInfo.helicopterSpawnPoint.x, helicopterInfo.helicopterSpawnPoint.y, helicopterInfo.helicopterSpawnPoint.z))
                if dist < 5 then
                    wait = 0
                    DrawMarker(2, vector3(helicopterInfo.helicopterSpawnPoint.x, helicopterInfo.helicopterSpawnPoint.y, helicopterInfo.helicopterSpawnPoint.z + 0.20), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
                    if dist < 3 then
                        ESX.ShowFloatingHelpNotification(helicopterInfo.texto, vector3(helicopterInfo.helicopterSpawnPoint.x, helicopterInfo.helicopterSpawnPoint.y, helicopterInfo.helicopterSpawnPoint.z + 0.50))
                        if dist < 2 then
                            if IsControlJustPressed(0, 38) then
                                CreateMenu(helicopterInfo)
                            end
                        end
                    end
                end
            end
            if weaponsBoolean then
                local dist = #(pedC - vector3(weaponsInfo.weaponsSpawnPoint.x, weaponsInfo.weaponsSpawnPoint.y, weaponsInfo.weaponsSpawnPoint.z))
                if dist < 5 then
                    wait = 0
                    DrawMarker(2, vector3(weaponsInfo.weaponsSpawnPoint.x, weaponsInfo.weaponsSpawnPoint.y, weaponsInfo.weaponsSpawnPoint.z + 0.20), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
                    if dist < 3 then
                        ESX.ShowFloatingHelpNotification(weaponsInfo.texto, vector3(weaponsInfo.weaponsSpawnPoint.x, weaponsInfo.weaponsSpawnPoint.y, weaponsInfo.weaponsSpawnPoint.z + 0.50))

                        if dist < 2 then
                            if IsControlJustPressed(0, 38) then
                                CreateMenu(weaponsInfo)
                            end
                        end
                    end
                end
            end
        end

        Citizen.Wait(wait)
    end
end)


CreateThread(function()
    while true do
        Wait(Config.TiempoToGiveReward * 60000)
        if isVip then
         --   print('give money')
            TriggerServerEvent('Roda_VipSystem:giveReward')
        end
    end
end)
