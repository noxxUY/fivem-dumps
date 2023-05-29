ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


Citizen.CreateThread(function()
    while true do 
	Citizen.Wait(5)
        local pedcoord = GetEntityCoords(PlayerPedId())
		local ped = PlayerPedId()
		for k, v in pairs(Config.Venta) do
			x, y, z = table.unpack(v)	
			local dst = GetDistanceBetweenCoords(pedcoord, x, y, z, true)
			DrawMarker(29, x, y, z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)
			if dst <= 4.5 then
				ESX.Game.Utils.DrawText3D(v, "Presiona ~g~[E]~w~ para comprar!", 1.0)
			end
			if dst <= 1 and IsControlJustPressed(0, 38) then
				Menu()
			end
		end		
	end	
end)

function Menu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = 'Barra Boliche',
		align    = 'bottom-right',
		elements = {
			{label = 'Comprar', value = 'comprar'},
	}}, function(data, menu)
		if data.current.value == 'comprar' then
			local elements = {}
			for i=1, #Config.Items, 1 do
				table.insert(elements, {
					label = Config.Items[i].label .. ' [<span style="color:green;">$' .. Config.Items[i].price .. '</span>]',
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
						TriggerServerEvent('xdiskjockey:comprar_item', data2.current.value, data2.current.price, serial)
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

Citizen.CreateThread(function()	
	for k, v in pairs(Config.Blips) do
		k = AddBlipForCoord(v)
		SetBlipSprite(k, 766)
		SetBlipDisplay(k, 4)
		SetBlipScale(k, 0.7)
		SetBlipColour(k, 46)
		SetBlipAsShortRange(k, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(k)
		EndTextCommandSetBlipName(k)
	end
end)