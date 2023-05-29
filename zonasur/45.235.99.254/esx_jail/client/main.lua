local isInJail, unjail, isInJail2 = false, false, false
local jailTime, fastTimer = 0, 0

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_jail:jailPlayer')
AddEventHandler('esx_jail:jailPlayer', function(_jailTime)
	jailTime = _jailTime

	local playerPed = PlayerPedId()

	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.male)
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.female)
		end
	end)

	SetPedArmour(playerPed, 0)
	ESX.Game.Teleport(playerPed, Config.JailLocation)
	isInJail, unjail = true, false
	
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
	
	while not unjail do
		playerPed = PlayerPedId()

		RemoveAllPedWeapons(playerPed, true)
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
	isInJail = false
	
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


RegisterNetEvent('esx_jail:jail_celda')
AddEventHandler('esx_jail:jail_celda', function(_jailTime, celda)
	jailTime = _jailTime

	local playerPed = PlayerPedId()

	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.male)
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.female)
		end
	end)

	SetPedArmour(playerPed, 0)
	ESX.Game.Teleport(playerPed, Config.Jail_Celda[celda])
	isInJail2, unjail = true, false
	exports["rp-radio"]:SetRadioOff()
	
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

	while not unjail do
		playerPed = PlayerPedId()

		RemoveAllPedWeapons(playerPed, true)
		if IsPedInAnyVehicle(playerPed, false) then
			ClearPedTasksImmediately(playerPed)
		end

		Citizen.Wait(10000)

		-- Is the player trying to escape?
		if #(GetEntityCoords(playerPed) - Config.Jail_Celda[celda]) > 10 then
			ESX.Game.Teleport(playerPed, Config.Jail_Celda[celda])
			TriggerEvent('chat:addMessage', {args = {'POLICIA:', _U('escape_attempt')}, color = {147, 196, 109}})
		end
	end

	ESX.Game.Teleport(playerPed, Config.JailBlip2)
	isInJail2 = false
	
	SetEntityInvincible(GetPlayerPed(-1), false)
	SetPlayerInvincible(PlayerId(), false)
	SetPedCanRagdoll(GetPlayerPed(-1), true)
	ClearPedLastWeaponDamage(GetPlayerPed(-1))
	SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
	SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), true)
	SetEntityCanBeDamaged(GetPlayerPed(-1), true)
	
	--exports["rp-radio"]:SetRadioOn()
	
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if jailTime > 0 and isInJail then
			if fastTimer < 0 then
				fastTimer = jailTime
			end
			DisableControlAction(0, 288, true)  -- Disable Teleefono
			DisableControlAction(0, 19, true) --DISABLE ALT PARA RADIO
			DisableControlAction(0, 21, true) --DISABLE SHIFT IZQUIERDO PARA SACAR RADIO
			draw2dText(_U('remaining_msg', ESX.Math.Round(fastTimer / 60)), 0.375, 0.955)
			fastTimer = fastTimer - 0.01
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if jailTime > 0 and isInJail2 then
			if fastTimer < 0 then
				fastTimer = jailTime
			end
			DisableControlAction(0, 288, true)  -- Disable Teleefono
			DisableControlAction(0, 19, true) --DISABLE ALT PARA RADIO
			DisableControlAction(0, 21, true) --DISABLE SHIFT IZQUIERDO PARA SACAR RADIO
			draw2dText(_U('remaining_msg2', ESX.Math.Round(fastTimer / 60)), 0.375, 0.955)
			fastTimer = fastTimer - 0.01
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_jail:unjailPlayer')
AddEventHandler('esx_jail:unjailPlayer', function()
	unjail, jailTime, fastTimer = true, 0, 0
end)

RegisterNetEvent('esx_jail:unjail_celda')
AddEventHandler('esx_jail:unjail_celda', function()
	unjail, jailTime, fastTimer = true, 0, 0
end)

AddEventHandler('playerSpawned', function(spawn)
	if isInJail then
		ESX.Game.Teleport(PlayerPedId(), Config.JailLocation)
	elseif isInJail2 then
		ESX.Game.Teleport(PlayerPedId(), Config.Jail_Celda[5])
	end
end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.JailBlip)

	SetBlipSprite(blip, 188)
	SetBlipScale (blip, 1.9)
	SetBlipColour(blip, 6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(_U('blip_name'))
	EndTextCommandSetBlipName(blip)
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