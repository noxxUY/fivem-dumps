local inMission = false
function Carreras_StartActivity(workName, step, workConfig)
    Citizen.CreateThread(function()
        esx.Game.SpawnVehicle("sanchez",vector3(824.76, 2373.12, 52.44),273.16, function(spawnedVehicle)
            TriggerEvent("LegacyFuel:SetFuel", spawnedVehicle, 100)
            SetVehicleNumberPlateText(spawnedVehicle, "CAR " .. math.random(111, 999))
            TriggerEvent("esx_lockpick:giveKey", spawnedVehicle)
            table.insert(SpawnedVehicles, {vehicle = spawnedVehicle})
        end)
        inMission = true 
        local playerPed = GetPlayerPed(-1)
        local compareCoords = vector3(1040.64, 2346.92, 47.16)
        while(inMission) do
            Citizen.Wait(2000)
            local coordsPed = GetEntityCoords(playerPed)
            local distance = GetDistanceBetweenCoords(coordsPed, compareCoords, true)
            if distance > 250.0 then
                inMission = false
                --ExecuteCommand("report Están intentando salir del circuito de motocross")
                esx.ShowNotification('Se te ha terminado la actividad debido a que no estabas en la zona de las carreras')
                Carreras_EndActivity(workName, step, workConfig)
            end
        end
    end)
end

function Carreras_EndActivity(workName, step, workConfig)
    inMission = false
    FinishWork(false)
end