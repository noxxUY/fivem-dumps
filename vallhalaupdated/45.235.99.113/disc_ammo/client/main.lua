ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('disc-ammo:useAmmoItem')
AddEventHandler('disc-ammo:useAmmoItem', function(ammo)
    local playerPed = PlayerPedId()
    local weapon

    local found, currentWeapon = GetCurrentPedWeapon(playerPed, true)
    if found then
        for _, v in pairs(ammo.weapons) do
            if currentWeapon == v then
                weapon = v
                break
            end
        end
        if weapon ~= nil then
            local pedAmmo = GetAmmoInPedWeapon(playerPed, weapon)
            local newAmmo = pedAmmo + ammo.count
            ClearPedTasks(playerPed)
            local found, maxAmmo = GetMaxAmmo(playerPed, weapon)
            if newAmmo < maxAmmo then
                TaskReloadWeapon(playerPed)
                if Config.EnableInventoryHUD then
                    TriggerServerEvent('disc-inventoryhud:updateAmmoCount', weapon, newAmmo)
                end
                SetPedAmmo(playerPed, weapon, newAmmo)
                TriggerServerEvent('disc-ammo:removeAmmoItem', ammo)
                exports['mythic_notify']:DoCustomHudText('cajaverde' , '¡Se cargaron exitosamente las balas al arma!' , 5000)
            else
                exports['mythic_notify']:DoCustomHudText('cajaroja' , 'Esta arma tiene el máximo de munición!' , 4000)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local currentWeapon = GetSelectedPedWeapon(PlayerPedId()) --morpheause show ammo fix
        DisplayAmmoThisFrame(currentWeapon)
    end
end)
