-- Deshabilitar cambio automático de asiento

local AddEventHandler = AddEventHandler
local InvokeNative = Citizen.InvokeNative

AddEventHandler('esx:enteredVehicle', function(vehicle, _, seat)
    local ped = ESX.PlayerData.ped
    if seat ~= 0 then
        return
    end

    InvokeNative(0xF75B0D629E1C063D, ped, vehicle, 0)
    InvokeNative(0x1913FE4CBF41C463, ped, 184, true)
end)

-- COMANDO /manejar
RegisterCommand('manejar', function()
    local ped = ESX.PlayerData.ped
    local veh = GetVehiclePedIsIn(ped, false)
    local IsPedInAnyVehicle = IsPedInAnyVehicle(ped, false)

    Wait(100)

    if IsPedInAnyVehicle then
        SetPedConfigFlag(ped, 184, true)
        TaskShuffleToNextVehicleSeat(ped, veh)
        SetPedConfigFlag(ped, 184, true)
    end

end, false)