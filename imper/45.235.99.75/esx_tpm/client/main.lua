local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:tpmv2')
AddEventHandler('esx:tpmv2', function()
    
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
        ESX.ShowNotification("Teleported.")
    else
        ESX.ShowNotification("Please place your waypoint.")
    end
end)
