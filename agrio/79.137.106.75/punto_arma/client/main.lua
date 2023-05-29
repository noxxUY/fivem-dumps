ESX = nil
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local ShopOpen = false
local love = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
	end
	while ESX.GetPlayerData() == nil do
        Citizen.Wait(1000)
    end
    PlayerData = ESX.GetPlayerData()
	ESX.TriggerServerCallback('aermas:getShop', function(shopItems)
		for k,v in pairs(shopItems) do
			Config.Zones[k].Items = v
		end
	end)
end)
local ja = true
Citizen.CreateThread(function()
while ja do
	Citizen.Wait(1)
	if IsControlJustReleased(0, 32) then
     ja = false
   tra = ESX.GetPlayerData()
if tra.job.name == "armasmenor" then
	love = true
else print('No menor')
end end end
end)
RegisterNetEvent('armas:sendShop')
AddEventHandler('armas:sendShop', function(shopItems)
	for k,v in pairs(shopItems) do
		Config.Zones[k].Items = v
	end
end)

function OpenShopMenu(zone)
	local elements = {}
	ShopOpen = true

	for i=1, #Config.Zones[zone].Items, 1 do
		local item = Config.Zones[zone].Items[i]

		table.insert(elements, {
			label = ('%s - <span style="color: green;">%s</span> | %s '):format(item.label, _U('shop_menu_item', ESX.Math.GroupDigits(item.price)), 'STOCK:'..item.stock),
			price = item.price,
			weaponName = item.item
		})
	end

	ESX.UI.Menu.CloseAll()
	PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title = _U('shop_menu_title'),
		align = 'top-left',
		elements = elements
	}, function(data, menu)
		ESX.TriggerServerCallback('armas:buyWeapon', function(bought)
			if bought then
				DisplayBoughtScaleform(data.current.weaponName, data.current.price)
				OpenShopMenu('GunShop')
			else
				PlaySoundFrontend(-1, 'ERROR', 'HUD_AMMO_SHOP_SOUNDSET', false)
			end
		end, data.current.weaponName, zone)
	end, function(data, menu)
		PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
		ShopOpen = false
		menu.close()

		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('shop_menu_prompt')
		CurrentActionData = { zone = zone }
	end, function(data, menu)
		PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
	end)
end

function DisplayBoughtScaleform(weaponName, price)
	local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	local sec = 4

	BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')

	PushScaleformMovieMethodParameterString(_U('weapon_bought', ESX.Math.GroupDigits(price)))
	PushScaleformMovieMethodParameterString(ESX.GetWeaponLabel(weaponName))
	PushScaleformMovieMethodParameterInt(GetHashKey(weaponName))
	PushScaleformMovieMethodParameterString('')
	PushScaleformMovieMethodParameterInt(100)

	EndScaleformMovieMethod()

	PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)

	Citizen.CreateThread(function()
		while sec > 0 do
			Citizen.Wait(0)
			sec = sec - 0.01
	
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
	end)
end

AddEventHandler('puntosarmashasEntered1', function(zone)
	if love then
	if zone == 'GunShop' or zone == 'BlackWeashop' then
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('shop_menu_prompt')
		CurrentActionData = { zone = zone }
	end end
end)

AddEventHandler('puntosarmaleave', function(zone)
	if love then 
	CurrentAction = nil
	ESX.UI.Menu.CloseAll() end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if ShopOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

-- Create Blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Zones) do
		if v.Legal then
			for i = 1, #v.Locations, 1 do
				local blip = AddBlipForCoord(v.Locations[i])

				SetBlipSprite (blip, 150)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 1.0)
				SetBlipColour (blip, 81)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName('Armeria [CIUDAD]')
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Display markers
local aaaaaaa= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(aaaaaaa)
if love then
	local sivet= false
		local coords = GetEntityCoords(PlayerPedId())

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Locations, 1 do
				if (Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Locations[i], true) < 15.0) then
					sivet = true
					aaaaaaa = 1
					DrawMarker(21, v.Locations[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
		if sivet== false then 
			aaaaaaa= 2500
		end
	end end
end)

-- Enter / Exit marker events
local erfas= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(erfas)
		local coords = GetEntityCoords(PlayerPedId())
		local isInMarker, currentZone = false, nil
if love then 
	erfas = 1500
		for k,v in pairs(Config.Zones) do
			for i=1, #v.Locations, 1 do
				if GetDistanceBetweenCoords(coords, v.Locations[i], true) < Config.Size.x then
					isInMarker, ShopItems, currentZone, LastZone = true, v.Items, k, k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('puntosarmashasEntered1', currentZone)
		end
		
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('puntosarmaleave', LastZone)
		end
	end end
end)

-- Key Controls
local jajaja= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(jajaja)
if love then
		if CurrentAction ~= nil then
			jajaja = 5
			ESX.ShowFloatingHelpNotification(CurrentActionMsg, GetEntityCoords(GetPlayerPed(-1)))

			if IsControlJustReleased(0, 38) then

				if CurrentAction == 'shop_menu' then
					--if Config.LicenseEnable and Config.Zones[CurrentActionData.zone].Legal then
						--ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
							--if hasWeaponLicense then
								OpenShopMenu(CurrentActionData.zone)
							--else
								--OpenBuyLicenseMenu(CurrentActionData.zone)
							--end
						--end, GetPlayerServerId(PlayerId()), 'weapon')
					--else
						--OpenShopMenu(CurrentActionData.zone)
					--end
				end

				CurrentAction = nil
			end
		else
			jajaja = 1500
		end end
	end
end)
local GUI = {}
GUI.Time = 0
  RegisterCommand('menuciudadarmas', function()
  if PlayerData.job ~= nil and PlayerData.job.name == 'armasmenor' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'SnowiMafiasAcciones') and (GetGameTimer() - GUI.Time) > 150 then
	TriggerEvent('snowiEventToMenu', PlayerData.job.name)
	   GUI.Time = GetGameTimer()
  end 
  end)
  RegisterKeyMapping('menuciudadarmas', 'Menu armeria ciudad', 'keyboard', 'F6' )