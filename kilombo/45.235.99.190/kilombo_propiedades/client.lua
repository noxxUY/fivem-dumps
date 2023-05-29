_menuPool  = NativeUI.CreatePool()

-- tbx-88908

local properties = {}
local propertyOwner = {}
local ownedProperties = {}
local trustedProperties = {}
local playersInProperties = {}
local vanishedUser = {}
local isinProperty = false
local gotAllProperties = false
local isinMarker = false
local isNearMarker = false
local isinRoomMenu = false
local currentLocation = nil
local propertyID = nil
local isinLeaveMarker = false
local ownedByCharname = nil
local currentPropertyData = nil
local onlyVisit = false
local currentEnterLoc = {}
local currentMapBlip


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)

	TriggerServerEvent('myProperties:getProperties')
	TriggerServerEvent('myProperties:registerPlayer') -- muss bei playerloaded ausgeführt werden

	ESX.TriggerServerCallback('myProperties:getLastProperty', function(propertyName)
		if propertyName ~= 0 then
			for k, props in pairs(propertyOwner) do
				if tonumber(props.id) == tonumber(propertyName) then
					local name = props.property
					for k2, v in pairs(properties) do
						if v.name == name then
							propertyID = props.id
							TriggerServerEvent('myProperties:enterProperty', tonumber(propertyName), v)
						end
					end
					break
				end
			end
			
		end
	end)
	

end)


Citizen.CreateThread(function()

		--TriggerServerEvent('myProperties:getProperties') --DEBUG

		while not gotAllProperties do
			Wait(100)
		end
		for k, prop in pairs(properties) do
			local coords = prop.entering
			if prop.is_buyable then
				if prop.is_unique then
					for k2, owned in pairs(propertyOwner) do
						if owned.property == prop.name then
							prop.showBlip = false
							-- Haus gehört jemandem
							break
						elseif k2 == #propertyOwner then
							prop.showBlip = true
							if Config.ShowAvailableBlips then
								local blip = AddBlipForCoord(coords.x, coords.y)
								SetBlipSprite(blip, 40)
								SetBlipDisplay(blip, 6)
								SetBlipScale(blip, 0.7)
								SetBlipColour(blip, 4)
								SetBlipAsShortRange(blip, true)
								BeginTextCommandSetBlipName("STRING");
								AddTextComponentString(Translation[Config.Locale]['blip_available_prop'])
								EndTextCommandSetBlipName(blip)
							end
						end
					end
				else
					prop.showBlip = true
					if Config.ShowAvailableBlips then
						local blip = AddBlipForCoord(coords.x, coords.y)
						SetBlipSprite(blip, 40)
						SetBlipDisplay(blip, 6)
						SetBlipScale(blip, 0.7)
						SetBlipColour(blip, 4)
						SetBlipAsShortRange(blip, true)
						BeginTextCommandSetBlipName("STRING");
						AddTextComponentString(Translation[Config.Locale]['blip_available_prop'])
						EndTextCommandSetBlipName(blip)
					end	
				end
			end

			for k2, ownedprop in pairs(ownedProperties) do
				if ownedprop.property == prop.name then
					
					local blip = AddBlipForCoord(coords.x, coords.y)
					SetBlipSprite(blip, 40)
					SetBlipDisplay(blip, 6)
					SetBlipScale(blip, 0.7)
					SetBlipColour(blip, 2)
					SetBlipAsShortRange(blip, true)
					BeginTextCommandSetBlipName("STRING");
					AddTextComponentString(Translation[Config.Locale]['blip_prop_owned'])
					EndTextCommandSetBlipName(blip)
					--[[--]]
				end
			end

			if #trustedProperties > 0 then
				for k3, trustProp in pairs(trustedProperties) do
					if trustProp.property == prop.name then
						local blip = AddBlipForCoord(coords.x, coords.y)
						SetBlipSprite(blip, 40)
						SetBlipDisplay(blip, 6)
						SetBlipScale(blip, 0.7)
						SetBlipColour(blip, 3)
						SetBlipAsShortRange(blip, true)
						BeginTextCommandSetBlipName("STRING");
						if trustProp.owner ~= nil then
							AddTextComponentString(Translation[Config.Locale]['blip_keyowner'] .. trustProp.owner)
						else
							AddTextComponentString(Translation[Config.Locale]['blip_keyowner_unknown'])
						end
						EndTextCommandSetBlipName(blip)
					end
				end
			end



		end

end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		if isinProperty then
		
			if currentPropertyData ~= nil then
			
				DrawMarker(27, currentPropertyData.room_menu.x, currentPropertyData.room_menu.y, currentPropertyData.room_menu.z - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0*1.5, 1.0*1.5, 1.0, 136, 0, 136, 75, false, false, 2, false, false, false, false)
				DrawMarker(27, currentPropertyData.inside.x, currentPropertyData.inside.y, currentPropertyData.inside.z - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0*1.0, 1.0*1.0, 1.0, 136, 0, 136, 75, false, false, 2, false, false, false, false)
			
			end
		
		end

		if isNearMarker then
			DrawMarker(27, currentEnterLoc.x, currentEnterLoc.y, currentEnterLoc.z - 0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9*0.9, 0.9*0.9, 1.0, 136, 0, 136, 75, false, false, 2, false, false, false, false)
		end

		if isinMarker then
			showInfobar(Translation[Config.Locale]['show_info'])
			if IsControlJustReleased(0, 38) then
				for k, prop in pairs(properties) do
					if currentLocation == prop.id then
						if prop.depends ~= 'Collector' then -- Wenn nur eine Wohnung
							if #ownedProperties > 0 then
								for i=1, #ownedProperties, 1 do
									if ownedProperties[i].property == prop.name then
										propertyID = ownedProperties[i].id
										--generateEstateMenu(prop, true)
										abrirMenu(prop, true)
										break
									else 
										if i == #ownedProperties then
											abrirMenu(prop, false)
										end
									end
								end
							else
								abrirMenu(prop, false)
							end
						else -- wenn mehrere
							local propsDepend = {}
							for k2, propdep in pairs(properties) do
								if propdep.depends == prop.name then
									table.insert(propsDepend, {
										name = propdep.name,
										label = propdep.label,
									})
								end
								if k2 == #properties then
									generateSelectMenu(prop, propsDepend)
								end
							end
						end
						break
					end
				end
				
			end
		elseif isinLeaveMarker then
			showInfobar(Translation[Config.Locale]['leave_prop_infobar'])
			if IsControlJustReleased(0, 38) then
				--generateDoorMenu()
				abrirMenuSalir()
			end
		elseif isinRoomMenu then
			showInfobar(Translation[Config.Locale]['access_wardrobe'])
			if IsControlJustReleased(0, 38) then
				for i=1, #propertyOwner, 1 do
					if propertyOwner[i].id == propertyID then
						abrirInventario(propertyOwner[i].owner, propertyID)
						break
					end
				end
			end
		else
		end
		

	end

end)

function abrirInventario(owner, propiedad)
	local isOwner = false
	for k, ownedProp in pairs(ownedProperties) do
		if ownedProp.id == propertyID then
			isOwner = true
			break
		end
	end

	if isOwner then
		exports.ox_inventory:openInventory('stash', 'motel-'..propiedad..'-stash')
		-- exports.ox_inventory:openInventory('stash', {id = 'hotel-'..propiedad..'', owner = owner})
	end

end

local wardrobeMenu = nil

function generateWardrobeMenu(owner)

	collectgarbage()
	
	if wardrobeMenu ~= nil and wardrobeMenu:Visible() then
		wardrobeMenu:Visible(false)
	end
	
	wardrobeMenu = NativeUI.CreateMenu(Translation[Config.Locale]['prop'], nil)
	_menuPool:Add(wardrobeMenu)

	local isOwner = false
	for k, ownedProp in pairs(ownedProperties) do
		if ownedProp.id == propertyID then
			isOwner = true
			break
		end
	end

	if isOwner then
		local trustedPlayersList = {}
		local currentDeposit = 0

		local trust = _menuPool:AddSubMenu(wardrobeMenu, Translation[Config.Locale]['manage_keys'])
		local highestIndex = 0
		
		for k, props in pairs(propertyOwner) do
			if propertyID == props.id then
				trustedPlayersList = props.trusted
				
				for i=1, #props.trusted, 1 do

					local trustedPlayer = NativeUI.CreateItem(props.trusted[i].name, Translation[Config.Locale]['remove_key_desc'])
					trust:AddItem(trustedPlayer)
					highestIndex = highestIndex + 1
					
				end
			end
		end

		local add = _menuPool:AddSubMenu(trust, Translation[Config.Locale]['give_key'])
		local playersInArea = ESX.Game.GetPlayersInArea(currentPropertyData.room_menu, 10.0)

		local gotOSResult = false
		if Config.useOneSyncInfinity then
			ESX.TriggerServerCallback('myProperties:getPlayersInArea', function(playersInArea)
				playersInArea = playersInArea
				gotOSResult = true
			end, currentPropertyData.room_menu, 10.0)
		end

		for i=1, 10, 1 do
			if not gotOSResult then
				Citizen.Wait(100)
			end
		end

		for k, player in pairs(playersInArea) do
			--if player ~= GetPlayerServerId(-1) then
				local playeradd = NativeUI.CreateItem(GetPlayerName(player), Translation[Config.Locale]['give_key_desc'] .. GetPlayerName(player) .. Translation[Config.Locale]['give_key_desc2'])
				add:AddItem(playeradd)
				add.OnItemSelect = function(sender, item, index)
					TriggerServerEvent('myProperties:updateTrusted', "add", GetPlayerServerId(playersInArea[index]), propertyID)
				end
			--end
		end
		
		trust.OnItemSelect = function(sender, item, index)
			if index <= highestIndex then
				TriggerServerEvent('myProperties:updateTrusted', "del", trustedPlayersList[index].steamID, propertyID)
			end
		end
	end

	local wardrobe = _menuPool:AddSubMenu(wardrobeMenu, Translation[Config.Locale]['wardrobe'])
	local selectedIndex = 1
	if Config.useMyClothesAPI then
		ESX.TriggerServerCallback('clothes:requestData', function(dressing)
			for i=1, #dressing, 1 do
				local dress = _menuPool:AddSubMenu(wardrobe, dressing[i].name)
				local takeOn = NativeUI.CreateItem('Outfit anziehen', '~b~')
				local remove = NativeUI.CreateItem('Outfit entfernen', '~b~')
				dress:AddItem(takeOn)
				dress:AddItem(remove)
	
				wardrobe.OnIndexChange = function(sender, index)
					selectedIndex = index
				end
	
				dress.OnItemSelect = function(sender, item, index)
					if item == takeOn then
						TriggerEvent('skinchanger:getSkin', function(skin)
	
							--ESX.TriggerServerCallback('lils_properties:getPlayerOutfit', function(clothes)
				
							TriggerEvent('skinchanger:loadClothes', skin, dressing[selectedIndex].clothesData)
							TriggerEvent('esx_skin:setLastSkin', skin)
			
							TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
							end)
				
							--end, selectedIndex)
				
						end)
					elseif item == remove then
						TriggerServerEvent('clothes:removeOutfit', dressing[selectedIndex].id)
						ShowNotification('Das Outfit ~y~' .. dressing[selectedIndex].name .. ' ~s~wurde gelöscht.')
						_menuPool:CloseAllMenus()
					end
				end
				_menuPool:RefreshIndex()
				_menuPool:MouseEdgeEnabled (false)
			end
		end)
	else
		ESX.TriggerServerCallback('myProperties:getPlayerDressing', function(dressing)
			for i=1, #dressing, 1 do
				local dress = _menuPool:AddSubMenu(wardrobe, dressing[i])
				local takeOn = NativeUI.CreateItem(Translation[Config.Locale]['outfin_use'], '~b~')
				local remove = NativeUI.CreateItem(Translation[Config.Locale]['outfit_remove'], '~b~')
				dress:AddItem(takeOn)
				dress:AddItem(remove)
	
				wardrobe.OnIndexChange = function(sender, index)
					selectedIndex = index
				end
	
				dress.OnItemSelect = function(sender, item, index)
					if item == takeOn then
						TriggerEvent('skinchanger:getSkin', function(skin)
	
							ESX.TriggerServerCallback('myProperties:getPlayerOutfit', function(clothes)
				
								TriggerEvent('skinchanger:loadClothes', skin, clothes)
								TriggerEvent('esx_skin:setLastSkin', skin)
				
								TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
								end)
				
							end, selectedIndex)
				
						end)
					elseif item == remove then
						TriggerServerEvent('myProperties:removeOutfit', selectedIndex)
						ShowNotification(Translation[Config.Locale]['outfit_removed'] .. dressing[selectedIndex] .. Translation[Config.Locale]['outfit_removed2'])
						_menuPool:CloseAllMenus()
					end
				end
				_menuPool:RefreshIndex()
				_menuPool:MouseEdgeEnabled (false)
			end
		end)
	end
	

	if not onlyVisit then
		local inventory_sub = _menuPool:AddSubMenu(wardrobeMenu, Translation[Config.Locale]['store'])
		local tresor_sub = _menuPool:AddSubMenu(wardrobeMenu, Translation[Config.Locale]['weaponary'])

		ESX.TriggerServerCallback('myProperties:getPropertyInventory', function(inventory)

			--local money = NativeUI.CreateItem('Bargeld: ', '~b~')
			--money:RightLabel(inventory.money)

			local inventoryItems = {}
			local wepaonsList = inventory.weapons

			for k, item in pairs(inventory.items) do
				if item.count > 0 then
					local invitem = NativeUI.CreateItem(item.label, '~b~')
					invitem:RightLabel(item.count .. '~b~x')
					inventory_sub:AddItem(invitem)
					table.insert(inventoryItems, {
						name = item.name,
						label = item.label,
						count = item.count,
					})
				end
				--item.name
			end

			for k, weapon in pairs(inventory.weapons) do
				local weaponinv = NativeUI.CreateItem(ESX.GetWeaponLabel(weapon.name), '~b~')
				weaponinv:RightLabel(weapon.ammo .. Translation[Config.Locale]['ammo']) 
				tresor_sub:AddItem(weaponinv)
				--weapon.name
			end

			inventory_sub.OnItemSelect = function(sender, item, index)

				local res_amount = CreateDialog(Translation[Config.Locale]['insert_withdraw'])
					if tonumber(res_amount) then
						local quantity = tonumber(res_amount)
						TriggerServerEvent('myProperties:getItem', propertyID, 'item_standard', inventoryItems[index].name, quantity)
						_menuPool:CloseAllMenus()
					end

			end

			tresor_sub.OnItemSelect = function(sender, item, index)
				TriggerServerEvent('myProperties:getItem', propertyID, 'item_weapon', wepaonsList[index].name, wepaonsList[index].ammo)
				_menuPool:CloseAllMenus()
			end

			_menuPool:RefreshIndex()
		end, propertyID)

		local putItem = _menuPool:AddSubMenu(wardrobeMenu, Translation[Config.Locale]['store_item'])

		ESX.TriggerServerCallback('myProperties:getPlayerInventory', function(inventory)
		
			local itemstoSelect = {}

			for k, itemininv in pairs(inventory.items) do
				if itemininv.count > 0 then
					local invitem = NativeUI.CreateItem(itemininv.label, '~b~')
					invitem:RightLabel(itemininv.count .. '~b~x')
					putItem:AddItem(invitem)
					table.insert(itemstoSelect, {
						type = 'item_standard',
						name = itemininv.name,
					})
				end

			end

			local playerPed  = PlayerPedId()
			local weaponList = ESX.GetWeaponList()

			for k, weaponsininv in pairs(weaponList) do

				local weaponHash = GetHashKey(weaponsininv.name)
				if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[k].name ~= 'WEAPON_UNARMED' then
					local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
					local weaponitem = NativeUI.CreateItem(weaponsininv.label, '~b~')
					weaponitem:RightLabel(ammo .. Translation[Config.Locale]['ammo'])
					putItem:AddItem(weaponitem)

					table.insert(itemstoSelect, {
						type = 'item_weapon',
						name = weaponsininv.name,
						ammo = ammo,
					})
				end

			end

			putItem.OnItemSelect = function(sender, item, index)
				
				local selectedItem = itemstoSelect[index]
				
				if selectedItem.type == 'item_weapon' then
					print('got put item: ' .. selectedItem.name .. ' x' .. selectedItem.ammo)
					TriggerServerEvent('myProperties:putItem', propertyID, 'item_weapon', selectedItem.name, selectedItem.ammo)
					_menuPool:CloseAllMenus()
				elseif selectedItem.type == 'item_standard' then
					local res_amount = CreateDialog(Translation[Config.Locale]['insert_deposit'])
					if tonumber(res_amount) then
						local quantity = tonumber(res_amount)
						TriggerServerEvent('myProperties:putItem', propertyID, 'item_standard', selectedItem.name, quantity)
						_menuPool:CloseAllMenus()
					end
				end

			end

		
		end)

		for k, props in pairs(propertyOwner) do
			if propertyID == props.id then
				currentDeposit = props.deposit
			end

		end
		local propDeposit = _menuPool:AddSubMenu(wardrobeMenu, Translation[Config.Locale]['wallet'])

		local depositBalance = NativeUI.CreateItem(Translation[Config.Locale]['credit'], Translation[Config.Locale]['current_credit'] .. currentDeposit .. Translation[Config.Locale]['currency'])
		depositBalance:RightLabel('~g~' .. currentDeposit .. Translation[Config.Locale]['currency'])
		propDeposit:AddItem(depositBalance)

		local depositMoney = NativeUI.CreateItem(Translation[Config.Locale]['money_deposit'], '~b~')
		propDeposit:AddItem(depositMoney)
		
		local withdrawMoney = NativeUI.CreateItem(Translation[Config.Locale]['money_withdraw'], '~b~')
		propDeposit:AddItem(withdrawMoney)

		propDeposit.OnItemSelect = function(sender, item, index)

			if item == depositMoney then
				local res_amount = CreateDialog(Translation[Config.Locale]['insert_deposit'])
				if tonumber(res_amount) then
					local quantity = tonumber(res_amount)
					TriggerServerEvent('myProperties:editPropDeposit', 'deposit', quantity, propertyID)
					_menuPool:CloseAllMenus()
				end

			elseif item == withdrawMoney then
				local res_amount = CreateDialog(Translation[Config.Locale]['insert_withdraw'])
				if tonumber(res_amount) then
					local quantity = tonumber(res_amount)
					TriggerServerEvent('myProperties:editPropDeposit', 'withdraw', quantity, propertyID)
					_menuPool:CloseAllMenus()
				end
			end

		end

	end

	
	
	
	wardrobeMenu:Visible(not wardrobeMenu:Visible())

	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)

end

function abrirMenu(prop, owns)

	local coords = prop.entering
	local s1 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
	local street1 = GetStreetNameFromHashKey(s1)

			local elements = {}

			table.insert(elements,{unselectable=true, icon="fa-solid fa-house", title=prop.label})
			table.insert(elements,{unselectable=true, icon = "fa-solid fa-circle-info", title = "Tipo de Propiedad", description=prop.type})
			table.insert(elements,{unselectable=true, icon = "fa-solid fa-circle-info", title = "Dirección de Propiedad", description=street1})
			if owns then
				table.insert(elements, {icon = "fa-solid fa-right-to-bracket", title = "Entrar", value = "entrar", description="Ingresar dentro de la habitación."})
					local price = 0
					local rented = false
					for k, propOwner in pairs(propertyOwner) do
						if propOwner.id == propertyID then
							price = propOwner.price
							rented = propOwner.rented
							break
						end
					end
				table.insert(elements,{icon = "fa-solid fa-money-bill", title = "Vender Propiedad", value = "vender", description="Vender habitación por $"..price / Config.CalculateSellPrice..""})
			else
				table.insert(elements,{icon = "fa-solid fa-money-bill", title = "Comprar Propiedad", value = "compro", description="Comprar una habitación por $"..prop.price..""})
			end

			ESX.OpenContext("right" , elements, 
			function(menu,element) -- On Select Function
		
				if element.value  == 'compro' then -- This detects which element you have pressed
					TriggerServerEvent('myProperties:buy', prop.name, "BUY", prop.price)
				end
				if element.value  == 'vender' then
					ESX.CloseContext()
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'cambio_nombre_hab', --Change menu name
					{
					  title = ('Escribe "Confirmar" para vender la propiedad.')
					},
					function(data, menu4)
					  local amount = tonumber(data.value)
					  if data.value == nil then
						ESX.ShowNotification('Debes escribir "Confirmar" para vender la casa.')
					  else
		
						if data.value ~= nil and data.value == 'Confirmar' then
							local price = 0
							local rented = false
							for k, propOwner in pairs(propertyOwner) do
								if propOwner.id == propertyID then
									price = propOwner.price
									rented = propOwner.rented
									break
								end
							end
							ESX.TriggerServerCallback('myProperties:pay', function(vendido)
								if vendido > 0 then
									TriggerServerEvent('myProperties:RemoveOwnedProperty', prop.name, 'SOURCE')
								end
							end, price / Config.CalculateSellPrice)
							ESX.UI.Menu.CloseAll()
						else
							ESX.ShowNotification('Debes escribir "Confirmar" para vender la casa.')
						end
						
						menu4.close()
					  end
					end,
					function(data, menu4)
					  menu4.close() -- Action when closing the menu 
				  end)
				end
				if element.value  == 'entrar' then
					TriggerServerEvent('InteractSound_SV:PlayOnSource', 'door_open', 0.1)
					TriggerServerEvent('myProperties:enterProperty', propertyID, prop)
				end
		
			ESX.CloseContext()
		end, function(menu) -- on close
			MenuOpen = false
		end)
end

function abrirMenuSalir()

	local elements = {}

	table.insert(elements,{unselectable=true, icon="fa-solid fa-house", title="Mi Propiedad"})
	-- table.insert(elements,{icon = "fa-solid fa-users", title = "Invitar adentro", description="Invitar personas adentro de la habitación.", value = 'invitar'})
	table.insert(elements,{icon = "fa-solid fa-comment-dots", title = "Cambiar Nombre", description="Cambiar el nombre de tu habitación.", value = 'cambio_nombre'})
	table.insert(elements,{icon = "fa-solid fa-right-from-bracket", title = "Salir de la Habitación", description="Salir a la calle.", value = 'salgo_calle'})


	ESX.OpenContext("right" , elements, 
	function(menu,element) -- On Select Function
	
		if element.value == 'invitar' then
			ESX.CloseContext()
			local Elements = {}

			table.insert(Elements,{unselectable=true, icon="fa-solid fa-house", title="Mi Propiedad"})

			local players = ESX.Game.GetPlayersInArea(currentPropertyData.entering, 10.0)
			local c = 0
			for _,player in pairs(players) do
			  if player ~= PlayerId() then
				print("678")
				table.insert(Elements,{icon = "fa-solid fa-person", title = GetPlayerName(player).." [ID:"..GetPlayerServerId(player).."]", description="Invitar a "..GetPlayerName(player).." a la habitación.", value = GetPlayerServerId(player),name = GetPlayerName(player), id = GetPlayerServerId(player)})
			  else
				print("681")
				table.insert(Elements,{unselectable=true, icon = "fa-solid fa-circle-info", title = "No hay nadie fuera"})
			  end
			end
		  ESX.OpenContext("right" , Elements, 
			function(menu,element) -- On Select Function
				print("687")
			if element.value ~= nil then
				TriggerServerEvent('myProperties:invitePlayer', element.current.id, propertyID, currentPropertyData)
				ShowNotification(Translation[Config.Locale]['invited_player'] .. element.current.name .. Translation[Config.Locale]['invited_player2'])
				ESX.CloseContext()
			end
		  end, function(menu) -- on close
		  end)
		  
	elseif element.value  == 'cambio_nombre' then -- This detects which element you have pressed

		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'cambio_nombre_hab', --Change menu name
		{
		  title = ('Introduce el nombre de tu habitación')
		},
		function(data, menu3)
		  local amount = tonumber(data.value)
		  if data.value == nil then
			ESX.ShowNotification('Nombre inválido')
		  else

			if data.value ~= nil and data.value ~= '' then
				TriggerServerEvent('myProperties:editPropPlate', propertyID, data.value)
				menu3.close()
			end
			
			menu3.close()
		  end
		end,
		function(data, menu3)
		  menu3.close() -- Action when closing the menu 
	  end)
	elseif element.value  == 'salgo_calle' then
		ESX.CloseContext()
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'door_open', 0.1)
		TriggerServerEvent('myProperties:leaveProperty', currentPropertyData)
	end
  
	ESX.CloseContext()
  end, function(menu) -- on close

  end)
end
	

function setNearestBlip(loc)
 if currentMapBlip ~= nil then
	RemoveBlip(currentMapBlip)
 end
 currentMapBlip = AddBlipForCoord(loc.x, loc.y)
 SetBlipSprite(currentMapBlip, 40)
 SetBlipDisplay(currentMapBlip, 6)
 SetBlipScale(currentMapBlip, 0.7)
 SetBlipColour(currentMapBlip, 4)
 SetBlipAsShortRange(blip, true)
 BeginTextCommandSetBlipName("STRING");
 AddTextComponentString(Translation[Config.Locale]['blip_available_prop'])
 EndTextCommandSetBlipName(currentMapBlip)

end

Citizen.CreateThread(function()

	while true do

		Citizen.Wait(400)

		isinMarker = false
		isNearMarker = false
		isinLeaveMarker = false
		isinRoomMenu = false


		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local closestDistance = 10000

		for k, prop in pairs(properties) do
			--[[if prop.depends ~= 'Collector' then
				local distanceLeave = Vdist(playerCoords, prop.inside.x, prop.inside.y, prop.inside.z)

				if distanceLeave <= 1.5 then
					isinLeaveMarker = true
					currentLocation = prop.id
				end
			end--]]
			
			if prop.is_single then
				local coords = prop.entering
				local distance = Vdist(playerCoords, coords.x, coords.y, coords.z)
				
				if Config.ShowOnlyNearestProperty then
					if distance < closestDistance and prop.showBlip then
						closestDistance = distance
						setNearestBlip(coords)
					end
				end

				if distance <= 1.5 then
					isNearMarker = true
					isinMarker = true
					currentEnterLoc = coords
					currentLocation = prop.id
				elseif distance <= 25.0 then
					isNearMarker = true
					currentEnterLoc = coords
				end

			end
		end

		if isinProperty then
			if currentPropertyData ~= nil then
				local distanceLeave = Vdist(playerCoords, currentPropertyData.inside.x, currentPropertyData.inside.y, currentPropertyData.inside.z)
				if distanceLeave <= 1.5 then
					isinLeaveMarker = true
				end
				local distanceRoommenu = Vdist(playerCoords, currentPropertyData.room_menu.x, currentPropertyData.room_menu.y, currentPropertyData.room_menu.z)
				if distanceRoommenu <= 1.5 then
					isinRoomMenu = true
				end
			end

		end


	end


end)

local SelectMenu = nil

function generateSelectMenu(base, PropsBelongtoBase)
    --_menuPool:Remove()
    collectgarbage()
	
	if SelectMenu ~= nil and SelectMenu:Visible() then
		SelectMenu:Visible(false)
	end

    SelectMenu = NativeUI.CreateMenu(base.label, '~b~' .. #PropsBelongtoBase .. Translation[Config.Locale]['collector_propamount'])
	_menuPool:Add(SelectMenu)
	

	for k, prop in pairs(PropsBelongtoBase) do
		local found = false
		for k2, ownedProps in pairs(ownedProperties) do
			if ownedProps.property == prop.name then
				local select = NativeUI.CreateItem(Translation[Config.Locale]['owned_prefix'] .. prop.label, '~b~')
				SelectMenu:AddItem(select)
				found = true
				break
			end
		end
		if not found then
			local select2 = NativeUI.CreateItem(prop.label, '~b~')
			SelectMenu:AddItem(select2)
		end
	end



	SelectMenu.OnItemSelect = function(sender, item, index)

		local selectedProp = {}
		for k2, prope in pairs(properties) do
			if prope.name == PropsBelongtoBase[index].name then
				selectedProp = prope
				break
			end
		end

		SelectMenu:Visible(false)
		if #ownedProperties > 0 then
			for i=1, #ownedProperties, 1 do
				if ownedProperties[i].property == selectedProp.name then
					propertyID = ownedProperties[i].id
					generateEstateMenu(selectedProp, true)
					break
				else 
					if i == #ownedProperties then
						generateEstateMenu(selectedProp, false)
					end
				end
			end
		else
			generateEstateMenu(selectedProp, false)
		end

	end

	_menuPool:CloseAllMenus()
	SelectMenu:Visible(not SelectMenu:Visible())

	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)

end


--OLD VANISHING
Citizen.CreateThread(function()

 	while true do
 		Citizen.Wait(0)
 		local playerPed = PlayerPedId()
 		if isinProperty then
 			for k, user in pairs(vanishedUser) do
 				if user ~= playerPed then
 					SetEntityLocallyInvisible(user)
 					SetEntityNoCollisionEntity(playerPed,  user,  true)
 					SetEntityLocallyInvisible(user)
                     SetEntityVisible(user, false, 0)
                     SetEntityNoCollisionEntity(playerPed, user, true)
 				end

 			end
 		end

 	end

end)

RegisterNetEvent('myProperties:setPlayerInvisible')
AddEventHandler('myProperties:setPlayerInvisible', function(playerEnter, instanceId)

	
 	local otherPlayer = GetPlayerFromServerId(playerEnter)
	
 	if otherPlayer ~= nil then
 		local otherPlayerPed = GetPlayerPed(otherPlayer)
 		table.insert(vanishedUser, otherPlayerPed)
 	end

end)

RegisterNetEvent('myProperties:setPlayerVisible')
AddEventHandler('myProperties:setPlayerVisible', function(playerEnter)


 	local otherPlayer = GetPlayerFromServerId(playerEnter)
 	local otherPlayerPed = GetPlayerPed(otherPlayer)
	
 	for k, vanish in pairs(vanishedUser) do
 		if vanish == otherPlayerPed then
 			table.remove(vanishedUser, k)
 		end
 	end

end)

--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		if isinProperty then
			for k, user in pairs(vanishedUser) do
				if user ~= playerPed then
					-- NetworkConcealEntity(user, true)
					-- SetEntityLocallyInvisible(user)/*
					-- SetEntityNoCollisionEntity(playerPed,  user,  true)
					-- SetEntityLocallyInvisible(user)
                    -- SetEntityVisible(user, false, 0)
                    -- SetEntityNoCollisionEntity(playerPed, user, true)
				end
			end
		elseif #vanishedUser > 0 then
			for k, user in pairs(vanishedUser) do
				if user ~= playerPed then
					NetworkConcealEntity(user, false)
				end
			end
			vanishedUser = {}
		end
	end
end)

RegisterNetEvent('myProperties:setPlayerInvisible')
AddEventHandler('myProperties:setPlayerInvisible', function(playerEnter, instanceId)
	local otherPlayer = GetPlayerFromServerId(playerEnter)
	if otherPlayer ~= nil then
		local otherPlayerPed = GetPlayerPed(otherPlayer)
		if otherPlayerPed ~= PlayerPedId() then
			table.insert(vanishedUser, otherPlayerPed)
			NetworkConcealEntity(otherPlayerPed, true)
		end
	end
end)

RegisterNetEvent('myProperties:setPlayerVisible')
AddEventHandler('myProperties:setPlayerVisible', function(playerEnter)
	local otherPlayer = GetPlayerFromServerId(playerEnter)
	local otherPlayerPed = GetPlayerPed(otherPlayer)
	for k, vanish in pairs(vanishedUser) do
		if vanish == otherPlayerPed then
			table.remove(vanishedUser, k)
			NetworkConcealEntity(otherPlayerPed, false)
		end
	end
end)]]


RegisterNetEvent('myProperties:enterProperty')
AddEventHandler('myProperties:enterProperty', function(prop)
	_menuPool:CloseAllMenus()
	local playerPed = PlayerPedId()
	local coords = prop.inside
	if prop.ipls ~= '[]' then
		RemoveIpl("apa_v_mp_h_01_b")
		RequestIpl(prop.ipls)
		while not IsIplActive(prop.ipls) do
			Citizen.Wait(0)
		end
	end

	SetEntityCoords(playerPed, coords.x, coords.y, coords.z)
	-- NetworkSetVoiceChannel(propertyID)
    NetworkSetTalkerProximity(0.0)
	isinProperty = true
	currentPropertyData = prop
	TriggerServerEvent('myProperties:saveLastProperty', propertyID)

end)

RegisterNetEvent('myProperties:leaveProperty')
AddEventHandler('myProperties:leaveProperty', function(prop)

    Citizen.InvokeNative(0xE036A705F989E049)
    NetworkSetTalkerProximity(2.5)
	isinProperty = false	
	onlyVisit = false
	--vanishedUser = {}
	local playerPed = PlayerPedId()
	local coords = prop.entering
	SetEntityCoords(playerPed, coords.x, coords.y, coords.z)
	RemoveIpl(prop.ipls)
	TriggerServerEvent('myProperties:saveLastProperty', 0)

end)

RegisterNetEvent('myProperties:sendPropertiesToClient')
AddEventHandler('myProperties:sendPropertiesToClient', function(properties_res, owner_res, steamID)

	properties = properties_res
	propertyOwner = owner_res
	ownedProperties = {}
	trustedProperties = {}

	for k, v in pairs(propertyOwner) do
		if steamID == v.owner then
			table.insert(ownedProperties, {
				id = v.id,
				property = v.property,
			})
		end
		for i=1, #v.trusted, 1 do
			if v.trusted[i].steamID ~= nil then
				if v.trusted[i].steamID == steamID then
					table.insert(trustedProperties, {
						id = v.id,
						property = v.property,
						owner = v.charname,
					})
				end
			end

		end
	end

	gotAllProperties = true


end)

RegisterNetEvent('myProperties:updatePropertyOwner')
AddEventHandler('myProperties:updatePropertyOwner', function(line, updatedTable, steamID)

	propertyOwner[line] = updatedTable

	ownedProperties = {}
	trustedProperties = {}

	for k, v in pairs(propertyOwner) do
		if steamID == v.owner then
			table.insert(ownedProperties, {
				id = v.id,
				property = v.property,
			})
		end
		for i=1, #v.trusted, 1 do
			if v.trusted[i].steamID ~= nil then
				if v.trusted[i].steamID == steamID then
					table.insert(trustedProperties, {
						id = v.id,
						property = v.property,
						owner = v.charname,
					})
				end
			end

		end
	end

end)

-- This event is there to avoid performing the event above on each change of the lock for everyone.
RegisterNetEvent('myProperties:updateLockState')
AddEventHandler('myProperties:updateLockState', function(line, newLockState)

	propertyOwner[line].locked = newLockState

end)

RegisterNetEvent('myProperties:hasInvitation')
AddEventHandler('myProperties:hasInvitation', function(ID, propertyData)

	hasInvite = true

	Citizen.CreateThread(function()
	
		while hasInvite do
			Citizen.Wait(0)
			if IsControlJustReleased(0, 38) then
				TriggerServerEvent('myProperties:enterProperty', ID, propertyData)
				propertyID = ID
				hasInvite = false
				onlyVisit = true
			end

		end
	
	end)

	Citizen.Wait(10000)
	if hasInvite then
		hasInvite = false
		ShowNotification(Translation[Config.Locale]['invitation_expired'])
	end

end)

--[[RegisterNetEvent('myProperties:receiveCharName')
AddEventHandler('myProperties:receiveCharName', function(charname)
	
	ownedByCharname = charname
	print(ownedByCharname)
end)--]]

--[[RegisterNetEvent('myProperties:updatePlayersInProperties')
AddEventHandler('myProperties:updatePlayersInProperties', function(playersInProps)

	playersInProperties = playersInProps
end)--]]

function showInfobar(msg)

	CurrentActionMsg  = msg
	SetTextComponentFormat('STRING')
	AddTextComponentString(CurrentActionMsg)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

function showPictureNotification(icon, msg, title, subtitle)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg);
    SetNotificationMessage(icon, icon, true, 1, title, subtitle);
    DrawNotification(false, true);
end

RegisterNetEvent('myProperties:msg')
AddEventHandler('myProperties:msg', function(msg)
	ShowNotification(msg)
end)

RegisterNetEvent('myProperties:picturemsg')
AddEventHandler('myProperties:picturemsg', function(icon, msg, title, subtitle)
	showPictureNotification(icon, msg, title, subtitle)
end)

RegisterNetEvent('myProperties:picturemsg')
AddEventHandler('myProperties:picturemsg', function(icon, msg, title, subtitle)
	showPictureNotification(icon, msg, title, subtitle)
end)

function CreateDialog(OnScreenDisplayTitle_shopmenu) --general OnScreenDisplay for KeyboardInput
	AddTextEntry(OnScreenDisplayTitle_shopmenu, OnScreenDisplayTitle_shopmenu)
	DisplayOnscreenKeyboard(1, OnScreenDisplayTitle_shopmenu, "", "", "", "", "", 32)
	while (UpdateOnscreenKeyboard() == 0) do
		DisableAllControlActions(0);
		Wait(0);
	end
	if (GetOnscreenKeyboardResult()) then
		local displayResult = GetOnscreenKeyboardResult()
		return displayResult
	end
end


RegisterNetEvent('myProperties:stillOnline')
AddEventHandler('myProperties:stillOnline', function()
	TriggerServerEvent('myProperties:registerPlayer')
end)


Citizen.CreateThread(function()
  RequestIpl('apa_v_mp_h_01_b')
end)


-- Creo loop para detectar si está en menu y lejos del marker se lo cierre
Citizen.CreateThread(function()

	if EnMenu == true and not isinMarker then
		ESX.UI.Menu.CloseAll()
	end

end)