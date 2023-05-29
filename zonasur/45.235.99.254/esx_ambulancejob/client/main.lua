local firstSpawn, PlayerLoaded = true, false

isDead = false
ESX = nil
mododm = false

PlayerData              = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	PlayerData = ESX.GetPlayerData()
end)

--[[
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)
]]--

RegisterNetEvent('esx_ambulancejob:dead')
AddEventHandler('esx_ambulancejob:dead', function(bool)
	isDead = bool	
end)

function SetDM(bool)
	mododm = bool
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

AddEventHandler('esx:onPlayerSpawn', function()
	isDead = false
	--exports['qs-smartphone']:canUsePhone(true)
	if firstSpawn then
		firstSpawn = false
		TriggerServerEvent('esx_policejob:setNivel')
		if Config.AntiCombatLog then
			while not PlayerLoaded do
				Citizen.Wait(1000)
			end
			
			
			ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(shouldDie)
				if shouldDie then
					ESX.ShowNotification(_U('combatlog_message'))
					--TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
					RemoveItemsAfterRPDeath()
				end
			end)
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Hospitals) do
		local blip = AddBlipForCoord(v.Blip.coords)

		SetBlipSprite(blip, v.Blip.sprite)
		SetBlipScale(blip, v.Blip.scale)
		SetBlipColour(blip, v.Blip.color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('blip_hospital'))
		EndTextCommandSetBlipName(blip)
	end
end)

-- Disable most inputs when dead
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if isDead then
			DisableAllControlActions(0)
			EnableControlAction(0, 81, true)
			EnableControlAction(0, 166, true)
			EnableControlAction(0, 18, true)
			EnableControlAction(0, 172, true)
			EnableControlAction(0, 173, true)
			EnableControlAction(0, 177, true)
			EnableControlAction(0, 188, true)
			EnableControlAction(0, 47, true)
			EnableControlAction(0, 245, true)
			EnableControlAction(0, 38, true)
			EnableControlAction(0, 54, true)
			EnableControlAction(0, 57, true)
		else
			Citizen.Wait(500)
		end
	end
end)

function OnPlayerDeath()
	isDead = true
	--exports['qs-smartphone']:canUsePhone(false)
	ESX.UI.Menu.CloseAll()
	--TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)	
	StartDeathTimer()
	StartDistressSignal()

	StartScreenEffect('DeathFailOut', -1, false)
end

RegisterNetEvent('esx_ambulancejob:removeScreen')
AddEventHandler('esx_ambulancejob:removeScreen', function()
	exports["allcity_deadscreen"]:SendNUIMessage({ setDisplay = false })	
end)

RegisterNetEvent('esx_ambulancejob:useItem')
AddEventHandler('esx_ambulancejob:useItem', function(itemName)
	ESX.UI.Menu.CloseAll()

	if itemName == 'medikit' then
		local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO better animations
		local playerPed = PlayerPedId()

		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

			Citizen.Wait(500)
			while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
				Citizen.Wait(0)
				DisableAllControlActions(0)
			end

			TriggerEvent('esx_ambulancejob:heal', 'big', true)
			ESX.ShowNotification(_U('used_medikit'))
		end)

	elseif itemName == 'bandage' then
		local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO better animations
		local playerPed = PlayerPedId()

		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

			Citizen.Wait(500)
			while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
				Citizen.Wait(0)
				DisableAllControlActions(0)
			end

			TriggerEvent('esx_ambulancejob:heal', 'small', true)
			ESX.ShowNotification(_U('used_bandage'))
		end)
	end
end)

function StartDistressSignal()
	Citizen.CreateThread(function()
		local timer = Config.BleedoutTimer

		while timer > 0 and isDead do
			Citizen.Wait(0)
			timer = timer - 30

			SetTextFont(4)
			SetTextScale(0.45, 0.45)
			SetTextColour(185, 185, 185, 255)
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			BeginTextCommandDisplayText('STRING')
			AddTextComponentSubstringPlayerName(_U('distress_send'))
			EndTextCommandDisplayText(0.175, 0.805)

			if IsControlJustReleased(0, 47) then
				SendDistressSignal()
				break
			end
		end
	end)
end

function SendDistressSignal()

	local playerPed = PlayerPedId()
	local PedPosition = GetEntityCoords(playerPed)
	--local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(PedPosition)
	
	local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }

	ESX.ShowNotification(_U('distress_sent'))
	TriggerServerEvent('esx_ambulancejob:onPlayerDistress', x, y, z)
    TriggerServerEvent('esx_addons_gcphone:startCall', 'ambulance', _U('distress_message'), PlayerCoords, {

		PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
	})
end

RegisterNetEvent('esx_ambulancejob:setBlip')
AddEventHandler('esx_ambulancejob:setBlip', function(x, y, z)
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	local blips = AddBlipForCoord(x, y, z)
	SetBlipSprite(blips, 303)
	SetBlipScale(blips, 0.8)
	SetBlipColour(blips, 1)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Auxilio')
    EndTextCommandSetBlipName(blips)
	Wait(60000)
	RemoveBlip(blips)
end)

function DrawGenericTextThisFrame()
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
end

function secondsToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0

	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format('%02.f', math.floor(seconds / 3600))
		local mins = string.format('%02.f', math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format('%02.f', math.floor(seconds - hours * 3600 - mins * 60))

		return mins, secs
	end
end

function StartDeathTimer()
	local canPayFine = false

	if Config.EarlyRespawnFine then
		ESX.TriggerServerCallback('esx_ambulancejob:checkBalance', function(canPay)
			canPayFine = canPay
		end)
	end

	local earlySpawnTimer = ESX.Math.Round(Config.EarlyRespawnTimer / 1000)
	local bleedoutTimer = ESX.Math.Round(Config.BleedoutTimer / 1000)

	Citizen.CreateThread(function()
		-- early respawn timer
		while earlySpawnTimer > 0 and isDead do
			Citizen.Wait(1000)

			if earlySpawnTimer >= 1 then
				earlySpawnTimer = earlySpawnTimer - 1
			end
		end

		-- bleedout timer
		while bleedoutTimer > 0 and isDead do
			Citizen.Wait(1000)

			if bleedoutTimer >= 1 then
				bleedoutTimer = bleedoutTimer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		local text
		local timeHeld = 0
		-- early respawn timer
		while earlySpawnTimer > 0 and isDead do
			Citizen.Wait(0)
			text = _U('respawn_available_in', secondsToClock(earlySpawnTimer))

			DrawGenericTextThisFrame()

			SetTextEntry('STRING')
			AddTextComponentString(text)
			DrawText(0.5, 0.8)
		end

		-- bleedout timer
		while bleedoutTimer > 0 and isDead do
			Citizen.Wait(0)
			text = _U('respawn_bleedout_in', secondsToClock(bleedoutTimer))

			if not Config.EarlyRespawnFine then
				text = text .. _U('respawn_bleedout_prompt')

				if IsControlPressed(0, 38) and timeHeld > 60 then
					--DropItemsAfterRPDeath()
					RemoveItemsAfterRPDeath()
					break
				end
			elseif Config.EarlyRespawnFine and canPayFine then
				text = text .. _U('respawn_bleedout_fine', ESX.Math.GroupDigits(Config.EarlyRespawnFineAmount))

				if IsControlPressed(0, 38) and timeHeld > 60 then
					TriggerServerEvent('esx_ambulancejob:payFine')
					RemoveItemsAfterRPDeath()
					break
				end
			end
			
			if IsControlPressed(0, 38) and earlySpawnTimer == 0 then
				timeHeld = timeHeld + 1
			else
				timeHeld = 0
			end
		
			DrawGenericTextThisFrame()

			SetTextEntry('STRING')
			AddTextComponentString(text)
			DrawText(0.5, 0.8)
		end

		if bleedoutTimer < 1 and isDead then
			RemoveItemsAfterRPDeath()
		end
	end)
end

function DropItemsAfterRPDeath()
	ExecuteCommand('do Se veria un camillero llevarse al sujeto al hospital mas cercano.')
	--TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
	TriggerServerEvent('esx_ambulancejob:DropItemsAfterRPDeath')
	
	Citizen.CreateThread(function()
		local coords = GetEntityCoords(PlayerPedId())	
		local formattedCoords = {}
		local heading = nil
		
		if PlayerData.job.name == "police" then
			formattedCoords = {
					x = Config.RespawnPointPolice.coords.x,
					y = Config.RespawnPointPolice.coords.y,
					z = Config.RespawnPointPolice.coords.z
				}
			heading = Config.RespawnPointPolice.heading
		else
		
			local distance1 = Vdist(coords.x, coords.y, coords.z, Config.RespawnPoint1.coords.x, Config.RespawnPoint1.coords.y, Config.RespawnPoint1.coords.z)
			local distance2 = Vdist(coords.x, coords.y, coords.z, Config.RespawnPoint2.coords.x, Config.RespawnPoint2.coords.y, Config.RespawnPoint2.coords.z)
			local distance3 = Vdist(coords.x, coords.y, coords.z, Config.RespawnPoint3.coords.x, Config.RespawnPoint3.coords.y, Config.RespawnPoint3.coords.z)
			
			if distance1 < distance2 and distance1 < distance3 then
				formattedCoords = {
					x = Config.RespawnPoint1.coords.x,
					y = Config.RespawnPoint1.coords.y,
					z = Config.RespawnPoint1.coords.z
				}
				heading = Config.RespawnPoint1.heading
			elseif distance2 < distance1 and distance2 < distance3 then
				formattedCoords = {
					x = Config.RespawnPoint2.coords.x,
					y = Config.RespawnPoint2.coords.y,
					z = Config.RespawnPoint2.coords.z
				}
				heading = Config.RespawnPoint2.heading
			elseif distance3 < distance1 and distance3 < distance2 then
				formattedCoords = {
					x = Config.RespawnPoint3.coords.x,
					y = Config.RespawnPoint3.coords.y,
					z = Config.RespawnPoint3.coords.z
				}
				heading = Config.RespawnPoint3.heading
			end
		
		end
		
		ESX.SetPlayerData('loadout', {})
		RespawnPed(PlayerPedId(), formattedCoords, heading)
		StopScreenEffect('DeathFailOut')
	end)
end

function RemoveItemsAfterRPDeath()
	ExecuteCommand('do Se veria un camillero llevarse al sujeto al hospital mas cercano.')
	--TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)

	Citizen.CreateThread(function()
		--DoScreenFadeOut(800)
		
		--while not IsScreenFadedOut() do
			--Citizen.Wait(10)
		--end
		
		ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()
			local coords = GetEntityCoords(PlayerPedId())	
			local formattedCoords = {}
			local heading = nil
			
			if PlayerData.job.name == "police" then
				formattedCoords = {
					x = Config.RespawnPointPolice.coords.x,
					y = Config.RespawnPointPolice.coords.y,
					z = Config.RespawnPointPolice.coords.z
				}
				heading = Config.RespawnPointPolice.heading
			else
				local distance1 = Vdist(coords.x, coords.y, coords.z, Config.RespawnPoint1.coords.x, Config.RespawnPoint1.coords.y, Config.RespawnPoint1.coords.z)
				local distance2 = Vdist(coords.x, coords.y, coords.z, Config.RespawnPoint2.coords.x, Config.RespawnPoint2.coords.y, Config.RespawnPoint2.coords.z)
				local distance3 = Vdist(coords.x, coords.y, coords.z, Config.RespawnPoint3.coords.x, Config.RespawnPoint3.coords.y, Config.RespawnPoint3.coords.z)
			
				if distance1 < distance2 and distance1 < distance3 then
					formattedCoords = {
						x = Config.RespawnPoint1.coords.x,
						y = Config.RespawnPoint1.coords.y,
						z = Config.RespawnPoint1.coords.z
					}
					heading = Config.RespawnPoint1.heading
				elseif distance2 < distance1 and distance2 < distance3 then
					formattedCoords = {
						x = Config.RespawnPoint2.coords.x,
						y = Config.RespawnPoint2.coords.y,
						z = Config.RespawnPoint2.coords.z
					}
					heading = Config.RespawnPoint2.heading
				elseif distance3 < distance1 and distance3 < distance2 then
					formattedCoords = {
						x = Config.RespawnPoint3.coords.x,
						y = Config.RespawnPoint3.coords.y,
						z = Config.RespawnPoint3.coords.z
					}
					heading = Config.RespawnPoint3.heading
				end
			end
			
			ESX.SetPlayerData('loadout', {})
			RespawnPed(PlayerPedId(), formattedCoords, heading)

			StopScreenEffect('DeathFailOut')
			--DoScreenFadeIn(800)
		end)
	end)
end

function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)

	TriggerServerEvent('esx:onPlayerSpawn')
	TriggerEvent('esx:onPlayerSpawn')
	TriggerEvent('playerSpawned') -- compatibility with old scripts, will be removed soon
end

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'SAME',
		number     = 'ambulance',
		base64Icon = 'data:image/png;base64,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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	--local mododm = exports["DM3"]:GetDM()
	if not mododm then
		OnPlayerDeath()
	end	
end)

RegisterNetEvent('esx_ambulancejob:revive_zs')
AddEventHandler('esx_ambulancejob:revive_zs', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	--TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
	
	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = ESX.Math.Round(coords.x, 1),
		y = ESX.Math.Round(coords.y, 1),
		z = ESX.Math.Round(coords.z, 1)
	}

	RespawnPed(playerPed, formattedCoords, 0.0)

	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
end)

-- Load unloaded IPLs
if Config.LoadIpl then
	RequestIpl('Coroner_Int_on') -- Morgue
end
