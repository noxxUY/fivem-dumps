ESX = nil
local GUI, CurrentActionData = {}, {}
GUI.Time = 0
local LastZone, CurrentAction, CurrentActionMsg
local payedMoney, HasPayed, HasLoadCloth, HasAlreadyEnteredMarker = false, false, false, false
local currentActionCoords

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenShopMenu()
	payedMoney = false
  local elements = {}

  table.insert(elements, {label = ('Comprar ropa'),  value = 'shop_clothes'})
  table.insert(elements, {label = ('Conjuntos guardados'), value = 'player_dressing'})
  table.insert(elements, {label = ('Borrar conjunto'), value = 'suppr_cloth'})

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_main', {
      title    = ('Ropa'),
      align    = 'bottom-right',
      elements = elements,
    }, function(data, menu)
	menu.close()

      if data.current.value == 'shop_clothes' then
			HasPayed = false

	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)

		menu.close()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
				title = '¿Quieres comprar la ropa?',
				align = 'bottom-right',
				elements = {
					{label = 'Si', value = 'yes'},
					{label = 'No', value = 'no'},
				}
			}, function(data, menu)

				menu.close()

				if data.current.value == 'yes' then

					ESX.TriggerServerCallback('esx_eden_clotheshop:checkMoney', function(hasEnoughMoney)

						if hasEnoughMoney then

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)

							TriggerServerEvent('esx_eden_clotheshop:pay')

							HasPayed = true
							payedMoney = true

							ESX.TriggerServerCallback('esx_eden_clotheshop:checkPropertyDataStore', function(foundStore)

								if foundStore then

									ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'save_dressing', {
											title = '¿Quieres guardar el conjunto?',
											align = 'bottom-right',
											elements = {
												{label = 'Si', value = 'yes'},
												{label = 'No',  value = 'no'},
											}
										}, function(data2, menu2)

											menu2.close()

											if data2.current.value == 'yes' then

												ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
														title = 'Nombre del outfit',
													}, function(data3, menu3)

														menu3.close()

														TriggerEvent('skinchanger:getSkin', function(skin)
															TriggerServerEvent('esx_eden_clotheshop:saveOutfit', data3.value, skin)
														end)

														ESX.ShowNotification('Guardaste el outfit correctamente')

													end, function(data3, menu3)
														menu3.close()
													end)
											end
										end)
								end
							end)

						else

							ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
								TriggerEvent('skinchanger:loadSkin', skin)
							end)

							ESX.ShowNotification('No tienes suficiente dinero')
						end
					end)
				end

				if data.current.value == 'no' then

					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
					end)
				end

				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = 'Presiona ~y~E~s~ para acceder a la tienda'
				CurrentActionData = {}

			end, function(data, menu)

				menu.close()

				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = _U('press_menu')
				CurrentActionData = {}

			end)
	end, function(data, menu)

			menu.close()

			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = _U('press_menu')
			CurrentActionData = {}

	end, {
		'tshirt_1',
		'tshirt_2',
		'torso_1',
		'torso_2',
		'decals_1',
		'decals_2',
		'arms',
		'arms_2',
		'pants_1',
		'pants_2',
		'shoes_1',
		'shoes_2',
		'chain_1',
		'chain_2',
		'bproof_1',
		'bproof_2',
		'watches_1',
		'watches_2',
		'bracelets_1',
		'bracelets_2',
		--'helmet_1',
		--'helmet_2',
		--'glasses_1',
		--'glasses_2',
		'bags_1',
		'bags_2',
	})
      end

      if data.current.value == 'player_dressing' then
		
        ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
          local elements = {}

          for i=1, #dressing, 1 do
            table.insert(elements, {label = dressing[i], value = i})
          end

          ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
              title    = ('Conjuntos'),
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
				  
				  ESX.ShowNotification(('Te pusiste el outfit'))
				  HasLoadCloth = true
				  payedMoney = false
                end, data.current.value)
              end)
            end, function(data, menu)
              menu.close()
			  
			  CurrentAction     = 'shop_menu'
			  CurrentActionMsg  = _U('press_menu')
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
              title    = ('Borrar conjunto'),
              align    = 'bottom-right',
              elements = elements,
            }, function(data, menu)
			menu.close()
				TriggerServerEvent('esx_eden_clotheshop:deleteOutfit', data.current.value)
				  
				ESX.ShowNotification(('Borraste el conjunto'))

            end, function(data, menu)
              menu.close()
			  
			  CurrentAction     = 'shop_menu'
			  CurrentActionMsg  = _U('press_menu')
			  CurrentActionData = {}
            end)
		end)
	  end
    end, function(data, menu)

      menu.close()

      CurrentAction     = 'room_menu'
      CurrentActionMsg  = _U('press_menu')
      CurrentActionData = {}
    end)
end

AddEventHandler('esx_eden_clotheshop:hasEnteredMarker', function(zone)
	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = _U('press_menu')
	CurrentActionData = {}
	TriggerEvent('dpc:EquipLast') 
end)

AddEventHandler('esx_eden_clotheshop:hasExitedMarker', function(zone)
	
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil

	if not HasPayed then
		if not HasLoadCloth then 

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end
	end
end)

RegisterNetEvent('esx_eden_clotheshop:forceResetSkin')
AddEventHandler('esx_eden_clotheshop:forceResetSkin', function()
	if payedMoney == true then
		payedMoney = false
		TriggerServerEvent('esx_eden_clotheshop:returnMoney')
	end

	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end)

-- Create Blips
--[[Citizen.CreateThread(function()

	for i=1, #Config.Shops, 1 do

		local blip = AddBlipForCoord(Config.Shops[i].x, Config.Shops[i].y, Config.Shops[i].z)

		SetBlipSprite (blip, 73)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 8)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('clothes'))
		EndTextCommandSetBlipName(blip)
	end
end)]]--

-- Display markers
Citizen.CreateThread(function()
	while true do
		s = 1000
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k,v in pairs(Config.Zones) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
				s = 5
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end
		Wait(s)
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do

		s = 1000

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil
		local dist
		for k,v in pairs(Config.Zones) do
			dist = GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true)
			local currentActionCoords = v.Pos
			if dist < 20 then
				s = 0
				local coords = GetEntityCoords(GetPlayerPed(-1))
				local dist = Vdist2(coords.x, coords.y, coords.z, currentActionCoords.x, currentActionCoords.y, currentActionCoords.z)
				Create3DText(dist,currentActionCoords)
				if dist < 5 then
					if IsControlPressed(0,  38) and (GetGameTimer() - GUI.Time) > 300 then
						OpenShopMenu()
					end
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('esx_eden_clotheshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_eden_clotheshop:hasExitedMarker', LastZone)
		end

		Wait(s)

	end
end)

Create3DText = function(distance,v)
	if(distance < 1.5) then
		s = 5
		ESX.DrawText3D(v.x,v.y,v.z -0.5,"Pulsa ~y~E~s~ para acceder a la tienda de ~r~ropa", 0, 0.1, 0.1,255)
	elseif distance < 10 then
		s = 5
		ESX.DrawText3D(v.x,v.y,v.z -0.5,"Pulsa ~y~E~s~ para acceder a la tienda de ~r~ropa", 0, 0.1, 0.1,100)
	end
end