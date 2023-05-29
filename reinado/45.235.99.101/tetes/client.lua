
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function OpenBuyLicenseMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_license', {
		title = 'Desea activar la licencia de Armero?',
		align = 'top-left',
		elements = {
			{label = 'Si', value = 'yes'},
			{label ='No', value = 'no'},
		}
	}, function(data, menu)
		if data.current.value == 'yes' then
			ESX.TriggerServerCallback('esx_armero:buyLicense', function()

			end)
			
			menu.close()
		elseif data.current.value == 'no' then
			menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end

Citizen.CreateThread(function()
    while true do
        local wait = 500
        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)
		local ubicacion = vector3(1336.9349, 4362.6621, 44.3668)
    
			local dist = #(pedC - ubicacion)
			if dist < 10 then
				wait = 0
				DrawMarker(2, 1336.9349, 4362.6621, 44.3668 + 0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
				if dist < 3 then
					ESX.ShowFloatingHelpNotification('Activar Licencia Armero', vector3(1336.9349, 4362.6621, 44.3668 + 0.50))
					if dist < 2 then
						if IsControlJustPressed(0, 38) then
							OpenBuyLicenseMenu()
						end
					end
				end
			end
        Citizen.Wait(wait)
    end
end)
