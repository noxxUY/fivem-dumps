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
	ESX.TriggerServerCallback('armasNorteGet', function(shopItems)
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
		if tra.job.name == "armasNorte" then
			love = true
		else
			print('No menor')
		end 
	end 
end
end)
RegisterNetEvent('armasNortesendShop')
AddEventHandler('armasNortesendShop', function(shopItems)
	for k,v in pairs(shopItems) do
		Config.Zones[k].Items = v
		print(Config.Zones[k].Items)
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
		align = 'bottom-right',
		elements = elements
	}, function(data, menu)
		ESX.TriggerServerCallback('armasNortebuyWeapon', function(bought)
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

AddEventHandler('entraEnPointNorte', function(zone)
	if love then
	if zone == 'GunShop' or zone == 'BlackWeashop' then
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('shop_menu_prompt')
		CurrentActionData = { zone = zone }
	end end
end)

AddEventHandler('salePointNorte', function(zone)
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

				SetBlipSprite (blip, 174)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 1.0)
				SetBlipColour (blip, 50)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName(_U('map_blip'))
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Display markers
local tt= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(tt)
		local opt = true
	if love then
		tt = 2500
		local coords = GetEntityCoords(PlayerPedId())

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Locations, 1 do
				if (Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Locations[i], true) < Config.DrawDistance) then
					opt = false
					tt = 1
					DrawMarker(21, v.Locations[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x-0.5, Config.Size.y-0.5, Config.Size.z-0.2, Config.Color.r, Config.Color.g, Config.Color.b, 100, true, true, 2, false, false, false, false)
				end
			end
		end
	else
		tt = 10000
	end 
		if opt == true then
			tt = 2500
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		local isInMarker, currentZone = false, nil
		local o = true
if love then 
		for k,v in pairs(Config.Zones) do
			for i=1, #v.Locations, 1 do
				if GetDistanceBetweenCoords(coords, v.Locations[i], true) < Config.Size.x then
					o = false
					isInMarker, ShopItems, currentZone, LastZone = true, v.Items, k, k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('entraEnPointNorte', currentZone)
		end
		
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('salePointNorte', LastZone)
		end
	else
		Citizen.Wait(3000)
	end
	if o == true then
		Citizen.Wait(3000)
	end
 end
end)

-- Key Controls
local TTT= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(TTT)
if love then
		if CurrentAction ~= nil then
			if ShopOpen == false then
			ESX.ShowFloatingHelpNotification(CurrentActionMsg)
			TTT=5
			if IsControlJustReleased(0, 38) then

				if CurrentAction == 'shop_menu' then
					
								OpenShopMenu(CurrentActionData.zone)
				end

				CurrentAction = nil
			end
		end
		else
			TTT = 2500
		end 
	else
		Citizen.Wait(3000)
	end
	end
end)
RegisterNetEvent('armeroNorteChaleco')
AddEventHandler('armeroNorteChaleco', function()

	local playerPed = GetPlayerPed(-1)
	local jugador = PlayerPedId()
	local e = {
		Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur=3500
	}
	while not HasAnimDictLoaded(e.Dict) do
		RequestAnimDict(e.Dict)
		Wait(100)
	end
local diccionario = 'clothingtie'
local animacion = 'try_tie_negative_a'
TaskPlayAnim(jugador, e.Dict, e.Anim, 3.0, 3.0, e.Dur, e.Move, 0, false, false, false)
	SetPedComponentVariation(playerPed, 9, 27, 9, 2)
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
	
end)


  local GUI = {}
GUI.Time = 0
  RegisterCommand('menuarmerianorte', function()
  if PlayerData.job ~= nil and PlayerData.job.name == 'armasNorte' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'SnowiMafiasAcciones') and (GetGameTimer() - GUI.Time) > 150 then
	TriggerEvent('snowiEventToMenu', PlayerData.job.name)
	   GUI.Time = GetGameTimer()
  end 
  end)
  RegisterKeyMapping('menuarmerianorte', 'Menu armeria norte', 'keyboard', 'F6' )