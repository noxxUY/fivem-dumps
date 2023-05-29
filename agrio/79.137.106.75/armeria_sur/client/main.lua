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
	ESX.TriggerServerCallback('armasSurGet', function(shopItems)
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
		if tra.job.name == "armeriaSur" then
			print('si armeria')
			love = true
		else
			print('No menor')
		end 
	end 
end
end)
RegisterCommand('reloadArmeria', function()
	tra = ESX.GetPlayerData()
	PlayerData = ESX.GetPlayerData()
		if tra.job.name == "armeriaSur" then
			love = true
		else
			print('No armeria :>'..tra.job.name)
		end 
	end
)
RegisterNetEvent('armasSursendShop')
AddEventHandler('armasSursendShop', function(shopItems)
	for k,v in pairs(shopItems) do
		Config.Zones[k].Items = v
		print(Config.Zones[k].Items)
	end
end)

function OpenShopMenu(zone)
	local elements = {}
	ShopOpen = true
print(json.encode(Config.Zones))
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
		ESX.TriggerServerCallback('armasSurbuyWeapon', function(bought)
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

AddEventHandler('entraEnPointsad23', function(zone)

	if zone == 'GunShop' or zone == 'BlackWeashop' then
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('shop_menu_prompt')
		CurrentActionData = { zone = zone }
	end 
	if zone == 'Vehicles' then
        CurrentAction     = 'menu_vehicle_spawner'
        CurrentActionMsg  = 'Sacar vehiculo'
        CurrentActionData = { zone = zone}
    end

    if zone == 'VehicleDeleters' then

      local playerPed = GetPlayerPed(-1)

      if IsPedInAnyVehicle(playerPed,  false) then

        local vehicle = GetVehiclePedIsIn(playerPed,  false)

        CurrentAction     = 'delete_vehicle'
        CurrentActionMsg  = 'Guardar vehiculo'
        CurrentActionData = {vehicle = vehicle}
      end

    end

end)

function SetVehicleMaxMods(vehicle)

	local props = {
	  modEngine       = 0,
	  modBrakes       = 0,
	  modTransmission = 0,
	  modSuspension   = 0,
	  modTurbo        = false,
	}
  
	ESX.Game.SetVehicleProperties(vehicle, props)
  
  end
AddEventHandler('salePoint1234', function(zone)
	--if love then 
	CurrentAction = nil
	ESX.UI.Menu.CloseAll() 
--end
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
				AddTextComponentSubstringPlayerName('Armeria SUR')
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Display markers
local sdadsa= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(sdadsa)
		local opt = true
	if love then
		local coords = GetEntityCoords(PlayerPedId())
		sdadsa = 1000
		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Locations, 1 do
				if (Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Locations[i], true) < Config.DrawDistance) then
					opt = false
					sdadsa = 1
					DrawMarker(21, v.Locations[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0,Config.Size.x-0.5, Config.Size.y-0.5, Config.Size.z-0.2, Config.Color.r, Config.Color.g, Config.Color.b, 100, true, true, 2, false, false, false, false)
				end
			end
		end
		for k,v in pairs(Config.Garage) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
			  --duerme = false
			  sdadsa = 1
				DrawMarker(21, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x-0.5, v.Size.y-0.5, v.Size.z-0.2, v.Color.r, v.Color.g, v.Color.b, 100, true, false, 2, false, false, false, false)
			end
		end
		
	else
		sdadsa=10000
	end 
		if opt == true then
			sdadsa = 2500
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
		for k,v in pairs(Config.Garage) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				o = false
				isInMarker  = true
				LastZone = k
				currentZone = k

			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('entraEnPointsad23', currentZone)
		end
		
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('salePoint1234', LastZone)
		end
		if o == true then
			Citizen.Wait(3000)
		end
	else
		Citizen.Wait(3000)
	end
	
 end
end)
local ledio = false
-- Enter / Exit marker events
--[[Citizen.CreateThread(function()
    while true do

        Wait(500)
        local duerme3 = true
        local duerme4 = true
        if love then
duerme3 = false
            local coords      = GetEntityCoords(GetPlayerPed(-1))
            local isInMarker  = false
            local currentZone = nil 

            

            if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
                HasAlreadyEnteredMarker = true
                LastZone                = currentZone
                TriggerEvent('entraEnPointsad23', currentZone)
            end

            if not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent('entraEnPointsad23', LastZone)
            end

        end
        if duerme3 == true then
          Citizen.Wait(5000)
        elseif duerme4 == true then
          Citizen.Wait(2500)
        end

    end
end)--]]

-- Key Controls
local jskajk= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(jskajk)
if love then
	jskajk= 1000

		if CurrentAction ~= nil then
			jskajk = 0
			ESX.ShowFloatingHelpNotification(CurrentActionMsg)
print(currentAction)
			if IsControlJustReleased(0, 38) then

				if CurrentAction == 'shop_menu' then
					
					CurrentAction = nil
								OpenShopMenu(CurrentActionData.zone)
				end
				if CurrentAction == 'menu_vehicle_spawner' then
					CurrentAction = nil
					ledio = true
					OpenVehicleSpawnerMenu()
				end
		
				if CurrentAction == 'delete_vehicle' then
					CurrentAction = nil
				  ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				end
				
				
			end
			
		end 
	else
		jskajk=2500
	end
	end
end)

local GUI = {}
GUI.Time = 0
  RegisterCommand('menuarmeriasur', function()
  if PlayerData.job ~= nil and PlayerData.job.name == 'armeriaSur' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'SnowiMafiasAcciones') then
	TriggerEvent('snowiEventToMenu', PlayerData.job.name)
	   --GUI.Time = GetGameTimer()
  end 
  end)
  RegisterKeyMapping('menuarmeriasur', 'Menu armeria sur', 'keyboard', 'F6' )



  function OpenVehicleSpawnerMenu()
	CurrentAction = nil
	local vehicles = Config.Garage.Vehicles
  
	ESX.UI.Menu.CloseAll()
  
	  local elements = {}
  
	  for i=1, #Config.AuthorizedVehicles, 1 do
		local vehicle = Config.AuthorizedVehicles[i]
		table.insert(elements, {label = vehicle.label, value = vehicle.name})
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_spawner',
		{
		  title    = 'Garaje',
		  align    = 'bottom-right',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  local model = data.current.value
  
		  local vehicle = GetClosestVehicle(vehicles.SpawnPoint.x,  vehicles.SpawnPoint.y,  vehicles.SpawnPoint.z,  3.0,  0,  71)
  
		  if not DoesEntityExist(vehicle) then
  
			local playerPed = GetPlayerPed(-1)
  
			if Config.MaxInService == -1 then
  
			  ESX.Game.SpawnVehicle(model, {
				x = vehicles.SpawnPoint.x,
				y = vehicles.SpawnPoint.y,
				z = vehicles.SpawnPoint.z
			  }, vehicles.Heading, function(vehicle)
			TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1) -- teleport into vehicle
				SetVehicleMaxMods(vehicle)
				SetVehicleDirtLevel(vehicle, 0)
			  end)
  
			else
  

  
				  ESX.Game.SpawnVehicle(model, {
					x = vehicles.SpawnPoint.x,
					y = vehicles.SpawnPoint.y,
					z = vehicles.SpawnPoint.z
				  }, vehicles.Heading, function(vehicle)
					TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)  -- teleport into vehicle
					SetVehicleMaxMods(vehicle)
					SetVehicleDirtLevel(vehicle, 0)
				  end)
  
  
			end
  
		  else
			ESX.ShowNotification('Vehiculo retirado del garaje')
		  end
  
		end,
		function(data, menu)
  
		  menu.close()
		  CurrentAction     = nil
		  --CurrentAction     = 'menu_vehicle_spawner'
		 -- CurrentActionMsg  = 'Sacar vehiculo'
		 -- CurrentActionData = {zone = zone}
  
		end
	  )
  
  
  end