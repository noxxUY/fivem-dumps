ESX = exports["es_extended"]:getSharedObject()
cachedBins = {}
closestBin = {
    'prop_dumpster_01a',
    'prop_dumpster_02a',
    'prop_dumpster_02b',
    'prop_dumpster_4a',
    'prop_dumpster_4b'
}

Citizen.CreateThread(function()
    if ESX.IsPlayerLoaded() then
		ESX.PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
	ESX.PlayerData = response
end)

Citizen.CreateThread(function()
    while true do
        
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #closestBin do
            local x = GetClosestObjectOfType(playerCoords, 2.0, GetHashKey(closestBin[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                entity = x
                bin    = GetEntityCoords(entity)
                sleep  = 5
                DrawText3D(bin.x, bin.y, bin.z + 1.5, 'Presiona [~g~E~s~] Para revolver y buscar en la ~b~basura~s~')  
                if IsControlJustReleased(0, 38) then
                    if not cachedBins[entity] then
                        OpenBin(entity)
                    else
                        ESX.ShowNotification('~r~¡Usted o alguien ya ha buscado aquí!~s~')
                    end
                end
                break
            else
                sleep = 1000
            end
        end
        Citizen.Wait(sleep)
    end
end)