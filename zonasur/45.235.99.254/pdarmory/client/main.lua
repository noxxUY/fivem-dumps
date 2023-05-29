ESX = nil

local PlayerData              = {}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(5)

		TriggerEvent("esx:getSharedObject", function(library)
			ESX = library
		end)
    end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	
	
    if ESX.IsPlayerLoaded() then

		--RefreshPed()
    end
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
	Citizen.Wait(100)

	while true do
		local sleepThread = 500

		if not Config.OnlyPolicemen or (Config.OnlyPolicemen and PlayerData["job"] and PlayerData["job"]["name"] == "police") then

			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped)

			local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Armory["x"], Config.Armory["y"], Config.Armory["z"], true)

			if dstCheck <= 5.0 then
				sleepThread = 5

				local text = "Armeria"

				if dstCheck <= 0.5 then
					text = "[~g~E~s~] Armeria"

					if IsControlJustPressed(0, 38) then
						OpenPoliceArmory()
					end
				end

				ESX.Game.Utils.DrawText3D(Config.Armory, text, 0.6)
			end
		end

		Citizen.Wait(sleepThread)
	end
end)

OpenPoliceArmory = function()
	PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)

	local elements = {
		{ ["label"] = "Pedir Armas", ["action"] = "weapon_storage" },
		{ ["label"] = "Guardar Armas", ["action"] = "drop_weapons" },
		{ ["label"] = "Tomar objetos", ["action"] = "get_stock" },
		{ ["label"] = "Guardar objetos", ["action"] = "put_stock" }
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "police_armory_menu",
		{
			title    = "Deposito Policial",
			align    = "center",
			elements = elements
		},
	function(data, menu)
		local action = data.current["action"]

		if action == "weapon_storage" then
			OpenWeaponStorage()
		elseif action == "drop_weapons" then
			DropWeaponMenu()
		elseif action == "get_stock" then
			OpenGetStocksMenu()
		elseif action == "put_stock" then
			OpenPutStocksMenu()
		end		
	end, function(data, menu)
		PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)

		menu.close()
	end, function(data, menu)
		PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
	end)
end

function DropWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon',
	{
		title    = 'Guardar Arma',
		align    = 'bottom-right',
		elements = elements
		
	}, function(data, menu)

		menu.close()
		
		TriggerServerEvent('esx_policejob:removeWeapon', data.current.value)

	end, function(data, menu)
		menu.close()
	end)
end

function OpenGetStocksMenu()
	if PlayerData.job.grade_name == 'boss' then
	ESX.TriggerServerCallback('esx_policejob:getStockItems', function(inventory)


		local elements = {}
		
		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dinero Sucio: <span style="color:red;">$ '..ESX.Math.GroupDigits(inventory.blackMoney)..'</span> ';
				type = 'item_account',
				value = 'black_money'
			})
		end
		
		if inventory.Money > 0 then
			table.insert(elements, {
				label = 'Dinero: <span style="color:green;">$ '..ESX.Math.GroupDigits(inventory.Money)..'</span> ';
				type = 'item_money',
				value = 'money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
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
				index = i
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = 'Almacen Policial',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.type == 'item_weapon' then
				menu.close()

				TriggerServerEvent('esx_policejob:getStockItem', data.current.type, data.current.value, data.current.index)
				ESX.SetTimeout(300, function()
					OpenGetStocksMenu()
				end)
			else

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = 'Cantidad'
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification('~r~Cantidad invalida!')
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:getStockItem', data.current.type, data.current.value, count)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		end
		end, function(data, menu)
			menu.close()
		end)

	end)
	else
		ESX.ShowNotification('~r~SOLO EL JEFE PUEDE RETIRAR')
	end
end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)

		local elements = {}
		
		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dinero Sucio: <span style="color:red;">$ '..ESX.Math.GroupDigits(inventory.blackMoney)..'</span> ';
				type  = 'item_account',
				value = 'black_money'
			})
		end
		
		if inventory.Money > 0 then
			table.insert(elements, {
				label = 'Dinero: <span style="color:green;">$ '..ESX.Math.GroupDigits(inventory.Money)..'</span> ';
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
				TriggerServerEvent('esx_policejob:putStockItems', data.current.type, data.current.value, data.current.ammo)
				ESX.SetTimeout(300, function()
					OpenPutStocksMenu()
				end)
			else
			
			local itemName = data.current.value
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = 'Cantidad'
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification('~r~Cantidad invalida!')
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:putStockItems', data.current.type, itemName, count)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		end
		end, function(data, menu)
			menu.close()
		end)
	end)

end

OpenWeaponStorage = function()
	PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)

	local elements = {}

	local Location = Config.Armory
	local PedLocation = Config.ArmoryPed
	local grade = PlayerData.job.grade_name

	for i = 1, #Config.ArmoryWeapons[grade], 1 do
		local weapon = Config.ArmoryWeapons[grade][i]
		
		if weapon["tipo"] == "item" then
			table.insert(elements, { ["label"] = weapon["label"], ["weapon"] = weapon })
		else
			table.insert(elements, { ["label"] = ESX.GetWeaponLabel(weapon["hash"]), ["weapon"] = weapon })
		end	
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "police_armory_weapon_menu",
		{
			title    = "Armeria Policial",
			align    = "center",
			elements = elements
		},
	function(data, menu)
		local anim = data.current["weapon"]["type"]
		local weaponHash = data.current["weapon"]["hash"]	
		
		--BYPASS ANIMACION DE SACAR Arma
		exports["esx_holster"]:bypass(true, weaponHash)
		
		ESX.UI.Menu.CloseAll()
		
		local closestPed, closestPedDst = ESX.Game.GetClosestPed(PedLocation)
		
		
		--[[
		if (DoesEntityExist(closestPed) and closestPedDst >= 5.0) or IsPedAPlayer(closestPed) then
			RefreshPed(true) -- failsafe if the ped somehow dissapear.

			ESX.ShowNotification("Intente nuevamente!")

			return
		end
		]]

		if IsEntityPlayingAnim(closestPed, "mp_cop_armoury", "pistol_on_counter_cop", 3) or IsEntityPlayingAnim(closestPed, "mp_cop_armoury", "rifle_on_counter_cop", 3) then
			ESX.ShowNotification("Por favor espere su turno!")
			return
		end

		if not NetworkHasControlOfEntity(closestPed) then
			NetworkRequestControlOfEntity(closestPed)
			Citizen.Wait(1000)
		end
		
		SetEntityCoords(closestPed, PedLocation["x"], PedLocation["y"], PedLocation["z"] - 0.985)
		SetEntityHeading(closestPed, PedLocation["h"])

		SetEntityCoords(PlayerPedId(), Location["x"], Location["y"], Location["z"] - 0.985)
		SetEntityHeading(PlayerPedId(), Location["h"])
		SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), true)

		local animLib = "mp_cop_armoury"

		LoadModels({ animLib })

		if DoesEntityExist(closestPed) and closestPedDst <= 5.0 then
			TaskPlayAnim(closestPed, animLib, anim .. "_on_counter_cop", 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
			
			Citizen.Wait(1100)
			
			GiveWeaponToPed(closestPed, GetHashKey(weaponHash), 1, false, true)
			SetCurrentPedWeapon(closestPed, GetHashKey(weaponHash), true)

			TaskPlayAnim(PlayerPedId(), animLib, anim .. "_on_counter", 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)

			Citizen.Wait(3100)

			RemoveWeaponFromPed(closestPed, GetHashKey(weaponHash))

			Citizen.Wait(15)
			GiveWeaponToPed(PlayerPedId(), GetHashKey(weaponHash), Config.ReceiveAmmo, false, true)
			
			local nivel = exports["esx_policejob"]:GetNivel()
			
			if weaponHash == 'WEAPON_SPECIALCARBINE' or weaponHash == 'WEAPON_CARBINE' or weaponHash == 'WEAPON_CARBINERIFLE' then
				if nivel == 3 then
					SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weaponHash), true)
				else
					SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), true)
				end
			else
				SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weaponHash), true)
			end
			
			ClearPedTasks(closestPed)
			ESX.TriggerServerCallback('1974_drogas:check', function(serial)
				if serial then
					TriggerServerEvent('esx_policejob:giveWeapon', weaponHash, Config.ReceiveAmmo, serial)
				end
			end)
		end

		UnloadModels()
	end, function(data, menu)
		PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
		menu.close()
	end, function(data, menu)
		PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
	end)
end

RefreshPed = function(spawn)
	local Location = Config.ArmoryPed

	ESX.TriggerServerCallback("qalle_policearmory:pedExists", function(Exists)
		if Exists and not spawn then
			return
		else

			LoadModels(GetHashKey('s_m_y_cop_01'))

			local pedId = CreatePed(3, Location["hash"], Location["x"], Location["y"], Location["z"] - 0.985, false, true)
			SetEntityHeading(pedId, Location["h"])
			--SetPedCombatAttributes(pedId, 46, true)                     
			--SetPedFleeAttributes(pedId, 0, 0)                      
			SetBlockingOfNonTemporaryEvents(pedId, true)
			
			SetEntityAsMissionEntity(pedId, true, true)
			SetEntityInvincible(pedId, true)
			TaskStartScenarioInPlace(pedId, 'WORLD_HUMAN_GUARD_STAND', 0, true)

			FreezeEntityPosition(pedId, true)
		end
	end)
end

local CachedModels = {}

LoadModels = function(models)
	for modelIndex = 1, #models do
		local model = models[modelIndex]

		table.insert(CachedModels, model)

		if IsModelValid(model) then
			while not HasModelLoaded(model) do
				RequestModel(model)
	
				Citizen.Wait(10)
			end
		else
			while not HasAnimDictLoaded(model) do
				RequestAnimDict(model)
	
				Citizen.Wait(10)
			end    
		end
	end
end

UnloadModels = function()
	for modelIndex = 1, #CachedModels do
		local model = CachedModels[modelIndex]

		if IsModelValid(model) then
			SetModelAsNoLongerNeeded(model)
		else
			RemoveAnimDict(model)   
		end

		table.remove(CachedModels, modelIndex)
	end
	
	Wait(4000)
	--HABILITAMOS DE NUEVO ANIMACION DE SACAR ARMA
	exports["esx_holster"]:bypass(false)
end