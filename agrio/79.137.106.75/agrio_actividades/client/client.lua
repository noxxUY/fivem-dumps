PedTable = {}
local workskin = nil
local CurrentMissionStep = nil
local CurrentWorkName = nil
local stepClient = nil
local scriptReady = false
local Blips = {}
SpawnedVehicles = {}
Citizen.CreateThread(function()
    while esx == nil do
		TriggerEvent('esx:getSharedObject', function(obj) esx = obj end)
		Citizen.Wait(50)
    end
    while esx.GetPlayerData().job == nil do
		Citizen.Wait(1000)
    end

    PlayerData = esx.GetPlayerData()
    scriptReady = true
    FirstPullNpcs()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)
RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	PlayerData.job2 = job2
end)
local _hasDmvSchoolLicense = false
RegisterNetEvent("esx:dmvSchool:license")
AddEventHandler("esx:dmvSchool:license", function(bool)
    _hasDmvSchoolLicense = bool
end)

local blips = {

	--{ id= 315, title='Actividad - Circuito Karting', color= 4,  x = -149.440, y = -2151.80, z = 16.705 },
 --   { id= 127, title='Actividad - Carreras Motocross', color= 5,  x = 823.28, y = 2367.84, z = 51.32 },
    --{ id= 477, title='Trabajo - Camionero', color= 4,  x = -3.6, y = -2538.88, z = 5.16 },
    --{ id= 477, title='Trabajo - Camionero', color= 4,  x = -247.67, y = 6067.4, z = 31.34 }, 
   -- { id= 471, title='Actividad - Motos de Agua', color= 4,  x = -1613.16, y = -1127.48, z = 1.32 }, 
   -- { id= 471, title='Actividad - Motos de Agua', color= 4,  x = -1517.32, y = 1505.96, z = 110.64 }, 
   -- { id= 471, title='Actividad - Motos de Agua', color= 4,  x = 1732.92, y = 3984.88, z = 31.96 },  
     --{ id= 94, title='Actividad - Paracaidismo', color= 4,  x = 444.48, y = 5574.88, z = 780.2 },  
   -- { id= 427, title='Alquiler de barcos', color= 4,  x = -719.88, y = -1326.76, z = 0.6 },
    --{ id= 427, title='Alquiler de barcos', color= 4,  x = -3427.86, y = 967.59, z = 7.35 },
   -- { id= 427, title='Alquiler de barcos', color= 4,  x = -1612.24, y = 5262.0, z = 2.97 },
   -- { id= 478, title='Distribuidora Jetsam', color= 53, x = 797.88, y = -2988.88, z = 6.04 },
   -- { id= 126, title='Actividad - Triatlón', color= 3, x = 2415.32, y = 4609.16, z= 38.36 },
    { id= 316, title='Actividad - Carreras de motos de agua', color= 3, x = 673.54, y = -1510.89, z = 8.71 },
    { id= 127, title='Actividad - Descenso del Chilliad', color= 5, x = 501.31, y = 5601.35, z = 795.66 },
    { id= 147, title='Actividad - Carrera de buggies', color= 6, x = -1574.68, y = 5171.95, z = 18.59 },
   -- { id= 308, title='Actividad - Exploración marina', color= 2, x = -277.89, y = 6637.15, z = 6.51 },


}

Citizen.CreateThread(function()

	for _, info in pairs(blips) do
		
	  info.blip = AddBlipForCoord(info.x, info.y, info.z)
	  
	  SetBlipSprite(info.blip, info.id)
	  
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.color)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

function SpawnBandasMisionPeds(CurrentWorkName, CurrentWorkConcretSettings, CurrentWorkStep)
    if(CurrentWorkConcretSettings.ped ~= nil and CurrentWorkStep == stepClient or CurrentWorkStep == 1 and stepClient == nil and CurrentWorkConcretSettings.level == nil)then
        DebugLog(CurrentWorkName .. " cargado")
        RequestModel(GetHashKey(CurrentWorkConcretSettings.ped))
        while not HasModelLoaded(GetHashKey(CurrentWorkConcretSettings.ped)) do
            Wait(0)
        end
        local spawnPed = CreatePed(5, GetHashKey(CurrentWorkConcretSettings.ped), CurrentWorkConcretSettings.coords, CurrentWorkConcretSettings.heading, false, true)
        SetEntityAsMissionEntity(spawnPed, true, true)
        FreezeEntityPosition(spawnPed, true)
        SetBlockingOfNonTemporaryEvents(spawnPed, true)
        SetEntityInvincible(spawnPed, true)
        SetPedFleeAttributes(spawnPed, 0, 0)
        DecorSetBool(spawnPed, "SPAWNEDPED", true)
        if (CurrentWorkConcretSettings.animation) then
            TaskPlayAnim(spawnPed, CurrentWorkConcretSettings.animation, CurrentWorkConcretSettings.animationName, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
        elseif(CurrentWorkConcretSettings.scenario) then
            TaskStartScenarioInPlace(spawnPed, CurrentWorkConcretSettings.scenario, 0, true)
        end
        table.insert(PedTable, {CurrentWorkName = CurrentWorkName, CurrentWorkConcretSettings = CurrentWorkConcretSettings, ped = spawnPed, step = CurrentWorkStep})
    elseif CurrentWorkConcretSettings.ped ~= nil and CurrentWorkConcretSettings.level ~= nil and stepClient == nil then
        for level, leveldata in pairs(CurrentWorkConcretSettings.level) do
            if leveldata == level then
                RequestModel(GetHashKey(CurrentWorkConcretSettings.ped))
                while not HasModelLoaded(GetHashKey(CurrentWorkConcretSettings.ped)) do
                    Wait(0)
                end
                local spawnPed = CreatePed(5, GetHashKey(CurrentWorkConcretSettings.ped), CurrentWorkConcretSettings.coords, CurrentWorkConcretSettings.heading, false, true)
                SetEntityAsMissionEntity(spawnPed, true, true)
                FreezeEntityPosition(spawnPed, true)
                SetBlockingOfNonTemporaryEvents(spawnPed, true)
                SetEntityInvincible(spawnPed, true)
                SetPedFleeAttributes(spawnPed, 0, 0)
                DecorSetBool(spawnPed, "SPAWNEDPED", true)
                if (CurrentWorkConcretSettings.animation) then
                    TaskPlayAnim(spawnPed, CurrentWorkConcretSettings.animation, CurrentWorkConcretSettings.animationName, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
                elseif(CurrentWorkConcretSettings.scenario) then
                    TaskStartScenarioInPlace(spawnPed, CurrentWorkConcretSettings.scenario, 0, true)
                end
                table.insert(PedTable, {CurrentWorkName = CurrentWorkName, CurrentWorkConcretSettings = CurrentWorkConcretSettings, ped = spawnPed, step = CurrentWorkStep})
            end
        end
    end
end

function FirstPullNpcs()
    for k, v in pairs(Config.Actividades) do
        for CurrentWorkSettings, CurrentWorkSettingsConcret in pairs(Config.Actividades[k]) do
            SpawnBandasMisionPeds(k, CurrentWorkSettingsConcret, CurrentWorkSettings)
        end
    end
end

function SpawnPedsDuringMission(workName, step, workConfig)
    if Config.Actividades[workName][step] ~= nil then
        local v = Config.Actividades[workName][step]
        if v.ped ~= nil then
            RequestModel(GetHashKey(v.ped))
            while not HasModelLoaded(GetHashKey(v.ped)) do
                Wait(0)
            end
            local spawnPed = CreatePed(5, GetHashKey(v.ped), v.coords, v.heading, false, true)
            SetEntityAsMissionEntity(spawnPed, true, true)
            FreezeEntityPosition(spawnPed, true)
            SetBlockingOfNonTemporaryEvents(spawnPed, true)
            SetEntityInvincible(spawnPed, true)
            SetPedFleeAttributes(spawnPed, 0, 0)
            DecorSetBool(spawnPed, "SPAWNEDPED", true)
            if (v.animation) then
                TaskPlayAnim(spawnPed, v.animation, v.animationName, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
            elseif(v.scenario) then
                TaskStartScenarioInPlace(spawnPed, v.scenario, 0, true)
            end
            if v.blip == true then
                blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
                SetBlipRoute(blip, true)
                table.insert(Blips, {blip = blip, workName = workName, step = step})
            end
            table.insert(PedTable, {CurrentWorkName = workName, CurrentWorkConcretSettings = v, ped = spawnPed, step = step})
        elseif v.marker ~= nil then
            if v.blip == true then
                blip = AddBlipForCoord(v.marker.x, v.marker.y, v.marker.z)
                SetBlipRoute(blip, true)
                table.insert(Blips, {blip = blip, workName = workName, step = step})
            end
            table.insert(PedTable, {CurrentWorkName = workName, CurrentWorkConcretSettings = v, step = step})
        end
    end
end

Citizen.CreateThread(function()
    local close = false
    local close_to = 0 
    while true do
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local isPedInVehicle = IsPedInAnyVehicle(playerPed, false)
        local isInMarker, hasExited, letSleep = false, false, true
        local nowMission, currentConfig
        if close then
            if #(coords - close_to) > 12.0 then
                close = false
                Citizen.Wait(1200)
            end
        elseif not close then
            Citizen.Wait(1200)
        end
        if (PlayerData ~= nil and PlayerData.job ~= nil and PedTable) then
            for _, selectedMission in pairs(PedTable) do
                if selectedMission.CurrentWorkConcretSettings.ped ~= nil then
                    local distance = GetDistanceBetweenCoords(coords, GetEntityCoords(selectedMission.ped), true)
                    if selectedMission.CurrentWorkName == "lenador" and selectedMission.step ~= 1 then
                        DebugLog(GetEntityCoords(selectedMission.ped) .. " - " .. selectedMission.step)
                    end
                    if distance < 1.5 + 1 and not isPedInVehicle then
                        close_to = GetEntityCoords(selectedMission.ped)
                        close = true
                        isInMarker, nowMission, currentConfig, currentStep = true, selectedMission.CurrentWorkName, selectedMission.CurrentWorkConcretSettings, selectedMission.step
                        CurrentActionMsgCoords = vector3(GetEntityCoords(selectedMission.ped).x,GetEntityCoords(selectedMission.ped).y,GetEntityCoords(selectedMission.ped).z+1)
                    end
                elseif selectedMission.CurrentWorkConcretSettings.spawnpeds ~= nil then
                    for i, data in ipairs(selectedMission.CurrentWorkConcretSettings.spawnpeds) do
                        local distance = GetDistanceBetweenCoords(coords, data.coords, true)
                        if distance < 1.5 + 1 then
                            close_to = GetEntityCoords(data.coords)
                            close = true
                            isInMarker, nowMission, currentConfig, currentStep = true, selectedMission.CurrentWorkName, selectedMission.CurrentWorkConcretSettings, selectedMission.step
                            CurrentActionMsgCoords = vector3(data.coords.x, data.coords.y, data.coords.z + 1.9)
                        end
                    end
                elseif selectedMission.CurrentWorkConcretSettings.marker ~= nil then
                    local distance = GetDistanceBetweenCoords(coords, selectedMission.CurrentWorkConcretSettings.marker, true)

                    if distance < 11.0 then
                        DrawMarker(Config.MarkerType, selectedMission.CurrentWorkConcretSettings.marker, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
                    end
                    if distance < 5.0 then
                        close_to = selectedMission.CurrentWorkConcretSettings.marker
                        close = true
                        isInMarker, nowMission, currentConfig, currentStep = true, selectedMission.CurrentWorkName, selectedMission.CurrentWorkConcretSettings, selectedMission.step
                        CurrentActionMsgCoords = vector3(selectedMission.CurrentWorkConcretSettings.marker.x, selectedMission.CurrentWorkConcretSettings.marker.y, selectedMission.CurrentWorkConcretSettings.marker.z + 1.7)
                    end

                    if distance < 11.0 and selectedMission.CurrentWorkConcretSettings.markerType == nil then
                        DrawMarker(Config.MarkerType, selectedMission.CurrentWorkConcretSettings.marker, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
                    elseif distance < 290.0 and selectedMission.CurrentWorkConcretSettings.markerType ~= nil then
                        DrawMarker(selectedMission.CurrentWorkConcretSettings.markerType, selectedMission.CurrentWorkConcretSettings.marker, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSizeGrande.x, Config.MarkerSizeGrande.y, Config.MarkerSizeGrande.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
                    end
                    if distance < Config.MarkerSize.x and selectedMission.CurrentWorkConcretSettings.markerType == nil then
                        close_to = selectedMission.CurrentWorkConcretSettings.marker
                        close = true
                        isInMarker, nowMission, currentConfig, currentStep = true, selectedMission.CurrentWorkName, selectedMission.CurrentWorkConcretSettings, selectedMission.step
                        CurrentActionMsgCoords = vector3(selectedMission.CurrentWorkConcretSettings.marker.x, selectedMission.CurrentWorkConcretSettings.marker.y, selectedMission.CurrentWorkConcretSettings.marker.z + 1.7)
                    elseif distance < Config.MarkerSizeGrande.x and selectedMission.CurrentWorkConcretSettings.markerType ~= nil then
                        close_to = selectedMission.CurrentWorkConcretSettings.marker
                        close = true
                        isInMarker, nowMission, currentConfig, currentStep = true, selectedMission.CurrentWorkName, selectedMission.CurrentWorkConcretSettings, selectedMission.step
                    end
                elseif selectedMission.CurrentWorkConcretSettings.marker == nil and selectedMission.CurrentWorkConcretSettings.ped == nil then
                    close_to = selectedMission.CurrentWorkConcretSettings.marker
                    close = true
                    isInMarker, nowMission, currentConfig, currentStep = true, selectedMission.CurrentWorkName, selectedMission.CurrentWorkConcretSettings, selectedMission.step             
                end
            end
            if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (lastMission ~= nowMission or LastStep ~= currentConfig)) then
                if (lastMission and LastStep) and (lastMission ~= nowMission or LastStep ~= currentConfig) then
                    TriggerEvent("esx_npcs:hasExitedMarker", lastMission, LastStep, currentStep)
                    hasExited = true
                end

                HasAlreadyEnteredMarker = true
                lastMission = nowMission
                LastStep = currentConfig
                TriggerEvent("esx_npcs:hasEnteredMarker", nowMission, currentConfig, currentStep)
            end

            if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent("esx_npcs:hasExitedMarker", lastMission, LastStep, currentStep)
            end

            Citizen.Wait(0)
        else
            Citizen.Wait(250)
        end
    end
end)
AddEventHandler("esx_npcs:hasEnteredMarker",function(workName, workConfig, workStep)
    CurrentMissionWork = workName
    CurrentMissionConfigure = workConfig
    CurrentMissionStep = workStep
end)
AddEventHandler("esx_npcs:hasExitedMarker", function(workName, workConfig, workStep)
    CurrentMissionWork = nil
    CurrentMissionConfigure = nil
    CurrentMissionStep = nil
end)

function FinishWork(finished)
    if stepClient ~= nil then
        if workskin == true then
            esx.TriggerServerCallback("esx_skin:getPlayerSkin",function(skin)
                TriggerEvent("skinchanger:loadSkin", skin)
                TriggerEvent('dpc:ApplyClothing')
            end)
        end
        workskin = nil
        CurrentMissionStep = nil
        CurrentWorkName = nil
        stepClient = nil
        TriggerEvent("esx_trabajos:activityState", false)
        if PedsGanadero ~= nil then
            if next(PedsGanadero) ~= nil then
                for k, v in pairs(PedsGanadero)do 
                    RemoveBlip(v.blip)
                    PedsGanadero = {}
                end
            end
        end
        if next(Blips) ~= nil then
            for k, v in pairs(Blips) do
                RemoveBlip(v.blip)
            end
        end
        if next(SpawnedVehicles) ~= nil then
            for k, v in pairs(SpawnedVehicles) do
                esx.Game.DeleteVehicle(v.vehicle)
            end
        end
        if next(PedTable) ~= nil then
            for k, v in pairs(PedTable) do
                if v.ped ~= nil then
                    DeleteEntity(v.ped)
                end
                PedTable = {}
            end
        end
        SendNUIMessage({
            type = "hide"
        })
        FirstPullNpcs()
        Camionero_CancelActivity()
    else
        esx.ShowNotification("No estas en ninguna actividad")
    end
end

RegisterCommand("cancelactivity", function(source)
    FinishWork()
end)

function GetWorkLabel(work)
    for k, v in pairs(Config.Labels) do
        if k == work then
            return v
        end
    end
    return false
end

function SelectMissionToDo(workName, workConfig, workStep)
    DebugLog("WorkStep " .. workStep)
    DebugLog("WorkName " .. workName)
    local playerPed = PlayerPedId()
    if workConfig.blip == true then
        DebugLog("Eliminando blip de {workname=" .. workName .. ",workStep=" .. workStep)
        for k, v in pairs(Blips) do
            if v.workName == workName then
                RemoveBlip(v.blip)
            end
        end
    end
    if workConfig.hide == nil or workConfig.hide == false and workConfig.text ~= nil then
        local _label = GetWorkLabel(workName)
        if _label ~= false then
            if workConfig.text then
                SendNUIMessage({
                    type = "show",
                    text = GetWorkLabel(workName) .. ": " .. workConfig.text
                })
            end
        else
            esx.ShowNotification(workConfig.text, 9000)
        end
    else
        SendNUIMessage({
            type = "hide"
        })
    end
    if workConfig.typeOfMission ~= nil then
        TriggerEvent("esx_trabajos:activityState", true)
        if workConfig.typeOfMission == "menu_custom" then
            _G[workConfig.menu](workName, workStep, workConfig)
        elseif workConfig.typeOfMission == "audio" then
            TriggerServerEvent('InteractSound_SV:PlayWithinDistanceLink', 0.8, workConfig.sound, 0.5)
        elseif (workConfig.typeOfMission == "skin") then
            TriggerEvent("skinchanger:getSkin", function(skin)
                if skin.sex == 0 then
                    TriggerEvent("skinchanger:loadClothes", skin, json.decode(workConfig.skinMale))
                    TriggerEvent("esx_skin:setLastSkin", skin)
                else
                    TriggerEvent("skinchanger:loadClothes", skin, json.decode(workConfig.skinFemale))
                    TriggerEvent("esx_skin:setLastSkin", skin)
                end
            end)
            workskin = true 
        elseif workConfig.typeOfMission == "passNextStep" then
            for CurrentWorkSettings, CurrentWorkSettingsConcret in pairs(Config.Actividades[workName][workConfig.nextStep]) do
                stepClient = workConfig.nextStep
                -- SpawnBandasMisionPeds(workName, CurrentWorkSettingsConcret, CurrentWorkSettings)
                -- SelectMissionToDo(workName, CurrentWorkSettingsConcret, workConfig.nextStep)
            end
        elseif workConfig.typeOfMission == "showMenu" then
            esx.UI.Menu.Open('default',GetCurrentResourceName(),"showmenu_configuration",
            { 
                title = workConfig.menuTitle, 
                align = "bottom-right", 
                elements = workConfig.elements 
            }, function(data, menu)
                if workConfig.afterMenu == "spawnVehicle" then
                    local spawnLibre = true
                    spawnLibre = spawnLibre and esx.Game.IsSpawnPointClear(vector3(workConfig.spawnCoordsVeh.x, workConfig.spawnCoordsVeh.y, workConfig.spawnCoordsVeh.z), 5)
                    if spawnLibre then
                        if next(SpawnedVehicles) ~= nil then
                            for k, v in pairs(SpawnedVehicles) do
                                DeleteEntity(v.vehicle)
                            end
                        end
                        Wait(100)
                        esx.Game.SpawnVehicle(data.current.value,vector3(workConfig.spawnCoordsVeh.x, workConfig.spawnCoordsVeh.y, workConfig.spawnCoordsVeh.z),workConfig.spawnCoordsVeh.w, function(spawnedVehicle)
                            TriggerEvent("LegacyFuel:SetFuel", spawnedVehicle, 100)
                            TriggerEvent("esx_trabajos:insertTableVehicle",spawnedVehicle)
                            TriggerEvent("esx_lockpick:giveKey", spawnedVehicle)
                            SetVehicleNumberPlateText(spawnedVehicle, "CAR " .. math.random(111, 999))
                        end)              
                    else
                        return
                    end
                end
                if data.current.value then
                    print(data.current.value)
                    stepClient = data.current.value
                    SpawnPedsDuringMission(workName, stepClient, workConfig)
                end
                if(workConfig.finishActivity)then
                    FinishWork()
                end
                menu.close()
            end, function(data, menu) 
                menu.close() 
            end)
        elseif workConfig.typeOfMission == "buyMenu" then
            esx.UI.Menu.Open('default',GetCurrentResourceName(),"buyMenu_configuration",
            { 
                title = workConfig.menu.title, 
                align = "bottom-right", 
                elements = workConfig.menu.elements 
            }, function(data, menu)
                esx.UI.Menu.Open('dialog',GetCurrentResourceName(),"buyMenu_dialogs",
                { 
                    title = "¿Cuántos quieres comprar?", 
                }, function(data2, menu2)
                    if data.current.money then
                        if tonumber(data2.value) then
                            TriggerServerEvent("esx_trabajos:menu:buy", data.current, workConfig.menu.money, tonumber(data2.value))
                        end
                    end
                    menu2.close()
                end, function(data2, menu2) 
                    menu2.close() 
                end)
            end, function(data, menu) 
                menu.close() 
            end)
        elseif workConfig.typeOfMission == "Boatrental" then
            
            esx.UI.Menu.Open('default',GetCurrentResourceName(),"showmenu_configuration",
            { 
                title = workConfig.menuTitle, 
                align = "bottom-right", 
                elements = workConfig.elements 
            }, function(data, menu)
                if workConfig.afterMenu == "spawnVehicle" then
                    local spawnLibre = true
                    spawnLibre = spawnLibre and esx.Game.IsSpawnPointClear(vector3(workConfig.spawnCoordsVeh.x, workConfig.spawnCoordsVeh.y, workConfig.spawnCoordsVeh.z), 5)
                    if spawnLibre then
                        if next(SpawnedVehicles) ~= nil then
                            for k, v in pairs(SpawnedVehicles) do
                                DeleteEntity(v.vehicle)
                            end
                        end
                        Wait(100)

                        esx.TriggerServerCallback('esx_trabajos:PayBoard', function(hasEnoughMoney)
                        
                        if hasEnoughMoney then    
                        esx.Game.SpawnVehicle(data.current.value,vector3(workConfig.spawnCoordsVeh.x, workConfig.spawnCoordsVeh.y, workConfig.spawnCoordsVeh.z),workConfig.spawnCoordsVeh.w, function(spawnedVehicle)
                            TriggerEvent("LegacyFuel:SetFuel", spawnedVehicle, 100)
                            TriggerEvent("esx_trabajos:insertTableVehicle",spawnedVehicle)
                            TriggerEvent("esx_lockpick:giveKey", spawnedVehicle)
                        end) 
                        else
                            FinishWork()
                            esx.ShowNotification("No tienes suficiente dinero")
                        end
                    end)
                    else
                        return
                    end
                end
                if(workConfig.finishActivity)then
                    FinishWork()
                end
                menu.close()
            end, function(data, menu) 
                menu.close() 
            end)
        elseif (workConfig.typeOfMission == "skinoff") then
            esx.TriggerServerCallback("esx_skin:getPlayerSkin",function(skin)
                TriggerEvent("skinchanger:loadSkin", skin)
                TriggerEvent('dpc:ApplyClothing')
            end)
            workskin = false
        elseif workConfig.typeOfMission == "deletecar" then
            local vehicle = GetVehiclePedIsIn(PlayerPedId())
            if workConfig.plate ~= nil and starts_with(GetVehicleNumberPlateText(vehicle), workConfig.plate) == true  then
                TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
                Citizen.Wait(2000)
                esx.Game.DeleteVehicle(vehicle)
            elseif workConfig.plate ~= nil and starts_with(GetVehicleNumberPlateText(vehicle), workConfig.plate) == false  then
                esx.ShowNotification("Al parecer este no es el vehículo que te hemos entregado, espero que no estés haciendo trampas..")
                return
            elseif workConfig.plate == nil then
                TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
                Citizen.Wait(2000)
                esx.Game.DeleteVehicle(vehicle)
            end
        elseif workConfig.typeOfMission == "checkcar" then
            local vehicle = GetVehiclePedIsIn(PlayerPedId())
            if workConfig.plate ~= nil and starts_with(GetVehicleNumberPlateText(vehicle), workConfig.plate) == true  then
                TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
            elseif workConfig.plate ~= nil and starts_with(GetVehicleNumberPlateText(vehicle), workConfig.plate) == false  then
                esx.ShowNotification("Al parecer este no es el vehículo que te hemos entregado, espero que no estés haciendo trampas..")
                return
            end
        elseif workConfig.typeOfMission == "commandexec" then
            ExecuteCommand(workConfig.command)
            if workConfig.notification ~= nil then
                esx.ShowNotification(workConfig.notification, 10000)
            end
        elseif workConfig.typeOfMission == "carta" then
            local noteTemplate = DrawTextTemplate()
            noteTemplate.x = 0.5
            noteTemplate.y = 0.5
            noteTemplate.text = "Encuentra al vendedor. \nNo tardes."
            DrawSprite("commonmenu","", 0.5,0.53, 0.2,0.1,0.0, 125,125,125,200)
            DrawText(noteTemplate)
        elseif workConfig.typeOfMission == "enter_circle" then
            esx.ShowNotification('Has fumigado por la zona')
        elseif workConfig.typeOfMission == "processWaiting" then
            ExecuteCommand(workConfig.anim)
            if workConfig.wait ~= nil then
                Citizen.Wait(workConfig.wait)
            end
            if workConfig.item ~= nil and workConfig.count ~= nil and workConfig.afterMission == "give_items" then
                esx.TriggerServerCallback('esx_trabajos:addItems', function(listo)
                    if(listo)then
                        esx.ShowNotification('Has recogido un ' .. workConfig.item)
                    else
                        return 
                    end
                end, workConfig.item, workConfig.count, workName)
            end
            FreezeEntityPosition(playerPed, false)
            ExecuteCommand("e c")
        elseif workConfig.typeOfMission == "give_items" then
            if(workConfig.item ~= nil and workConfig.count ~= nil)then
                esx.TriggerServerCallback('esx_trabajos:addItems', function(listo)
                    if(listo)then
                        esx.ShowNotification('Has recogido un ' .. workConfig.item)
                    else
                        return 
                    end
                end, workConfig.item, workConfig.count, workName)
            end
        elseif workConfig.typeOfMission == "tpToCoords" then
            local _playerPed = GetPlayerPed(-1)
            SetEntityCoords(_playerPed, vector3(workConfig.spawnCoordsPed.x, workConfig.spawnCoordsPed.y, workConfig.spawnCoordsPed.z))
            SetEntityHeading(_playerPed, workConfig.spawnCoordsPed.w)
            if(workConfig.finishActivity)then
                FirstPullNpcs()
            end
        elseif workConfig.typeOfMission == "loot" then
            local playerPed = GetPlayerPed(-1)
            FreezeEntityPosition(playerPed, true)
            ExecuteCommand(workConfig.animation)
            Citizen.Wait(workConfig.animationDuration)
            FreezeEntityPosition(playerPed, false)
            ClearPedTasks(playerPed)
        elseif workConfig.typeOfMission == "spawncar" then
            local spawnLibre = true
            spawnLibre = spawnLibre and esx.Game.IsSpawnPointClear(workConfig.coordsToSpawn, 5)
            if spawnLibre then
                local carName = workConfig.model[math.random(1, #workConfig.model)]
                esx.Game.SpawnVehicle(carName,workConfig.coordsToSpawn,workConfig.coordsHeading, function(spawnedVehicle)
                    SetVehicleNumberPlateText(spawnedVehicle, workConfig.platePrefix .. " " .. math.random(111, 999))
                    local plate = workConfig.platePrefix
                    SetVehicleNumberPlateText(spawnedVehicle, plate)
                    SetVehicleNumberPlateText(spawnedVehicle, workConfig.platePrefix .. " " .. math.random(111, 999))
                    TriggerEvent("LegacyFuel:SetFuel", spawnedVehicle, 100)
                    TriggerEvent("esx_trabajos:insertTableVehicle",spawnedVehicle)
                    TriggerEvent("esx_lockpick:giveKey", spawnedVehicle)
                end)              
            else
                return
            end
        end
        local _removed = false
        if(workConfig.removeItems)then
            esx.TriggerServerCallback('esx_trabajos:removeItems', function(removed)
                if(not removed)then
                    _removed = false
                    FinishWork(true)
                    Citizen.Wait(4000)
                else 
                    _removed = true
                end  
            end, workConfig.removeItems)
        end
        if(workConfig.giveItems and stepClient ~= nil)then
            TriggerServerEvent("esx_trabajos:giveItems", workConfig.giveItems)
        end
        if(workConfig.automaticPassStep == nil or workConfig.automaticPassStep == true)then
            stepClient = workStep + 1
            SpawnPedsDuringMission(workName, stepClient, workConfig)
        end
        if(workConfig.endActivity)then
            FinishWork(true)
        end
        if(workConfig.removeEntity == nil or workConfig.removeEntity == true)then
            RemoveWorkEntity(workName, workStep, false)
            RemoveMarker(workName, workStep, false)
        end
    end
end



RegisterNetEvent('esx_trabajos:insertTableVehicle')
AddEventHandler('esx_trabajos:insertTableVehicle', function(vehicle)
    table.insert(SpawnedVehicles, {vehicle = vehicle})
end)

function starts_with(str, start)
	if str:sub(1, #start) == start then
		return true
	else
		return false
	end
end

function RemoveWorkEntity(workName, workStep, inmediatly)
    local index = nil
    for i, activeWork in ipairs(PedTable) do
        if (activeWork.CurrentWorkName == workName and (workStep == nil or activeWork.step == workStep)) then
            index = i

            if (activeWork.ped ~= nil) then
                if (inmediatly) then
                    SetEntityAsMissionEntity(activeWork.ped, false, false)
                    DeletePed(activeWork.ped)
                else
                    FreezeEntityPosition(activeWork.ped, false)
                    ClearPedTasksImmediately(activeWork.ped)
                    SetTimeout(5000,function()
                        SetEntityAsMissionEntity(activeWork.ped, false, false)
                        DeletePed(activeWork.ped)
                    end)
                end
            end
            break
        end
    end
    if (index ~= nil) then
        table.remove(PedTable, index)
    end
end

function RemoveMarker(workName, workStep, inmediatly)
    for i, activeWork in ipairs(PedTable) do
        if (activeWork.CurrentWorkName == workName and (workStep == nil or activeWork.step == workStep)) then
            index = i
            break
        end
    end
    if (index ~= nil) then
        table.remove(PedTable, index)
    end
end

-- TP PARA LAS MIERDAS

function TpToCoords(data)
    local _playerPed = GetPlayerPed(-1)
    SetEntityCoords(_playerPed, vector3(data.coordsTp.x, data.coordsTp.y, data.coordsTp.z))
    SetEntityHeading(_playerPed, data.coordsTp.w)
end

---

Citizen.CreateThread(function()
    local show_use_notification = false
    while true do
        Citizen.Wait(1)
        if CurrentMissionWork then
            if CurrentMissionConfigure.missionToDo == "directo" then

                SelectMissionToDo(CurrentMissionWork,CurrentMissionConfigure, CurrentMissionStep)
                CurrentMissionWork = nil    
            else
                local message_notification = "Interactuar con la persona"
                if CurrentMissionConfigure.floatingMsg ~= nil then
                    message_notification = CurrentMissionConfigure.floatingMsg
                end
                if not show_use_notification then
                    TriggerEvent("interface:use_notification:show", 'E', message_notification)
                    show_use_notification = true
                end
                if IsControlJustReleased(0, 38) then
                    if (CurrentMissionConfigure.jobNeeded == nil or HasJobNeeded(CurrentMissionConfigure.jobNeeded)) then
                        if(not CurrentMissionConfigure.dmvLicense or (_hasDmvSchoolLicense and CurrentMissionConfigure.dmvLicense))then
                            SelectMissionToDo(CurrentMissionWork,CurrentMissionConfigure, CurrentMissionStep)
                            CurrentMissionWork = nil
                        else
                            esx.ShowNotification("¡Necesitas tener el carnet de conducir para realizar el trabajo!", 5000, "error")
                        end
                    else
                        esx.ShowNotification("No tienes el trabajo necesario para realizar esta actividad!", 5000, "error")
                    end
                end
            end
        else
            if show_use_notification then
                TriggerEvent("interface:use_notification:hide")
                show_use_notification = false
            end
        end
    end
end)

function HasJobNeeded(job)
	if PlayerData.job ~= nil and PlayerData.job.name == job then
		return true, PlayerData.job
	elseif PlayerData.job2 ~= nil and PlayerData.job2.name == job then
		return true, PlayerData.job2
	end
	return false
end

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

function DebugLog(args)
    if Config.DebugLog then
        print("^2[esx_trabajos]^0 " .. args)
    end
end