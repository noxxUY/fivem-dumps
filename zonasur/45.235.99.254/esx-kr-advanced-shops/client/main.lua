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
ESX 			    			= nil
local showblip = false
local displayedBlips = {}
local AllBlips = {}
local number = nil
local blipRobbery = nil
local OnRobbery = false
local timeLeft = 180
local start_timer = false
local global = false
local touch = false
local devolvercaja = {}
local DrawDistance = 20.0
local currentZone = nil
local ShopId           = nil
local para = nil

local coords1 = {
  		[1] = {x = 380.74, y = 331.94, z = 103.57},
		[2] = {x = 2550.23, y = 387.34, z = 108.62},
		[3] = {x = -3047.88, y = 588.16, z = 7.91},
		[4] = {x = -1478.97, y = -374.36, z = 38.16},
		[5] = {x = 1395.49, y = 3612.94, z = 33.98},
		[6] = {x = -2959.5, y = 387.78, z =13.04},
		[7] = {x = 2674.36, y = 3288.0, z = 54.24},
		[8] = {x = -42.76, y = -1749.36, z = 28.42},
		[9] = {x = 1160.77, y = -314.03, z = 68.21},
		[10] = {x = -708.14, y = -904.05, z =18.22},
		[11] = {x = -1828.23, y = 799.83, z = 137.16},
		[12] = {x = 1706.87, y = 4919.76, z = 41.06},
		[13] = {x = 1960.75, y = 3748.67, z = 31.34},
		[14] = {x = 1126.26, y = -980.84, z = 44.42},
		[15] = {x = 30.42, y = -1339.86, z = 28.5},
		[16] = {x = -1383.59, y = -630.25, z = 29.82},
		[17] = {x = 545.07, y = 2663.47, z = 41.16},
		[18] = {x = -3249.02, y = 1006.04, z = 11.83},
		[19] = {x = 1168.51, y = 2718.37, z = 36.16},
		[20] = {x = 1736.66, y = 6419.02, z = 34.04},
		[25] = {x = -119.09,  y = 6384.04, z = 31.18},
    }

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


AddEventHandler('onResourceStop', function(resource)
	  if resource == GetCurrentResourceName() then
		  SetNuiFocus(false, false)
	  end
end)
  
RegisterNUICallback('escape', function(data, cb)
	 SetNuiFocus(false, false)
	 SendNUIMessage({
		 type = "close",
	 })
	 touch = false
end)

RegisterNUICallback('bossactions', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({
		type = "close",
	})
	OpenBoss(ShopId)
	touch = false
end)

local Cart = {}

RegisterNUICallback('putcart', function(data, cb)
	table.insert(Cart, {item = data.item, label = data.label, count = data.count, id = data.id, price = data.price})
	cb(Cart)
end)

RegisterNUICallback('notify', function(data, cb)
	ESX.ShowNotification(data.msg)
end)

RegisterNUICallback('refresh', function(data, cb)
	 
	Cart = {}

		ESX.TriggerServerCallback('esx_kr_shop:getOwnedShop', function(data)
			ESX.TriggerServerCallback('esx_kr_shop:getShopItems', function(result)
			
					if data ~= nil then
						Owner = true
					end

					if result ~= nil then

								SetNuiFocus(true, true)
				
								SendNUIMessage({
									type = "shop",
									result = result,
									owner = Owner,
								})
					end

				end, ShopId)
			end, ShopId)
end)

RegisterNUICallback('emptycart', function(data, cb)
	Cart = {}
	
end)

RegisterNUICallback('buy', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({
		type = "close",
	})
	touch = false
	
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
		title    = 'Forma de Pago',
		align    = 'bottom-right',
		elements = {
			{label = 'Efectivo', value = 'money'},
			{label = 'Debito', value = 'bank'}
		}}, function(data2, menu)
			TriggerServerEvent('esx_kr_shops:Buy', ShopId, data.Item, data.Count, data2.current.value)
			menu.close()
			Cart = {}
	end, function(data, menu)
		menu.close()
	end)
	
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
   PlayerData = xPlayer
end)

local Msg        = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil


AddEventHandler('esx_kr_shop:hasEnteredMarker', function(zone)
	if zone == 0 then
		Msg  = _U('press_to_open_center')
	elseif zone == 'Shop' then
		Msg  = _U('press_to_open')
	elseif zone == 'Rob' and not OnRobbery then
		if not devolvercaja[ShopId] then
			Msg  = 'Presiona ~INPUT_CONTEXT~ Para Robar Tienda'
		else
			Msg  = 'Presiona ~INPUT_CONTEXT~ para devolver Caja Registradora!'
		end
	end
end)

AddEventHandler('esx_kr_shop:hasExitedMarker', function(zone)
	ShopId = nil
	LastZone = nil
end)


Citizen.CreateThread(function ()
 	 while true do
		Citizen.Wait(5)
		if ShopId ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(Msg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustReleased(0, Keys['E']) and not touch then
				--print('APRETASTE E')
				touch = true
				if ShopId == 0 then
					OpenShopCenter()
				elseif currentZone == 'Shop' then
					ESX.TriggerServerCallback('esx_kr_shop:getOwnedShop', function(data)
						ESX.TriggerServerCallback('esx_kr_shop:getShopItems', function(result)
							if data ~= nil then
								Owner = true
							end
							if result ~= nil then
								SetNuiFocus(true, true)
								SendNUIMessage({
									type = "shop",
									result = result,
									owner = Owner,
								})
							end
						end, ShopId)
					end, ShopId)
				elseif currentZone == 'Rob' then				
					if devolvercaja[ShopId] then
						TriggerServerEvent('esx_kr_shops-robbery:devuelvocaja', ShopId, para)
						touch = false
					else
						if IsPedArmed(PlayerPedId(), 4) then
							Robbery(ShopId, para)
						else
							ESX.ShowNotification("~r~Sin Arma no puedes robarle a nadie!")
						end
					end
					
				end
	 	 	end
		end
	end
end)


function OpenShopCenter()

	ESX.UI.Menu.CloseAll()

  	local elements = {}

		if showblip then
			table.insert(elements, {label = 'Ocultar TODAS las tiendas en el mapa', value = 'removeblip'})
		else
			table.insert(elements, {label = 'Mostrar TODAS las tiendas en el mapa', value = 'showblip'})
		end

			ESX.TriggerServerCallback('esx_kr_shop:getShopList', function(data)
				
				if data then
					for i=1, #data, 1 do
						table.insert(elements, {label = _U('buy_shop') .. data[i].ShopNumber .. ' [$' .. data[i].ShopValue .. '] Impuestos: <span style="color:red;">$'..data[i].rentprice, value = 'kop', price = data[i].ShopValue, shop = data[i].ShopNumber})
					end


					ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'shopcenter',
					{
						title    = 'Shop',
						align    = 'left',
						elements = elements
					},
					function(data, menu)

					if data.current.value == 'kop' then
					ESX.UI.Menu.CloseAll()

					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'name', {
					title = _U('name_shop')
					}, function(data2, menu2)

					local name = data2.value
					TriggerServerEvent('esx_kr_shops:BuyShop', name, data.current.price, data.current.shop, data.current.bought)
					menu2.close()
					touch = false

					end,
					function(data2, menu2)
					menu2.close()
					menu.close()
					touch = false
					end)

					elseif data.current.value == 'removeblip' then
						showblip = false
						createForSaleBlips()
						menu.close()
						touch = false
					elseif data.current.value == 'showblip' then
						showblip = true
						createForSaleBlips()
						menu.close()
						touch = false
					end
			end,
			function(data, menu)
				menu.close()
				touch = false
			end)
			else
				ESX.ShowNotification("~y~Ya eres dueño de una tienda no puedes tener otra!")
				touch = false
			end
		end)
end

-- function OpenShop()
--   ESX.UI.Menu.CloseAll()
--   local elements = {}

  
-- 	ESX.TriggerServerCallback('esx_kr_shop:getOwnedShop', function(data)
-- 	ESX.TriggerServerCallback('esx_kr_shop:getShopItems', function(result)

--         if data ~= nil then
--             table.insert(elements, {label = 'Boss Menu', value = 'boss'})
--         end

-- 	    if result ~= nil then
-- 		    for i=1, #result, 1 do
-- 		        if result[i].count > 0 then
-- 					table.insert(elements, {label = result[i].label .. ' | ' .. result[i].count ..' in your stock for [$' .. result[i].price .. ' per item]', value = 'buy', ItemName = result[i].item})
-- 				end
-- 			end
-- 		end


--   ESX.UI.Menu.Open(
--   'default', GetCurrentResourceName(), 'shops',
--   {
-- 	title    = 'Shop',
-- 	align    = 'left',
-- 	elements = elements
--   },
--   function(data, menu)
-- 	if data.current.value == 'boss' then
--         ESX.UI.Menu.CloseAll()
-- 		OpenBoss()
		
-- 	elseif data.current.value == 'buy' then
--         	ESX.UI.Menu.CloseAll()

-- 			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'mainmeny', {
-- 			title = 'How much whould you like to buy?'
-- 			}, function(data2, menu2)

--        	 	local count = tonumber(data2.value)

-- 				TriggerServerEvent('esx_kr_shops:Buy', number, data.current.ItemName, count)
-- 				menu2.close()
	
--                     	end,
--                     	function(data2, menu2)
--                     	menu2.close()
--                 	end)
--                     end
--                 end,
--                 function(data, menu)
-- 				menu.close()
-- 			end)
-- 		end, number)
-- 	end, number)
-- end

function OpenBoss()


  ESX.TriggerServerCallback('esx_kr_shop:getOwnedShop', function(data)
  
	local elements = {}

		table.insert(elements, {label = 'Tu tienes: $' .. data[1].money .. ' en la compania!',    value = ''})
		table.insert(elements, {label = 'Pedidos',    value = 'shipments'})
        table.insert(elements, {label = 'Poner un artículo a la venta', value = 'putitem'})
        table.insert(elements, {label = 'Saca un artículo de la venta',    value = 'takeitem'})
        table.insert(elements, {label = 'Ponga dinero en su empresa',    value = 'putmoney'})
        table.insert(elements, {label = 'Saca dinero de tu empresa',    value = 'takemoney'})
        table.insert(elements, {label = 'Cambiar nombre de su empresa: $' .. Config.ChangeNamePrice,    value = 'changename'})
		table.insert(elements, {label = 'Vende tu empresa por $' .. math.floor(data[1].ShopValue / Config.SellValue),   value = 'sell'})

		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'boss',
		{
			title    = 'Shop',
			align    = 'left',
			elements = elements
		},
		function(data, menu)
        if data.current.value == 'putitem' then
            PutItem(ShopId)
        elseif data.current.value == 'takeitem' then  
            TakeItem(ShopId)
        elseif data.current.value == 'takemoney' then
            

            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'takeoutmoney', {
                title = '¿Cuánto te gustaría sacar?'
            }, function(data2, menu2)
  
			local amount = tonumber(data2.value)
			
			TriggerServerEvent('esx_kr_shops:takeOutMoney', amount, ShopId)
			
			menu2.close()
        
		end,
		function(data2, menu2)
		menu2.close()
		end)

	 	elseif data.current.value == 'putmoney' then
			ESX.UI.Menu.CloseAll()

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putinmoney', {
			title = '¿Cuánto te gustaría depositar?'
			}, function(data3, menu3)
			local amount = tonumber(data3.value)
			TriggerServerEvent('esx_kr_shops:addMoney', amount, ShopId)
			menu3.close()
				end,
				function(data3, menu3)
			menu3.close()
		end)

		elseif data.current.value == 'sell' then
		  ESX.UI.Menu.CloseAll()    

		  ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'sell', {
			title = 'ESCRIBIR: (SI) sin paréntesis para confirmar'
          }, function(data4, menu4)
            
            if data4.value == 'SI' then
              TriggerServerEvent('esx_kr_shops:SellShop', ShopId)
              menu4.close()
			end
		    	end,
		    	function(data4, menu4)
		    menu4.close()
		end)

	  elseif data.current.value == 'changename' then
		ESX.UI.Menu.CloseAll()    

		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'changename', {
		  title = '¿Cómo te gustaría nombrar tu tienda?'
        }, function(data5, menu5)
            
            TriggerServerEvent('esx_kr_shops:changeName', ShopId, data5.value)
            menu5.close()
               		end,
                	function(data5, menu5)
                	menu5.close()
				end)
				
			elseif data.current.value == 'shipments' then
				OpenShipments(ShopId)

				end
        		end,
        		function(data, menu)
        	menu.close()
	    end)
    end, ShopId)
end

function OpenShipments(id)

	local elements = {}

	table.insert(elements, {label = 'Comprar Productos', value = 'buy'})
	table.insert(elements, {label = 'Pedidos', value = 'shipments'})

	ESX.UI.Menu.Open(
  	'default', GetCurrentResourceName(), 'shipments',
	{
		title    = 'Shop',
		align    = 'left',
		elements = elements
	},
	  function(data, menu)
		
		if data.current.value == 'buy' then
			ESX.UI.Menu.CloseAll()
			OpenShipmentDelivery(id)
		elseif data.current.value == 'shipments' then
			ESX.UI.Menu.CloseAll()
			GetAllShipments(id)
		end
		end,
	function(data, menu)
	menu.close()
	end)
end

function GetAllShipments(id)

	local elements = {}

	ESX.TriggerServerCallback('esx_kr_shop:getTime', function(time)
	ESX.TriggerServerCallback('esx_kr_shop:getAllShipments', function(items)

	local once = true
	local once2 = true

		for i=1, #items, 1 do

			if time - items[i].time >= Config.DeliveryTime and once2 then
			table.insert(elements, {label = '--ENVÍOS LISTOS--'})
			table.insert(elements, {label = 'Obtén todos tus envíos', value = 'pickup'})
			once2 = false
			end

			if time - items[i].time >= Config.DeliveryTime then
			table.insert(elements, {label = items[i].label,	value = items[i].item, price = items[i].price})
			end

			if time - items[i].time <= Config.DeliveryTime and once then
				table.insert(elements, {label = '--ENVIOS PENDIENTES--'})
				once = false
			end

			if time - items[i].time <= Config.DeliveryTime then
				times = time - items[i].time
				table.insert(elements, {label = items[i].label .. ' tiempo restante: ' .. math.floor((Config.DeliveryTime - times) / 60) .. ' minutos' })
			end

		end

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'allshipments',
	{
	  title    = 'Shop',
	  align    = 'left',
	  elements = elements
	},
	  function(data, menu)
		
		if data.current.value == 'pickup' then
			TriggerServerEvent('esx_kr_shops:GetAllItems', id)
		end
	
		end,
		function(data, menu)
		menu.close()
		end)

	end, id)
	end)
end

function OpenShipmentDelivery(id)
	ESX.UI.Menu.CloseAll()
	local elements = {}

		for i=1, #Config.Items, 1 do
			table.insert(elements, {labels =  Config.Items[i].label, label =  Config.Items[i].label .. ' $' .. Config.Items[i].price .. ' por unidad.',	value = Config.Items[i].item, price = Config.Items[i].price})
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'shipitem',
			{
			title    = 'Shop',
			align    = 'left',
			elements = elements
			},
			function(data, menu)
				--menu.close()
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'krille', {
				title = '¿Cuánto quieres comprar?'
				}, function(data2, menu2)
					menu2.close()
					TriggerServerEvent('esx_kr_shop:MakeShipment', id, data.current.value, data.current.price, tonumber(data2.value), data.current.labels)

				end, function(data2, menu2)
					menu2.close()
				end)

		end,
		function(data, menu)
		menu.close()
	end)
end


function TakeItem(ShopId)

  local elements = {}

  ESX.TriggerServerCallback('esx_kr_shop:getShopItems', function(result)

	for i=1, #result, 1 do
	    if result[i].count > 0 then
	    	table.insert(elements, {label = result[i].label .. ' | ' .. result[i].count ..' piezas almacenadas [' .. result[i].price .. ' $ por pieza', value = 'removeitem', ItemName = result[i].item})
	    end
    end


  ESX.UI.Menu.Open(
  'default', GetCurrentResourceName(), 'takeitem',
  {
	title    = 'Shop',
	align    = 'left',
	elements = elements
  },
  function(data, menu)
local name = data.current.ItemName

    if data.current.value == 'removeitem' then
        menu.close()
        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'howmuch', {
        title = '¿Cuánto te gustaría sacar?'
        }, function(data2, menu2)

        local count = tonumber(data2.value)
		menu2.close()
    	TriggerServerEvent('esx_kr_shops:RemoveItemFromShop', ShopId, count, name)
    
			end, function(data2, menu2)
				menu2.close()
			end)
			end
		end,
		function(data, menu)
		menu.close()
		end)
  	end, ShopId)
end


function PutItem(ShopId)

  local elements = {}

  ESX.TriggerServerCallback('esx_kr_shop:getInventory', function(result)

    for i=1, #result.items, 1 do
        
      local invitem = result.items[i]
      
	    if invitem.count > 0 then
			table.insert(elements, { label = invitem.label .. ' | ' .. invitem.count .. ' En tu bolso', count = invitem.count, name = invitem.name})
	    end
	end

  ESX.UI.Menu.Open(
  'default', GetCurrentResourceName(), 'putitem',
  {
	title    = 'Shop',
	align    = 'left',
	elements = elements
  },
  function(data, menu)

        local itemName = data.current.name
        local invcount = data.current.count

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'sell', {
			title = _U('how_much')
			}, function(data2, menu2)

			local count = tonumber(data2.value)
		
			if count > invcount then
				ESX.ShowNotification('~r~No puedes vender más de lo que posees')
				menu2.close()
				menu.close()
			else
				menu2.close()
				menu.close()

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'sellprice', {
				title = _U('set_price')
				}, function(data3, menu3)

				local price = tonumber(data3.value)
				menu3.close()
				TriggerServerEvent('esx_kr_shops:setToSell', ShopId, itemName, count, price)
		
						end)
					end
				end,
				function(data3, menu3)
				menu3.close()
				end)
			end, 
			function(data2, menu2)
			menu2.close()
			end)
        end, function(data, menu)
        menu.close()
    end)
end

Citizen.CreateThread(function ()
  while true do
	Citizen.Wait(5)

	local coords = GetEntityCoords(GetPlayerPed(-1))

		for tienda,v_ in pairs(Config.Zones) do
			if tienda ~= 0 then
				for k,v in pairs(v_) do
					if k == 'Shop' then
						local distance = #(coords - v)
						if distance < 20 then
						--if k == 'Shop' then
							DrawMarker(29, v.x, v.y, v.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 180, 0, 200, false, true, 2, false, false, false, false)
						--else
							--DrawMarker(29, v.x, v.y, v.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 200, false, true, 2, false, false, false, false)
						--end
						end
					elseif k == 'Rob' then
						local distance = #(coords - v)
						if distance < 20 then
							DrawMarker(29, v.x, v.y, v.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 200, false, true, 2, false, false, false, false)
						end
					end
				end
			else
				local distance = #(coords - v_)
				if distance < 20 then
					DrawMarker(29, v_.x, v_.y, v_.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 180, 0, 200, false, true, 2, false, false, false, false)
				end
			end
	    end
	end
end)

Citizen.CreateThread(function ()
  while true do
	Citizen.Wait(25)

	local coords      = GetEntityCoords(GetPlayerPed(-1))
	local isInMarker  = false

	for t,v_ in pairs(Config.Zones) do
		if t ~= 0 then
			for k,v in pairs(v_) do
				if k ~= 'para' then
					local distance = #(coords - v)
					if distance < 1.2 then
						isInMarker  = true
						currentZone = k
						ShopId = t
						para = v_.para
					end
				end
			end
		else
			local distance = #(coords - v_)
			if distance < 1.2 then
				isInMarker  = true
				currentZone = t
				ShopId = t
			end
		end
	end
	
	--[[
	for k,v in pairs(Config.Robos) do
		--if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.2) then
		local distance = #(coords - v)
		if distance < 1.2 then
			isInMarker  = true
			currentZone = k
		end
	end
	]]--
	
	if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
		HasAlreadyEnteredMarker = true
		LastZone                = currentZone
		TriggerEvent('esx_kr_shop:hasEnteredMarker', currentZone)
	end

	if not isInMarker and HasAlreadyEnteredMarker then
		HasAlreadyEnteredMarker = false
		TriggerEvent('esx_kr_shop:hasExitedMarker', LastZone)
	end
  end
end)


RegisterNetEvent('esx_kr_shops:setBlip')
AddEventHandler('esx_kr_shops:setBlip', function()

  	ESX.TriggerServerCallback('esx_kr_shop:getOwnedBlips', function(blips)
		if blips ~= nil then
			createBlip(blips)
	  	end
   	end)
end)

RegisterNetEvent('esx_kr_shops:removeBlip')
AddEventHandler('esx_kr_shops:removeBlip', function()
	for i=1, #displayedBlips do
    	RemoveBlip(displayedBlips[i])
	end
end)

AddEventHandler('playerSpawned', function(spawn)
	Citizen.Wait(500)

	ESX.TriggerServerCallback('esx_kr_shop:getOwnedBlips', function(blips)

		if blips ~= nil then
			createBlip(blips)
		end
	end)
end)



Citizen.CreateThread(function()
	Citizen.Wait(500)
	ESX.TriggerServerCallback('esx_kr_shop:getOwnedBlips', function(blips)
		if blips ~= nil then
			createBlip(blips)
		end
	end)
end)

Citizen.CreateThread(function()
	Citizen.Wait(500)
	local blip = AddBlipForCoord(6.09, -708.89, 44.97)
	SetBlipSprite (blip, 605)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.7)
	SetBlipColour (blip, 5)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Properties')
	EndTextCommandSetBlipName(blip)
end)

function createBlip(blips)
	for i=1, #blips, 1 do
  		for k,v in pairs(Config.Zones) do
			if blips[i].identifier == '0' then
				if k == blips[i].ShopNumber then
					local blip2 = AddBlipForCoord(vector3(v.Shop.x, v.Shop.y, v.Shop.z))
					SetBlipSprite (blip2, 52)
					SetBlipDisplay(blip2, 4)
					SetBlipScale  (blip2, 0.7)
					SetBlipColour (blip2, 1)
					SetBlipAsShortRange(blip2, true)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString('ID: ' .. blips[i].ShopNumber)
					EndTextCommandSetBlipName(blip2)
					table.insert(displayedBlips, blip2)
				end
			else
				if k == blips[i].ShopNumber then
					local blip = AddBlipForCoord(vector3(v.Shop.x, v.Shop.y, v.Shop.z))
					SetBlipSprite (blip, 52)
					SetBlipDisplay(blip, 4)
					SetBlipScale  (blip, 0.7)
					SetBlipColour (blip, 29)
					SetBlipAsShortRange(blip, true)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString(blips[i].ShopName)
					EndTextCommandSetBlipName(blip)
					table.insert(displayedBlips, blip)
				end
			end
 		end
	end
end


function createForSaleBlips()
	if showblip then

		IDBLIPS = {
			[1] = {x = 373.875,   y = 325.896,  z = 102.566, n = 1},
			[2] = {x = 2557.458,  y = 382.282,  z = 107.622, n = 2},
			[3] = {x = -3038.939, y = 585.954,  z = 6.908, n = 3},
			[4] = {x = -1487.553, y = -379.107,  z = 39.163, n = 4},
			[5] = {x = 1392.562,  y = 3604.684,  z = 33.980, n = 5},
			[6] = {x = -2968.243, y = 390.910,   z = 14.043, n = 6},
			[7] = {x = 2678.916,  y = 3280.671, z = 54.241, n = 7},
			[8] = {x = -48.519,   y = -1757.514, z = 28.421, n = 8},
			[9] = {x = 1163.373,  y = -323.801,  z = 68.205, n = 9},
			[10] = {x = -707.501,  y = -914.260,  z = 18.215, n = 10},
			[11] = {x = -1820.523, y = 792.518,   z = 137.118, n = 11},
			[12] = {x = 1698.388,  y = 4924.404,  z = 41.063, n = 12},
			[13] = {x = 1961.464,  y = 3740.672, z = 31.343, n = 13},
			[14] = {x = 1135.808,  y = -982.281,  z = 45.415, n = 14},
			[15] = {x = 25.88,     y = -1347.1,   z = 28.5, n = 15},
			[16] = {x = -1393.409, y = -606.624,  z = 29.319, n = 16},
			[17] = {x = 547.431,   y = 2671.710, z = 41.156, n = 17},
			[18] = {x = -3241.927, y = 1001.462, z = 11.830, n = 18},
			[19] = {x = 1166.024,  y = 2708.930,  z = 37.157, n = 19},
			[20] = {x = 1729.216,  y = 6414.131, z = 34.037, n = 20},
			[21] = {x = 256.41,  y = -782.49, z = 29.48, n = 21},
			[22] = {x = -160.3,  y = 6322.69, z = 30.6, n = 22},
			[23] = {x = 161.52,  y = 6640.81, z = 30.71, n = 23},
			[24] = {x = -119.09,  y = 6384.04, z = 31.18, n = 24},
		}

		for i=1, #IDBLIPS, 1 do

			local blip2 = AddBlipForCoord(vector3(IDBLIPS[i].x, IDBLIPS[i].y, IDBLIPS[i].z))
				
				SetBlipSprite (blip2, 52)
				SetBlipDisplay(blip2, 4)
				SetBlipScale  (blip2, 0.7)
				SetBlipColour (blip2, 1)
				SetBlipAsShortRange(blip2, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString('ID: ' .. IDBLIPS[i].n)
				EndTextCommandSetBlipName(blip2)
				table.insert(AllBlips, blip2)
		end

		else
			for i=1, #AllBlips, 1 do
				RemoveBlip(AllBlips[i])
			end
		ESX.UI.Menu.CloseAll()
	end
end

--ROBBERY

local Var = nil
local Coordss = nil

local Id = nil
local Name = nil
local cancelara = nil

function Robbery(id, paraa)
	--ESX.ShowNotification(paraa)
	print('Robbery(id, paraa)')
	if not global then
		--ESX.ShowNotification(paraa)
		
		ESX.TriggerServerCallback('esx_kr_shop-robbery:getUpdates', function(result)
			if result.cb then
				if paraa == 'psg' then
					ESX.TriggerServerCallback('esx_seguridad:getSeguridad', function(results)
						if results >= Config.RequiredPolices then
							ESX.TriggerServerCallback("esx_kr_shops-robbery:Start", function (robada)
								if robada then
									for k,v in pairs(Config.Zones) do
										if id == k then
											Coordss = {x=v.Rob.x, y=v.Rob.y, z=v.Rob.z}
										end	
									end
									OnRobbery = true
									Id = id
									cancelara = paraa
									Name = result.name
								else
									touch = false
									ESX.ShowNotification("~r~Esta tienda ya esta siendo Robada!")
								end
							end, id, paraa)
						else
							touch = false
							ESX.ShowNotification("~r~No hay suficientes PRO-SEGUR en línea. " .. results .. '/' .. Config.RequiredPolices)
						end
					end)
				elseif paraa == 'police2' then
					ESX.TriggerServerCallback('esx_police2job:getCops', function(results)
						if results >= Config.RequiredPolices then
							ESX.TriggerServerCallback("esx_kr_shops-robbery:Start", function (robada)
								if robada then
									for k,v in pairs(Config.Zones) do
										if id == k then
											Coordss = {x=v.Rob.x, y=v.Rob.y, z=v.Rob.z}
										end	
									end
									OnRobbery = true
									Id = id
									cancelara = paraa
									Name = result.name
								else
									touch = false
									ESX.ShowNotification("~r~Esta tienda ya esta siendo Robada!")
								end
							end, id, paraa)
						else
							touch = false
							ESX.ShowNotification("~r~No hay suficientes POLICIAS FEDERALES en línea. " .. results .. '/' .. Config.RequiredPolices)
						end
					end)
				elseif paraa == 'gendarme' then
					ESX.TriggerServerCallback('esx_gendarmeria:getCops', function(results)
						if results >= Config.RequiredPolices then
							ESX.TriggerServerCallback("esx_kr_shops-robbery:Start", function (robada)
								if robada then
									for k,v in pairs(Config.Zones) do
										if id == k then
											Coordss = {x=v.Rob.x, y=v.Rob.y, z=v.Rob.z}
										end	
									end
									OnRobbery = true
									Id = id
									cancelara = paraa
									Name = result.name
								else
									touch = false
									ESX.ShowNotification("~r~Esta tienda ya esta siendo Robada!")
								end
							end, id, paraa)
						else
							touch = false
							ESX.ShowNotification("~r~No hay suficientes GENDARMES en línea. " .. results .. '/' .. Config.RequiredPolices)
						end
					end)
				end
			else
				touch = false
				ESX.ShowNotification("~r~Esta tienda ya ha sido robada, espera: " ..  math.floor((Config.TimeBetweenRobberies - result.time)  / 60) .. ' minutos')
			end
		end, id)
		
	else
		touch = false
		ESX.ShowNotification("~r~Ya estan robando una tienda!")
	end
end

function loadModel(model)
    Citizen.CreateThread(function()
        while not HasModelLoaded(model) do
            RequestModel(model)
          Citizen.Wait(1)
        end
    end)
end

RegisterNetEvent('esx-kr-advanced-shops:status')
AddEventHandler('esx-kr-advanced-shops:status', function(bool)
    global = bool
end)

RegisterNetEvent('esx-kr-advanced-shops:killblip')
AddEventHandler('esx-kr-advanced-shops:killblip', function(id)
    for k,v in pairs(AllBlips) do	
		if k == id then
			RemoveBlip(v) 
		end	
    end
end)

RegisterNetEvent('esx-kr-advanced-shops:EntregoCaja')
AddEventHandler('esx-kr-advanced-shops:EntregoCaja', function(id)
	devolvercaja[id] = false
end)

--DEVOLVER CAJA
RegisterNetEvent('esx-kr-advanced-shops:DevolverCaja')
AddEventHandler('esx-kr-advanced-shops:DevolverCaja', function(id)
	devolvercaja[id] = true
	SetTimeout(60000 * 25 , function()
		devolvercaja[id] = false
	end)
end)

RegisterNetEvent('esx-kr-advanced-shops:setblip')
AddEventHandler('esx-kr-advanced-shops:setblip', function(id)
	for k,v in pairs(Config.Zones) do
		if id == k then
			AllBlips[id] = AddBlipForCoord(v.Rob.x, v.Rob.y, v.Rob.z)
			SetBlipSprite(AllBlips[id], 161)
			SetBlipScale(AllBlips[id], 0.7)
			SetBlipColour(AllBlips[id], 75)
			PulseBlip(AllBlips[id])
		end
    end
end)

Citizen.CreateThread(function() --timer
    while true do
	Wait(5)
		if OnRobbery and timeLeft > 0 then
			timeLeft = timeLeft - 1
			Wait(1000)
		end	
	end	
end)

Citizen.CreateThread(function()
	while true do
        Wait(5)
		local playerpos = GetEntityCoords(GetPlayerPed(-1))
		if OnRobbery and GetDistanceBetweenCoords(playerpos.x, playerpos.y, playerpos.z, Coordss.x, Coordss.y, Coordss.z, true) <= 15 then
			TriggerEvent("mt:missiontext", "Debes permanecer en la tienda:~r~ " .. timeLeft.. " ~w~segundos.")
			if timeLeft == 0 then
				OnRobbery = false
				touch = false
				timeLeft = 180
				TriggerEvent("mt:missiontext", "~g~YA PUEDES ESCAPAR!!!", 8000)
				TriggerServerEvent('esx_kr_shops-robbery:GetReward', Id, cancelara)
				--TriggerServerEvent("esx_kr_shops-robbery:NotifyOwner", '~r~El robo en tu tienda ~b~(' .. Name ..')~r~ Fue desafortunadamente exitoso!', Id)
			end
		elseif OnRobbery and GetDistanceBetweenCoords(playerpos.x, playerpos.y, playerpos.z, Coordss.x, Coordss.y, Coordss.z, true) >= 15 then
			OnRobbery = false
			touch = false
			timeLeft = 180
			TriggerServerEvent('esx_kr_shops-robbery:Cancel', Id, cancelara) --here it works
			ESX.ShowNotification(_U("robbery_cancel"))
		end			
	end
end)

RegisterNetEvent("mt:missiontext") 
AddEventHandler("mt:missiontext", function(text, time)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(text)
	DrawSubtitleTimed(time, 1)
end)

RegisterNetEvent("esx_kr_shops:transferir") 
AddEventHandler("esx_kr_shops:transferir", function(shopNumber)
	ESX.ShowNotification('Transfiriendo tienda Nº'..shopNumber)
	ExecuteCommand('e clipboard')
	
	local playerPed = PlayerPedId()
	local playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)

	if #playersNearby > 0 then
		local players = {}
		local elements = {}

		for k,playerNearby in ipairs(playersNearby) do
			players[GetPlayerServerId(playerNearby)] = true
		end

		ESX.TriggerServerCallback('esx:getPlayerNames', function(returnedPlayers)
			for playerId,playerName in pairs(returnedPlayers) do
				table.insert(elements, {
					label = playerName..' ['..playerId..']',
					playerId = playerId
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'give_item_to', {
				title    = 'Transferir Propiedad A:',
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				local selectedPlayer, selectedPlayerId = GetPlayerFromServerId(data2.current.playerId), data2.current.playerId
				playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
				playersNearby = ESX.Table.Set(playersNearby)

				if playersNearby[selectedPlayer] then
					local selectedPlayerPed = GetPlayerPed(selectedPlayer)
					if IsPedOnFoot(selectedPlayerPed) and not IsPedFalling(selectedPlayerPed) then
						ExecuteCommand('cancel')
						--TriggerServerEvent('1974_escritura:transferir', selectedPlayerId)
						TriggerServerEvent('esx_kr_shops:transferir', selectedPlayerId, shopNumber)
						menu2.close()	
					else
						ESX.ShowNotification('Debes estar parado!')
						ExecuteCommand('cancel')
					end
				else
					ESX.ShowNotification('Nadie cerca para transferir!')
					TriggerEvent('dpemotes:cancel')
					menu2.close()
				end
			end, function(data2, menu2)
				TriggerEvent('dpemotes:cancel')
				menu2.close()
			end)
		end, players)
	else
		TriggerEvent('dpemotes:cancel')
		ESX.ShowNotification('Nadie cerca para transferir!')
	end
end)