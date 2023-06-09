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

local idVisable = true
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(2000)
	ESX.TriggerServerCallback('esx_scoreboard:getConnectedPlayers', function(connectedPlayers)
		UpdatePlayerTable(connectedPlayers)
	end)
end)

Citizen.CreateThread(function()
	Citizen.Wait(500)
	SendNUIMessage({
		action = 'updateServerInfo',

		maxPlayers = GetConvarInt('sv_maxclients', 250),
		uptime = 'unknown',
		playTime = '00h 00m'
	})
end)

RegisterNetEvent('esx_scoreboard:updateConnectedPlayers')
AddEventHandler('esx_scoreboard:updateConnectedPlayers', function(connectedPlayers)
	UpdatePlayerTable(connectedPlayers)
end)

RegisterNetEvent('esx_scoreboard:updatePing')
AddEventHandler('esx_scoreboard:updatePing', function(connectedPlayers)
	SendNUIMessage({
		action  = 'updatePing',
		players = connectedPlayers
	})
end)

RegisterNetEvent('esx_scoreboard:toggleID')
AddEventHandler('esx_scoreboard:toggleID', function(state)
	if state then
		idVisable = state
	else
		idVisable = not idVisable
	end

	SendNUIMessage({
		action = 'toggleID',
		state = idVisable
	})
end)

RegisterNetEvent('uptime:tick')
AddEventHandler('uptime:tick', function(uptime)
	SendNUIMessage({
		action = 'updateServerInfo',
		uptime = uptime
	})
end)

function UpdatePlayerTable(connectedPlayers)
	local formattedPlayerList, num = {}, 1
	local ems, judicial, police, police2, fbi, taxi, mechanic, telefe, players, seguridad, mechanic3, mechanic4, gendarme, mechanic2, transito = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	--mlibre, garbage, bus, pollero, lumberjack, trucker, miner, unemployed, pizzero, portuario, edesur
	for k,v in pairs(connectedPlayers) do

		if num == 1 then
			table.insert(formattedPlayerList, ('<tr><td>%s</td><td>%s</td>'):format(v.name, v.id))
			num = 2
		elseif num == 2 then
			table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td>'):format(v.name, v.id))
			num = 3
		elseif num == 3 then
			table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td>'):format(v.name, v.id))
			num = 4
		elseif num == 4 then
			table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td>'):format(v.name, v.id))
			num = 5
		elseif num == 5 then
			table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td>'):format(v.name, v.id))
			num = 6
		elseif num == 6 then
			table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td>'):format(v.name, v.id))
			num = 1
		end

		players = players + 1

		if v.job == 'ambulance' then
			ems = ems + 1
		elseif v.job == 'police' then
			police = police + 1
		elseif v.job == 'police2' then
			police2 = police2 + 1
		elseif v.job == 'fbi' then
			fbi = fbi + 1
		elseif v.job == 'taxi' then
			taxi = taxi + 1
		elseif v.job == 'mechanic' then
			mechanic = mechanic + 1						
		elseif v.job == 'telefe' then
			telefe = telefe + 1		
		elseif v.job == 'seguridad' then
			seguridad = seguridad + 1			
		elseif v.job == 'judicial' then
			judicial = judicial + 1	
		elseif v.job == 'mechanic3' then
			mechanic3 = mechanic3 + 1
		elseif v.job == 'mechanic4' then
			mechanic4 = mechanic4 + 1
		elseif v.job == 'mechanic2' then
			mechanic2 = mechanic2 + 1
		elseif v.job == 'gendarme' then
			gendarme = gendarme + 1
		elseif v.job == 'transito' then
			transito = transito + 1
		end		
		--[[
		elseif v.job == 'portuario' then
			portuario = portuario + 1
		elseif v.job == 'bus' then
			bus = bus + 1
		elseif v.job == 'pizzero' then
			pizzero = pizzero + 1
		elseif v.job == 'miner' then
			miner = miner + 1
		elseif v.job == 'pollero' then
			pollero = pollero + 1
		elseif v.job == 'fueler' then
			fueler = fueler + 1
		elseif v.job == 'lumberjack' then
			lumberjack = lumberjack + 1
		elseif v.job == 'trucker' then
			trucker = trucker + 1
		elseif v.job == 'garbage' then
			garbage = garbage + 1	
		elseif v.job == 'fisherman' then
			fisherman = fisherman + 1
		elseif v.job == 'mlibre' then
			mlibre = mlibre + 1
		elseif v.job == 'farmer' then
			farmer = farmer + 1	
		elseif v.job == 'edesur' then
			edesur = edesur + 1
		elseif v.job == 'unemployed' then
			unemployed = unemployed + 1	
		]]--		
	end

	if num == 1 then
		table.insert(formattedPlayerList, '</tr>')
	end

	SendNUIMessage({
		action  = 'updatePlayerList',
		players = table.concat(formattedPlayerList)
	})

	SendNUIMessage({
		action = 'updatePlayerJobs',
		jobs   = { mechanic4 = mechanic4, gendarme = gendarme, mechanic3 = mechanic3, mechanic2 = mechanic2, seguridad = seguridad, judicial = judicial, ems = ems, police = police, police2 = police2, fbi = fbi, taxi = taxi, mechanic = mechanic, telefe = telefe, transito = transito, player_count = players}
	})
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, Keys['F10']) and IsInputDisabled(0) then
			ToggleScoreBoard()
			Citizen.Wait(200)

		-- D-pad up on controllers works, too!
		elseif IsControlJustReleased(0, 172) and not IsInputDisabled(0) then
			ToggleScoreBoard()
			Citizen.Wait(200)
		end
	end
end)

RegisterCommand('scoreboard', function()
	ToggleScoreBoard()
	Citizen.Wait(200)
end, false)

-- Close scoreboard when game is paused
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300)

		if IsPauseMenuActive() and not IsPaused then
			IsPaused = true
			SendNUIMessage({
				action  = 'close'
			})
		elseif not IsPauseMenuActive() and IsPaused then
			IsPaused = false
		end
	end
end)

function ToggleScoreBoard()
	SendNUIMessage({
		action = 'toggle'
	})
end

Citizen.CreateThread(function()
	local playMinute, playHour = 0, 0

	while true do
		Citizen.Wait(1000 * 60) -- every minute
		playMinute = playMinute + 1
	
		if playMinute == 60 then
			playMinute = 0
			playHour = playHour + 1
		end

		SendNUIMessage({
			action = 'updateServerInfo',
			playTime = string.format("%02dh %02dm", playHour, playMinute)
		})
	end
end)
