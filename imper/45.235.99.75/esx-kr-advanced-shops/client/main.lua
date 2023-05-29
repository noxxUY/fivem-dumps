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

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
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
end)

RegisterNUICallback('bossactions', function(data, cb)
	 
	SetNuiFocus(false, false)

	SendNUIMessage({
		type = "close",
	})

	OpenBoss(number)
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

				end, number)
			end, number)
end)

RegisterNUICallback('emptycart', function(data, cb)
	Cart = {}
	
end)

RegisterNUICallback('buy', function(data, cb)
	
		TriggerServerEvent('esx_kr_shops:Buy', number, data.Item, data.Count)
		ExecuteCommand("me Le paga al kioskero")
	Cart = {}
	
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
   PlayerData = xPlayer
end)

local ShopId           = nil
local Msg        = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil


AddEventHandler('esx_kr_shop:hasEnteredMarker', function(zone)
	if zone == 'center' then
		ShopId = zone
		number = zone
		Msg  = _U('press_to_open_center')
	elseif zone <= 100 then
		ShopId = zone
		number = zone
		Msg  = _U('press_to_open')
	elseif zone >= 100 then
		ShopId = zone
		number = zone
		Msg  = _U('press_to_rob')
	end
end)

AddEventHandler('esx_kr_shop:hasExitedMarker', function(zone)
	ShopId = nil
	ESX.UI.Menu.CloseAll()
end)

Citizen.CreateThread(function ()
 	 while true do
		Citizen.Wait(0)
		local hour = GetClockHours()
        local ClosingTime = Config.ClosingHour-1
        
		if ShopId ~= nil then		
           if hour < Config.OpeningHour or hour > ClosingTime then
		      ESX.ShowHelpNotification(Msg)
		          if IsControlJustReleased(0, Keys['E']) then
				  ExecuteCommand("me Habla con el vendedor")
			end		             ESX.ShowAdvancedNotification('', '~y~Estabelecimento', '~r~O estabelecimento está fechado~g~ Funcionamos de ' .. Config.OpeningHour .. ' - ' .. Config.ClosingHour ..'.', 'CHAR_PEGASUS_DELIVERY', 8)

       else			
			
		if ShopId ~= nil then
		   ESX.ShowHelpNotification(Msg)   
				if IsControlJustReleased(0, Keys['E']) then
				ExecuteCommand("me Habla con el vendedor")
					if ShopId == 'center' then
						OpenShopCenter()
					

					elseif ShopId <= 100 then
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
			
							end, number)
						end, number)
					elseif ShopId >= 100 then
						Robbery(number - 100)
					end	
			ShopId = nil	
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
			table.insert(elements, {label = 'Ocultar todas las tiendas del mapa', value = 'removeblip'})
		else
			table.insert(elements, {label = 'Mostrar todas las tiendas del mapa', value = 'showblip'})
		end

			ESX.TriggerServerCallback('esx_kr_shop:getShopList', function(data)

				for i=1, #data, 1 do
					table.insert(elements, {label = _U('buy_shop') .. data[i].ShopNumber .. ' [$' .. data[i].ShopValue .. ']', value = 'kop', price = data[i].ShopValue, shop = data[i].ShopNumber})
					
				end


					ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'shopcenter',
					{
						title    = 'Tiendas',
						align    = 'right',
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

					end,
					function(data2, menu2)
					menu2.close()
					end)

					elseif data.current.value == 'removeblip' then
						showblip = false
						createForSaleBlips()
						menu.close()
					elseif data.current.value == 'showblip' then
						showblip = true
						createForSaleBlips()
						menu.close()
					end
					end)
				end,
			function(data, menu)
		menu.close()
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

		table.insert(elements, {label = 'Tu tienes: $' .. data[1].money .. ' na empresa', value = ''})
		table.insert(elements, {label = 'Stock de la tienda',    value = 'shipments'})
        table.insert(elements, {label = 'Colocar item', value = 'putitem'})
        table.insert(elements, {label = 'sacar item',    value = 'takeitem'})
        table.insert(elements, {label = 'Depositar dinero a la tienda',    value = 'putmoney'})
        table.insert(elements, {label = 'Retirar dinero de la tienda ',    value = 'takemoney'})
        table.insert(elements, {label = 'Cambiar el nombre de la tienda: $' .. Config.ChangeNamePrice,    value = 'changename'})
		table.insert(elements, {label = 'Vender tienda por: $' .. math.floor(data[1].ShopValue / Config.SellValue),   value = 'sell'})

		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'boss',
		{
			title    = 'Tienda',
			align    = 'right',
			elements = elements
		},
		function(data, menu)
        if data.current.value == 'putitem' then
            PutItem(number)
        elseif data.current.value == 'takeitem' then  
            TakeItem(number)
        elseif data.current.value == 'takemoney' then
            

            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'takeoutmoney', {
                title = 'Quantidade?'
            }, function(data2, menu2)
  
			local amount = tonumber(data2.value)
			
			TriggerServerEvent('esx_kr_shops:takeOutMoney', amount, number)
			
			menu2.close()
        
		end,
		function(data2, menu2)
		menu2.close()
		end)

	 	elseif data.current.value == 'putmoney' then
			ESX.UI.Menu.CloseAll()

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putinmoney', {
			title = 'Quantidade?'
			}, function(data3, menu3)
			local amount = tonumber(data3.value)
			TriggerServerEvent('esx_kr_shops:addMoney', amount, number)
			menu3.close()
				end,
				function(data3, menu3)
			menu3.close()
		end)

		elseif data.current.value == 'sell' then
		  ESX.UI.Menu.CloseAll()    

		  ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'sell', {
			title = 'ESCREVA:(sim) sem parênteses para confirmar'
          }, function(data4, menu4)
            
            if data4.value == 'sim' then
              TriggerServerEvent('esx_kr_shops:SellShop', number)
              menu4.close()
			end
		    	end,
		    	function(data4, menu4)
		    menu4.close()
		end)

	  elseif data.current.value == 'changename' then
		ESX.UI.Menu.CloseAll()    

		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'changename', {
		  title = 'Nome da loja?'
        }, function(data5, menu5)
            
            TriggerServerEvent('esx_kr_shops:changeName', number, data5.value)
            menu5.close()
               		end,
                	function(data5, menu5)
                	menu5.close()
				end)
				
			elseif data.current.value == 'shipments' then
				OpenShipments(number)

				end
        		end,
        		function(data, menu)
        	menu.close()
	    end)
    end, number)
end

function OpenShipments(id)

	local elements = {}

	table.insert(elements, {label = '-- Encomendar produtos --'})
	table.insert(elements, {label = 'Mercadinho', value = 'buy'})
	table.insert(elements, {label = '-------------------------------------------------'})
	table.insert(elements, {label = '-- Encomendar produtos --'})
	table.insert(elements, {label = 'Bar', value = 'buyy'})
	table.insert(elements, {label = '-------------------------------------------------'})
	table.insert(elements, {label = '-- Encomendar produtos --'})
	table.insert(elements, {label = 'Conveniência', value = 'buyyy'})
	table.insert(elements, {label = '-------------------------------------------------'})
	table.insert(elements, {label = '-- Produtos em estoque --'})
	table.insert(elements, {label = 'Pegar produtos', value = 'shipments'})

	ESX.UI.Menu.Open(
  	'default', GetCurrentResourceName(), 'shipments',
	{
		title    = 'Loja',
		align    = 'right',
		elements = elements
	},
	  function(data, menu)
		
		if data.current.value == 'buy' then
			ESX.UI.Menu.CloseAll()
			OpenShipmentDelivery(id)
		elseif data.current.value == 'buyy' then
			ESX.UI.Menu.CloseAll()
			OpenShipmentDeliveryy(id)
        elseif data.current.value == 'buyyy' then
			ESX.UI.Menu.CloseAll()
			OpenShipmentDeliveryyy(id)			
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
			table.insert(elements, {label = '-- PEDIDOS PRONTOS --'})
			table.insert(elements, {label = 'Receba todos os seus envios', value = 'pickup'})
			once2 = false
			end

			if time - items[i].time >= Config.DeliveryTime then
			table.insert(elements, {label = items[i].label,	value = items[i].item, price = items[i].price})
			end

			if time - items[i].time <= Config.DeliveryTime and once then
				table.insert(elements, {label = '-- PEDIDOS PENDENTES --'})
				once = false
			end

			if time - items[i].time <= Config.DeliveryTime then
				times = time - items[i].time
				table.insert(elements, {label = items[i].label .. ': ' .. math.floor((Config.DeliveryTime - times) / 60) .. ' minutos' })
			end

		end

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'allshipments',
	{
	  title    = 'loja',
	  align    = 'right',
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

		for i=1, #Config.Items_Loja, 1 do
			table.insert(elements, {labels =  Config.Items_Loja[i].label, label =  Config.Items_Loja[i].label .. ' por: $' .. Config.Items_Loja[i].price .. ' ',	value = Config.Items_Loja[i].item, price = Config.Items_Loja[i].price})
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'shipitem',
			{
			title    = 'Mercadinho',
			align    = 'right',
			elements = elements
			},
			function(data, menu)
				menu.close()
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'krille', {
				title = 'Quantidade?'
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

function OpenShipmentDeliveryy(id)
	ESX.UI.Menu.CloseAll()
	local elements = {}

		for i=1, #Config.Items_Bar, 1 do
			table.insert(elements, {labels =  Config.Items_Bar[i].label, label =  Config.Items_Bar[i].label .. ' por: $' .. Config.Items_Bar[i].price .. ' ',	value = Config.Items_Bar[i].item, price = Config.Items_Bar[i].price})
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'shipitem',
			{
			title    = 'Bar',
			align    = 'right',
			elements = elements
			},
			function(data, menu)
				menu.close()
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'krille', {
				title = 'Quantidade?'
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

function OpenShipmentDeliveryyy(id)
	ESX.UI.Menu.CloseAll()
	local elements = {}

		for i=1, #Config.Items_Conveniencia, 1 do
			table.insert(elements, {labels =  Config.Items_Conveniencia[i].label, label =  Config.Items_Conveniencia[i].label .. ' por: $' .. Config.Items_Conveniencia[i].price .. ' ',	value = Config.Items_Conveniencia[i].item, price = Config.Items_Conveniencia[i].price})
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'shipitem',
			{
			title    = 'Conveniência',
			align    = 'right',
			elements = elements
			},
			function(data, menu)
				menu.close()
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'krille', {
				title = 'Quantidade?'
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

function TakeItem(number)

  local elements = {}

  ESX.TriggerServerCallback('esx_kr_shop:getShopItems', function(result)

	for i=1, #result, 1 do
	    if result[i].count > 0 then
	    	table.insert(elements, {label = result[i].label .. ' | ' .. result[i].count ..'x itens: $' .. result[i].price .. ' cada!', value = 'removeitem', ItemName = result[i].item})
	    end
    end


  ESX.UI.Menu.Open(
  'default', GetCurrentResourceName(), 'takeitem',
  {
	title    = 'Loja',
	align    = 'right',
	elements = elements
  },
  function(data, menu)
local name = data.current.ItemName

    if data.current.value == 'removeitem' then
        menu.close()
        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'howmuch', {
        title = 'Quantidade?'
        }, function(data2, menu2)

        local count = tonumber(data2.value)
		menu2.close()
    	TriggerServerEvent('esx_kr_shops:RemoveItemFromShop', number, count, name)
    
			end, function(data2, menu2)
				menu2.close()
			end)
			end
		end,
		function(data, menu)
		menu.close()
		end)
  	end, number)
end


function PutItem(number)

  local elements = {}

  ESX.TriggerServerCallback('esx_kr_shop:getInventory', function(result)

    for i=1, #result.items, 1 do
        
      local invitem = result.items[i]
      
	    if invitem.count > 0 then
			table.insert(elements, { label = invitem.label .. ' | ' .. invitem.count .. 'x', count = invitem.count, name = invitem.name})
	    end
	end

  ESX.UI.Menu.Open(
  'default', GetCurrentResourceName(), 'putitem',
  {
	title    = 'Loja',
	align    = 'right',
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
				ESX.ShowNotification('~r~No puedes vender más de lo que tienes')
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
				TriggerServerEvent('esx_kr_shops:setToSell', number, itemName, count, price)
		
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
	Citizen.Wait(1)

	local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if(27 ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance ) then
				if v.Pos.red then
					DrawMarker(23, v.Pos.x, v.Pos.y, v.Pos.z + 0.05, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.2, 180, 0, 0, 200, false, true, 2, false, false, false, false)
					DrawMarker(29, v.Pos.x, v.Pos.y, v.Pos.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 180, 0, 0, 200, false, true, 2, false, false, false, false)		
				else
					DrawMarker(23, v.Pos.x, v.Pos.y, v.Pos.z + 0.05, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.2, 0, 180, 0, 200, false, true, 2, false, false, false, false)
					DrawMarker(29, v.Pos.x, v.Pos.y, v.Pos.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 180, 0, 200, false, true, 2, false, false, false, false)
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
	local currentZone = nil

	for k,v in pairs(Config.Zones) do
	  if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.2) then
		isInMarker  = true
		currentZone = v.Pos.number
	  end
	end

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

end)

function createBlip(blips)
	for i=1, #blips, 1 do
  		for k,v in pairs(Config.Zones) do
			if v.Pos.number == blips[i].ShopNumber then
			
			end
 		end
	end
end


function createForSaleBlips()
	if showblip then

		IDBLIPS = {
			[1] = {x = 373.875,    y = 325.896,   z = 102.566, n = 1},
			[2] = {x = 2557.458,   y = 382.282,   z = 107.622, n = 2},
			[3] = {x = -3038.939,  y = 585.954,   z = 6.908,   n = 3},
			[4] = {x = -1487.553,  y = -379.107,  z = 39.163,  n = 4},
			[5] = {x = 1392.562,   y = 3604.684,  z = 33.980,  n = 5},
			[6] = {x = -2968.243,  y = 390.910,   z = 14.043,  n = 6},
			[7] = {x = 2678.916,   y = 3280.671,  z = 54.241,  n = 7},
			[8] = {x = -48.519,    y = -1757.514, z = 28.421,  n = 8},
			[9] = {x = 1163.373,   y = -323.801,  z = 68.205,  n = 9},
			[10] = {x = -707.501,  y = -914.260,  z = 18.215,  n = 10},
			[11] = {x = -1820.523, y = 792.518,   z = 137.118, n = 11},
			[12] = {x = 1698.388,  y = 4924.404,  z = 41.063,  n = 12},
			[13] = {x = 1961.464,  y = 3740.672,  z = 31.343,  n = 13},
			[14] = {x = 1135.808,  y = -982.281,  z = 45.415,  n = 14},
			[15] = {x = 25.88,     y = -1347.1,   z = 28.5,    n = 15},
			[16] = {x = 316.77,    y = -588.26,   z = 43.29,   n = 16},
			[17] = {x = 547.431,   y = 2671.710,  z = 41.156,  n = 17},
			[18] = {x = -3241.927, y = 1001.462,  z = 11.830,  n = 18},
			[19] = {x = 1166.024,  y = 2708.930,  z = 37.157,  n = 19},
			[20] = {x = 1729.216,  y = 6414.131,  z = 34.037,  n = 20},
			[21] = {x = 841.13,    y = -1031.08,  z = 28.23,   n = 21},
			[22] = {x = 22.11,     y = -1110.21,  z = 29.81,   n = 22},
			[23] = {x = -660.63,   y = -937.93,   z = 21.87,   n = 23},
			[24] = {x = -1308.57,  y = -395.21,   z = 36.73,   n = 24},
			[25] = {x = 249.26,    y = -50.53,    z = 69.98,   n = 25},
			[26] = {x = -3169.05,  y = 1087.95,   z = 20.87,   n = 26},
			[27] = {x = -1115.09,  y = 2697.74,   z = 18.59,   n = 27},
			[28] = {x = -327.87,   y = 6083.18,   z = 31.49,   n = 38},
			[29] = {x = 1696.35,   y = 3759.34,   z = 34.8,    n = 39},
			[30] = {x = 808.88,    y = -2155.17,  z = 29.63,   n = 30},
			[31] = {x = 2566.67,   y = 296.76,    z = 108.76,  n = 31},
			[32] = {x = 127.81,    y = -1284.78,  z = 29.28,   n = 32},
			[33] = {x = -1393.409, y = -606.624,  z = 29.319,  n = 33},
			[34] = {x = -560.18,   y = 286.79,    z = 82.18,   n = 34},
		}

		for i=1, #IDBLIPS, 1 do

			local blip2 = AddBlipForCoord(vector3(IDBLIPS[i].x, IDBLIPS[i].y, IDBLIPS[i].z))
				
				SetBlipSprite (blip2, 350)
				SetBlipDisplay(blip2, 4)
				SetBlipScale  (blip2, 0.8)
				SetBlipColour (blip2, 4)
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
local OnRobbery = false
local Id = nil
local Name = nil

function Robbery(id)

	local coords1 = {
  		[1] = {x = 380.74,    y = 331.94,   z = 103.57, heading = 255.47},
		[2] = {x = 2550.23,   y = 387.34,   z = 108.62, heading = 359.25},
		[3] = {x = -3047.88,  y = 588.16,   z = 7.91, heading = 20.34},
		[4] = {x = -1478.97,  y = -374.36,  z = 38.16, heading = 228.54},
		[5] = {x = 1395.49,   y = 3612.94,  z = 33.98, heading = 22.18},
		[6] = {x = -2959.5,   y = 387.78,   z =13.04 , heading = 171.58},
		[7] = {x = 2674.36,   y = 3288.0,   z = 54.24, heading = 339.44},
		[8] = {x = -42.76,    y = -1749.36, z = 28.42, heading = 320.15},
		[9] = {x = 1160.77,   y = -314.03,  z = 68.21, heading = 10.81},
		[10] = {x = -708.14,  y = -904.05,  z =18.22 , heading = 5.29},
		[11] = {x = -1828.23, y = 799.83,   z = 137.16, heading = 53.63},
		[12] = {x = 1706.87,  y = 4919.76,  z = 41.06, heading = 237.41},
		[13] = {x = 1960.75,  y = 3748.67,  z = 31.34, heading = 304.34},
		[14] = {x = 1126.26,  y = -980.84,  z = 44.42, heading = 9.13},
		[15] = {x = 30.45,    y = -1339.88, z = 28.5 , heading = 269.79},
		[16] = {x = 545.07,   y = 2663.47,  z = 41.16, heading = 96.45},
		[17] = {x = -3249.02, y = 1006.04,  z = 11.83, heading = 0.76},
		[18] = {x = 1168.51,  y = 2718.37,  z = 36.16, heading = 271.45},
		[19] = {x = 1736.31,  y = 6419.15,  z = 35.04, heading = 246.85},
    }

    -- TriggerServerEvent('esx_kr_shops:UpdateCurrentShop', id)

        ESX.TriggerServerCallback('esx_kr_shop-robbery:getUpdates', function(result)
		ESX.TriggerServerCallback('esx_kr_shop-robbery:getOnlinePolices', function(results)

			if result.cb ~= nil then
				if results >= Config.RequiredPolices then
                TriggerServerEvent('esx_kr_shops-robbery:UpdateCanRob', id)
                
                    local coords = {
                        x = coords1[id].x,
                        y = coords1[id].y,
                        z = coords1[id].z - 1,
					}
						TriggerServerEvent('esx_addons_gcphone:startCall', "police", "Asalto de tienda " .. result.name .. '!', coords)
						TriggerServerEvent('esx_kr_shops-robbery:NotifyOwner', "~r~la  tienda ~b~(" .. result.name .. ')~r~ está siendo robada', id)
						
						ESX.Game.SpawnObject(1089807209, coords, function(safe)
						SetEntityHeading(safe, coords1[id].heading)
						FreezeEntityPosition(safe, true)

                        SetEntityHealth(safe, 10000)
                        OnRobbery = true
						Var = safe
						Id = id
						Coordss = coords
						Name = result.name
						end)
                else
					ESX.ShowNotification("~r~No policias suficientes para robar " .. results .. '/' .. Config.RequiredPolices)
				end
			else
				ESX.ShowNotification("~r~ya esta tienda fue robada espera : " ..  math.floor((Config.TimeBetweenRobberies - result.time)  / 60) .. ' minutos')
			end
		end)
	end, id)
end

Citizen.CreateThread(function()
	while true do
        Wait(0)
			local playerpos = GetEntityCoords(GetPlayerPed(-1))
				if OnRobbery and GetDistanceBetweenCoords(playerpos.x, playerpos.y, playerpos.z, Coordss.x, Coordss.y, Coordss.z, true) <= 15 then
					
					local hp = GetEntityHealth(Var)
					TriggerEvent("mt:missiontext", "Quebre o cofre:~r~ " .. hp/100 .. "%", 1000)

				if hp == 0 then
					OnRobbery = false
					TriggerServerEvent('esx_kr_shops-robbery:GetReward', Id)
					TriggerServerEvent("esx_kr_shops-robbery:NotifyOwner", '~r~O assalto na sua loja ~b~(' .. Name ..')~r~ foi infelizmente bem sucedido!', Id)
					DeleteEntity(Var)
				end

				elseif OnRobbery and GetDistanceBetweenCoords(playerpos.x, playerpos.y, playerpos.z, Coordss.x, Coordss.y, Coordss.z, true) >= 15 then
					OnRobbery = false
					DeleteEntity(Var)
					TriggerServerEvent('esx_kr_shops-robbery:NotifyOwner', "~g~O assalto na sua loja ~b~(" .. Name .. ')~g~ não foi bem sucedido!', Id)
					ESX.ShowNotification(_U("robbery_cancel"))	
				end
	end
end)

RegisterNetEvent("mt:missiontext") -- credits: https://github.com/schneehaze/fivem_missiontext/blob/master/MissionText/missiontext.lua
AddEventHandler("mt:missiontext", function(text, time)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString(text)
		DrawSubtitleTimed(time, 1)
end)
