-- CONFIG --

-- AFK Kick Time Limit (in seconds)
--secondsUntilKick = 1200
secondsUntilKick = 1200

-- Warn players if 3/4 of the Time Limit ran up
kickWarning = true
afk = false
-- CODE --
local aim = 1000
Citizen.CreateThread(function()
--	SetAimCooldown(aim)
--	SetWeaponsNoAutoreload(true)
	SetWeaponsNoAutoswap(true)
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "WARNING", {255, 0, 0}, "^1Vas a ser trasladado a otro 'Mundo' en " .. time .. " segundos por estar AFK! Cuando vuelvas a estar listo, volveras a la normalidad y verás a los usuarios.")
					end

					time = time - 1
				else
					---Code new
					if afk == false then
					afk = true
					SetEntityVisible(PlayerPedId(), false, false)
					print('Cull to 1.0')
					TriggerServerEvent('minCullin')
					TriggerEvent('estoyAfk', true)
					end
					--TriggerServerEvent("kickForBeingAnAFKDouchebag")
				end
			else
				if afk == true then
					afk = false
					SetEntityVisible(PlayerPedId(), true, false)
				--	SetEntityCollision(PlayerPedId(), true, false)
				print('Cull revert')
				TriggerEvent('estoyAfk', false)
					TriggerServerEvent('snowiBoostFps', 'invAfk')
				end
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)
RegisterCommand('testCoolAim', function(source, args)
	local aim = tonumber(args[1])
	SetAimCooldown(aim)
	SetWeaponsNoAutoreload(true)
	SetWeaponsNoAutoswap(true)
	print('Aim to->'..aim) end)
	RegisterCommand('testvehRpm', function(source, args)
		local rpm = tonumber(args[1])
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
SetVehicleCurrentRpm(vehicle, rpm) end)
