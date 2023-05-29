local Keys = {
["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

ESX = nil

local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function Menu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = 'Tus Objetos',
		align    = 'bottom-right',
		elements = {
			{label = 'Vender Objetos', value = 'vender'},
			{label = 'Comprar Objetos', value = 'comprar'},
	}}, function(data, menu)
		if data.current.value == 'vender' then
			OpenPutStocksMenu()
		else
			local elements = {}
			for i=1, #Config.Items, 1 do
				table.insert(elements, {
					label = Config.Items[i].label .. ' [<span style="color:red;">$' .. Config.Items[i].price .. '</span>]',
					value = Config.Items[i].value,
					price = Config.Items[i].price
				})
			end
			
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'compra_menu',
			{
				title    = 'Compra de Objetos',
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				ESX.TriggerServerCallback('1974_drogas:check', function(serial)
					if serial then
						TriggerServerEvent('1974_venta_ilegal:comprar_item', data2.current.value, data2.current.price, serial)
					end
				end)
				menu2.close()
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('1974_venta_ilegal:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]
			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					cantidad  = item.count,
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = 'Inventario',
			align    = 'bottom-right',
			elements = elements
		}, function(data3, menu3)
			local itemName = data3.current.value
			local cantidad = data3.current.cantidad
			TriggerServerEvent('1974_venta_ilegal:compra', itemName, cantidad)
			menu3.close()
		end, function(data3, menu3)
			menu3.close()
		end)
	end)
end

Citizen.CreateThread(function()
    while true do 
	Citizen.Wait(5)
        local pedcoord = GetEntityCoords(PlayerPedId())
		local ped = PlayerPedId()
		local x, y, z = table.unpack(Config.Venta)
		local dst = GetDistanceBetweenCoords(pedcoord, x, y, z-1, true)
		
		DrawMarker(29, x, y, z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)
		
		if dst <= 4.5 then
			ESX.Game.Utils.DrawText3D(Config.Venta, "Presiona ~g~[E]~w~ para Comprar/Vender Objetos!", 1.0)
		end

		if dst <= 1 and IsControlJustPressed(0, Keys["E"]) then
			Menu()
		end
		
		local x, y, z = table.unpack(Config.VentaArmas)
		local dst = GetDistanceBetweenCoords(pedcoord, x, y, z-1, true)
		
		if dst <= 2.5 then
			ESX.Game.Utils.DrawText3D(Config.VentaArmas, "Presiona ~g~[E]~w~ para Comprar Armas!", 1.0)
		end

		if dst <= 1.5 and IsControlJustPressed(0, Keys["E"]) then
			MenuArmas()
		end
	end	
end)
--[[
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(5)
		local x, y, z = table.unpack(Config.Venta)
		DrawMarker(29, x, y, z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)
	end
end)
]]
Citizen.CreateThread(function()
	local x, y, z = table.unpack(Config.Venta)
	local blip = AddBlipForCoord(x, y)
	SetBlipSprite (blip, 108)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.8)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Compra y Venta")
	EndTextCommandSetBlipName(blip)
end)


function MenuArmas()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = 'Armas Ilegales',
		align    = 'bottom-right',
		elements = {
			{label = 'Comprar Armas', value = 'comprar'},
	}}, function(data, menu)
		if data.current.value == 'comprar' then
			local elements = {}
			for i=1, #Config.Armas, 1 do
				table.insert(elements, {
					label = Config.Armas[i].label .. ' [<span style="color:red;">$' .. Config.Armas[i].price .. '</span>]',
					value = Config.Armas[i].value,
					price = Config.Armas[i].price
				})
			end
			
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'compra_menu',
			{
				title    = 'Compra de Armas',
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				ESX.TriggerServerCallback('1974_drogas:check', function(serial)
					if serial then
						TriggerServerEvent('1974_venta_ilegal:comprar_armas', data2.current.value, data2.current.price, serial)	
					end
				end)
				menu2.close()
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

