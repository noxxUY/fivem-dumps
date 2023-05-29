local isInJailOOC, unjailOOC = false, false
local jailTimeOOC, fastTimerOOC = 0, 0

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_jailooc:jailPlayerOOC')
AddEventHandler('esx_jailooc:jailPlayerOOC', function(_jailTime)
	jailTimeOOC = _jailTime
	
	print(_jailTime)
	
	local playerPed = PlayerPedId()
	
	TriggerEvent('rp-radio:SetRadioOff')

	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.male)
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.female)
		end
	end)

	SetPedArmour(playerPed, 0)
	ESX.Game.Teleport(playerPed, Config.JailLocation)
	isInJailOOC, unjailOOC = true, false
	
	--Activamos GOD MODE
	SetEntityInvincible(GetPlayerPed(-1), true)
	SetPlayerInvincible(PlayerId(), true)
	SetPedCanRagdoll(GetPlayerPed(-1), false)
	ClearPedBloodDamage(GetPlayerPed(-1))
	ResetPedVisibleDamage(GetPlayerPed(-1))
	ClearPedLastWeaponDamage(GetPlayerPed(-1))
	SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
	SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
	SetEntityCanBeDamaged(GetPlayerPed(-1), false)

	while not unjailOOC do
		playerPed = PlayerPedId()

		--RemoveAllPedWeapons(playerPed, true)
		if IsPedInAnyVehicle(playerPed, false) then
			ClearPedTasksImmediately(playerPed)
		end

		Citizen.Wait(20000)

		-- Is the player trying to escape?
		if #(GetEntityCoords(playerPed) - Config.JailLocation) > 10 then
			ESX.Game.Teleport(playerPed, Config.JailLocation)
			TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
		end
	end

	ESX.Game.Teleport(playerPed, Config.JailBlip)
	isInJailOOC = false
	
	SetEntityInvincible(GetPlayerPed(-1), false)
	SetPlayerInvincible(PlayerId(), false)
	SetPedCanRagdoll(GetPlayerPed(-1), true)
	ClearPedLastWeaponDamage(GetPlayerPed(-1))
	SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
	SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), true)
	SetEntityCanBeDamaged(GetPlayerPed(-1), true)

	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if jailTimeOOC > 0 and isInJailOOC then
			if fastTimerOOC < 0 then
				fastTimerOOC = jailTimeOOC
			end

			draw2dText(_U('remaining_msg', ESX.Math.Round(fastTimerOOC / 60)), 0.375, 0.955)
			fastTimerOOC = fastTimerOOC - 0.01
			
			DisableControlAction(2, 19, true) -- Disable Radio 
			DisableControlAction(0, 21, true) --DISABLE SHIFT IZQUIERDO PARA SACAR RADIO
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_jailooc:unjailoocPlayer')
AddEventHandler('esx_jailooc:unjailoocPlayer', function()
	unjailOOC, jailTimeOOC, fastTimerOOC = true, 0, 0
end)

AddEventHandler('playerSpawned', function(spawn)
	if isInJailOOC then
		ESX.Game.Teleport(PlayerPedId(), Config.JailLocation)
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.male)
			else
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.female)
			end
		end)
	end
end)


function draw2dText(text, x, y)
	SetTextFont(4)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x, y)
end