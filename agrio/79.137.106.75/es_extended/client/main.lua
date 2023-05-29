local isPaused, isDead, pickups = false, false, {}
local isLoadoutLoaded, isPlayerSpawned= false, false
local lastLoadout = {}
local veeee = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if NetworkIsPlayerActive(PlayerId()) then
			TriggerServerEvent('esx:onPlayerJoined')
			break
		end
	end
end)

local puede = 0
RegisterCommand('cp', function(source, args)
if puede >10 then
	puede = 0
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        
        --TriggerEvent('skinchanger:loadSkin', {sex=0},print('a'))
        if skin.sex == 0 then
        TriggerEvent('skinchanger:loadDefaultModel', true, print('b'))
        else
        TriggerEvent('skinchanger:loadDefaultModel', false, print('b'))
        end

        --print(json.encode(skin))
        Citizen.Wait(2000)
        TriggerEvent('skinchanger:loadSkin', skin)
        TriggerEvent('snowidesbug')
        TriggerEvent('snowiClear', 'j')
end)
	TriggerEvent('chatMessage', '🍊AYUDA🍊', {255, 0, 0},"Has usado /cp para desbugearte. Si tu personaje sigue sin cargar, notifica al STAFF a través de /report o a través de ticket en discord.gg/agriorp!!")
else
	TriggerEvent('chatMessage', '🍊AYUDA🍊', {255, 0, 0},"No hemos detectado que estás bugeado, por favor, si es así notifica al STAFF a través de /report o a través de ticket en discord.gg/agriorp!!")
end 
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
	ESX.PlayerLoaded = true
	ESX.PlayerData = playerData
	coordsESX = {}
	coordsESX.x=playerData.coords.x
	coordsESX.y=playerData.coords.y
	coordsESX.z=playerData.coords.z
	--print('Seteadas coords ESX')
	veeee = veeee+1
	-- check if player is coming from loading screen
	if GetEntityModel(PlayerPedId()) == GetHashKey('PLAYER_ZERO') then
		local defaultModel = GetHashKey('a_f_m_beach_01')
		RequestModel(defaultModel)

		while not HasModelLoaded(defaultModel) do
			Citizen.Wait(0)
		end

		SetPlayerModel(PlayerId(), defaultModel)
		SetPedDefaultComponentVariation(PlayerPedId())
		SetPedRandomComponentVariation(PlayerPedId(), true)
		SetModelAsNoLongerNeeded(defaultModel)
		puede = puede +1
	    --TriggerEvent('chatMessage', '🍊AYUDA🍊', {255, 0, 0},"Si tu personaje no se cargó correctamente, puedes usar /cp para volver a cargarlo!!")
	end

	-- freeze the player
	FreezeEntityPosition(PlayerPedId(), true)

	-- enable PVP
	SetCanAttackFriendly(PlayerPedId(), true, false)
	NetworkSetFriendlyFireOption(true)

	-- disable wanted level
	ClearPlayerWantedLevel(PlayerId())
	SetMaxWantedLevel(0)

	if Config.EnableHud then
		for k,v in ipairs(playerData.accounts) do
			local accountTpl = '<div><img src="img/accounts/' .. v.name .. '.png"/>&nbsp;{{money}}</div>'
			ESX.UI.HUD.RegisterElement('account_' .. v.name, k, 0, accountTpl, {money = ESX.Math.GroupDigits(v.money)})
		end

		local jobTpl = '<div>{{job_label}} - {{grade_label}}</div>'

		if playerData.job.grade_label == '' or playerData.job.grade_label == playerData.job.label then
			jobTpl = '<div>{{job_label}}</div>'
		end

		ESX.UI.HUD.RegisterElement('job', #playerData.accounts, 0, jobTpl, {
			job_label = playerData.job.label,
			grade_label = playerData.job.grade_label
		})
	end

	Citizen.Wait(150)
	print('Tp '..playerData.coords.x..' Y= '..playerData.coords.y..' Z='..playerData.coords.z)
	ESX.Game.Teleport(PlayerPedId(), {
		x = playerData.coords.x,
		y = playerData.coords.y,
		z = playerData.coords.z + 0.25,
		heading = playerData.coords.heading
	}, function()
		frz = true
	--	Citizen.Wait(1000)
		print('Primero on player span server')
		TriggerServerEvent('esx:onPlayerSpawn')
	--	Citizen.Wait(1000)
		print('Primero client')
		TriggerEvent('esx:onPlayerSpawn')
	--	Citizen.Wait(1000)
		print('Primero normal sin na clien')
		TriggerEvent('playerSpawned') -- compatibility with old scripts, will be removed soon
	--	Citizen.Wait(1000)
		print('Primero restore loadit')
		TriggerEvent('esx:restoreLoadout')
		TriggerServerEvent('snowiStartTout', veeee)
	--	Citizen.Wait(1000)
		--print('Primero')

		Citizen.Wait(3000)
		ShutdownLoadingScreen()
--	Citizen.Wait(1000)
		print('Primero  screen')
		ShutdownLoadingScreenNui()
	--	Citizen.Wait(1000)
		print('Primero nui')
		FreezeEntityPosition(PlayerPedId(), false)
	--	Citizen.Wait(1000)
		print('Primero freze')
		DoScreenFadeIn(10000)
	--	Citizen.Wait(2000)
		print('Primero fade in')
		StartServerSyncLoops()
	end)--]]
	--Citizen.Wait(1000)
	print('Primero offf loading')
	TriggerEvent('esx:loadingScreenOff')
	TriggerEvent('snowiFixDefModel')
	frz = false
	TriggerEvent('checkDeadSnowi')
	
end)
--local dui = GetDuiHandle(CreateDui('https://i.imgur.com/NFVvZeP.png', 642, 512))
local dui = GetDuiHandle(CreateDui('https://media.discordapp.net/attachments/870820745935224832/871692702633300008/Banner_Agrio.gif', 1020, 450))
local dui2 = GetDuiHandle(CreateDui('https://media.discordapp.net/attachments/743943681903689729/1098995955275149342/yjhcmovie-loading.gif', 1020, 450))
local snowiESX = true
Citizen.CreateThread(function()
	CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('SnowiLoad'), 'loaded', dui)
	CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('SnowiLoad2'), 'loaded', dui2)
while snowiESX do
	while frz == nil do
		Citizen.Wait(1)
		DrawSprite('SnowiLoad', 'loaded', 0.5, 0.55, 0.65, 0.65, 0, 255, 255, 255, 130)
	end
	if frz == true then
		print('Seteo', coordsESX.x, coordsESX.y, coordsESX.z)
		SetEntityCoords(PlayerPedId(),coordsESX.x, coordsESX.y, coordsESX.z, true, false, false, true)
		FreezeEntityPosition(PlayerPedId(), true)
		SetEntityVisible(PlayerPedId(), false, 0)
		DrawSprite('SnowiLoad2', 'loaded', 0.5, 0.55, 0.65, 0.65, 0, 255, 255, 255, 130)
	end
	if frz == false then
		print('Rompo thread')
		SetEntityVisible(PlayerPedId(), true, 0)
		snowiESX = false
		return

	end
Citizen.Wait(1)
end
end)


RegisterNetEvent('esx:setMaxWeight')
AddEventHandler('esx:setMaxWeight', function(newMaxWeight) ESX.PlayerData.maxWeight = newMaxWeight end)

AddEventHandler('esx:onPlayerSpawn', function() isDead = false end)
AddEventHandler('esx:onPlayerDeath', function() isDead = true end)

AddEventHandler('skinchanger:modelLoaded', function()
	while not ESX.PlayerLoaded do
		Citizen.Wait(0)
	end
print('Cargada skin player')
--if isLoadoutLoaded == false then
	TriggerEvent('esx:restoreLoadout')
--end
end)

AddEventHandler('esx:restoreLoadout', function()
	--[[local playerPed = PlayerPedId()
	local ammoTypes = {}
	RemoveAllPedWeapons(playerPed, true)

	for k,v in ipairs(ESX.PlayerData.loadout) do
		local weaponName = v.name
		local weaponHash = GetHashKey(weaponName)

		GiveWeaponToPed(playerPed, weaponHash, 0, false, false)
		SetPedWeaponTintIndex(playerPed, weaponHash, v.tintIndex)

		local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)

		for k2,v2 in ipairs(v.components) do
			local componentHash = ESX.GetWeaponComponent(weaponName, v2).hash
			GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
		end

		if not ammoTypes[ammoType] then
			AddAmmoToPed(playerPed, weaponHash, v.ammo)
			ammoTypes[ammoType] = true
		end
	end--]]
	local playerPed = PlayerPedId()
	local ammoTypes = {}

	RemoveAllPedWeapons(playerPed, true)
print('Armas eliminadas restoreloadout')
	for k,v in ipairs(ESX.PlayerData.loadout) do
		local weaponName = v.name
		local weaponHash = GetHashKey(weaponName)
print('Arma giveada '..json.encode(ESX.PlayerData.loadout))
		GiveWeaponToPed(playerPed, weaponHash, 0, false, false)
		local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)

		for k2,v2 in ipairs(v.components) do
			local componentHash = ESX.GetWeaponComponent(weaponName, v2).hash

			GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
		end

		if not ammoTypes[ammoType] then
			AddAmmoToPed(playerPed, weaponHash, v.ammo)
			ammoTypes[ammoType] = true
		end
	end

	isLoadoutLoaded = true
end)
RegisterCommand('getWeig', function(source, args)
print("Weight del inventario: "..ESX.PlayerData.weight)
end)
RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for k,v in ipairs(ESX.PlayerData.accounts) do
		if v.name == account.name then
			ESX.PlayerData.accounts[k] = account
			break
		end
	end

	if Config.EnableHud then
		ESX.UI.HUD.UpdateElement('account_' .. account.name, {
			money = ESX.Math.GroupDigits(account.money)
		})
	end
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count, showNotification)
	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.UI.ShowInventoryItemNotification(true, v.label, count - v.count)
			ESX.PlayerData.inventory[k].count = count
			break
		end
	end

	if showNotification then
		ESX.UI.ShowInventoryItemNotification(true, item, count)
	end

	if ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
		ESX.ShowInventory()
	end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count, showNotification)
	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.UI.ShowInventoryItemNotification(false, v.label, v.count - count)
			ESX.PlayerData.inventory[k].count = count
			break
		end
	end

	if showNotification then
		ESX.UI.ShowInventoryItemNotification(false, item, count)
	end

	if ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
		ESX.ShowInventory()
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:addWeapon')
AddEventHandler('esx:addWeapon', function(weaponName, ammo)
	--[[local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)

	GiveWeaponToPed(playerPed, weaponHash, ammo, false, false)--]]
	local playerPed  = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)

	GiveWeaponToPed(playerPed, weaponHash, ammo, false, false)
	print(PlayerPedId(-1)..' Cogió un arma del suelo ['..weaponHash)
end)

RegisterNetEvent('esx:addWeaponComponent')
AddEventHandler('esx:addWeaponComponent', function(weaponName, weaponComponent)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)
	local componentHash = ESX.GetWeaponComponent(weaponName, weaponComponent).hash

	GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
end)

RegisterNetEvent('esx:setWeaponAmmo')
AddEventHandler('esx:setWeaponAmmo', function(weaponName, weaponAmmo)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)

	SetPedAmmo(playerPed, weaponHash, weaponAmmo)
end)

RegisterNetEvent('esx:setWeaponTint')
AddEventHandler('esx:setWeaponTint', function(weaponName, weaponTintIndex)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)

	SetPedWeaponTintIndex(playerPed, weaponHash, weaponTintIndex)
end)

RegisterNetEvent('esx:removeWeapon')
AddEventHandler('esx:removeWeapon', function(weaponName, ammo)
	--[[local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)

	RemoveWeaponFromPed(playerPed, weaponHash)
	SetPedAmmo(playerPed, weaponHash, 0) -- remove leftover ammo--]]
	local playerPed  = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)
	SetCurrentPedWeapon(playerPed,GetHashKey("WEAPON_UNARMED"),true)
	RemoveWeaponFromPed(playerPed, weaponHash)

	if ammo then
		local pedAmmo = GetAmmoInPedWeapon(playerPed, weaponHash)
		local finalAmmo = math.floor(pedAmmo - ammo)
		SetPedAmmo(playerPed, weaponHash, finalAmmo)
	else
		SetPedAmmo(playerPed, weaponHash, 0) -- remove leftover ammo
	end
end)

RegisterNetEvent('esx:removeWeaponComponent')
AddEventHandler('esx:removeWeaponComponent', function(weaponName, weaponComponent)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)
	local componentHash = ESX.GetWeaponComponent(weaponName, weaponComponent).hash

	RemoveWeaponComponentFromPed(playerPed, weaponHash, componentHash)
end)

RegisterNetEvent('esx:teleport')
AddEventHandler('esx:teleport', function(coords)
	local playerPed = PlayerPedId()

	-- ensure decmial number
	coords.x = coords.x + 0.0
	coords.y = coords.y + 0.0
	coords.z = coords.z + 0.0

	ESX.Game.Teleport(playerPed, coords)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if Config.EnableHud then
		ESX.UI.HUD.UpdateElement('job', {
			job_label = job.label,
			grade_label = job.grade_label
		})
	end
end)

RegisterNetEvent('esx:spawnVehicle')
AddEventHandler('esx:spawnVehicle', function(vehicleName)
	local model = (type(vehicleName) == 'number' and vehicleName or GetHashKey(vehicleName))

	if IsModelInCdimage(model) then
		local playerPed = PlayerPedId()
		local playerCoords, playerHeading = GetEntityCoords(playerPed), GetEntityHeading(playerPed)

		ESX.Game.SpawnVehicle(model, playerCoords, playerHeading, function(vehicle)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		end)
	else
		TriggerEvent('chat:addMessage', {args = {'^1AgrioRP', 'Nombre del vehículo inválido.'}})
	end
end)





RegisterNetEvent('esx:registerSuggestions')
AddEventHandler('esx:registerSuggestions', function(registeredCommands)
	for name,command in pairs(registeredCommands) do
		if command.suggestion then
			TriggerEvent('chat:addSuggestion', ('/%s'):format(name), command.suggestion.help, command.suggestion.arguments)
		end
	end
end)



RegisterNetEvent('esx:deleteVehicle')
AddEventHandler('esx:deleteVehicle', function(radius)
	local playerPed = PlayerPedId()

	if radius and tonumber(radius) then
		radius = tonumber(radius) + 0.01
		local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(playerPed), radius)

		for k,entity in ipairs(vehicles) do
			local attempt = 0

			while not NetworkHasControlOfEntity(entity) and attempt < 100 and DoesEntityExist(entity) do
				Citizen.Wait(100)
				NetworkRequestControlOfEntity(entity)
				attempt = attempt + 1
			end

			if DoesEntityExist(entity) and NetworkHasControlOfEntity(entity) then
				ESX.Game.DeleteVehicle(entity)
			end
		end
	else
		local vehicle, attempt = ESX.Game.GetVehicleInDirection(), 0

		if IsPedInAnyVehicle(playerPed, true) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		end

		while not NetworkHasControlOfEntity(vehicle) and attempt < 100 and DoesEntityExist(vehicle) do
			Citizen.Wait(100)
			NetworkRequestControlOfEntity(vehicle)
			attempt = attempt + 1
		end

		if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
			ESX.Game.DeleteVehicle(vehicle)
		end
	end
end)

-- Pause menu disables HUD display
if Config.EnableHud then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(300)

			if IsPauseMenuActive() and not isPaused then
				isPaused = true
				ESX.UI.HUD.SetDisplay(0.0)
			elseif not IsPauseMenuActive() and isPaused then
				isPaused = false
				ESX.UI.HUD.SetDisplay(1.0)
			end
		end
	end)

	AddEventHandler('esx:loadingScreenOff', function()
		ESX.UI.HUD.SetDisplay(1.0)
	end)
end
local waitloadu = 10000
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(waitloadu)
if isLoadoutLoaded then
		local playerPed      = PlayerPedId()
		local loadout        = {}
		local loadoutChanged = false

		for k,v in ipairs(Config.Weapons) do
			local weaponName = v.name
			local weaponHash = GetHashKey(weaponName)
			local weaponComponents = {}

			if HasPedGotWeapon(playerPed, weaponHash, false) and weaponName ~= 'WEAPON_UNARMED' then
				local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)

				for k2,v2 in ipairs(v.components) do
					if HasPedGotWeaponComponent(playerPed, weaponHash, v2.hash) then
						table.insert(weaponComponents, v2.name)
					end
				end

				if not lastLoadout[weaponName] or lastLoadout[weaponName] ~= ammo then
					loadoutChanged = true
				end

				lastLoadout[weaponName] = ammo

				table.insert(loadout, {
					name = weaponName,
					ammo = ammo,
					label = v.label,
					components = weaponComponents
				})
			else
				if lastLoadout[weaponName] then
					loadoutChanged = true
				end

				lastLoadout[weaponName] = nil
			end
		end
	
		if loadoutChanged and isLoadoutLoaded then
			ESX.PlayerData.loadout = loadout
			TriggerServerEvent('esx:updateLoadout', loadout)
		end
	else
		print("loadaout changed false no se acftualiza")
	end

	end
end)

function StartServerSyncLoops()
	-- keep track of ammo
	--[[Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)

			if isDead then
				Citizen.Wait(500)
			else
				local playerPed = PlayerPedId()

				if IsPedShooting(playerPed) then
					local _,weaponHash = GetCurrentPedWeapon(playerPed, true)
					local weapon = ESX.GetWeaponFromHash(weaponHash)

					if weapon then
						local ammoCount = GetAmmoInPedWeapon(playerPed, weaponHash)
						TriggerServerEvent('esx:updateWeaponAmmo', weapon.name, ammoCount)
					end
				end
			end
		end
	end)--]]

	-- sync current player coords with server
	Citizen.CreateThread(function()
		local previousCoords = vector3(ESX.PlayerData.coords.x, ESX.PlayerData.coords.y, ESX.PlayerData.coords.z)

		while true do
			Citizen.Wait(5000)
			if ESX.PlayerLoaded == true then
			local playerPed = PlayerPedId()

			if DoesEntityExist(playerPed) then
				local playerCoords = GetEntityCoords(playerPed)
				local distance = #(playerCoords - previousCoords)

				if distance > 5 then
					previousCoords = playerCoords
					local playerHeading = ESX.Math.Round(GetEntityHeading(playerPed), 1)
					local formattedCoords = {x = ESX.Math.Round(playerCoords.x, 1), y = ESX.Math.Round(playerCoords.y, 1), z = ESX.Math.Round(playerCoords.z, 1), heading = playerHeading}
					TriggerServerEvent('esx:updateCoords', formattedCoords)
				end
			end
		end
		end
	end)
end

--[[RegisterCommand('inventario', function() if IsInputDisabled(0) and not isDead and not ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
	--ESX.ShowInventory()
TriggerEvent("openInventoriHUD")
end end)
RegisterKeyMapping('inventario', 'Menu de tu inventario', 'keyboard', 'F2' )--]]
RegisterNetEvent('snowiSyncDoInvC', function()
ExecuteCommand('doinv') end)
RegisterCommand('doinv', function(source, args) 
    local inv = {}
   -- table.insert(inv, {label='Snowi test', count = 69})
if args[1] ~= nil then
local id = tonumber(args[1])
if IsEntityDead(GetPlayerPed(GetPlayerFromServerId(id))) then print('Cacheando a muerto')  
	TriggerEvent('chatMessage', 'AgrioRP🍊', {200, 10, 0},"Has solicitado /doinv al ID ("..id..") [muerto] ")
TriggerServerEvent('snowiSyncDoInv', id)
else
	print('No puede este pendejo sugerir a nadie que este vivo un doinv')
end
	
	return
end
	for k,v in pairs(ESX.PlayerData.accounts) do
        print('Reccop mony')
		if v.money > 0 then
			
if v.name == 'money' then
    v.snowiName = 'Dinero en mano'

			table.insert(inv, {
				label =v.snowiName,
				count = '^2'..v.money..'^4€^0'
			})
        end
		end
	end
print('Recopilando informacion de tu inventario...')
	for k,v in ipairs(ESX.PlayerData.inventory) do
      --  print(json.encode(v))
		if v.count > 0 then
            if v.label == nil then v.label = v.name end
			--currentWeight = currentWeight + (v.weight * v.count)

			table.insert(inv, {
				label = '^5'..v.label..'^0',
				count = v.count})
		end
	end
	local playerPed = PlayerPedId()
    for i=1, #Config.Weapons, 1 do
		local weaponHash = GetHashKey(Config.Weapons[i].name)
print('Add weapon')
		if HasPedGotWeapon(playerPed, weaponHash, false) and Config.Weapons[i].name ~= 'WEAPON_UNARMED' then
			local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
			table.insert(inv, {
				label     = '^1'..Config.Weapons[i].label..'^0',
				count      = ammo,
			})
		end
	end
    local info = 'Tendría: '
   -- print(json.encode(inv))
    for i=1, #inv, 1 do
       info = info..inv[i].label..' x '..inv[i].count..' / '
    end
    print(info)
    ExecuteCommand('do '..info)
--ExecuteCommand('do Tendría: '..inv[#inv].label..' x '..inv[#inv].count)

end)