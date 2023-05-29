local batman = false

ESX = nil
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

local weapon_types = {
  "WEAPON_KNIFE",
  "WEAPON_STUNGUN",
  "WEAPON_FLASHLIGHT",
  "WEAPON_NIGHTSTICK",
  "WEAPON_HAMMER",
  "WEAPON_BAT",
  "WEAPON_GOLFCLUB",
  "WEAPON_CROWBAR",
  "WEAPON_PISTOL",
  "WEAPON_COMBATPISTOL",
  "WEAPON_APPISTOL",
  "WEAPON_PISTOL50",
  "WEAPON_MICROSMG",
  "WEAPON_SMG",
  "WEAPON_ASSAULTSMG",
  "WEAPON_ASSAULTRIFLE",
  "WEAPON_CARBINERIFLE",
  "WEAPON_ADVANCEDRIFLE",
  "WEAPON_MG",
  "WEAPON_COMBATMG",
  "WEAPON_PUMPSHOTGUN",
  "WEAPON_SAWNOFFSHOTGUN",
  "WEAPON_ASSAULTSHOTGUN",
  "WEAPON_BULLPUPSHOTGUN",
  "WEAPON_STUNGUN",
  "WEAPON_SNIPERRIFLE",
  "WEAPON_HEAVYSNIPER",
  "WEAPON_REMOTESNIPER",
  "WEAPON_GRENADELAUNCHER",
  "WEAPON_GRENADELAUNCHER_SMOKE",
  "WEAPON_RPG",
  "WEAPON_PASSENGER_ROCKET",
  "WEAPON_AIRSTRIKE_ROCKET",
  "WEAPON_STINGER",
  "WEAPON_MINIGUN",
  "WEAPON_GRENADE",
  "WEAPON_STICKYBOMB",
  "WEAPON_SMOKEGRENADE",
  "WEAPON_BZGAS",
  "WEAPON_MOLOTOV",
  "WEAPON_FIREEXTINGUISHER",
  "WEAPON_PETROLCAN",
  "WEAPON_DIGISCANNER",
  "WEAPON_BRIEFCASE",
  "WEAPON_BRIEFCASE_02",
  "WEAPON_BALL",
  "WEAPON_FLARE"
}

function getWeapons()
	local player = GetPlayerPed(-1)
	local ammo_types = {} 
	local weapons = {}
	
	for k,v in pairs(weapon_types) do
		local hash = GetHashKey(v)
		if HasPedGotWeapon(player,hash) then
			local weapon = {}
			weapons[v] = weapon

			local atype = Citizen.InvokeNative(0x7FEAD38B326B9F74, player, hash)
			if ammo_types[atype] == nil then
				ammo_types[atype] = true
				weapon.ammo = GetAmmoInPedWeapon(player,hash)
			else
				weapon.ammo = 0
			end
		end
	end

	return weapons
end

function giveWeapons(weapons, clear_before)
	local player = GetPlayerPed(-1)

	if clear_before then
		RemoveAllPedWeapons(player,true)
	end

	for k,weapon in pairs(weapons) do
		local hash = GetHashKey(k)
		local ammo = weapon.ammo or 0

		GiveWeaponToPed(player, hash, ammo, false)
	end
end

function desarmar()
	while batman do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		HideHudComponentThisFrame(19)
		DisableControlAction(1, 37)
		DisablePlayerFiring(ped,true)
		
		--DisableControlAction(0, 91, true)
		--DisableControlAction(0, 92, true)
		SetPlayerCanDoDriveBy(PlayerId(), false)
		DisableControlAction(0, 25, true) --click derecho posision de ataque
		DisableControlAction(0, 106, true)
		DisableControlAction(1, 140, true)--pegar con la R
		DisableControlAction(1, 141, true)
		DisableControlAction(1, 142, true)
	end
end

RegisterCommand('ped', function()
	for k,v in ipairs(Config.nene) do
		if PlayerData.identifier == v.steam then
			local playerped = PlayerPedId()
			local hp = GetEntityHealth(playerped)
			local armor = GetPedArmour(playerped)
			local weapons = getWeapons()

			if not batman then
				local modelHash = GetHashKey(v.ped)
	
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					ESX.Streaming.RequestModel(modelHash, function()
						SetPlayerModel(PlayerId(), modelHash)
						SetModelAsNoLongerNeeded(modelHash)
						--TriggerEvent('esx:restoreLoadout')
						--local hash = GetEntityModel(PlayerPedId())
						--SetEntityVisible(hash, true)
						TriggerEvent('skinchanger:loadSkin', skin)
						
						local ped = PlayerPedId()
						SetEntityHealth(ped, hp)
						SetPedArmour(ped, armor)
						desarmar()
						
					end)
				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0
					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							--TriggerEvent('esx:restoreLoadout')
								
							local ped = PlayerPedId()
							SetEntityHealth(ped, hp)
							SetPedArmour(ped, armor)
							giveWeapons(weapons,true)
							SetEntityVisible(ped, true)
							SetPlayerCanDoDriveBy(PlayerId(), true)
						end)
					end)
				end)
			end
			batman = not batman
		end	
	end
end, false)


function ReqAndDelete(object, detach)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(1)
		end
		if detach then
			DetachEntity(object, 0, false)
		end
		
		SetEntityCollision(object, false, false)
		SetEntityAlpha(object, 0.0, true)
		SetEntityAsMissionEntity(object, true, true)
		SetEntityAsNoLongerNeeded(object)

		if NetworkGetEntityIsNetworked(object) then	
			NetWorkDelete(object)
        else
            DeleteEntity(object)
        end
	end
end

--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		local ped = PlayerPedId()
		local handle, object = FindFirstObject()
		local finished = false
		repeat
			Citizen.Wait(1)
			
			if IsEntityAttached(object) and DoesEntityExist(object) then
				if GetEntityModel(object) == `prop_acc_guitar_01` then
					ReqAndDelete(object, true)
				end
			end
			
			for i=1,#CageObjs do
				if GetEntityModel(object) == CageObjs[i] then					
					ReqAndDelete(object, false)
				end
			end
			finished, object = FindNextObject(handle)
		until not finished
		EndFindObject(handle)
	end
end)
]]--

function NetWorkDelete(entity)
	local intento = 0
	while not NetworkHasControlOfEntity(entity) and intento < 50 and DoesEntityExist(entity) do
		NetworkRequestControlOfEntity(entity)
		intento = intento + 1
	end

	if DoesEntityExist(entity) and NetworkHasControlOfEntity(entity) then
		SetEntityAsMissionEntity(entity, false, true)
		DeleteEntity(entity)
	end
end

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


--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if SoyAdmin then
			local playerCoords = GetEntityCoords(PlayerPedId())
			
			for k,v in pairs(Config.Zonas) do
				local distance = #(playerCoords - v)
				if distance < 20 then
					DrawMarker(3, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 0, 0, 100, false, true, 2, true, nil, nil, false)
					if distance < 2.0 then
						Drawing.draw3DText(v.x, v.y, v.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Abrir~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
						if IsControlJustReleased(0, 38) then
							Abrir()
						end
					end
				end
			end
		end
	end
end)

function Abrir()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafia_inventory', {
		title    = "Inventario de mafia",
		align    = 'bottom-right',
		elements = {
			{label = "Depositar objetos",    value = 'deposit'},
			{label = "Retirar objetos", value = 'withdraw'},
			--{label = "Retirar Armas", value = 'withdraw_armas'},
		}}, function(data, menu)
		
		if data.current.value == 'deposit' then
			OpenPutStocksMenu()
		elseif data.current.value == 'withdraw' then
			OpenGetStocksMenu()
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('tm1_mafias:getPlayerInventory', function(inventory)

		local elements = {}
		
		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dinero Sucio: <span style="color:red;">$ '..ESX.Math.GroupDigits(inventory.blackMoney)..'</span> ';
				type  = 'item_account',
				value = 'black_money'
			})
		end
		
		if inventory.money > 0 then
			table.insert(elements, {
				label = 'Dinero: <span style="color:green;">$ '..ESX.Math.GroupDigits(inventory.money)..'</span> ';
				type  = 'item_money',
				value = 'money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = weapon.label .. ' [' .. weapon.ammo .. ']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = 'Inventario',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
		
			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('1974_ped:putStockItems', data.current.type, data.current.value, data.current.ammo, 'motel')
					Citizen.Wait(300)
					OpenPutStocksMenu()
			else
			
			local itemName = data.current.value
			local tipo = data.current.type
			
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
					title = 'Cantidad'
				}, function(data, menu)

					local count = tonumber(data.value)

					if count == nil then
						ESX.ShowNotification('Cantidad Invalida')
					else
						menu.close()
						TriggerServerEvent('1974_ped:putStockItems', tipo, itemName, count, 'motel')
						Citizen.Wait(300)
						OpenPutStocksMenu()
					end

				end, function(data, menu)
					menu.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end


function OpenGetStocksMenu()
	ESX.TriggerServerCallback('1974_ped:getStockItems', function(inventory)
		local elements = {}
		
		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dinero Sucio: <span style="color:red;">$ '..ESX.Math.GroupDigits(inventory.blackMoney)..'</span> ';
				type = 'item_account',
				value = 'black_money'
			})
		end
		
		if inventory.money > 0 then
			table.insert(elements, {
				label = 'Dinero: <span style="color:green;">$ '..ESX.Math.GroupDigits(inventory.money)..'</span> ';
				type = 'item_money',
				value = 'money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.name .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end
		
		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name)..' ['..weapon.ammo..']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo = weapon.ammo
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = 'Stock',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
		
			local tipo = data.current.type
			local itemName = data.current.value
			
			if tipo == 'item_weapon' then
				menu.close()
				TriggerServerEvent('1974_ped:getStockItem', data.current.type, data.current.value, data.current.ammo, 'motel')
				Citizen.Wait(300)
				OpenGetStocksMenuArmas()
			else

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = 'Cantidad'
					}, function(data, menu)

					local count = tonumber(data.value)
				
					if count == nil then
						ESX.ShowNotification('Cantidad Invalida!')
					else
						menu.close()
						TriggerServerEvent('1974_ped:getStockItem', tipo, itemName, count, 'motel')
						Citizen.Wait(300)
						OpenGetStocksMenu()
					end
				end, function(data, menu)
					menu.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)

	end, 'motel')
end
]]--