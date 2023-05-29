--This makes players incapable of carjacking vehicles w/ npc's inside.
--just comment out this if you don't need / want this feature
---------------------------------------------------------------------------------
--[[Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
            local lock = GetVehicleDoorLockStatus(veh)
            if lock == 7 then
                SetVehicleDoorsLocked(veh, 2)
            end
            local pedd = GetPedInVehicleSeat(veh, -1)
            if pedd then
                SetPedCanBeDraggedOut(pedd, false)
            end
        end
    end
 end)]]
-----------------------------------------------------------------------------------

local locked = false
RegisterNetEvent('s_lockpick:startlockpicking')
AddEventHandler('s_lockpick:startlockpicking', function()
    local ped = PlayerPedId()
    local pedc = GetEntityCoords(ped)
    local closeveh = GetClosestVehicle(pedc.x, pedc.y, pedc.z, 5.0, 0 ,71)
    local lockstatus = GetVehicleDoorLockStatus(closeveh)
    local distance = #(GetEntityCoords(closeveh) - pedc)
    if distance < 3 then
        if lockstatus == 2 then
            TriggerEvent('s_lockpick:client:openLockpick', lockpick)
            ESX.ShowNotification('Use [A / D] and [Mouse] to pick the lock')
            ExecuteCommand('e mechanic3')
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"),true)
            FreezeEntityPosition(PlayerPedId(), true)
            TriggerServerEvent("s_lockpick:server:remove")
        else
            ESX.ShowNotification('Este vehículo no está cerrado.', "warning")
        end
    else
        ESX.ShowNotification('No hay ningún vehículo cerca', "error")
    end
end)

function lockpick(success)
    ped = PlayerPedId()
    pedc = GetEntityCoords(ped)
    local veh = GetClosestVehicle(pedc.x, pedc.y, pedc.z, 3.0, 0, 71)
    if success then
        Citizen.Wait(1000)
        ExecuteCommand("e uncuff")
        Citizen.Wait(500)
        ClearPedTasks(PlayerPedId())
        FreezeEntityPosition(PlayerPedId(), false)
        ESX.ShowNotification('Pudiste forzar el vehículo.', "success")
        SetVehicleDoorsLocked(veh, 1)
        SetVehicleDoorsLockedForAllPlayers(veh, false)
    else
        ClearPedTasks(PlayerPedId())
        ESX.ShowNotification('Rompiste la ganzúa, las alarmas del vehículo se dispararon.', "warning")
        FreezeEntityPosition(PlayerPedId(), false)
        SetVehicleAlarm(veh, true)
        SetVehicleAlarmTimeLeft(veh, 4000)
        SetVehicleDoorsLocked(veh, 2)
        --Here you can add your own police notification event if you wish
    end
end
