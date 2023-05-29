-- CAMIONERO
local BlipsRoutes = {}
local carga = {}
local _isGoingToPay = true
function Camionero_ElegirPunto(workName, step, workConfig)
    local elements = {}
    for i, data in ipairs(workConfig.menupoints) do
        local playerCoords = GetEntityCoords(playerPed)
        local distanceBetween = GetDistanceBetweenCoords(playerCoords, data.coords)
        table.insert(elements, {label = data.Text, value = i })
    end
    esx.UI.Menu.Open('default',GetCurrentResourceName(),"camionero_elegirpunto",
    { 
        title = "Camionero - Elegir Ruta", 
        align = "bottom-right", 
        elements = elements 
    }, function(data, menu)
        menu.close()
        selectedRoute = workConfig.menupoints[data.current.value];
        local spawnLibre = true
        spawnLibre = spawnLibre and esx.Game.IsSpawnPointClear(vector3(821.72, -2930.08, 5.92), 7)
        if spawnLibre then
            esx.Game.SpawnVehicle(selectedRoute.trailer,vector3(41.12, -2479.08, 6.0),53.16, function(spawnedVehicle)
                TriggerEvent("LegacyFuel:SetFuel", spawnedVehicle, 100)
                TriggerEvent("esx_lockpick:giveKey", spawnedVehicle)
                SetVehicleNumberPlateText(spawnedVehicle, "ECA " .. math.random(111, 999))
            end)
            esx.Game.SpawnVehicle(selectedRoute.carga,vector3(40.04, -2484.72, 6.0),55.68, function(spawnedVehicle)
                TriggerEvent("LegacyFuel:SetFuel", spawnedVehicle, 100)
                TriggerEvent("esx_trabajos:insertTableVehicle",spawnedVehicle)
                TriggerEvent("esx_lockpick:giveKey", spawnedVehicle)
                table.insert(carga, {carga = spawnedVehicle})
                SetVehicleNumberPlateText(spawnedVehicle, "ECAR " .. math.random(111, 999))
            end)
        else
            esx.ShowNotification("Los puntos de spawn están ocupados esperate un momento!")
            return
        end
        Config.Actividades['camionero'][5].finalmoney = selectedRoute.finalmoney
        Config.Actividades['camionero'][3].marker = selectedRoute.coords
        stepClient = step + 1
        SpawnPedsDuringMission(workName, stepClient, workConfig)
        blip = AddBlipForCoord(selectedRoute.coords.x, selectedRoute.coords.y, selectedRoute.coords.z)
        table.insert(BlipsRoutes, {blip = blip, workName = workName, step = step})
        SetBlipRoute(blip, true)
    end, function(data, menu) 
        menu.close() 
    end)
end

function CamioneroNorte_ElegirPunto(workName, step, workConfig)
    local elements = {}
    for i, data in ipairs(workConfig.menupoints) do
        local playerCoords = GetEntityCoords(playerPed)
        local distanceBetween = GetDistanceBetweenCoords(playerCoords, data.coords)
        table.insert(elements, {label = data.Text, value = i })
    end
    esx.UI.Menu.Open('default',GetCurrentResourceName(),"camionero_elegirpunto",
    { 
        title = "Camionero - Elegir Ruta", 
        align = "bottom-right", 
        elements = elements 
    }, function(data, menu)
        menu.close()
        selectedRoute = workConfig.menupoints[data.current.value];
        local spawnLibre = true
        spawnLibre = spawnLibre and esx.Game.IsSpawnPointClear(vector3(-277.84, 6063.68, 31.56), 7)
        if spawnLibre then
            esx.Game.SpawnVehicle(selectedRoute.trailer,vector3(-277.84, 6063.68, 31.56),60.44, function(spawnedVehicle)
                TriggerEvent("LegacyFuel:SetFuel", spawnedVehicle, 100)
                TriggerEvent("esx_lockpick:giveKey", spawnedVehicle)
                TriggerEvent("esx_trabajos:insertTableVehicle",spawnedVehicle)
                SetVehicleNumberPlateText(spawnedVehicle, "ECA " .. math.random(111, 999))
            end)
            esx.Game.SpawnVehicle(selectedRoute.carga,vector3(-262.8, 6053.76, 31.76),51.4, function(spawnedVehicle)
                TriggerEvent("LegacyFuel:SetFuel", spawnedVehicle, 100)
                TriggerEvent("esx_trabajos:insertTableVehicle",spawnedVehicle)
                TriggerEvent("esx_lockpick:giveKey", spawnedVehicle)
                table.insert(carga, {carga = spawnedVehicle})
                SetVehicleNumberPlateText(spawnedVehicle, "ECAR " .. math.random(111, 999))
            end)
        else
            esx.ShowNotification("Los puntos de spawn están ocupados esperate un momento!")
            return
        end
        Config.Actividades['camioneronorte'][5].finalmoney = selectedRoute.finalmoney
        Config.Actividades['camioneronorte'][3].marker = selectedRoute.coords
        stepClient = step + 1
        SpawnPedsDuringMission(workName, stepClient, workConfig)
        blip = AddBlipForCoord(selectedRoute.coords.x, selectedRoute.coords.y, selectedRoute.coords.z)
        table.insert(BlipsRoutes, {blip = blip, workName = workName, step = step})
        SetBlipRoute(blip, true)
    end, function(data, menu) 
        menu.close() 
    end)
end

function Camionero_EntregarCarga(workName, step, workConfig)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    local trailer = GetVehicleTrailerVehicle(vehicle)
    if trailer ~= false then
        DetachVehicleFromTrailer(vehicle)
        Wait(2000)
        DetachVehicleFromTrailer(vehicle)
        for k,v in pairs(carga) do
            esx.Game.DeleteVehicle(v.carga)
            carga = {}
        end
        for k, v in pairs(BlipsRoutes) do
            RemoveBlip(v.blip)
        end
    else
        _isGoingToPay = false
        esx.ShowNotification("No llevas la carga.")
        return
    end
end

function Camionero_CancelActivity()
    if next(BlipsRoutes) ~= nil then
        for k, v in pairs(BlipsRoutes) do
            RemoveBlip(v.blip)
            table.remove(BlipsRoutes, k)
        end
    end
end

function Camionero_FinalMoney(workName, step, workConfig)
    local finalmoney = workConfig.finalmoney
    DebugLog("Final money after all changes " .. finalmoney)
    if(_isGoingToPay)then
        esx.TriggerServerCallback('esx_npcs:getSalary', function(finalmoney)
            if finalmoney ~= 0 or finalmoney ~= nil then
                esx.ShowNotification("Has ganado " .. finalmoney .. "$ de sueldo")
            end
        end, finalmoney, workName)
    else
        esx.ShowNotification("No has cumplido las reglas del trabajo, no cobras")
    end
    FinishWork(true)
end