local PlayerData = {}
local JobStarted = false
local Level = 1
local Pickaxe = 1
local Experience = 0
local haspickaxe = false
local NewPickaxe = true
local firsthelp = false
local Login = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
	if (Config.jobrequirement and (PlayerData.job ~= nil and PlayerData.job.name == Config.jobname)) then
		CreateBossBlip(true)
	elseif not Config.jobrequirement then
		CreateBossBlip(true)
	end
	Login = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	if (Config.jobrequirement and (PlayerData.job ~= nil and PlayerData.job.name == Config.jobname)) then
		CreateBossBlip(true)
	elseif not Config.jobrequirement then
		CreateBossBlip(true)
	else 
		CreateBossBlip(false)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if Login then
			ESX.TriggerServerCallback('dream-miner:getdatabase', function(exp, pickaxe)
				local i = #Config.Levels
				while true do
					if Config.Levels[i].exp <= exp then
						Level = i
						break
					end
					i = i - 1
					Citizen.Wait(0)
				end
				Pickaxe = pickaxe
			end, PlayerData)
			break
		end
	end
end)

function CreateBossBlip(type)
	if type then
		RemoveBlip(StartJobBlip)
		StartJobBlip = AddBlipForCoord(Config.miner['BossSpawn'].Pos.x, Config.miner['BossSpawn'].Pos.y, Config.miner['BossSpawn'].Pos.z)
		
		SetBlipSprite (StartJobBlip, 408)
		SetBlipDisplay(StartJobBlip, 4)
		SetBlipScale  (StartJobBlip, 0.8)
		SetBlipColour (StartJobBlip, 0)
		SetBlipAsShortRange(StartJobBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Mina')
		EndTextCommandSetBlipName(StartJobBlip)
	else
		RemoveBlip(StartJobBlip)
	end
end

Citizen.CreateThread(function()
	if not Config.jobrequirement then
		CreateBossBlip(true)
	end
	local ped_hash = GetHashKey(Config.miner['BossSpawn'].Type)
	RequestModel(ped_hash)
	while not HasModelLoaded(ped_hash) do
		Citizen.Wait(1)
	end	
	BossNPC = CreatePed(1, ped_hash, Config.miner['BossSpawn'].Pos.x, Config.miner['BossSpawn'].Pos.y, Config.miner['BossSpawn'].Pos.z-1, Config.miner['BossSpawn'].Pos.h, false, true)
	SetBlockingOfNonTemporaryEvents(BossNPC, true)
	SetPedDiesWhenInjured(BossNPC, false)
	SetPedCanPlayAmbientAnims(BossNPC, true)
	SetPedCanRagdollFromPlayerImpact(BossNPC, false)
	SetEntityInvincible(BossNPC, true)
	FreezeEntityPosition(BossNPC, true)


	local ped_hash = GetHashKey(Config.miner['Pickaxeplace'].Type)
	RequestModel(ped_hash)
	while not HasModelLoaded(ped_hash) do
		Citizen.Wait(1)
	end	
	PickaxeNPC = CreatePed(1, ped_hash, Config.miner['Pickaxeplace'].Pos.x, Config.miner['Pickaxeplace'].Pos.y, Config.miner['Pickaxeplace'].Pos.z-1, Config.miner['Pickaxeplace'].Pos.h, false, true)
	SetBlockingOfNonTemporaryEvents(PickaxeNPC, true)
	SetPedDiesWhenInjured(PickaxeNPC, false)
	SetPedCanPlayAmbientAnims(PickaxeNPC, true)
	SetPedCanRagdollFromPlayerImpact(PickaxeNPC, false)
	SetEntityInvincible(PickaxeNPC, true)
	FreezeEntityPosition(PickaxeNPC, true)

	PickaxeObjectNPC = CreateObject(GetHashKey('prop_tool_pickaxe'), Config.miner['Pickaxeplace'].Pos.x, Config.miner['Pickaxeplace'].Pos.y, Config.miner['Pickaxeplace'].Pos.z, true, true, true)
	SetEntityCollision(PickaxeObjectNPC , false)
	AttachEntityToEntity(PickaxeObjectNPC, PickaxeNPC, GetPedBoneIndex(PickaxeNPC, 57005), 0.15, 0.05, 0.0, -65.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)


	local ped_hash = GetHashKey(Config.miner['Sell'].Type)
	RequestModel(ped_hash)
	while not HasModelLoaded(ped_hash) do
		Citizen.Wait(1)
	end	
	SellNPC = CreatePed(1, ped_hash, Config.miner['Sell'].Pos.x, Config.miner['Sell'].Pos.y, Config.miner['Sell'].Pos.z-1, Config.miner['Sell'].Pos.h, false, true)
	SetBlockingOfNonTemporaryEvents(SellNPC, true)
	SetPedDiesWhenInjured(SellNPC, false)
	SetPedCanPlayAmbientAnims(SellNPC, true)
	SetPedCanRagdollFromPlayerImpact(SellNPC, false)
	SetEntityInvincible(SellNPC, true)
	FreezeEntityPosition(SellNPC, true)

	RequestAnimDict("anim@heists@box_carry@")
	while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
		Citizen.Wait(7)
	end
	TaskPlayAnim(SellNPC, "anim@heists@box_carry@" ,"idle", 8.0, -8.0, -1, 2, 0, false, false, false)	
	NPCRock = CreateObject(GetHashKey('prop_rock_5_smash3'), Config.miner['Sell'].Pos.x, Config.miner['Sell'].Pos.y, Config.miner['Sell'].Pos.z, true, true, true)
	SetEntityCollision(NPCRock , false)
	AttachEntityToEntity(NPCRock, SellNPC, GetPedBoneIndex(SellNPC, 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)

	while true do

		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		if(GetDistanceBetweenCoords(coords,Config.miner['BossSpawn'].Pos.x, Config.miner['BossSpawn'].Pos.y, Config.miner['BossSpawn'].Pos.z, true) < 4.0) then	
			sleep = 4
			if(GetDistanceBetweenCoords(coords,Config.miner['BossSpawn'].Pos.x, Config.miner['BossSpawn'].Pos.y, Config.miner['BossSpawn'].Pos.z, true) < 1.5) then	
				sleep = 0
				if (Config.jobrequirement and (PlayerData.job ~= nil and PlayerData.job.name == Config.jobname)) or not Config.jobrequirement then

					if not JobStarted then						
						DrawText3Ds(Config.miner['BossSpawn'].Pos.x, Config.miner['BossSpawn'].Pos.y, Config.miner['BossSpawn'].Pos.z+1.0, 'Presiona [~g~E~w~] para empezar a trabajar')
					else
						DrawText3Ds(Config.miner['BossSpawn'].Pos.x, Config.miner['BossSpawn'].Pos.y, Config.miner['BossSpawn'].Pos.z+1.0, 'Presiona [~r~E~w~] para terminar el trabajo')
					end

					if (IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) and not JobStarted) then
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
							if skin.sex == 0 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.male)
							else
								TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.female)
							end
							JobStarted = true
							ESX.ShowNotification("<b>Jefe</b>: Para agarrar el pico, andá con amigo de la izquierda. Para vender recursos, andá a mi derecha.", "info")
						end)
					elseif (IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) and JobStarted) then
						JobStarted = false
						DeleteEntity(PickaxeObject)
						if haspickaxe then
							RemoveBlip(MineBlip)
						end
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
						end)
					end

				else
					DrawText3Ds(Config.miner['BossSpawn'].Pos.x, Config.miner['BossSpawn'].Pos.y, Config.miner['BossSpawn'].Pos.z+1.0, 'Esté trabajo no es para vos master.')
				end
			end
		elseif(GetDistanceBetweenCoords(coords,Config.miner['Pickaxeplace'].Pos.x, Config.miner['Pickaxeplace'].Pos.y, Config.miner['Pickaxeplace'].Pos.z, true) < 4.0) and JobStarted then	
			sleep = 4
			if(GetDistanceBetweenCoords(coords,Config.miner['Pickaxeplace'].Pos.x, Config.miner['Pickaxeplace'].Pos.y, Config.miner['Pickaxeplace'].Pos.z, true) < 1.5) then	
				sleep = 0
				if NewPickaxe and not haspickaxe and Pickaxe <= 6 then
					DrawText3Ds(Config.miner['Pickaxeplace'].Pos.x, Config.miner['Pickaxeplace'].Pos.y, Config.miner['Pickaxeplace'].Pos.z+1.2, 'Presiona [~g~G~w~] para mejorar tu pico a '..Config.Pickaxe[Pickaxe+1].color..''..Config.Pickaxe[Pickaxe+1].name..'~w~ ('..Config.Pickaxe[Pickaxe+1].price..'~g~$~w~)')
				end

				if not haspickaxe then
					DrawText3Ds(Config.miner['Pickaxeplace'].Pos.x, Config.miner['Pickaxeplace'].Pos.y, Config.miner['Pickaxeplace'].Pos.z+1.0, 'Presiona [~g~E~w~] para tomar el pico ('..Config.Pickaxe[Pickaxe].color..''..Config.Pickaxe[Pickaxe].name..'~w~)')
				else
					DrawText3Ds(Config.miner['Pickaxeplace'].Pos.x, Config.miner['Pickaxeplace'].Pos.y, Config.miner['Pickaxeplace'].Pos.z+1.0, 'Presiona [~r~E~w~] para dejar el pico en el suelo')
				end
				if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) and not haspickaxe then
					PickaxeObject = CreateObject(GetHashKey('prop_tool_pickaxe'), coords.x, coords.y, coords.z, true, true, true)
					SetEntityCollision(PickaxeObject , false)
					AttachEntityToEntity(PickaxeObject, ped, GetPedBoneIndex(ped, 57005), 0.15, 0.05, 0.0, -65.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)

					ESX.ShowNotification("<b>Jefe</b>: Ya tenes pico, ahora tenes que ir a minar.", "info")
					haspickaxe = true

					MineBlip = AddBlipForCoord(Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.x, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.y, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.z)
					SetBlipSprite(MineBlip, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Blip.type)
					SetBlipDisplay(MineBlip, 4)
					SetBlipScale  (MineBlip, 0.8)
					SetBlipColour (MineBlip, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Blip.color)
					SetBlipAsShortRange(MineBlip, true)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString('Mine')
					EndTextCommandSetBlipName(MineBlip)

					CreateWork()
				elseif (IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false)) and haspickaxe then
					DeleteEntity(PickaxeObject)
					haspickaxe = false
					ESX.ShowNotification("<b>Jefe</b>: No tenés pico para poder trabajar.", "warning")
					RemoveBlip(MineBlip)
				elseif IsControlJustReleased(0, Keys['G']) and not IsPedInAnyVehicle(ped, false) and not haspickaxe and Pickaxe <= 6 then
					ESX.TriggerServerCallback('dream-miner:upgrade', function(cb)
						if cb then 
							Pickaxe = Pickaxe + 1
							ESX.ShowNotification("<b>Jefe</b> Mejoraste tu pico a "..Config.Pickaxe[Pickaxe].name.."", "success")
						else
							ESX.ShowNotification("<b>Jefe</b> No tenes suficiente dinero para mejorar tu pico", "info")
						end
					end, Pickaxe)
				end
			end
		elseif(GetDistanceBetweenCoords(coords,Config.miner['Sell'].Pos.x, Config.miner['Sell'].Pos.y, Config.miner['Sell'].Pos.z, true) < 4.0) and JobStarted then
			sleep = 4
			if(GetDistanceBetweenCoords(coords,Config.miner['Sell'].Pos.x, Config.miner['Sell'].Pos.y, Config.miner['Sell'].Pos.z, true) < 1.5) then
				sleep = 0
				DrawText3Ds(Config.miner['Sell'].Pos.x, Config.miner['Sell'].Pos.y, Config.miner['Sell'].Pos.z+1.0, 'Presiona [~g~E~w~] para vender los minerales')
				DrawMarker(29, Config.miner['Sell'].Pos.x, Config.miner['Sell'].Pos.y, Config.miner['Sell'].Pos.z+1.3, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 123, 204, 88, 100, false, true, 2, true, false, false, false)
				if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
					ESX.TriggerServerCallback('dream-miner:payout', function(money, amount, experience)
						if money then
							if experience == 0 then
								ESX.ShowNotification("<b>Jefe</b>: Vendiste "..amount.." minerales por:  $"..money.."", "success")
							else 
								Experience = Experience + experience
								ESX.ShowNotification("<b>Jefe</b>: Vendiste "..amount.." minerales por:  $"..money.." y "..experience.." exp", "success")
								local i = 10
								while true do
									if Config.Levels[i].exp < Experience then
										Level = i
										break
									end
									i = i - 1
									Citizen.Wait(0)
								end
							end
						else 
							ESX.ShowNotification("<b>Jefe</b>: No tenes nada para vender", "error")
						end
					end, Experience)
				end
			end
		elseif JobStarted and (GetDistanceBetweenCoords(coords,Config.miner['Pickaxeplace'].Pos.x, Config.miner['Pickaxeplace'].Pos.y, Config.miner['Pickaxeplace'].Pos.z, true) > 100.0) then
			ESX.ShowNotification("<b>Jefe</b>: Dejaste tu lugar de trabajo", "info")
			JobStarted = false
			DeleteEntity(PickaxeObject)
			if haspickaxe then
				RemoveBlip(MineBlip)
			end
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end
		Citizen.Wait(sleep)
	end
end)



function CreateWork()
	Citizen.CreateThread(function()
		while true do
			sleep = 500
			local ped = PlayerPedId()
			local coords = GetEntityCoords(ped)
			if(GetDistanceBetweenCoords(coords,Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.x, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.y, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.z, false) < 15.0) then	
				sleep = 4
				DrawMarker(43, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.x, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.y, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.z-1.3, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.scaleX, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.scaleY, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.scaleZ, 71, 134, 173, 150, false, false, 2, false, false, false, false)
				if(GetDistanceBetweenCoords(coords,Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.x, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.y, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.z, false) < 4.0) then	
					sleep = 0
					DrawText3Ds(coords.x, coords.y, coords.z+1.2, 'Presiona [~g~E~w~] para minar')
					DrawText3Ds(Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.x, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.y, Config.MinePlaces[Config.Pickaxe[Pickaxe].name].Pos.z+1.2, Config.Pickaxe[Pickaxe].name..' pickaxe')
					if IsControlJustReleased(0, 38) and not IsPedInAnyVehicle(ped, false) then
						SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'))
						local dict = loadDict('melee@large_wpn@streamed_core')
						for i=1,Config.Levels[Level].anim,1 do
							TaskPlayAnim(PlayerPedId(), dict, 'ground_attack_on_spot', 8.0, -8.0, -1, 2, 0, false, false, false)
							TriggerEvent('dream-miner:sound', 'pickaxe', 0.5)
							Citizen.Wait(2300)
						end
						ClearPedTasks(PlayerPedId())

						
							TriggerEvent('dream-miner:sound', 'breakrock', 0.3)
							local rock1 = CreateObject(GetHashKey('prop_rock_5_smash3'), coords.x+0.3, coords.y+0.1, coords.z, true, true, true)
							local rock2 = CreateObject(GetHashKey('prop_rock_5_smash3'), coords.x-0.5, coords.y-0.3, coords.z, true, true, true)
							local rock3 = CreateObject(GetHashKey('prop_rock_5_smash3'), coords.x+0.3, coords.y-0.4, coords.z, true, true, true)

							SetEntityCollision(rock1, false)
							SetEntityCollision(rock2, false)
							SetEntityCollision(rock3, false)

							PlaceObjectOnGroundProperly(rock1)
							PlaceObjectOnGroundProperly(rock2)
							PlaceObjectOnGroundProperly(rock3)

							FreezeEntityPosition(rock1, true)
							FreezeEntityPosition(rock2, true)
							FreezeEntityPosition(rock3, true)

							objectCoords1 = GetEntityCoords(rock1) 
							objectCoords2 = GetEntityCoords(rock2) 
							objectCoords3 = GetEntityCoords(rock3) 

							local done = 0

						while true do
							local ped = PlayerPedId()
							local coords = GetEntityCoords(ped)
								if objectCoords1 and (GetDistanceBetweenCoords(coords,objectCoords1.x, objectCoords1.y, objectCoords1.z, false) < 0.5) then	
									DrawText3Ds(objectCoords1.x, objectCoords1.y, objectCoords1.z, 'Presiona [~r~E~w~] para tomar el material')
									if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
										done = done + 1
										objectCoords1 = nil
										DeleteEntity(rock1)
										TriggerServerEvent('dream-miner:mine', Pickaxe, Level)
									end
								elseif objectCoords2 and (GetDistanceBetweenCoords(coords,objectCoords2.x, objectCoords2.y, objectCoords2.z, false) < 0.5) then
									DrawText3Ds(objectCoords2.x, objectCoords2.y, objectCoords2.z, 'Presiona [~r~E~w~] para tomar el material')
									if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
										done = done + 1
										objectCoords2 = nil
										DeleteEntity(rock2)
										TriggerServerEvent('dream-miner:mine', Pickaxe, Level)
									end
								elseif objectCoords3 and (GetDistanceBetweenCoords(coords,objectCoords3.x, objectCoords3.y, objectCoords3.z, false) < 0.5) then
									DrawText3Ds(objectCoords3.x, objectCoords3.y, objectCoords3.z, 'Presiona [~r~E~w~] para tomar el material')
									if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
										done = done + 1
										objectCoords3 = nil
										DeleteEntity(rock3)
										TriggerServerEvent('dream-miner:mine', Pickaxe, Level)
									end
								end
								if done == 3 then
									if not firsthelp then
										ESX.ShowNotification("<b>Jefe</b>: Podés vender los materiales yendo al hombre que sostiene la piedra", "info")
										firsthelp = true
									end
									break
								end
							
							Citizen.Wait(0)
						end
					end
				end
			end

			if not haspickaxe then
				break
			end
			Citizen.Wait(sleep)
		end
	end)
end

loadDict = function(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

--[[RegisterCommand('reset', function()
	haspickaxe = true
	CreateWork()

end)]]

function Randomize(tb)
	local keys = {}
	for k in pairs(tb) do table.insert(keys, k) end
	return tb[keys[math.random(#keys)]]
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('dream-miner:sound')
AddEventHandler('dream-miner:sound', function(name, vol)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = name,
        transactionVolume   = vol
    })
end)