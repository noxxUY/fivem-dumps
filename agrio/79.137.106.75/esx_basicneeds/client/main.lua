ESX          = nil
local IsDead = false
local IsAnimated = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end
end)

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
	TriggerEvent('esx_status:set', 'stress', 1000)

end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)
	TriggerEvent('esx_status:set', 'stress', 1000)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function()

	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

    TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#CFAD0F', function(status)
    	return false
    end, function(status)
    	status.remove(250)
    end)
    
    TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0C98F1', function(status)
    	return false
    end, function(status)
    	status.remove(100)
    end)
	
	Citizen.CreateThread(function()

		while true do

			Wait(3000)

			local playerPed  = GetPlayerPed(-1)
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				
				if status.val == 0 then

					if prevHealth <= 150 then
						health = health - 2
					else
						health = health - 1
					end

				end

			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				
				if status.val == 0 then

					if prevHealth <= 150 then
						health = health - 2
					else
						health = health - 1
					end

				end

			end)

			if health ~= prevHealth then
				SetEntityHealth(playerPed,  health)
			end

		end

	end)
local nosabeisprogramar = 2500
	Citizen.CreateThread(function()

		while true do

			Wait(nosabeisprogramar)

			local playerPed = GetPlayerPed(-1)
			
			if IsEntityDead(playerPed) and not IsDead then
				nosabeisprogramar= 5
				IsDead = true
			else
				nosabeisprogramar = 2500
			end

		end

	end)

end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)





RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
	if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_hotdog_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'prop_ecola_can'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onEatChocolate')
AddEventHandler('esx_basicneeds:onEatChocolate', function(prop_name)
if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'prop_choc_ego'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.035, 0.009, -30.0, -240.0, -120.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onEatSandwich')
AddEventHandler('esx_basicneeds:onEatSandwich', function(prop_name)
if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'prop_sandwich_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.03, -240.0, -180.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onEatChips')
AddEventHandler('esx_basicneeds:onEatChips', function(prop_name)
if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'v_ret_ml_chips4'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkBeer')
AddEventHandler('esx_basicneeds:onDrinkBeer', function(prop_name)
if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'prop_amb_beer_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.008, 0.03, 240.0, -60.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkWine')
AddEventHandler('esx_basicneeds:onDrinkWine', function(prop_name)
if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'prop_wine_bot_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.02, -0.3, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkVodka')
AddEventHandler('esx_basicneeds:onDrinkVodka', function(prop_name)
if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'prop_vodka_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.02, -0.3, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkWhisky')
AddEventHandler('esx_basicneeds:onDrinkWhisky', function(prop_name)
if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_whiskey_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.02, -0.2, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkMilk')
AddEventHandler('esx_basicneeds:onDrinkMilk', function(prop_name)
if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_milk_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, -0.009, -0.03, -0.1, -90.0, 270.0, -90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onEatCupCake')
AddEventHandler('esx_basicneeds:onEatCupCake', function(prop_name)
if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'ng_proc_food_ornge1a'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.045, 0.06, 45.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkCoffe')
AddEventHandler('esx_basicneeds:onDrinkCoffe', function(prop_name)
if (IsPedSwimmingUnderWater(GetPlayerPed(-1)) or IsPedSwimming(GetPlayerPed(-1))) then
		TriggerEvent('esx:showNotification', 'No puedes comer si estas en el agua!')
	  return
	  end
	if not IsAnimated then
		prop_name = prop_name or 'prop_fib_coffee'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.01, -0.03, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
				local playerPed = PlayerPedId()
				local maxHealth = GetEntityMaxHealth(playerPed)
							local health = GetEntityHealth(playerPed)
							local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
							--SetEntityHealth(playerPed, newHealth)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

--BONG 
local bongtomado = 0 
RegisterNetEvent('agrioneeds:bong')
AddEventHandler('agrioneeds:bong', function()
    
  if bongtomado >= 1 then
	ESX.ShowNotification("No puedes tomar varios bongs seguidos, debes esperar un tiempo para volver a consumir bong.")
  else
	bongtomado = bongtomado +1
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
   
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
	SetPedMoveRateOverride(PlayerId(),10.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
	--[[DEATH_FAIL_IN_EFFECT_SHAKE  
DRUNK_SHAKE  
FAMILY5_DRUG_TRIP_SHAKE  
HAND_SHAKE  
JOLT_SHAKE  
LARGE_EXPLOSION_SHAKE  
MEDIUM_EXPLOSION_SHAKE  
SMALL_EXPLOSION_SHAKE  
ROAD_VIBRATION_SHAKE  
SKY_DIVING_SHAKE  
VIBRATE_SHAKE  ]]--

	--StopScreenEffect("DrugsTrevorClownsFight")
	ShakeGameplayCam("VIBRATE_SHAKE", 3.0)
	StartScreenEffect("CamPushInFranklin",40000,true)
    Citizen.Wait(30000)
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
	local armor = GetPedArmour(GetPlayerPed(-1))
	SetPedArmour(PlayerPedId(), armor+10) 
	print("Dado chaleco bong:"..tostring(armor))

	local heal = GetEntityHealth(GetPlayerPed(-1))
	--SetEntityHealth(GetPlayerPed(-1), heal+50)
	local maxHealth = GetEntityMaxHealth(playerPed)
	local health = GetEntityHealth(playerPed)
	local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 24))
	SetEntityHealth(playerPed, newHealth)
							--SetEntityHealth(playerPed, newHealth)
	--SetPedArmour(PlayerPedId(), 10)
	--SetEntityHealth(GetPlayerPed(-1), 50)
  end
end)
--VAPE
local vapetomado = 0
local mariatomada = 0
Citizen.CreateThread(function()

	while true do
		Citizen.Wait(1000 * 60)
		if vapetomado >= 1 or bongtomado >= 1 or mariatomada >= 1 then
			vapetomado = 0
			mariatomada = 0
			bongtomado = 0
		end
	end
end)


RegisterNetEvent('agrioneeds:vape')
AddEventHandler('agrioneeds:vape', function()
  
  if vapetomado >= 1 then
	ESX.ShowNotification("No puedes tomar varios vapes seguidos, debes esperar un tiempo para volver a consumir vape.")
  else
	vapetomado = vapetomado +1
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
    
  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
  ShakeGameplayCam("VIBRATE_SHAKE", 2.0)
	StartScreenEffect("CamPushInTrevor",40000,true)
  Citizen.Wait(3000)
  ClearPedTasksImmediately(playerPed)
  SetPedMoveRateOverride(PlayerId(),10.0)
  SetRunSprintMultiplierForPlayer(PlayerId(),0.90)
  Citizen.Wait(30000)
  SetPedMoveRateOverride(PlayerId(),0.50)
  SetRunSprintMultiplierForPlayer(PlayerId(),0.90)
  local heal = GetEntityHealth(GetPlayerPed(-1))
	SetEntityHealth(GetPlayerPed(-1), heal+20)
	
	local armor = GetPedArmour(GetPlayerPed(-1))
	SetPedArmour(PlayerPedId(), armor+10) 
	print("Dado chaleco vape:"..tostring(armor))
	
  end
end)

--MARIA LEGAL

RegisterNetEvent('agrioneeds:marialegal')
AddEventHandler('agrioneeds:marialegal', function()
	if mariatomada >= 1 then
		ESX.ShowNotification("No puedes tomar varios vapes seguidos, debes esperar un tiempo para volver a consumir vape.")
	  else
		mariatomada = mariatomada +1
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
    
  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
  ShakeGameplayCam("VIBRATE_SHAKE", 3.0)
  StartScreenEffect("CamPushInFranklin",40000,true)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
	local heal = GetEntityHealth(GetPlayerPed(-1))
	--local newHeal = SetEntityHealth(GetPlayerPed(-1), heal+10)
	--local armor = GetPedArmour(GetPlayerPed(-1))
	--local newArmor = SetPedArmour(PlayerPedId(), armor+10) 
	--SetPedArmour(PlayerPedId(), 10)
	  end

end)



-- Cigarett 
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)
--local ya = false
RegisterNetEvent('esx_cigarett:startSmoke')
AddEventHandler('esx_cigarett:startSmoke', function(source)
	--ya = true
	--print('ya true')
	ESX.ShowNotification('Has prendido tu cigarro y te lo estas fumando')
	SmokeAnimation()
	Wait(30000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	ESX.ShowNotification('Te estabas fumando la colilla y has tirado el cigarro al suelo')
end)

function SmokeAnimation()
	local playerPed = GetPlayerPed(-1)
	
	Citizen.CreateThread(function()
		--print(ya)
		--while ya do
		TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING", 0, true)
		--Wait(30000)
		--ya = false
		--print('ya en false')
		--ClearPedTasksImmediately(GetPlayerPed(-1))
		--end
		--print(ya)    
	end)
end

-- Optionalneeds
function Drunk(level, start)
  
  Citizen.CreateThread(function()
     local playerPed = GetPlayerPed(-1)
     if start then
      DoScreenFadeOut(800)
      Wait(1000)
    end
     if level == 0 then
       RequestAnimSet("move_m@drunk@slightlydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Citizen.Wait(0)
      end
       SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
     elseif level == 1 then
       RequestAnimSet("move_m@drunk@moderatedrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
        Citizen.Wait(0)
      end
       SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
     elseif level == 2 then
       RequestAnimSet("move_m@drunk@verydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
        Citizen.Wait(0)
      end
       SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)
     end
     SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedIsDrunk(playerPed, true)
     if start then
      DoScreenFadeIn(800)
    end
   end)
 end
 function Reality()
   Citizen.CreateThread(function()
     local playerPed = GetPlayerPed(-1)
     DoScreenFadeOut(800)
    Wait(1000)
     ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
     DoScreenFadeIn(800)
   end)
 end
 AddEventHandler('esx_status:loaded', function(status)
   TriggerEvent('esx_status:registerStatus', 'drunk', 0, '#8F15A5', --roxo
    function(status)
      if status.val > 0 then
        return true
      else
        return false
      end
    end,
    function(status)
      status.remove(1500)
    end
  )
  local tmptawitdrun = 3500
 	Citizen.CreateThread(function()
 		while true do
 			Wait(tmptawitdrun)
 			TriggerEvent('esx_status:getStatus', 'drunk', function(status)
				
				if status.val > 0 then
					tmptawitdrun = 1000
          local start = true
           if IsAlreadyDrunk then
            start = false
          end
           local level = 0
           if status.val <= 250000 then
            level = 0
          elseif status.val <= 500000 then
            level = 1
          else
            level = 2
          end
           if level ~= DrunkLevel then
            Drunk(level, start)
          end
           IsAlreadyDrunk = true
          DrunkLevel     = level
		else
			tmptawitdrun = 3500
				end
 				if status.val == 0 then
          
          if IsAlreadyDrunk then
            Reality()
          end
           IsAlreadyDrunk = false
          DrunkLevel     = -1
 				end
 			end)
 		end
 	end)
 end)
