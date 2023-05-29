local holdingUp = false
local banco = ""
local blipRobbery = nil

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('kilombo_robos:bancos:currentlyRobbing')
AddEventHandler('kilombo_robos:bancos:currentlyRobbing', function(currentBank)
	holdingUp, banco = true, currentBank
end)

RegisterNetEvent('kilombo_robos:bancos:killBlip')
AddEventHandler('kilombo_robos:bancos:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('kilombo_robos:bancos:setBlip')
AddEventHandler('kilombo_robos:bancos:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 0.7)
	SetBlipColour(blipRobbery, 3)

	PulseBlip(blipRobbery)
end)

RegisterNetEvent('kilombo_robos:bancos:tooFar')
AddEventHandler('kilombo_robos:bancos:tooFar', function()
	holdingUp, banco = false, ''
	exports['okokNotify']:Alert("SERVIDOR", _U('robbery_cancelled'), 3500, 'info')
end)

RegisterNetEvent('kilombo_robos:bancos:robberyComplete')
AddEventHandler('kilombo_robos:bancos:robberyComplete', function(award)
	holdingUp, banco = false, ''
	exports['okokNotify']:Alert("SERVIDOR", _U('robbery_complete', award), 3500, 'success')
end)

RegisterNetEvent('kilombo_robos:bancos:startTimer')
AddEventHandler('kilombo_robos:bancos:startTimer', function()
	local timer = Bancos[banco].tiempoDeRobo
	local nombre = Bancos[banco].nombreDeTienda

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
			drawTxt(0.86, 1.44, 1.0, 1.0, 0.4, _U('robbery_timer', nombre, timer), 255, 255, 255, 255)
		end
	end)
end)

Citizen.CreateThread(function()
	while true do
		sleep = 500
		local playerPos = GetEntityCoords(PlayerPedId(), true)

		for k,v in pairs(Bancos) do
			local storePos = v.position
			local distance = #(playerPos - v.position)

			if distance < Config.Marker.DrawDistance then
				if not holdingUp then
					sleep = 1
					DrawMarker(Config.Marker.Type, storePos.x, storePos.y, storePos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, true, true, 2, false, false, false, false)

					if distance < 0.5 then
						ESX.ShowHelpNotification(_U('press_to_rob', v.nombreDeTienda))

						if IsControlJustReleased(0, 38) then
							if IsPedArmed(PlayerPedId(), 4) then
								local nextRobberyId = 1
								local robberyData = {
									id = nextRobberyId,
									banco = k,
									nombre = v.nombreDeTienda,
								}
								TriggerServerEvent('kilombo_robos:bancos:robberyStarted', k)
								TriggerServerEvent('kilombo_robos:bancos:roboIniciado', robberyData)
								-- nextRobberyId = nextRobberyId + 1
								-- Citizen.Wait(2000)
								-- local robberyData2 = {
								-- 	id = nextRobberyId,
								-- 	banco = "PrincipalBank",
								-- 	nombre = "Banco Principal",
								-- }
								-- TriggerServerEvent('kilombo_robos:bancos:roboIniciado', robberyData2)
							else
								exports['okokNotify']:Alert("SERVIDOR", _U('no_threat'), 3500, 'info')
							end
						end
					end
				end
			end
		end

		if holdingUp then
			local storePos = Bancos[banco].position
			if #(playerPos - storePos) > Config.MaxDistance then
				Citizen.Wait(1500)
				TriggerServerEvent('kilombo_robos:bancos:tooFarSV', banco)
				Citizen.Wait(100)
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Bancos)do
		local ve = v.position
		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 150)
		SetBlipScale(blip, 0.2)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('bank_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)
