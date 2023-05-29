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
local debug = false
local disableC = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
	end
	Citizen.Wait(5000)
	ESX.TriggerServerCallback('snowiScoreGetStatus', function(disable)
		disableC = disable
		print(disable, disableC)
		if debug == true then
		print(json.encode(jugadores))
		end
	end)
	Citizen.Wait(10000)
	if disable == true then
		print('Scoreboard deshabilitada/en desarrollo. Check Thread ->', disable)
		return
	end
	ESX.TriggerServerCallback('snowiScoreGetInfo', function(jugadores)
		UpdatePlayerTable(jugadores)
		if debug == true then
		print(json.encode(jugadores))
		end
	end)
	
end)

Citizen.CreateThread(function()
	Citizen.Wait(500)
	--[[SendNUIMessage({
		action = 'updateServerInfo',
		maxPlayers = GetConvarInt('sv_maxclients', 256),
		uptime = 'unknown',
		playTime = '00h 00m'
	})--]]
	SendNUIMessage({
        action = 'updatedata',
        pid = 0,
        phone = 'Loading',
        job = 'Loading',
        name = 'Loading',
        bank = 'Loading',
        logo = "https://media.discordapp.net/attachments/1075573634292260944/1077488549575798824/LOGO_ANIMADO_2.gif",
        playerss = 'Loading',
        maxPlayers = 900,
    })
end)

RegisterNetEvent('snowiScoreActuClient', function(d)
if d == 'desactivo' then
disable = true
print('Disable to ->', disable)
elseif d == 'activo' then
	disable = false
	print('Disable to ->', disable)
end
end)

RegisterNetEvent('uptime:tick')
AddEventHandler('uptime:tick', function(uptime)
	SendNUIMessage({
		action = 'updateServerInfo',
		uptime = uptime
	})
end)

function UpdatePlayerTable(jugadores)
	local ems, police, taxi, mechanic, unemployed,players, sheriff,seguridadCivil = 0, 0, 0, 0, 0, 0,0,0
	for k,v in pairs(jugadores) do
		players = players + 1
		if v.t == 'amb' then
			ems = ems + 1
		elseif v.t == 'pol' then
			police = police + 1
		elseif v.t == 'taxi' then
			taxi = taxi + 1
		elseif v.t == 'mec' then
			mechanic = mechanic + 1
		elseif v.t == 'u' then
			unemployed = unemployed + 1
		elseif v.t == 's' then
			sheriff = sheriff + 1
		elseif v.t == 'segci' then
			seguridadCivil = seguridadCivil+1
		end
	end
	if debug == true then
		print(ems, police, taxi, mechanic, unemployed, players, sheriff)
	end
	--[[SendNUIMessage({
		action = 'updatePlayerJobs',
		jobs   = {ems = ems, police = police, taxi = taxi, mechanic = mechanic, unemployed = unemployed,sheriff = sheriff, seguridadCivil=seguridadCivil,player_count = players}
	})--]]
	players= math.floor(players+math.abs(players*0.50))
	SendNUIMessage({
		action = 'updatedatajob',
		mechanic = mechanic,
		police = police,
		sheriff = sheriff,
		sc = seguridadCivil,
		ambulance = ems,
		taxi = taxi,
		robos = {
			{order = 1 , label = 'FLEECA',          requieredCops = 3},
			{order = 2 , label = 'PACIFIC BANK',    requieredCops = 2},
			{order = 3 , label = 'VANGELICO',       requieredCops = 6},
			{order = 4 , label = 'STORE',           requieredCops = 3},
			{order = 5 , label = 'HUMANE LABS',     requieredCops = 4},
			{order = 6 , label = 'BOBCAT',          requieredCops = 5},
			{order = 7 , label = 'UNION',           requieredCops = 3},
			{order = 8 , label = 'YACHT',           requieredCops = 2},
			{order = 9 , label = 'VANT',            requieredCops = 1},
		}
		,
	})
	SendNUIMessage({
		action = 'updatedata',
		pid = GetPlayerServerId(GetPlayerPed(-1)),
		phone = "###",
		job = ESX.GetPlayerData().job.label,
		name = GetPlayerName(GetPlayerPed(-1)),
		bank =  ESX.GetPlayerData().accounts[1].money,
		logo = "https://media.discordapp.net/attachments/1075573634292260944/1077488549575798824/LOGO_ANIMADO_2.gif",
		playerss = players,
		maxPlayers = 900,
	})
end
local pressed = false
local ense = 0
RegisterCommand('scoreboardmenu', function() 
	if disableC == true then
		print('Scoreboard deshabilitada/en desarrollo. ->', disable)
		Citizen.Wait(2000)
	else
	print(ense)
	pressed = true
	ense = ense +1
	if ense == 2 then
		ense = 0
	end
	if ense == 1 then
	ESX.TriggerServerCallback('snowiScoreGetInfo', function(jugadores)
		UpdatePlayerTable(jugadores)
if debug == true then
	print(json.encode(jugadores))
end
	end)
	end
	ToggleScoreBoard()
	Citizen.Wait(500)
	pressed = false
end
end)
RegisterKeyMapping('scoreboardmenu', 'Mirar scoreboard', 'keyboard', 'DELETE' )

RegisterCommand('scoreDe', function()
if pressed == true then
	pressed = false
print('Pressed ->', pressed)
else
	print('Pressed Ya es falso que coño->', pressed)
end end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)

		if IsPauseMenuActive() and not IsPaused then
			IsPaused = true
			--[[SendNUIMessage({
				action  = 'close'
			})--]]
			SetNuiFocus(false, false)
			SendNUIMessage({action = 'hide'})
			
		elseif not IsPauseMenuActive() and IsPaused then
			IsPaused = false
		end
	end
end)
RegisterNUICallback("exit" , function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({action = 'hide'})
end)

function ToggleScoreBoard()
	--[[SendNUIMessage({
		action = 'toggle'
	})-]]
	SetNuiFocus(true, true) 
        SendNUIMessage({ action = 'show'})
        SendNUIMessage({ action = 'bottom'})
end
RegisterCommand('ScoreDebug', function()
if debug == true then
	debug = false
	print('Debug Snowi Score ->', debug)
else 
	debug = true
	print('Debug Snowi Score ->', debug)
end
end)
--[[Citizen.CreateThread(function()
	local playMinute, playHour = 0, 0

	while true do
		Citizen.Wait(1000 * 60)
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
--]]