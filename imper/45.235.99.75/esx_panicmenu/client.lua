ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(5)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)
  

RegisterNetEvent('esx_panicmenu:panicShout')
AddEventHandler('esx_panicmenu:panicShout', function(targetCoords, xPlayer, name)
	if string.match(PlayerData.job.name, xPlayer.job.name) or string.match(xPlayer.job.name, PlayerData.job.name) then
		local alpha = 250
		--local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 50.0)
		local gunshotBlip1 = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		ESX.ShowNotification("~s~[~b~AYUDA~s~] ~r~" .. name .. "~s~ envió una señal de pánico")

		SetBlipSprite(gunshotBlip1, 161)
		SetBlipScale(gunshotBlip1, 2.0)
		SetBlipColour(gunshotBlip1, 3)
		SetBlipRoute(gunshotBlip1, true)
		SetBlipRouteColour(gunshotBlip1, 3)
		SetBlipDisplay(gunshotBlip1, 2)

		PlaySound(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 0, 0, 1)
		Citizen.Wait(400)
		PlaySound(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 0, 0, 1)
		Citizen.Wait(400)
		PlaySound(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 0, 0, 1)
		Citizen.Wait(400)
		PlaySound(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 0, 0, 1)
		Citizen.Wait(400)
		PlaySound(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 0, 0, 1)
		Citizen.Wait(400)
		PlaySound(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(200)
			alpha = alpha - 1
			if alpha == 0 then
				RemoveBlip(gunshotBlip1)
				return
			end
		end
	end
end)
