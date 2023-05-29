local menuOpen = false
local letSleep = true

Citizen.CreateThread(function()
	Citizen.Wait(0)
	ESX.TriggerServerCallback('lavado:permitido', function(permitido, identifier)
		if permitido then

			Citizen.CreateThread(function()
				while true do
					local playerPos = GetEntityCoords(PlayerPedId(), true)
					local sleep = 500

					for k,v in pairs(Lavados) do
						
						local storePos = v.position
						local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z)
			
						if distance < Config.Marker.DrawDistance then
							if identifier == v.Hexa then
								sleep = 1
								DrawMarker(Config.Marker.Type, storePos.x, storePos.y, storePos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, true, true, 2, false, false, false, false)
			
								if distance < 0.5 then
									ESX.ShowHelpNotification("".._U('moneywash_prompt').." ("..v.nombreDePunto..")")
			
									if IsControlJustReleased(0, 38) then
										OpenMoneyWashComprados()
									end
								end
							end
						end
					end
					Citizen.Wait(sleep)
				end
			end)
			
		end

	end)


end)

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local distancia = #(coords - Config.CircleZones.MoneyWash.coords)
		local sleep = 500

		if distancia < 2 and menuOpen == false then
			sleep = 1
			if not menuOpen then
				ESX.ShowHelpNotification(_U('moneywash_prompt'))

				if IsControlJustReleased(0, Keys['E']) then
					OpenMoneyWash()
				end
			else
				Citizen.Wait(500)
			end
		end

		 if menuOpen and distancia > 2 then
		 	menuOpen = false
		 	ESX.UI.Menu.CloseAll()
		 end

		for k,v in pairs(Config.Zones) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(playerCoords - Config.Zones.MoneyWash.Pos)

			if distance < Config.DrawDistance and menuOpen == false then
				sleep = 1

				if Config.Zones.MoneyWash.Type ~= -1 then
					DrawMarker(Config.Zones.MoneyWash.Type, Config.Zones.MoneyWash.Pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Zones.MoneyWash.Size.x, Config.Zones.MoneyWash.Size.y, Config.Zones.MoneyWash.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, nil, nil, false)
				end

			end
		end
		Citizen.Wait(sleep)
	end
end)

function CheckMoneyWashLicense()

	ESX.TriggerServerCallback('kilombo_ilegal:CheckMoneyWashLicense', function(cb)
		if cb then
			wasOpen = true
			OpenMoneyWash()
		else
			ESX.ShowNotification(_U('need_license'))
		end
	end)
end

function OpenMoneyWashComprados()
	ESX.UI.Menu.CloseAll()
	local elements = {
		{label = _U('moneywash_wash'), value = 'moneywash_wash'}
	}
	--menuOpen = true

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_shop', {
		title    = _U('moneywash_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'moneywash_wash' then
			ESX.TriggerServerCallback('kilombo_ilegal:Wash2', function(inicial) 
				if inicial <= 0 then
					ESX.ShowNotification('No tenes dinero sucio para lavar.', "error")
				else
					ESX.ShowNotification('Lavaste $<span style="color:green;font-weight:bold">'..inicial..'</span>, recibiste $<span style="color:green;font-weight:bold">'..inicial..'</span>. Con una comisión del <span style="color:red;font-weight:bold">0%</span>.', "success")
				end
			end)
			-- TriggerServerEvent('kilombo_ilegal:Wash2')
			ESX.UI.Menu.CloseAll()
			--menuOpen = false
		end
	end, function(data, menu)
		menu.close()
		--menuOpen = false
	end)
end

function OpenMoneyWash()
	ESX.UI.Menu.CloseAll()
	local elements = {
		{label = _U('moneywash_wash'), value = 'moneywash_wash'}
	}
	menuOpen = true

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_shop', {
		title    = _U('moneywash_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'moneywash_wash' then
			menu.close()
			local success = lib.skillCheck({
				'easy',
				'easy',
				{areaSize = 60, speedMultiplier = 1},
				'hard'
			})
            if not success then
				menuOpen = false
				ESX.ShowNotification("Fallaste al lavar la plata, intentalo de nuevo.", "error")
                return
            end
            if success then
				if GetDistanceBetweenCoords(coords, Config.CircleZones.MoneyWash.coords, true) > 2 then
					ESX.TriggerServerCallback('kilombo_ilegal:Wash', function(inicial, total) 
						if inicial <= 0 then
							ESX.ShowNotification('No tenes dinero sucio para lavar.', "error")
						else
							ESX.ShowNotification('Lavaste $<span style="color:green;font-weight:bold">'..inicial..'</span>, recibiste $<span style="color:green;font-weight:bold">'..ESX.Math.Round(total)..'</span>. Con una comisión del <span style="color:red;font-weight:bold">30%</span>.', "success")
						end
					end)
					-- TriggerServerEvent('kilombo_ilegal:Wash')
					ESX.UI.Menu.CloseAll()
					menuOpen = false
				else
					exports['okokNotify']:Alert("SERVIDOR", 'Estás muy lejos del punto de lavado para hacer esto', 3500, 'info')
					ESX.UI.Menu.CloseAll()
					menuOpen = false
				end
            end
		end
	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if menuOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)