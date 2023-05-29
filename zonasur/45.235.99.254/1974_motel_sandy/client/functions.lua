GlobalFunction = function(event, data)
    local options = {
        event = event,
        data = data
    }

    TriggerServerEvent("1974_motel_sandy:globalEvent", options)
end

function Init()
    StartMotel()
    CheckIfInsideMotel()
end

OpenMotelRoomMenu = function(motelRoom)
    local menuElements = {}

    local cachedMotelRoom = cachedData["motels"][motelRoom]

    if cachedMotelRoom then
        for roomIndex, roomData in ipairs(cachedMotelRoom["rooms"]) do
            local roomData = roomData["motelData"]

            local allowed = roomData["displayLabel"] == ESX.PlayerData["character"]["firstname"] .. " " .. ESX.PlayerData["character"]["lastname"]

            table.insert(menuElements, {
                ["label"] = allowed and "Entrar a la habitación de " .. roomData["displayLabel"] .. "" or roomData["displayLabel"] .. " - Esta cerrada prueba a tocar la puerta.",
                ["action"] = roomData,
                ["allowed"] = allowed
            })
        end
    end

    if #menuElements == 0 then
        table.insert(menuElements, {
            ["label"] = "Esta habitación no ha sido alquilada aún."
        })
    end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "main_motel_menu", {
        ["title"] = "Motel",
        ["align"] = Config.AlignMenu,
        ["elements"] = menuElements
    }, function(menuData, menuHandle)
        local action = menuData["current"]["action"]
        local allowed = menuData["current"]["allowed"]

        if action then
            menuHandle.close()

            if allowed then
                EnterMotel(action)
            else
                PlayAnimation(PlayerPedId(), "timetable@jimmy@doorknock@", "knockdoor_idle")

                --GlobalFunction("knock_motel", action)
            end
        end
    end, function(menuData, menuHandle)
        menuHandle.close()
    end)
end

OpenInviteMenu = function(motelRoomData)
	local playersInArea = ESX.Game.GetPlayersInArea(GetMotelFromConfig(motelRoomData["room"]), 3.0)
	local elements      = {}
	
	 if #playersInArea <= 0 then
        return ESX.ShowNotification("No hay nadie afuera.")
    end

	for i=1, #playersInArea, 1 do
		if playersInArea[i] ~= PlayerId() then
			table.insert(elements, {label = GetPlayerName(playersInArea[i]), value = GetPlayerServerId(playersInArea[i])})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_invite', {
		title = 'Invitar a alguien',
		align = 'bottom-right',
		elements = elements,
	}, function(data, menu)
		local action = data.current.value
        if action then
            menu.close()
            GlobalFunction("invite_player", {
                ["motel"] = motelRoomData,
                ["player"] = action
            })
        end
	end, function(data, menu)
		menu.close()
	end)
end

EnterMotel = function(motelRoomData)
    if cachedData["insideMotel"] then 
        ExitInstance() 
        
        cachedData["insideMotel"] = false
    end

    DoScreenFadeOut(100)

    while not IsScreenFadedOut() do
        Citizen.Wait(5)
    end

    cachedData["insideMotel"] = true

    ESX.Game.Teleport(PlayerPedId(), Config.MotelInterior["exit"], function()
        FreezeEntityPosition(PlayerPedId(), true)

        EnterInstance(motelRoomData["uniqueId"])

        while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
            Citizen.Wait(100)
        end

        DoScreenFadeIn(100)

        FreezeEntityPosition(PlayerPedId(), false)
    end)

    local tmpPos = nil
    while cachedData["insideMotel"] do
        local sleepThread = 500

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)


        for action, position in pairs(Config.MotelInterior) do
            local dstCheck = GetDistanceBetweenCoords(pedCoords, position, true)
            if tmpPos ~= nil then
                if GetDistanceBetweenCoords(pedCoords, tmpPos, true) > 2.0 then
                    ESX.UI.Menu.CloseAll()
                    tmpPos = nil
                end
            end

            if dstCheck <= 5.0 then
                sleepThread = 5

                if dstCheck <= 0.9 then
                    local displayText = "[~g~E~s~] " .. Config.ActionLabel[action] or action

                    DrawScriptText(position, displayText)

                    if IsControlJustPressed(0, 38) then
                        DoMotelAction(action, motelRoomData)
                        tmpPos = pedCoords
                    end
                end
            end
        end

        Citizen.Wait(sleepThread)
    end

    ESX.Game.Teleport(PlayerPedId(), GetMotelFromConfig(motelRoomData["room"]), function()
        FreezeEntityPosition(PlayerPedId(), true)
        
        while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
            Citizen.Wait(100)
        end
        
        DoScreenFadeIn(100)
        
        FreezeEntityPosition(PlayerPedId(), false)
        
        ExitInstance()
    end)
end

OpenHotelSandy = function()
    if GetPlayerMotel() then return ESX.ShowNotification("Ya tienes una habitación.") end
    
    cachedData["purchasing"] = true
    
    cachedData["cams"] = {
        ["first"] = CreateAnimatedCam({ ["x"] = 313.4732, ["y"] = 2630.453, ["z"] = 48.394, ["rotationX"] = 0.0, ["rotationY"] = 0.0, ["rotationZ"] = 210.0 }),
        ["second"] = CreateAnimatedCam({ ["x"] = 317.8032, ["y"] = 2638.902, ["z"] = 52.054, ["rotationX"] = 0.0, ["rotationY"] = 0.0, ["rotationZ"] = 210.0 }),
        ["third"] = CreateAnimatedCam({ ["x"] = 326.2865, ["y"] = 2632.725, ["z"] = 47.812, ["rotationX"] = 0.0, ["rotationY"] = 0.0, ["rotationZ"] = 230.0 }),
        --["fourth"] = CreateAnimatedCam({ ["x"] = 365.2517, ["y"] = 2664.872, ["z"] = 51.394, ["rotationX"] = 0.0, ["rotationY"] = 0.0, ["rotationZ"] = 210.0 })
    }

    RenderScriptCams(true, true, 1500, true, true)

    HandleCam("first", "second", 2000)
    
    Citizen.Wait(1000)
    
    HandleCam("second", "third", 5000)
    
    Citizen.Wait(4500)
    
    Citizen.CreateThread(function()
        local currentMotel = 1
        
		--[[
        local CheckCam = function()
            if currentMotel > 10 and not cachedData["positive"] then
                cachedData["positive"] = true

                HandleCam("third", "fourth", 2000)
            elseif currentMotel <= 10 and cachedData["positive"] then
                cachedData["positive"] = false

                HandleCam("fourth", "third", 2000)
            end
        end
		]]--

        while cachedData["purchasing"] do
            Citizen.Wait(0)

            local markerPos = GetMotelFromConfig(currentMotel)

            if IsControlJustPressed(0, 191) then
                OpenConfirmBox(currentMotel)
            elseif IsControlJustPressed(0, 175) then
                if GetMotelFromConfig(currentMotel - 1) then
                    currentMotel = currentMotel - 1
                else
                    if currentMotel - 2 < 1 then
                        currentMotel = 10
                    else
                        currentMotel = currentMotel - 2
                    end
                end
            elseif IsControlJustPressed(0, 174) then
                if GetMotelFromConfig(currentMotel + 1) then
                    currentMotel = currentMotel + 1
                else
                    if currentMotel + 2 > 10 then
                        currentMotel = 1
                    else
                        currentMotel = currentMotel + 2
                    end
                end
            elseif IsControlJustPressed(0, 202) then
                Cleanup()

                cachedData["purchasing"] = false
            end

            BeginTextCommandDisplayHelp("Instructions")
            EndTextCommandDisplayHelp(0, 0, 1, -1)

            --CheckCam()

            DrawScriptMarker({
                ["type"] = 2,
                ["pos"] = markerPos,
                ["r"] = 0,
                ["g"] = 255,
                ["b"] = 0,
                ["sizeX"] = 0.4,
                ["sizeY"] = 0.4,
                ["sizeZ"] = 0.4,
                ["rotate"] = true
            })
        end
    end)
end

OpenConfirmBox = function(motelRoom)
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "main_accept_motel", {
        ["title"] = "¿Quieres comprar la #" .. motelRoom .. "?",
        ["align"] = Config.AlignMenu,
        ["elements"] = {
            {
                ["label"] = "Sí, confirmar compra.",
                ["action"] = "yes"
            },
            {
                ["label"] = "No, cancelar.",
                ["action"] = "no"
            }
        }
    }, function(menuData, menuHandle)
        local action = menuData["current"]["action"]

        if action == "yes" then
            ESX.TriggerServerCallback("1974_motel_sandy:buyMotel", function(bought)
                if bought == 1 then
                    ESX.ShowNotification("Has comprado la habitación #" .. motelRoom)
                    Cleanup()
                    cachedData["purchasing"] = false
				elseif bought == 2 then
					ESX.ShowNotification("Hubo un error al Alquilar el Motel!")
                elseif bought == 3 then
                    ESX.ShowNotification("No tienes suficiente dinero.")
                end

                menuHandle.close()
            end, motelRoom)
        else
            menuHandle.close()
        end
    end, function(menuData, menuHandle)
        menuHandle.close()
    end)
end

OpenWardrobe = function()
	local elements = {}
	table.insert(elements, {label = 'Ropero', value = 'player_dressing'})
	table.insert(elements, {label = 'Eliminar outfit', value = 'suppr_cloth'})

	ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_main', {
      title    = 'Ropas',
      align    = 'bottom-right',
      elements = elements,
    }, function(data, menu)
	menu.close()
      if data.current.value == 'player_dressing' then
		
        ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
          local elements = {}

          for i=1, #dressing, 1 do
            table.insert(elements, {label = dressing[i], value = i})
          end

          ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
              title    = 'Ropero',
              align    = 'bottom-right',
              elements = elements,
            }, function(data, menu)

              TriggerEvent('skinchanger:getSkin', function(skin)

                ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes)

                  TriggerEvent('skinchanger:loadClothes', skin, clothes)
                  TriggerEvent('esx_skin:setLastSkin', skin)

                  TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                  end)
				  
				  ESX.ShowNotification('Tu vestimenta ha cargado correctamente')
				  HasLoadCloth = true
				  payedMoney = false
                end, data.current.value)
              end)
            end, function(data, menu)
              menu.close()
			  
			  CurrentAction     = 'shop_menu'
			  CurrentActionMsg  = 'Presion ~y~ E ~w~para abrir el menú'
			  CurrentActionData = {}
            end
          )
        end)
      end
	  
	  if data.current.value == 'suppr_cloth' then
		ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
			local elements = {}

			for i=1, #dressing, 1 do
				table.insert(elements, {label = dressing[i], value = i})
			end
			
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'supprime_cloth', {
              title    = 'Borrar ropas',
              align    = 'bottom-right',
              elements = elements,
            }, function(data, menu)
			menu.close()
				TriggerServerEvent('esx_eden_clotheshop:deleteOutfit', data.current.value)
				  
				ESX.ShowNotification('Vestimenta borrada')

            end, function(data, menu)
              menu.close()
			  
			  CurrentAction     = 'shop_menu'
			  CurrentActionMsg  = 'Presion ~y~ E ~w~para abrir el menú'
			  CurrentActionData = {}
            end)
		end)
	  end
    end, function(data, menu)

      menu.close()

      CurrentAction     = 'room_menu'
      CurrentActionMsg  = 'Presion ~y~ E ~w~para abrir el menú'
      CurrentActionData = {}
    end)
end

DoMotelAction = function(action, motelRoomData)
    if action == "exit" then
        cachedData["insideMotel"] = false
    elseif action == "drawer" then
        OpenStorage(motelRoomData["owner"])
    elseif action == "wardrobe" then
        OpenWardrobe()
    elseif action == "invite" then
        OpenInviteMenu(motelRoomData)
    end
end

function GetPlayerMotel()
    for doorIndex, doorData in pairs(cachedData["motels"]) do
        for roomIndex, roomData in ipairs(doorData["rooms"]) do
            local roomData = roomData["motelData"]
			
            local allowed = roomData["owner"] == ESX.PlayerData.identifier

            if allowed then
                cachedData["cachedRoom"] = roomData
                return roomData
			end
        end
    end
    return false
end

DrawScriptMarker = function(markerData)
    DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0, markerData["sizeX"] or 1.0, markerData["sizeY"] or 1.0, markerData["sizeZ"] or 1.0, markerData["r"] or 1.0, markerData["g"] or 1.0, markerData["b"] or 1.0, 100, false, true, 2, false, false, false, false)
end

DrawScriptText = function(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords["x"], coords["y"], coords["z"])
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = string.len(text) / 370

    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 206, 206, 206, 70)
end

PlayAnimation = function(ped, dict, anim, settings)
	if dict then
        Citizen.CreateThread(function()
            RequestAnimDict(dict)

            while not HasAnimDictLoaded(dict) do
                Citizen.Wait(100)
            end

            if settings == nil then
                TaskPlayAnim(ped, dict, anim, 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
            else 
                local speed = 1.0
                local speedMultiplier = -1.0
                local duration = 1.0
                local flag = 0
                local playbackRate = 0

                if settings["speed"] then
                    speed = settings["speed"]
                end

                if settings["speedMultiplier"] then
                    speedMultiplier = settings["speedMultiplier"]
                end

                if settings["duration"] then
                    duration = settings["duration"]
                end

                if settings["flag"] then
                    flag = settings["flag"]
                end

                if settings["playbackRate"] then
                    playbackRate = settings["playbackRate"]
                end

                TaskPlayAnim(ped, dict, anim, speed, speedMultiplier, duration, flag, playbackRate, 0, 0, 0)
            end
      
            RemoveAnimDict(dict)
		end)
	else
		TaskStartScenarioInPlace(ped, anim, 0, true)
	end
end

CreateAnimatedCam = function(camIndex)
    local camInformation = camIndex

    if not cachedData["cams"] then
        cachedData["cams"] = {}
    end

    if cachedData["cams"][camIndex] then
        DestroyCam(cachedData["cams"][camIndex])
    end

    cachedData["cams"][camIndex] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

    SetCamCoord(cachedData["cams"][camIndex], camInformation["x"], camInformation["y"], camInformation["z"])
    SetCamRot(cachedData["cams"][camIndex], camInformation["rotationX"], camInformation["rotationY"], camInformation["rotationZ"])

    return cachedData["cams"][camIndex]
end

HandleCam = function(camIndex, secondCamIndex, camDuration)
    if camIndex == 0 then
        RenderScriptCams(false, false, 0, 1, 0)
        
        return
    end

    local cam = cachedData["cams"][camIndex]
    local secondCam = cachedData["cams"][secondCamIndex] or nil

    local InterpolateCams = function(cam1, cam2, duration)
        SetCamActive(cam1, true)
        SetCamActiveWithInterp(cam2, cam1, duration, true, true)
    end

    if secondCamIndex then
        InterpolateCams(cam, secondCam, camDuration or 5000)
    end
end

CheckIfInsideMotel = function()
    local insideMotel = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.MotelInterior["exit"]) <= 20.0

    if insideMotel then
        DoScreenFadeOut(500)

        while not IsScreenFadedOut() do
            Citizen.Wait(0)
        end

        local ownedMotel = GetPlayerMotel()

        if ownedMotel then
            EnterMotel(ownedMotel)
        else
            ESX.Game.Teleport(PlayerPedId(), Config.ReconnectSpawn["position"], function()
                ESX.ShowNotification("Te has desconectado dentro de tu motel, por eso has reaparecido aquí.")
            end)
        end

        DoScreenFadeIn(500)
    end
end

Cleanup = function()
    RenderScriptCams(false, false, 0, 1, 0)

    for camIndex, camThingy in pairs(cachedData["cams"]) do
        if DoesCamExist(camThingy) then
            DestroyCam(camThingy)
        end
    end
end

GetMotelFromConfig = function(motelIndex)
    local motel = nil
    for k,v in pairs(Config.LandLord) do
        if (v.MotelsEntrances[motelIndex] ~= nil) then
            motel = v.MotelsEntrances[motelIndex]
        end
    end
    return motel
end