Framework = {
    object = nil,

    LoadFunction = function(cb)
        if Config.Framework == 'ESX' then
            Framework.object = exports['es_extended']:getSharedObject()
        
            if not IsDuplicityVersion() then
                while Framework.object.GetPlayerData().job == nil do
                    Citizen.Wait(50)
                end

                Framework.object.playerData = Framework.object.GetPlayerData()

                
                RegisterNetEvent('esx:setJob', function(job)
                    Framework.object.PlayerData.job = job
                end)
                
                cb()
            end
        end
    end,

    GetPlayerObject = function(playerId)
        if Config.Framework == 'ESX' then
            local xPlayer = Framework.object.GetPlayerFromId(playerId)

            return xPlayer
        end
    end,

    GiveWeapon = function(ped, data)
        TriggerEvent('cc_anticheat:weapons:check')
        GiveWeaponToPed(ped, data.name, 9999, true, false)
        SetAmmoInClip(ped, data.name, 999)
        SetPedInfiniteAmmo(ped, true, data.name)
        SetPedWeaponTintIndex(ped, data.name, data.tintIndex)
        print(data.name)
        
        for k, v in pairs(data.components) do
            GiveWeaponComponentToPed(ped, data.name, v)
        end
    end,

    HealthPlayer = function(refill)
        local ped = PlayerPedId()

        SetEntityHealth(ped, 200)
        
        if refill then
            SetPedArmour(ped, 100)
        end
    end,

    RestoreLoadout = function(playerId)
        local playerObject = Framework.GetPlayerObject(playerId)

        if Config.Framework == 'ESX' then
            for k, v in ipairs(playerObject.getLoadout()) do
                if v.label ~= nil then
                    TriggerClientEvent('esx:addWeapon', playerId, v.name, v.ammo)
    
                    if v.tintIndex ~= nil then
                        TriggerClientEvent('esx:setWeaponTint', playerId, v.name, v.tintIndex)
                    end
    
                    for k1, v1 in pairs(v.components) do
                        TriggerClientEvent('esx:addWeaponComponent', playerId, v.name, v1)
                    end
                end
            end
        end
    end,

    GetIdentifier = function(playerObject)
        if Config.Framework == 'ESX' then
            return playerObject.identifier
        end
    end,

    GetName = function(playerObject)
        if Config.Framework == 'ESX' then
            return playerObject.name
        end
    end,

    GetJob = function(playerObject)
        if not IsDuplicityVersion() then
            if Config.Framework == 'ESX' then
                return Framework.object.PlayerData.job
            end
        else
            if Config.Framework == 'ESX' then
                return playerObject.job
            end
        end
    end,

    TriggerServerCallback = function(name, cb, ...)
        if not IsDuplicityVersion() then
            if Config.Framework == 'ESX' then
                Framework.object.TriggerServerCallback(name, function(...)
                    cb(...)
                end, ...)
            end
        end
    end,

    RegisterServerCallback = function(name, cb)
        if IsDuplicityVersion() then
            if Config.Framework == 'ESX' then
                Framework.object.RegisterServerCallback(name, cb)
            end
        end
    end
}