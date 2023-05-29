local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

  ESX = nil
  local PlayerData = {}

  Citizen.CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  Citizen.Wait(1000)
		  PlayerData = ESX.GetPlayerData()
	   end
   end)

  function hintToDisplay(text)
	  SetTextComponentFormat("STRING")
	  AddTextComponentString(text)
   end

  local GiGiShops = {
	--[[  { x = 2557.46,  y = 382.41,  z = 108.00},
	  { x = 373.875,   y = 325.896,  z = 102.90},
	  { x = -3038.97, y = 586.01,  z = 7.30},
	  { x = -3241.927, y = 1001.462, z = 12.30},
	  { x =  547.431,   y = 2671.710, z = 41.50},
	  { x = 1961.464,  y = 3740.672, z = 31.50},
	  { x = 2678.916,  y = 3280.671, z = 54.50},
	  { x = 5116.516,  y = -5178.671, z = 2.30},
	  {x = 1729.216,  y = 6414.131, z = 34.40},
	  {x = -48.519,   y = -1757.514, z = 28.80},
	  {x = 1163.373,  y = -323.801,  z = 68.50},]]
	  {x = -707.501,  y = -914.260,  z = 18.50, ['badulake'] = true },
	--  {x = -1820.523, y = 792.518,   z = 137.40},
	  --{x = 1698.388,  y = 4924.404,  z = 41.30},
	 -- {x = 945.688,  y = 17.2424,  z =116.163},
	}
local kjkk= 2500
local badulakeP = false
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(kjkk)
		  local dormir = true
		  for index, value in pairs(GiGiShops) do
			
			  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, value.x, value.y, value.z)
			  if dist < 7.5 then
				dormir = false
				kjkk = 1
				if value.badulake ~= nil then
					badulakeP = true
				else 
					badulakeP = false
				end
				  DrawText3Ds(value.x, value.y, value.z + 1.0, '[~g~E~s~] Supermercado')
				  DrawMarker(26, value.x, value.y, value.z+0.5, 30.0, 30.0, 10.0, -220, 320.0, 320.0, 1.5-0.5,1.0, 1.0-0.2, 0,255,150, 100, true, true, 2, false, false, false, false)
				  if dist <= 1.0 then
					  if IsControlJustPressed(0, Keys['E']) then
						  OpenShopMenu()
					  end
				  end
			  end
		  end
		  if dormir == true then
			Citizen.Wait(3000)
			kjkk = 2500
		  end
	  end
  end)

  function OpenShopMenu()
	  ESX.UI.Menu.CloseAll()
if badulakeP == true and (ESX.GetPlayerData().job.name == 'badulake') then
	  ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'GiGi_Shops',
		  {
			  title    = 'Bienvenido/a a tu tienda favorita',
			  align    = 'top-right',
			  elements = {
				  {label = 'Pan (5€)', value = 'water_1', item = 'bread', price = 5},
				  {label = 'Cocacola (10€)', value = 'water_1', item = 'water', price = 10},
				  {label = 'Funda impermeable (450€)', value = 'water_1', item = 'fundaimper', price = 450},
				  {label = 'Vino (10€)', value = 'water_1', item = 'wine', price = 10},
				  {label = 'Café (5€)', value = 'water_1', item = 'coffe', price = 5},
				  {label = 'Cerveza (8€)', value = 'water_1', item = 'beer', price = 8},
				  {label = 'Vodka (12€)', value = 'water_1', item = 'vodka', price = 12},
				  {label = 'Whisky (15€)', value = 'water_1', item = 'whisky', price = 15},
				  {label = 'Leche (6€)', value = 'water_1', item = 'milk', price = 6},
				  {label = 'Patatas Chips (12€)', value = 'water_1', item = 'chips', price = 12},
				  {label = 'Magdalena (15€)', value = 'water_1', item = 'cupcake', price = 15},
				  {label = 'Sandwich (10€)', value = 'water_1', item = 'sandwich', price = 10},
				  {label = 'Radio MP3 (1000€)', value = 'water_1', item = 'hifi', price = 1000},
				  {label = 'Equipo de buzo (1000€) ', value = 'water_1', item = 'scubagear', price = 1000},
				  {label = 'Antorcha de buzo (500€)', value = 'water_1', item = 'uwtorch', price = 500},
				  {label = 'Cigarro (5€)', value = 'water_1', item = 'cigarett', price = 5},
				  {label = 'Mechero (15€)', value = 'water_1', item = 'lighter', price = 15},
				  {label = 'Croquetas (25€)', value = 'water_1', item = 'croquettes', price = 25},
				 -- {label = 'kit de Reparaciones (1500€)', value = 'water_1', item = 'fixkit', price = 1500},
				  {label = 'Ganzúa (1000€)', value = 'water_1', item = 'lockpick', price = 1000},
				--  {label = 'Cargador (500€)', value = 'water_1', item = 'clip', price = 500},
				  {label = 'Tarjeta de seguridad ', value = 'water_1', item = 'secure_card', price = 5000},
				  {label = 'Dormidina [340€]', value = 'water_1', item = 'piluleoubli', price = 340},
				  {label = 'Walki [500€]', value = 'water_1', item = 'walki', price = 500},
				  {label = 'GPS [3500€]', value = 'water_1', item = 'gps', price = 3500},
			}
		  },
		  function(data, menu)
			  local item = data.current.item
			  local price = data.current.price
			  local label = data.current.label
			  TriggerServerEvent('badulakeShop', item, price, label)
		  end,
	  function(data, menu)
		  menu.close()
	  end)
	else
if badulakeP == false then
	ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'GiGi_Shops',
		  {
			  title    = 'Bienvenido/a a tu tienda favorita',
			  align    = 'top-right',
			  elements = {
				  {label = 'Pan (5€)', value = 'water_1', item = 'bread', price = 5},
				  {label = 'Cocacola (10€)', value = 'water_1', item = 'water', price = 10},
				  {label = 'Funda impermeable (450€)', value = 'water_1', item = 'fundaimper', price = 450},
				  {label = 'Vino (10€)', value = 'water_1', item = 'wine', price = 10},
				  {label = 'Café (5€)', value = 'water_1', item = 'coffe', price = 5},
				  {label = 'Cerveza (8€)', value = 'water_1', item = 'beer', price = 8},
				  {label = 'Vodka (12€)', value = 'water_1', item = 'vodka', price = 12},
				  {label = 'Whisky (15€)', value = 'water_1', item = 'whisky', price = 15},
				  {label = 'Leche (6€)', value = 'water_1', item = 'milk', price = 6},
				  {label = 'Patatas Chips (12€)', value = 'water_1', item = 'chips', price = 12},
				  {label = 'Magdalena (15€)', value = 'water_1', item = 'cupcake', price = 15},
				  {label = 'Sandwich (10€)', value = 'water_1', item = 'sandwich', price = 10},
				  {label = 'Radio MP3 (1000€)', value = 'water_1', item = 'hifi', price = 1000},
				  {label = 'Equipo de buzo (1000€) ', value = 'water_1', item = 'scubagear', price = 1000},
				  {label = 'Antorcha de buzo (500€)', value = 'water_1', item = 'uwtorch', price = 500},
				  {label = 'Cigarro (5€)', value = 'water_1', item = 'cigarett', price = 5},
				  {label = 'Mechero (15€)', value = 'water_1', item = 'lighter', price = 15},
				  {label = 'Croquetas (25€)', value = 'water_1', item = 'croquettes', price = 25},
				  {label = 'kit de Reparaciones (1500€)', value = 'water_1', item = 'fixkit', price = 1500},
				  {label = 'Ganzúa (1000€)', value = 'water_1', item = 'lockpick', price = 1000},
				--  {label = 'Cargador (500€)', value = 'water_1', item = 'clip', price = 500},
				  {label = 'Tarjeta de seguridad ', value = 'water_1', item = 'secure_card', price = 5000},
				  {label = 'Dormidina [340€]', value = 'water_1', item = 'piluleoubli', price = 340},
				  {label = 'Walki [500€]', value = 'water_1', item = 'walki', price = 500},
				  {label = 'GPS [3500€]', value = 'water_1', item = 'gps', price = 3500},
				  {label = 'Borrador de  spray[500€]', value = 'water_1', item = 'spray_remover', price = 500},

			}
		  },
		  function(data, menu)
			  local item = data.current.item
			  local price = data.current.price
			  local label = data.current.label
			  TriggerServerEvent('GiGi_Shops:buy', item, price, label)
		  end,
	  function(data, menu)
		  menu.close()
	  end)
else
	TriggerEvent('esx:showNotification', 'No tienes permiso para usar este punto de compra!')
end

	end
  end

  --Blips
  local blips = {
	  {title="Tienda 24/7", id=628, x = 2557.458,  y = 382.282,  z = 107.622},
	  {title="Tienda 24/7", id=628, x = 373.875,   y = 325.896,  z = 102.566},
	  {title="Tienda 24/7", id=628, x = -3038.939, y = 585.954,  z = 6.908},
	  {title="Tienda 24/7", id=628, x = -3241.927, y = 1001.462, z = 11.830},
	  {title="Tienda 24/7", id=628, x =  547.431,   y = 2671.710, z = 41.156},
	  {title="Tienda 24/7", id=628, x = 1961.464,  y = 3740.672, z = 31.343},
	  {title="Tienda 24/7", id=628, x = 2678.916,  y = 3280.671, z = 54.241},
	  {title="Tienda 24/7", id=628, x = 1729.216,  y = 6414.131, z = 34.037},
	  {title="Tienda 24/7", id=628, x = -48.519,   y = -1757.514, z = 28.421},
	  {title="Tienda 24/7", id=628, x = 1163.373,  y = -323.801,  z = 68.205},
	  {title="Tienda 24/7", id=628, x = -707.501,  y = -914.260,  z = 18.215},
	  {title="Tienda 24/7", id=628, x = -1820.523, y = 792.518,   z = 137.118},
	  {title="Establecimiento [SIN EXPLORAR]", id=273, x = 5115.523, y = -5178.518,   z = 2.118},
	  {title="Tienda 24/7", id=628, x = 1698.388,  y = 4924.404,  z = 41.063},
	  {title="Tienda 24/7 [CASINO AZOTEA]", id=605, x = 945.688,  y = 17.2424,  z =116.163},
	}

  Citizen.CreateThread(function()
	  for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.8)
		SetBlipColour(info.blip, 2)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	  end
  end)

  function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(2)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 370
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.030, 226, 166, 66, 180)
  end
