local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168,["F11"] = 344, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local panic = false

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(1)
-- 		if ESX.PlayerData.job.name == Config.PoliceName then
-- 			if not panic and IsControlJustPressed(1, Config.PanicButton) then
-- 				panic = true
-- 				local plyPos = GetEntityCoords(PlayerPedId(),  true)
-- 				local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
-- 				local street1 = GetStreetNameFromHashKey(s1)
-- 				local player = GetPlayerPed(PlayerId())
-- 				TriggerServerEvent('gna_panico:server:PanicUrgente', player, street1)
-- 				TriggerServerEvent('gna_panico:server:BlipUrgente', plyPos.x, plyPos.y, plyPos.z)
-- 			end
-- 		else
-- 			Citizen.Wait(500)
-- 		end
-- 	end
-- end)


RegisterNetEvent('gna_panico:client:PanicUrgente')
AddEventHandler('gna_panico:client:PanicUrgente', function(player, s1, s2)
	if ESX.PlayerData.job.name == Config.PoliceName then
			local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(player)))
			ESX.ShowAdvancedNotification('BOTÓN DE PÁNICO', '~r~Alerta Urgente', ' Un oficial está en peligro. ~g~' ..s1, mugshotStr, 0,210)
			UnregisterPedheadshot(mugshot)
			PlaySound(-1, "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
	end
end)

RegisterNetEvent('gna_panico:client:BlipUrgente')
AddEventHandler('gna_panico:client:BlipUrgente', function(tx, ty, tz)
	if ESX.PlayerData.job.name == Config.PoliceName then
	local transT = 250
	local Blip = AddBlipForCoord(tx, ty, tz)
	SetBlipSprite(Blip,  161)
	SetBlipColour(Blip,  1)
	SetBlipScale(Blip , 1.5)
	SetBlipAlpha(Blip,  transT)
	SetBlipAsShortRange(Blip,  false)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(_U('panicbuttonblip'))
	EndTextCommandSetBlipName(Blip)
	PulseBlip(Blip)
	while transT ~= 0 do
		Wait(Config.blipTime * 4)
		transT = transT - 1
		SetBlipAlpha(Blip,  transT)
			if transT == 0 then
				SetBlipSprite(Blip,  2)
				panic = false
				return
			end
		end
	end
end)

---------------------------------------------------------------------------------
------------------------------ IMPORTANTE ---------------------------------------
---------------------------------------------------------------------------------

RegisterNetEvent('gna_panico:client:PanicImportante')
AddEventHandler('gna_panico:client:PanicImportante', function(player, s1, s2)
	if ESX.PlayerData.job.name == Config.PoliceName then
			local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(player)))
			ESX.ShowAdvancedNotification('BOTÓN DE PÁNICO', '~y~Alerta Importante', ' Un oficial está en peligro. ~g~' ..s1, mugshotStr, 4)
			UnregisterPedheadshot(mugshot)
			PlaySound(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", 0, 0, 1)
			Citizen.Wait(200)
			PlaySound(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", 0, 0, 1)
	end
end)

RegisterNetEvent('gna_panico:client:BlipImportante')
AddEventHandler('gna_panico:client:BlipImportante', function(tx, ty, tz)
	if ESX.PlayerData.job.name == Config.PoliceName then
	local transT = 250
	local Blip = AddBlipForCoord(tx, ty, tz)
	SetBlipSprite(Blip,  161)
	SetBlipColour(Blip,  5)
	SetBlipScale(Blip , 1.5)
	SetBlipAlpha(Blip,  transT)
	SetBlipAsShortRange(Blip,  false)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(_U('panicbuttonblip'))
	EndTextCommandSetBlipName(Blip)
	PulseBlip(Blip)
	while transT ~= 0 do
		Wait(Config.blipTime * 4)
		transT = transT - 1
		SetBlipAlpha(Blip,  transT)
			if transT == 0 then
				SetBlipSprite(Blip,  2)
				panic = false
				return
			end
		end
	end
end)

---------------------------------------------------------------------------------
------------------------------ L E V E ------------------------------------------
---------------------------------------------------------------------------------

RegisterNetEvent('gna_panico:client:PanicLeve')
AddEventHandler('gna_panico:client:PanicLeve', function(player, s1, s2)
	if ESX.PlayerData.job.name == Config.PoliceName then
			local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(player)))
			ESX.ShowAdvancedNotification('BOTÓN DE PÁNICO', '~g~Alerta Leve', ' Un oficial está en peligro. ~g~' ..s1, mugshotStr, 4)
			UnregisterPedheadshot(mugshot)
			PlaySound(-1, "TENNIS_MATCH_POINT", "HUD_AWARDS", 0, 0, 1)
	end
end)

RegisterNetEvent('gna_panico:client:BlipLeve')
AddEventHandler('gna_panico:client:BlipLeve', function(tx, ty, tz)
	if ESX.PlayerData.job.name == Config.PoliceName then
	local transT = 250
	local Blip = AddBlipForCoord(tx, ty, tz)
	SetBlipSprite(Blip,  161)
	SetBlipColour(Blip,  2)
	SetBlipScale(Blip , 1.5)
	SetBlipAlpha(Blip,  transT)
	SetBlipAsShortRange(Blip,  false)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(_U('panicbuttonblip'))
	EndTextCommandSetBlipName(Blip)
	PulseBlip(Blip)
	while transT ~= 0 do
		Wait(Config.blipTime * 4)
		transT = transT - 1
		SetBlipAlpha(Blip,  transT)
			if transT == 0 then
				SetBlipSprite(Blip,  2)
				panic = false
				return
			end
		end
	end
end)

---------------------------------------------------------------------------------
------------------------------ S E R V I C I O ----------------------------------
---------------------------------------------------------------------------------

 RegisterNetEvent('gna_panico:client:EntroServ')
 AddEventHandler('gna_panico:client:EntroServ', function(player)
 	if ESX.PlayerData.job.name == Config.PoliceName then
 		--ESX.TriggerServerCallback('esx_policejob:obtengoNombre', function(data)
 			TriggerEvent('skinchanger:getSkin', function(skin)
 				if skin.sex == 0 then
 					local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
 					--ESX.ShowAdvancedNotification('NOTIFICACIÓN P.F.A', '~g~Entrada en servicio', 'El oficial ~b~'..data.firstname..' '..data.lastname..'~w~ entró en servicio.', mugshotStr, 4)
					 ESX.ShowAdvancedNotification('NOTIFICACIÓN P.F.A', '~g~Entrada en servicio', 'El oficial ~b~'..GetPlayerName(GetPlayerFromServerId(player))..'~w~ entró en servicio.', mugshotStr, 4)
 					UnregisterPedheadshot(mugshot)
 					PlaySound(-1, "Kill_List_Counter", "GTAO_FM_Events_Soundset", 0, 0, 1)
 				else
 					local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
 					--ESX.ShowAdvancedNotification('NOTIFICACIÓN P.F.A', '~g~Entrada en servicio', 'La oficial ~b~'..data.firstname..' '..data.lastname..'~w~ entró en servicio.', mugshotStr, 4)
					 ESX.ShowAdvancedNotification('NOTIFICACIÓN P.F.A', '~g~Entrada en servicio', 'La oficial ~b~'..GetPlayerName(GetPlayerFromServerId(player))..'~w~ entró en servicio.', mugshotStr, 4)
 					UnregisterPedheadshot(mugshot)
 					PlaySound(-1, "Kill_List_Counter", "GTAO_FM_Events_Soundset", 0, 0, 1)
 				end
 			end)
 		--end)
 	end
 end)

-- RegisterNetEvent('gna_panico:client:EntroServ')
-- AddEventHandler('gna_panico:client:EntroServ', function(player)
-- 	if ESX.PlayerData.job.name == Config.PoliceName then
-- 		ESX.TriggerServerCallback('gna_panico:obtengoNombre', function(data)
-- 			local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(player)))
-- 			ESX.ShowAdvancedNotification('NOTIFICACIÓN P.F.A', '~g~Entrada en servicio', 'El oficial ~b~'..GetPlayerName(GetPlayerFromServerId(player))..'~w~ entró en servicio.', mugshotStr, 4)
-- 			UnregisterPedheadshot(mugshot)
-- 			PlaySound(-1, "Kill_List_Counter", "GTAO_FM_Events_Soundset", 0, 0, 1)
-- 		end)
-- 	end
-- end)

RegisterNetEvent('gna_panico:client:SalgoServ')
AddEventHandler('gna_panico:client:SalgoServ', function(player)
	if ESX.PlayerData.job.name == Config.PoliceName then
		--ESX.TriggerServerCallback('gna_panico:obtengoNombre', function(data)
			TriggerEvent('skinchanger:getSkin', function(skin)
				if skin.sex == 0 then
					local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
					--ESX.ShowAdvancedNotification('NOTIFICACIÓN P.F.A', '~r~Salida de servicio', 'El oficial ~b~'..data.firstname..' '..data.lastname..'~w~ salió de servicio.', mugshotStr, 4)
					ESX.ShowAdvancedNotification('NOTIFICACIÓN P.F.A', '~r~Salida de servicio', 'El oficial ~b~'..GetPlayerName(GetPlayerFromServerId(player))..'~w~ salió de servicio.', mugshotStr, 4)
					UnregisterPedheadshot(mugshot)
					PlaySound(-1, "Kill_List_Counter", "GTAO_FM_Events_Soundset", 0, 0, 1)
				else
					local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
					--ESX.ShowAdvancedNotification('NOTIFICACIÓN P.F.A', '~r~Salida de servicio', 'La oficial ~b~'..data.firstname..' '..data.lastname..'~w~ salió de servicio.', mugshotStr, 4)
					ESX.ShowAdvancedNotification('NOTIFICACIÓN P.F.A', '~r~Salida de servicio', 'La oficial ~b~'..GetPlayerName(GetPlayerFromServerId(player))..'~w~ salió de servicio.', mugshotStr, 4)
					UnregisterPedheadshot(mugshot)
					PlaySound(-1, "Kill_List_Counter", "GTAO_FM_Events_Soundset", 0, 0, 1)
				end
			end)
		--end)
	end
end)
