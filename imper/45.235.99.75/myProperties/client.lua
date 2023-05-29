ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

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

		if Config.Debug then
			TriggerServerEvent('myProperties:getProperties') --DEBUG
		end


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
					SetBlipScale(blip, 1.0)
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
						SetBlipScale(blip, 1.0)
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
			_menuPool:ProcessMenus()
			showInfobar(Translation[Config.Locale]['show_info'])
			if IsControlJustReleased(0, 38) then
				for k, prop in pairs(properties) do
					if currentLocation == prop.id then
						if prop.depends ~= 'Collector' then -- Wenn nur eine Wohnung
							if #ownedProperties > 0 then
								for i=1, #ownedProperties, 1 do
									if ownedProperties[i].property == prop.name then
										propertyID = ownedProperties[i].id
										generateEstateMenu(prop, true)
										break
									else
										if i == #ownedProperties then
											generateEstateMenu(prop, false)
										end
									end
								end
							else
								generateEstateMenu(prop, false)
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
			_menuPool:ProcessMenus()
			showInfobar(Translation[Config.Locale]['leave_prop_infobar'])
			if IsControlJustReleased(0, 38) then
				generateDoorMenu()
			end
		elseif isinRoomMenu then
			_menuPool:ProcessMenus()
			showInfobar(Translation[Config.Locale]['access_wardrobe'])
			if IsControlJustReleased(0, 38) then
				for i=1, #propertyOwner, 1 do
					if propertyOwner[i].id == propertyID then
						generateWardrobeMenu(propertyOwner[i].owner)
						break
					end
				end
			end
		else
			_menuPool:CloseAllMenus()
		end


	end

end)

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

local wardrobeMenu = nil


local function roundAndCheckSign(num)
	local roundedNum = math.floor(num + 0.5) -- Redondea el número utilizando la función math.floor()

	if roundedNum < 0 then                -- Verifica si el número redondeado es negativo
		roundedNum = -roundedNum          -- Convierte el número negativo en positivo
	end

	return roundedNum
end

function generateWardrobeMenu(owner)

    _menuPool:Remove()
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
			ESX.TriggerServerCallback('myProperties:getPlayersInArea', function(playersInArea_res)
				playersInArea = playersInArea_res
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

				local playeradd
				if Config.useOneSyncInfinity then
					playeradd = NativeUI.CreateItem(player.name, Translation[Config.Locale]['give_key_desc'] .. player.name .. Translation[Config.Locale]['give_key_desc2'])
					add:AddItem(playeradd)
				else
					playeradd = NativeUI.CreateItem(GetPlayerName(player), Translation[Config.Locale]['give_key_desc'] .. GetPlayerName(player) .. Translation[Config.Locale]['give_key_desc2'])
					add:AddItem(playeradd)
				end

				add.OnItemSelect = function(sender, item, index)
					if Config.useOneSyncInfinity then
						TriggerServerEvent('myProperties:updateTrusted', "add", playersInArea[index].id, propertyID)
					else
						TriggerServerEvent('myProperties:updateTrusted', "add", GetPlayerServerId(playersInArea[index]), propertyID)
					end

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

			local playerPed  = GetPlayerPed(-1)
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
						quantity = roundAndCheckSign(quantity)
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

local doorMenu = nil

function generateDoorMenu()
    _menuPool:Remove()
    collectgarbage()

	if doorMenu ~= nil and doorMenu:Visible() then
		doorMenu:Visible(false)
	end

    doorMenu = NativeUI.CreateMenu(currentPropertyData.type, nil)
	_menuPool:Add(doorMenu)

		local invite = _menuPool:AddSubMenu(doorMenu, Translation[Config.Locale]['invite'])
		local playersInArea = ESX.Game.GetPlayersInArea(currentPropertyData.entering, 10.0)

		local gotOSResult = false
		if Config.useOneSyncInfinity then
			ESX.TriggerServerCallback('myProperties:getPlayersInArea', function(playersInArea_res)
				playersInArea = playersInArea_res
				gotOSResult = true
			end, currentPropertyData.entering, 10.0)
		end

		for i=1, 10, 1 do
			if not gotOSResult then
				Citizen.Wait(100)
			end
		end

		for k, player in pairs(playersInArea) do
			local playerInvite
			if Config.useOneSyncInfinity then
				playerInvite = NativeUI.CreateItem(player.name, Translation[Config.Locale]['invite_player'] .. player.name .. Translation[Config.Locale]['invite_player2'])
				invite:AddItem(playerInvite)
			else
				playerInvite = NativeUI.CreateItem(GetPlayerName(player), Translation[Config.Locale]['invite_player'] .. GetPlayerName(player) .. Translation[Config.Locale]['invite_player2'])
				invite:AddItem(playerInvite)
			end

		end

		invite.OnItemSelect = function(sender, item, index)

			if Config.useOneSyncInfinity then
				TriggerServerEvent('myProperties:invitePlayer', playersInArea[index].id, propertyID, currentPropertyData)
				ShowNotification(Translation[Config.Locale]['invited_player'] .. playersInArea[index].name .. Translation[Config.Locale]['invited_player2'])
			else
				TriggerServerEvent('myProperties:invitePlayer', GetPlayerServerId(playersInArea[index]), propertyID, currentPropertyData)
				ShowNotification(Translation[Config.Locale]['invited_player'] .. GetPlayerName(playersInArea[index]) .. Translation[Config.Locale]['invited_player2'])
			end

		end

	local changePropPlate
	if not onlyVisit then

		local lockedStates = {
			Translation[Config.Locale]['lock_only_key'],
			Translation[Config.Locale]['lock_open'],
			--'nur Besitzer', -- needed for- in otherApartments.OnItemSelect .. and i dont want whis :crying:
		}

		local lock = NativeUI.CreateListItem(Translation[Config.Locale]['doorlock'], lockedStates, 1, Translation[Config.Locale]['doorlock_desc'])
		doorMenu:AddItem(lock)

		doorMenu.OnListSelect = function(sender, item, index)
			if item == lock then
				ShowNotification(Translation[Config.Locale]['doorlock_changed'] .. lockedStates[index])
				TriggerServerEvent('myProperties:saveLockState', propertyID, index)
			end
		end

		changePropPlate = NativeUI.CreateItem(Translation[Config.Locale]['doorbell'], Translation[Config.Locale]['doorbell_desc'])
		changePropPlate:RightLabel('~r~' .. Config.ChangeDoorbellPrice .. Translation[Config.Locale]['currency'])
		doorMenu:AddItem(changePropPlate)
	end

	local leave = NativeUI.CreateItem(Translation[Config.Locale]['leave_prop_pre'] .. currentPropertyData.type .. Translation[Config.Locale]['leave_prop'], '~b~')
	leave:RightLabel('~b~→→→')
	doorMenu:AddItem(leave)

	doorMenu.OnItemSelect = function(sender, item, index)
		if item == leave then
			TriggerServerEvent('myProperties:leaveProperty', currentPropertyData)
			doorMenu:Visible(false)
		elseif changePropPlate ~= nil and item == changePropPlate then
			local res_plate = CreateDialog(Translation[Config.Locale]['doorbell'])
			if res_plate ~= nil and res_plate ~= '' then
				TriggerServerEvent('myProperties:editPropPlate', propertyID, res_plate)
				_menuPool:CloseAllMenus()
			end
		end
	end


	doorMenu:Visible(not doorMenu:Visible())

	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
end

local SelectMenu = nil

function generateSelectMenu(base, PropsBelongtoBase)
    _menuPool:Remove()
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

local menu = nil

function generateEstateMenu(prop, owns)
    _menuPool:Remove()
    collectgarbage()

	if menu ~= nil and menu:Visible() then
		menu:Visible(false)
	end

    menu = NativeUI.CreateMenu(Translation[Config.Locale]['prop'], nil)
    _menuPool:Add(menu)

	local coords = prop.entering
	local s1 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
	local street1 = GetStreetNameFromHashKey(s1)

	local isOwned = NativeUI.CreateItem(Translation[Config.Locale]['info_owned'], '~b~')
	if owns then
		isOwned:RightLabel(Translation[Config.Locale]['info_yes'])
	else
		isOwned:RightLabel(Translation[Config.Locale]['info_no'])
	end
	local type = NativeUI.CreateItem(Translation[Config.Locale]['info_type'], '~b~')
	type:RightLabel(prop.type)
	local name = NativeUI.CreateItem(Translation[Config.Locale]['info_name'], '~b~')
	name:RightLabel(prop.label)
	local adress = NativeUI.CreateItem(Translation[Config.Locale]['info_adress'], '~b~')
	adress:RightLabel(street1)
	local unique = NativeUI.CreateItem(Translation[Config.Locale]['unique'], '~b~')
	if prop.is_unique then
		unique:RightLabel(Translation[Config.Locale]['info_yes'])
	else
		unique:RightLabel(Translation[Config.Locale]['info_no'])
	end


	menu:AddItem(type)
	menu:AddItem(name)
	menu:AddItem(adress)
	menu:AddItem(unique)
	local spacer = NativeUI.CreateItem('~b~', '~b~')
	menu:AddItem(spacer)
	menu:AddItem(isOwned)

	if owns then

		--local myapartment = _menuPool:AddSubMenu(menu, '~b~' .. prop.type .. ' verwalten', nil, nil)

		local enter = NativeUI.CreateItem(Translation[Config.Locale]['enter_prop'], '~b~')
		enter:RightLabel('~b~→→→')
		menu:AddItem(enter)

		menu.OnItemSelect = function(sender, item, index)

			if item == enter then
				TriggerServerEvent('myProperties:enterProperty', propertyID, prop)
				_menuPool:CloseAllMenus()
			end

		end


	end

	local propertyIsSold = false

	if prop.is_unique then
		for k, ownedProps in pairs(propertyOwner) do
			if ownedProps.property == prop.name then

				--local isBought = NativeUI.CreateItem('~r~Wohnung nicht mehr verfügbar!')
				local owner = NativeUI.CreateItem(Translation[Config.Locale]['owner'], '~b~')
				owner:RightLabel(ownedProps.charname)

				--if not owns then
				--	menu:AddItem(isBought)
				--end
				menu:AddItem(owner)
				propertyIsSold = true
				break
			end

		end

	end


	if not owns then
		if prop.is_buyable then
			if not propertyIsSold then
				local buy = NativeUI.CreateItem(Translation[Config.Locale]['buy'], '~b~')
				buy:RightLabel(prop.price .. Translation[Config.Locale]['currency'])
				menu:AddItem(buy)

				--local running = NativeUI.CreateItem('Laufende Kosten: ' , '~b~')
				--running:RightLabel(prop.price / 800 + 12 .. '$ / Tag')
				--menu:AddItem(running)

				menu.OnItemSelect = function(sender, item, index)

					if item == buy then
						TriggerServerEvent('myProperties:buy', prop.name, "BUY", prop.price)
						_menuPool:CloseAllMenus()
					elseif item == rent then
						_menuPool:CloseAllMenus()
					end

				end
			end
		end
	else
		local price = 0
		local rented = false
		for k, propOwner in pairs(propertyOwner) do
			if propOwner.id == propertyID then
				price = propOwner.price
				rented = propOwner.rented
				break
			end
		end
		if rented == 1 then
			local sell = _menuPool:AddSubMenu(menu, Translation[Config.Locale]['cancel_rent'])
			local rented = NativeUI.CreateItem(Translation[Config.Locale]['rented'], '~b~')
			rented:RightLabel(Translation[Config.Locale]['info_yes'])
			sell:AddItem(rented)
			local confirm = NativeUI.CreateItem(Translation[Config.Locale]['cancel_prop'], '~b~')
			sell:AddItem(confirm)

			sell.OnItemSelect = function(sender, item, index)

				if item == confirm then
					TriggerServerEvent('myProperties:RemoveOwnedProperty', prop.name, 'SOURCE')
					_menuPool:CloseAllMenus()
				end

			end
		else
			local sell = _menuPool:AddSubMenu(menu, Translation[Config.Locale]['sell_prop'])
			local rented = NativeUI.CreateItem(Translation[Config.Locale]['rented'], '~b~')
			rented:RightLabel(Translation[Config.Locale]['info_no'])
			sell:AddItem(rented)
			local confirm = NativeUI.CreateItem(Translation[Config.Locale]['confirm'], Translation[Config.Locale]['confirm_desc'] .. price / 4 .. Translation[Config.Locale]['confirm_desc2'])
			confirm:RightLabel('~g~'.. price / Config.CalculateSellPrice .. '$')
			sell:AddItem(confirm)

			sell.OnItemSelect = function(sender, item, index)

				if item == confirm then
					TriggerServerEvent('myProperties:RemoveOwnedProperty', prop.name, 'SOURCE')
					_menuPool:CloseAllMenus()
				end

			end
		end



	end





	menu:Visible(not menu:Visible())

	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
end


-- OLD VANISHING
-- Citizen.CreateThread(function()

-- 	while true do
-- 		Citizen.Wait(0)
-- 		local playerPed = PlayerPedId()
-- 		if isinProperty then
-- 			for k, user in pairs(vanishedUser) do
-- 				if user ~= playerPed then
-- 					--SetEntityLocallyInvisible(user)
-- 					--SetEntityNoCollisionEntity(playerPed,  user,  true)
-- 					SetEntityLocallyInvisible(user)
--                     SetEntityVisible(user, false, 0)
--                     SetEntityNoCollisionEntity(playerPed, user, true)
-- 				end

-- 			end
-- 		end

-- 	end

-- end)

-- RegisterNetEvent('myProperties:setPlayerInvisible')
-- AddEventHandler('myProperties:setPlayerInvisible', function(playerEnter, instanceId)


-- 	local otherPlayer = GetPlayerFromServerId(playerEnter)

-- 	if otherPlayer ~= nil then
-- 		local otherPlayerPed = GetPlayerPed(otherPlayer)
-- 		table.insert(vanishedUser, otherPlayerPed)
-- 	end

-- end)

-- RegisterNetEvent('myProperties:setPlayerVisible')
-- AddEventHandler('myProperties:setPlayerVisible', function(playerEnter)


-- 	local otherPlayer = GetPlayerFromServerId(playerEnter)
-- 	local otherPlayerPed = GetPlayerPed(otherPlayer)

-- 	for k, vanish in pairs(vanishedUser) do
-- 		if vanish == otherPlayerPed then
-- 			table.remove(vanishedUser, k)
-- 		end
-- 	end

-- end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		if isinProperty then
			for k, user in pairs(vanishedUser) do
				if user ~= playerPed then
					-- NetworkConcealEntity(user, true)
					-- SetEntityLocallyInvisible(user)/*
					-- SetEntityNoCollisionEntity(playerPed,  user,  true)
					SetEntityLocallyInvisible(user)
                    SetEntityVisible(user, false, 0)
                    SetEntityNoCollisionEntity(playerPed, user, true)
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
		if otherPlayerPed ~= GetPlayerPed(-1) then
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
end)


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
	NetworkSetVoiceChannel(propertyID)
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


