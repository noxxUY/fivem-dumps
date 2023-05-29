ESX = exports["es_extended"]:getSharedObject()

local Wait = false
local moneyismoneylan = false

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        local time = 1000
        if QBCore then
            for k, v in pairs(Config.Locations) do
                local PlayerPed = PlayerPedId()
                local VehicleInPed = GetVehiclePedIsIn(PlayerPed)
                local PlayerCoords = GetEntityCoords(PlayerPed)
                local distance = #(PlayerCoords - vector3(Config.Locations[k]['coords'].x, Config.Locations[k]['coords'].y, Config.Locations[k]['coords'].z))
                if distance < 50 then 
                    time = 1
                    DrawMarker(2, Config.Locations[k]['coords'].x, Config.Locations[k]['coords'].y, Config.Locations[k]['coords'].z+0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 71, 155, 155, 185, false, true, 2, false, false, false, false)
                    if distance < 2.5 then
                        QBCore.Functions.DrawText3D(Config.Locations[k]['coords'].x, Config.Locations[k]['coords'].y, Config.Locations[k]['coords'].z+1, "~b~[E] ~w~Car Wash ~g~"..Config.CarWashAmounth.." $ ~w~.. ")
                        if IsControlJustReleased(0, 38) and not Wait then
                            TriggerServerEvent("magicarrow-carwash:moneycontrol")
                        end
                    end
                end
            end
        else
            for k, v in pairs(Config.Locations) do
                local PlayerPed = PlayerPedId()
                local VehicleInPed = GetVehiclePedIsIn(PlayerPed)
                local PlayerCoords = GetEntityCoords(PlayerPed)
                local distance = #(PlayerCoords - vector3(Config.Locations[k]['coords'].x, Config.Locations[k]['coords'].y, Config.Locations[k]['coords'].z))
                if distance < 50 then 
                    time = 1
                    DrawMarker(2, Config.Locations[k]['coords'].x, Config.Locations[k]['coords'].y, Config.Locations[k]['coords'].z+0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 71, 155, 155, 185, false, true, 2, false, false, false, false)
                    if distance < 2.5 then
                        DrawText3D(Config.Locations[k]['coords'].x, Config.Locations[k]['coords'].y, Config.Locations[k]['coords'].z+1, "~b~[E] ~w~Car Wash ~g~"..Config.CarWashAmounth.." $ ~w~.. ")
                        if IsControlJustReleased(0, 38) and not Wait then
                            TriggerServerEvent("magicarrow-carwash:moneycontrol")
                        end
                    end
                end
            end
        end
        Citizen.Wait(time)
    end
end)

RegisterNetEvent('magicarrow-carwash:washprop')
AddEventHandler('magicarrow-carwash:washprop', function()
    local playerPed = PlayerPedId()
    if QBCore then
        QBCore.Functions.SpawnObject('prop_carwash_roller_vert', {x = 26.32478, y = -1389.74, z = 29.366}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
        end)
        QBCore.Functions.SpawnObject('prop_carwash_roller_vert', {x = 26.23478, y = -1393.70, z = 29.314}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
        end)
        QBCore.Functions.SpawnObject('prop_carwash_roller_vert', {x = -697.705, y = -932.892, z = 19.013}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
        end)
        QBCore.Functions.SpawnObject('prop_carwash_roller_vert', {x = -702.270, y = -933.074, z = 19.013}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
        end)
    else
        ESX.Game.SpawnObject('prop_carwash_roller_vert', {x = 26.32478, y = -1389.74, z = 29.366}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
        end)
        ESX.Game.SpawnObject('prop_carwash_roller_vert', {x = 26.23478, y = -1393.70, z = 29.314}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
        end)
        ESX.Game.SpawnObject('prop_carwash_roller_vert', {x = -697.705, y = -932.892, z = 19.013}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
        end)
        ESX.Game.SpawnObject('prop_carwash_roller_vert', {x = -702.270, y = -933.074, z = 19.013}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
        end)
    end
end)
 

RegisterNetEvent('magicarrow-carwash:waterefectstart')
AddEventHandler('magicarrow-carwash:waterefectstart', function()
	local ped = PlayerPedId()
	TriggerServerEvent("magicarrow-carwash-server:watereffect", GetEntityCoords(ped))
    Citizen.Wait(200)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "washingsounds", 0.2)
end)

RegisterNetEvent("magicarrow-carwash:watereffect")
AddEventHandler("magicarrow-carwash:watereffect", function(coords)
	if #(coords - GetEntityCoords(PlayerPedId())) < 150 then
		SetPtfxAssetNextCall("core")
        local Wash = StartParticleFxLoopedAtCoord("water_splash_vehicle", coords.x,coords.y, coords.z+1.0, 10.0, 10.0, 10.0, 15.0, true, false, false, true)
		SetParticleFxLoopedAlpha(Wash, 100.0)
		SetParticleFxLoopedColour(Wash, 255.0, 255.0, 255.0, 0)
        Citizen.Wait(1000)
		StopParticleFxLooped(Wash, 0)
	end
end)

RegisterNetEvent("magicarrow-carwash:watereffect2")
AddEventHandler("magicarrow-carwash:watereffect2", function(coords)
    Citizen.Wait(1000)
	if #(coords - GetEntityCoords(PlayerPedId())) < 150 then
		SetPtfxAssetNextCall("core")
		local Wash2 = StartParticleFxLoopedAtCoord("water_splash_vehicle", coords.x,coords.y, coords.z+1.0, 10.0, 10.0, 10.0, 15.0, true, false, false, true)
		SetParticleFxLoopedAlpha(Wash2, 1.0)
		SetParticleFxLoopedColour(Wash2, 255.0, 255.0, 255.0, 0)
        Citizen.Wait(1000)
		StopParticleFxLooped(Wash2, 0)
	end
end)

RegisterNetEvent("magicarrow-carwash:watereffect3")
AddEventHandler("magicarrow-carwash:watereffect3", function(coords)
    Citizen.Wait(2000)
	if #(coords - GetEntityCoords(PlayerPedId())) < 150 then
		SetPtfxAssetNextCall("core")
		local Wash3 = StartParticleFxLoopedAtCoord("water_splash_vehicle", coords.x,coords.y, coords.z+1.0, 10.0, 10.0, 10.0, 15.0, true, false, false, true)
		SetParticleFxLoopedAlpha(Wash3, 1.0)
		SetParticleFxLoopedColour(Wash3, 255.0, 255.0, 255.0, 0)
        Citizen.Wait(1000)
		StopParticleFxLooped(Wash3, 0)
	end
end)

RegisterNetEvent("magicarrow-carwash:watereffect4")
AddEventHandler("magicarrow-carwash:watereffect4", function(coords)
    Citizen.Wait(3500)
	if #(coords - GetEntityCoords(PlayerPedId())) < 150 then
		SetPtfxAssetNextCall("core")
		local Wash4 = StartParticleFxLoopedAtCoord("water_splash_vehicle", coords.x,coords.y, coords.z+1.0, 10.0, 10.0, 10.0, 15.0, true, false, false, true)
		SetParticleFxLoopedAlpha(Wash4, 1.0)
		SetParticleFxLoopedColour(Wash4, 255.0, 255.0, 255.0, 0)
        Citizen.Wait(1000)
		StopParticleFxLooped(Wash4, 0)
	end
end)

RegisterNetEvent("magicarrow-carwash:moneyisaccepted")
AddEventHandler("magicarrow-carwash:moneyisaccepted", function()
    local PlayerPed = PlayerPedId()
    local VehicleInPed = GetVehiclePedIsIn(PlayerPed)
    local PlayerCoords = GetEntityCoords(PlayerPed)
    if QBCore then
        TriggerEvent("magicarrow-carwash:washprop")
        TriggerEvent("magicarrow-carwash:waterefectstart")
        Wait = true
        QBCore.Functions.Progressbar("car_wash", "Washing Car...", 6250, false, true, { -- p1: menu name, p2: yazı, p3: ölü iken kullan, p4:iptal edilebilir
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
        SetVehicleDirtLevel(VehicleInPed)
        SetVehicleUndriveable(VehicleInPed, false)
        WashDecalsFromVehicle(VehicleInPed, 1.0)
        DeleteObject()
        Wait = false
    end, function() -- Cancel
            DeleteObject()
            Wait = false
        end)
    else
        TriggerEvent("magicarrow-carwash:washprop")
        TriggerEvent("magicarrow-carwash:waterefectstart")
        Wait = true
            TriggerEvent("mythic_progbar:client:progress", {
                duration = 6250,
                label = "Washing Car...",
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
            }, function(status)
            if not status then
                SetVehicleDirtLevel(VehicleInPed)
                SetVehicleUndriveable(VehicleInPed, false)
                WashDecalsFromVehicle(VehicleInPed, 1.0)
                DeleteObject()
                Wait = false
            end
        end)
    end
end)

local TakeObject = {
    {objeAdi = "Wash", hash = -382832258},
}

-- RegisterCommand('deneme', function()
--     DeleteObject()
-- end)

function DeleteObject()
    if Config.framework == "esx" then
        local yakindakiObjeler = ESX.Game.GetObjects()
        for x=1, #yakindakiObjeler do
            local yakinObjeHash = GetEntityModel(yakindakiObjeler[x])
            for i=1, #TakeObject do
                if TakeObject[i].hash == yakinObjeHash then
                    ESX.Game.DeleteObject(yakindakiObjeler[x])
                    break
                end
            end
        end
    elseif Config.framework == "qb" then
        local yakindakiObjeler = QBCore.Functions.GetObjects()
        for x=1, #yakindakiObjeler do
            local yakinObjeHash = GetEntityModel(yakindakiObjeler[x])
            for i=1, #TakeObject do
                if TakeObject[i].hash == yakinObjeHash then
                    QBCore.Functions.DeleteObject(yakindakiObjeler[x])
                    break
                end
            end
        end
    end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end