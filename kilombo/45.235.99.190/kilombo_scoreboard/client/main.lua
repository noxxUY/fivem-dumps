Keys = {
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

local showPlayerId, isScoreboardActive = true, false

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10000)
		ESX.TriggerServerCallback('hr-scoreboard:getConnectedPlayers', function(connectedPlayers, maxPlayers)
			UpdatePlayerTable(connectedPlayers)
		
			SendNUIMessage({
				action = 'updateServerInfo',
				maxPlayers = maxPlayers,
				--uptime = 'unknown',
				--playTime = '00h 00m'
			})
		end)
	end

end)

RegisterNetEvent('hr-scoreboard:updateConnectedPlayers')
AddEventHandler('hr-scoreboard:updateConnectedPlayers', function(connectedPlayers)
	UpdatePlayerTable(connectedPlayers)
end)

RegisterNetEvent('hr-scoreboard:updatePlayersInQueue')
AddEventHandler('hr-scoreboard:updatePlayersInQueue', function(playersInQueue)
	SendNUIMessage({action = 'updateServerInfo', playersInQueue = playersInQueue})
end)

--[[RegisterNetEvent('hr-scoreboard:updatePing')
AddEventHandler('hr-scoreboard:updatePing', function(connectedPlayers)
	SendNUIMessage({action = 'updatePing', players = connectedPlayers})
end)]]

RegisterNetEvent('hr-scoreboard:toggleID')
AddEventHandler('hr-scoreboard:toggleID', function(state)
	if state then
		showPlayerId = state
	else
		showPlayerId = not showPlayerId
	end

	SendNUIMessage({action = 'toggleID', state = showPlayerId})
end)

--[[RegisterNetEvent('uptime:tick')
AddEventHandler('uptime:tick', function(uptime)
	SendNUIMessage({action = 'updateServerInfo', uptime = uptime})
end)]]

function UpdatePlayerTable(connectedPlayers)
	local formattedPlayerList = {}
	local ems, police, mechanic3, mechanic, gna, mechanic2, players = 0, 0, 0, 0, 0, 0, 0

	for k,v in pairs(connectedPlayers) do
		table.insert(formattedPlayerList, ('<tr><td>%s</td><td>%s</td><td>%s</td></tr>'):format(v.name, v.playerId, v.ping))
		players = players + 1

		if v.job == 'ambulance' then
			ems = ems + 1
		elseif v.job == 'police' then
			police = police + 1
		elseif v.job == 'gna' then
			gna = gna + 1
		elseif v.job == 'mechanic2' then
			mechanic2 = mechanic2 + 1
		elseif v.job == 'mechanic3' then
			mechanic3 = mechanic3 + 1
		elseif v.job == 'mechanic' then
			mechanic = mechanic + 1
		end
	end

	SendNUIMessage({action = 'updatePlayerList', players = table.concat(formattedPlayerList)})

	SendNUIMessage({
		action = 'updatePlayerJobs',
		jobs = {ems = ems, police = police, mechanic2 = mechanic2, mechanic = mechanic, gna = gna, mechanic3 = mechanic3, player_count = players}
	})
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() and isScoreboardActive then
		SetNuiFocus(false)
	end
end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(0)

-- 		if IsControlJustReleased(0, 57) and IsInputDisabled(0) then
-- 			isScoreboardActive = true
-- 			--SetNuiFocus(true, false)
-- 			SendNUIMessage({action = 'enable'})

-- 			Citizen.Wait(1000)
-- 		end

-- 		if IsControlPressed(0, Keys['F10']) and isScoreboardActive then
-- 			SendNUIMessage({action = 'apagar'})
-- 			Citizen.Wait(1000)
-- 		end
-- 	end
-- end)

RegisterCommand("scoreboard", function()
	if not isScoreboardActive then
		isScoreboardActive = true
		--SetNuiFocus(true, false)
		SendNUIMessage({action = 'enable'})

		Citizen.Wait(1000)
	else
		SendNUIMessage({action = 'apagar'})
		Citizen.Wait(1000)
	end
end, false)

RegisterKeyMapping('scoreboard', 'Abrir o cerrar scoreboard', 'keyboard', 'F10')

RegisterNUICallback('onCloseMenu', function()
	isScoreboardActive = false
	SetNuiFocus(false)
end)
