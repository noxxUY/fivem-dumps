local holdingUp = false
local store = ""
local blipRobbery = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2)
end

RegisterNetEvent('esx_holdupweapon:currentlyRobbing')
AddEventHandler('esx_holdupweapon:currentlyRobbing', function(currentStore)
	holdingUp, store = true, currentStore
end)

RegisterNetEvent('esx_holdupweapon:killBlip')
AddEventHandler('esx_holdupweapon:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdupweapon:setBlip')
AddEventHandler('esx_holdupweapon:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 3)

	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdupweapon:tooFar')
AddEventHandler('esx_holdupweapon:tooFar', function()
	holdingUp, store = false, ''
	--ESX.ShowNotification(_U('robbery_cancelled'))
end)

RegisterNetEvent('esx_holdupweapon:robberyComplete')
AddEventHandler('esx_holdupweapon:robberyComplete', function(award)
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_complete', award))
end)

RegisterNetEvent('esx_holdupweapon:startTimer')
AddEventHandler('esx_holdupweapon:startTimer', function()
	local timer = Stores[store].secondsRemaining

	Citizen.CreateThread(function()
		while timer > 0 and holdingUp do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(0)
			drawTxt(0.9, 1.45, 1.0, 1.0, 0.4, _U('robbery_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPos = GetEntityCoords(PlayerPedId(), true)

		for k,v in pairs(Stores) do
			local storePos = v.position
			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z)
			local para = v.para

			if distance < Config.Marker.DrawDistance then
				if not holdingUp then
					DrawMarker(Config.Marker.Type, storePos.x, storePos.y, storePos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)

					if distance < 0.5 then
						ESX.ShowHelpNotification(_U('press_to_rob', v.nameOfStore))

						if IsControlJustReleased(0, 38) then
							if IsPedArmed(PlayerPedId(), 4) then
								if para == 'police' then
									ESX.TriggerServerCallback('esx_policejob:getCops', function(cops)	
										if cops >= Config.PoliceNumberRequired then
											TriggerServerEvent('esx_holdupweapon:robberyStarted', k, para)
										else
											ESX.ShowNotification("~r~No hay suficientes POLICIAS DISPONIBLES. " .. cops .. '/' .. Config.PoliceNumberRequired)
										end
									end)
								elseif para == 'police2' then
									ESX.TriggerServerCallback('esx_police2job:getCops', function(cops)	
										if cops >= Config.PoliceNumberRequired then
											TriggerServerEvent('esx_holdupweapon:robberyStarted', k, para)
										else
											ESX.ShowNotification("~r~No hay suficientes POLICIAS FEDERALES DISPONIBLES. " .. cops .. '/' .. Config.PoliceNumberRequired)
										end
									end)
								elseif para == 'gendarme' then
									ESX.TriggerServerCallback('esx_gendarmeria:getCops', function(cops)	
										if cops >= Config.PoliceNumberRequired then
											TriggerServerEvent('esx_holdupweapon:robberyStarted', k, para)
										else
											ESX.ShowNotification("~r~No hay suficientes GENDARMES en línea. " .. cops .. '/' .. Config.PoliceNumberRequired)
										end
									end)
								end
							else
								ESX.ShowNotification("~r~Sin Arma no puedes robarle a nadie!")
							end
						end
					end
				end
			end
		end

		if holdingUp then
			local storePos = Stores[store].position
			if Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z) > Config.MaxDistance then
				holdingUp = false
				TriggerServerEvent('esx_holdupweapon:tooFar', store)
			end
		end
	end
end)
