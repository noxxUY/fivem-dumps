function Revive(ped)
    if not inPurge then return end
    if inPurge then 
        local randomCoords = Config.RespawnPoints[math.random(1, #Config.RespawnPoints)]

        NetworkResurrectLocalPlayer(randomCoords.x, randomCoords.y, randomCoords.z, true, false)
        SetPlayerInvincible(ped, false)
        ClearPedBloodDamage(ped)
        SetEntityHealth(ped, 200)
        SetEntityInvincible(ped, false)
        SetEntityVisible(ped, true, false)
        SetEntityCollision(ped, true, true)
        SetEntityAlpha(ped, 255, false)
        SetEntityCoords(ped, randomCoords.x, randomCoords.y, randomCoords.z, false, false, false, false)
        ManageWeapons(true)
    end
end 


RegisterNetEvent('lapurga:finalizarpurga')
AddEventHandler('lapurga:finalizarpurga', function ()
    ExitPurge()
end)

function ExitPurge()
    if not inPurge then return end
    if inPurge then 
        ManageWeapons(false)
        inPurge = false
        TriggerServerEvent('lapurga:setDimension', 0)
        SetEntityCoords(PlayerPedId(), Config.Point.x, Config.Point.y, Config.Point.z, false, false, false, false)
    end
end

function JoinPurge()
    if inPurge then return end
    if not inPurge then 
        ManageWeapons(true)
        inPurge = true
        local randomCoords = Config.RespawnPoints[math.random(1, #Config.RespawnPoints)]
        SetEntityCoords(PlayerPedId(), randomCoords.x, randomCoords.y, randomCoords.z, false, false, false, false)
        TriggerServerEvent('lapurga:setDimension', 69)
    end
    CreateThread(function()
        while inPurge do
            Wait(5)

            local playerPed = PlayerPedId()

            if IsEntityDead(playerPed) then
                Revive(playerPed)
            end
        end
    end)
end

function ManageWeapons(give)
    if give then 
        for k, v in pairs(Config.WeaponsToGive) do
            GiveWeaponToPed(PlayerPedId(), GetHashKey(v), 9999, false, true)
            SetCurrentPedWeapon(ped, GetHashKey(v), true)
            SetPedInfiniteAmmo(ped, true, GetHashKey(v))
            SetAmmoInClip(ped, GetHashKey(v), 9999)
        end
    else
        RemoveAllPedWeapons(PlayerPedId(), true)
    end
end


function ShowHtml(bool)
    SetNuiFocus(true, true)
    if bool then 
        SendNUIMessage({
            action = 'purgaIniciada'
        })
    else
        SendNUIMessage({
            action = 'purgaFinalizada'
        })
    end
end