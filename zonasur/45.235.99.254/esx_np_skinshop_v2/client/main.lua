
local hasAlreadyEnteredMarker, hasPaid, currentActionData = false, true, {}
local lastZone, currentAction, currentActionMsg
local currentZone = nil

ESX = nil
local inMenu = false
local PlayerData              = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing

function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function OpenShopMenu(zone)
	hasPaid = false
	inMenu = true
	print(zone)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'requestOutfit', {
		title = _U('outfit_menu'),
		align = 'bottom-right',
		elements = {
			{label = _U('outfit'), value = 'outfit'},
			{label = _U('buy'), value = 'clothes'}
		}
	},
	function(data, menu)
		if data.current.value == 'outfit' then

			ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)

				if dressing and dressing[1] ~= nil then --TESTEAR

					ESX.UI.Menu.CloseAll()
					ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'shop_enter_zone',
					{
						title = _U('outfit'),
						align = 'bottom-right',
						elements = {
							{label = _U('change_clothe'), value = 'change_cloth'},
							{label = _U('del_clothe'), value = 'del_cloth'},
						}
					},
					function(data, menu)
						if data.current.value == 'change_cloth' then
							ESX.UI.Menu.CloseAll()
							ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)

								local elements = {}

								for i=1, #dressing, 1 do
									table.insert(elements, {label = dressing[i], value = i})
								end

								ESX.UI.Menu.Open(
								'default', GetCurrentResourceName(), 'player_dressing',
								{
									title    = _U('choose_clothe'),
									align = 'bottom-right',
									elements = elements,
								},
								function(data2, menu)

									ESX.TriggerServerCallback('esx_np_skinshop:buyClothes', function(bought)
										if bought then
											TriggerEvent('skinchanger:getSkin', function(skin)

												ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes)

													TriggerEvent('skinchanger:loadClothes', skin, clothes)
													TriggerEvent('esx_skin:setLastSkin', skin)

													TriggerEvent('skinchanger:getSkin', function(skin)
														TriggerServerEvent('esx_skin:save', skin)
													end)

												end, data2.current.value)

											end)
											hasPaid = true
										else
											hasPaid = false
											ESX.ShowNotification('~r~No tenes dinero, solo cobramos en efectivo!')
										end
									end, zone)
									menu.close()
								end,
								function(data2, menu)
									menu.close()
								end)

							end)
						else
							ESX.UI.Menu.CloseAll()
							ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
								local elements = {}

								for i=1, #dressing, 1 do
									table.insert(elements, {label = dressing[i], value = i})
								end

								ESX.UI.Menu.Open(
								'default', GetCurrentResourceName(), 'remove_cloth',
								{
									title    = _U('which_delete'),
									align = 'bottom-right',
									elements = elements,
								},
								function(data2, menu)
									menu.close()
									TriggerServerEvent('esx_eden_clotheshop:removeOutfit', data2.current.value)
									ESX.ShowNotification(_U('clothe_delete'))
								end,
								function(data2, menu)
									menu.close()
								end)
							end)
						end
					end,
					function(data, menu)
						ESX.UI.Menu.CloseAll()
						CurrentAction = 'shop_menu'
					end)

				else
					ESX.ShowNotification(_U('no_outfit'))
				end

			end)
		else
			menu.close()
			TriggerEvent('skinchanger:getSkin', function(skin)
				TriggerServerEvent('esx_skin:save', skin)
			end)
			TriggerEvent("esx_np_skinshop:toggleMenu", "clotheshop")
		end
		currentAction     = 'shop_menu'
		currentActionMsg  = _U('press_menu')
		currentActionData = {}
	end,
	function(data, menu)
		menu.close()
		currentAction     = 'shop_menu'
		currentActionMsg  = _U('press_menu')
		currentActionData = {}
	end)
end

function openDialog(zone)
	--inMenu = true
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
		title = _U('valid_this_purchase'),
		align = 'bottom-right',
		elements = {
			{label = _U('no'), value = 'no'},
			{label = _U('yes', ESX.Math.GroupDigits(Config.Price)), value = 'yes'}
	}}, function(data, menu)
		menu.close()

		if data.current.value == 'yes' then
			ESX.TriggerServerCallback('esx_np_skinshop:buyClothes', function(bought)
				if bought then
					
					TriggerEvent('skinchanger:getSkin', function(skin)
						--print(json.encode(skin))
						TriggerServerEvent('esx_skin:save', skin)
					end)

					hasPaid = true

					ESX.TriggerServerCallback('esx_np_skinshop:checkPropertyDataStore', function(foundStore)
						if foundStore then
							ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'save_dressing', {
								title = _U('save_in_dressing'),
								align = 'bottom-right',
								elements = {
									{label = _U('no'),  value = 'no'},
									{label = _U('yes2'), value = 'yes'}
							}}, function(data2, menu2)
								menu2.close()

								if data2.current.value == 'yes' then
									ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
										title = _U('name_outfit')
									}, function(data3, menu3)
										menu3.close()

										TriggerEvent('skinchanger:getSkin', function(skin)
											TriggerServerEvent('esx_np_skinshop:saveOutfit', data3.value, skin)
											ESX.ShowNotification(_U('saved_outfit'))
										end)
									end, function(data3, menu3)
										menu3.close()
										--inMenu = false
									end)
								end
							end)
						end
					end)

				else
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
					end)
					--inMenu = false
					ESX.ShowNotification('~r~No tenes dinero, solo cobramos en efectivo!')
				end
			end, zone)
		elseif data.current.value == 'no' then
			--inMenu = false
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end

		currentAction     = 'shop_menu'
		--inMenu = false
		currentActionMsg  = _U('press_menu')
		currentActionData = {}
	end, function(data, menu)
		menu.close()

		currentAction     = 'shop_menu'
		--inMenu = false
		currentActionMsg  = _U('press_menu')
		currentActionData = {}
	end)
end

RegisterNUICallback("endDialog", function(data)
	print(currentZone)
	TriggerEvent("esx_np_skinshop:toggleMenu")
	if data == "clothes" then
		openDialog(currentZone)
	else
		TriggerEvent("esx_newaccessories:endDialog")
	end
end)

AddEventHandler('esx_np_skinshop:hasEnteredMarker', function(zone)
	currentAction     = 'shop_menu'
	currentActionMsg  = _U('press_menu')
	currentActionData = {}
end)

AddEventHandler('esx_np_skinshop:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	currentAction = nil
	inMenu = false
	
	if not hasPaid then
		TriggerEvent('esx_skin:getLastSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
	end
	
end)

-- Create Blips
Citizen.CreateThread(function()
	for k,v in ipairs(Config.Shops) do
		local blip = AddBlipForCoord(v.blip)

		SetBlipSprite (blip, 73)
		
		if v.owner then
			SetBlipColour (blip, 2)
		else
			SetBlipColour (blip, 47)
		end
		SetBlipScale(blip, 0.7)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('clothes'))
		EndTextCommandSetBlipName(blip)
	end
end)

-- Enter / Exit marker events & draw markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords, isInMarker, letSleep = GetEntityCoords(PlayerPedId()), false, true

		for k,v in pairs(Config.Shops) do
			local distance = #(playerCoords - v.blip)

			if distance < Config.DrawDistance then
				letSleep = false
				DrawMarker(Config.MarkerType, v.blip, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, nil, nil, false)

				if distance < Config.MarkerSize.x then
					isInMarker, currentZone = true, k
				end
			end
		end

		if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
			hasAlreadyEnteredMarker, lastZone = true, currentZone
			TriggerEvent('esx_np_skinshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_np_skinshop:hasExitedMarker', lastZone)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		
		if currentAction and not inMenu then
			ESX.ShowHelpNotification(currentActionMsg)

			if IsControlJustReleased(0, 38) then
				if currentAction == 'shop_menu' then
					OpenShopMenu(currentZone)
				end

				currentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k, v in pairs(Config.Shops) do
			if v.owner and PlayerData.identifier == v.owner then
				local distance = #(coords - v.menu)
				if distance < 20 then
					DrawMarker(3, v.menu.x, v.menu.y, v.menu.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
					if distance < 1.5 and not isProcessing then
						Drawing.draw3DText(v.menu.x, v.menu.y, v.menu.z - 1.0, '~g~[E]~w~ para abrir menu ~g~DUEÑO~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
						if IsControlJustPressed(1, 38) then
							print(k)
							MenuJefe(k)
						end
					end
				end
			end
		end
	end
end)

function MenuJefe(ropa)
	local options = {
        wash      = true,
    }

    ESX.UI.Menu.CloseAll()

	TriggerEvent('esx_society:openBossMenu_zs', 'ropa'..ropa, function(data, menu)
		menu.close()
	end,options)
end
