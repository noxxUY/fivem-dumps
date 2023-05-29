local carryingBackInProgress = false
local carryingBackInProgress2 = false
local carryAnimNamePlaying = ""
local carryAnimDictPlaying = ""
local carryControlFlagPlaying = 0
local preso = false
local txt = 0
local broyale = false

--Cocoyito
local piggyBackInProgress = false
local IsLiftup = false
local tron = false

ESX = nil

RegisterNetEvent('CarryPeople:tron')
AddEventHandler('CarryPeople:tron', function(bool)
	tron = bool
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function Preso(bool, etc)
	preso = bool
	if etc then
		txt = 1
	else
		txt = 0
	end
end

function Cargado()
	return carryingBackInProgress
end

RegisterNetEvent('CarryPeople:broyale')
AddEventHandler('CarryPeople:broyale', function(bool)
	broyale = bool
end)

RegisterCommand("c",function(source, args)
	if not IsControlPressed(0, 21) and not IsPedRunning(GetPlayerPed(-1)) then
	if not preso and not broyale then
		if not IsPedDeadOrDying(GetPlayerPed(-1), false) then
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				if not carryingBackInProgress and not carryingBackInProgress2 then
					if not piggyBackInProgress then
						local player = PlayerPedId()	
						lib = 'missfinale_c2mcs_1'
						anim1 = 'fin_c2_mcs_1_camman'
						lib2 = 'nm'
						anim2 = 'firemans_carry'
						distans = 0.15
						distans2 = 0.27
						height = 0.63
						spin = 0.0		
						length = 100000
						controlFlagMe = 49
						controlFlagTarget = 33
						animFlagTarget = 1
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer ~= -1 and closestDistance <= 1.5 then
							target = GetPlayerServerId(closestPlayer)
							TriggerServerEvent('CarryPeople:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
						else
							ESX.ShowNotification("Nadie cerca para llevar!")
						end
					else
						piggyBackInProgress = false
						carryingBackInProgress2 = false
						ClearPedSecondaryTask(GetPlayerPed(-1))
						DetachEntity(GetPlayerPed(-1), true, false)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer ~= -1 and closestDistance <= 1.5 then
							target = GetPlayerServerId(closestPlayer)
						end
						if target ~= 0 then 
							TriggerServerEvent("CarryPeople:stop2",target)
						end
					end
				else
					carryingBackInProgress = false
					carryingBackInProgress2 = false
					ClearPedSecondaryTask(GetPlayerPed(-1))
					DetachEntity(GetPlayerPed(-1), true, false)
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer ~= -1 and closestDistance <= 1.5 then
						target = GetPlayerServerId(closestPlayer)
					end
					if target ~= 0 then 
						TriggerServerEvent("CarryPeople:stop",target)
					end
				end
			else
				ESX.ShowNotification("Bajate del auto marmota para cargar a alguien!")
			end
		else
			ESX.ShowNotification("No puedes cargar a nadie estando muerto boludo!")
		end
	else
		if txt == 0 then
			ESX.ShowNotification("No puedes hacer esto estando esposado.")
		else
			ESX.ShowNotification("~r~No puedes hacer esto adentro de motel.")
		end
	end
	end
end,false)

RegisterCommand("c2",function(source, args)
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
if closestPlayer ~= -1 and closestDistance <= 1.5 then
	target = GetPlayerServerId(closestPlayer)
	targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	if not preso and not broyale then
		if not IsPedDeadOrDying(GetPlayerPed(-1), false) and not IsPedDeadOrDying(targetPed, false) then
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				if not piggyBackInProgress and not piggyBackInProgress2 then
					if not carryingBackInProgress and not carryingBackInProgress2 then
						local player = PlayerPedId()	
						lib = 'anim@arena@celeb@flat@paired@no_props@'
						anim1 = 'piggyback_c_player_a'
						anim2 = 'piggyback_c_player_b'
						distans = -0.07
						distans2 = 0.0
						height = 0.45
						spin = 0.0		
						length = 100000
						controlFlagMe = 49
						controlFlagTarget = 33
						animFlagTarget = 1
						TriggerServerEvent('CarryPeople:sync2', closestPlayer, lib, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
					else
						carryingBackInProgress = false
						carryingBackInProgress2 = false
						ClearPedSecondaryTask(GetPlayerPed(-1))
						DetachEntity(GetPlayerPed(-1), true, false)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer ~= -1 and closestDistance <= 1.5 then
							target = GetPlayerServerId(closestPlayer)
						end
						if target ~= 0 then 
							TriggerServerEvent("CarryPeople:stop",target)
						end
					end
				else
					piggyBackInProgress = false
					piggyBackInProgress2 = false
					ClearPedSecondaryTask(GetPlayerPed(-1))
					DetachEntity(GetPlayerPed(-1), true, false)
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer ~= -1 and closestDistance <= 1.5 then
						target = GetPlayerServerId(closestPlayer)
					end
					if target ~= 0 then 
						TriggerServerEvent("CarryPeople:stop2",target)
					end
				end
			else
			
			end
		else
			ESX.ShowNotification('No puedes cargar si uno de los 2 esta muerto!')
		end
	else
	
	end
else
	ESX.ShowNotification("Nadie cerca para llevar!")
end
end,false)

--[[
RegisterCommand("c3",function(source, args)
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
if closestPlayer ~= -1 and closestDistance <= 1.5 then
	target = GetPlayerServerId(closestPlayer)
	targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	if not preso then
		if not IsPedDeadOrDying(GetPlayerPed(-1), false) and not IsPedDeadOrDying(targetPed, false) then
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
					local dict = "anim@heists@box_carry@"
					
					RequestAnimDict(dict)
					while not HasAnimDictLoaded(dict) do
						Citizen.Wait(100)
					end
					
					local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
					
					if closestDistance ~= -1 and closestDistance <= 1.5 then
						TriggerServerEvent('CarryPeople:lyfter', GetPlayerServerId(closestPlayer))		
						TaskPlayAnim(GetPlayerPed(-1), dict, "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
					else
						ESX.ShowNotification("Nadie cerca para llevar!")
					end
			else
			
			end
		else
			ESX.ShowNotification('No puedes cargar si uno de los 2 esta muerto!')
		end
	else
	
	end
else
	ESX.ShowNotification("Nadie cerca para llevar!")
end
end,false)

function LoadAnimationDictionary(animationD)
	while(not HasAnimDictLoaded(animationD)) do
		RequestAnimDict(animationD)
		Citizen.Wait(1)
	end
end


--UPA
RegisterNetEvent('CarryPeople:upplyft')
AddEventHandler('CarryPeople:upplyft', function(target)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	local lPed = GetPlayerPed(-1)
	local dict = "amb@code_human_in_car_idles@low@ps@"
	
	if isCarry == false then
		LoadAnimationDictionary("amb@code_human_in_car_idles@generic@ps@base")
		TaskPlayAnim(lPed, "amb@code_human_in_car_idles@generic@ps@base", "base", 8.0, -8, -1, 33, 0, 0, 40, 0)
		AttachEntityToEntity(GetPlayerPed(-1), targetPed, 9816, 0.015, 0.38, 0.11, 0.9, 0.30, 90.0, false, false, false, false, 2, false)
		isCarry = true
	else
		DetachEntity(GetPlayerPed(-1), true, false)
		ClearPedTasksImmediately(targetPed)
		ClearPedTasksImmediately(GetPlayerPed(-1))
		isCarry = false
	end
end)
]]--
--FIN UPA

RegisterNetEvent('CarryPeople:syncTarget')
AddEventHandler('CarryPeople:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress2 = true
	RequestAnimDict(animationLib)
	
	ESX.ShowNotification('TE CARGARON AL HOMBRO')

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation2
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

RegisterNetEvent('CarryPeople:syncMe')
AddEventHandler('CarryPeople:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = GetPlayerPed(-1)
	carryingBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

RegisterNetEvent('CarryPeople:cl_stop')
AddEventHandler('CarryPeople:cl_stop', function()
	carryingBackInProgress = false
	carryingBackInProgress2 = false
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
end)

--Cocoyo

RegisterNetEvent('CarryPeople:syncTarget2')
AddEventHandler('CarryPeople:syncTarget2', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	piggyBackInProgress2 = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('CarryPeople:syncMe2')
AddEventHandler('CarryPeople:syncMe2', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = GetPlayerPed(-1)
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	piggyBackInProgress = true
	Citizen.Wait(length)
end)

RegisterNetEvent('CarryPeople:cl_stop2')
AddEventHandler('CarryPeople:cl_stop2', function()
	piggyBackInProgress = false
	piggyBackInProgress2 = false
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
end)
--fin cocoyo

Citizen.CreateThread(function()
	while true do
		if (carryingBackInProgress or piggyBackInProgress) and not tron then
			
			local ped = PlayerPedId()
			
			DisableControlAction(0, 21, true)
			DisableControlAction(0, 22, true)
			DisablePlayerFiring(ped,true)
			
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			
			if not IsEntityPlayingAnim(GetPlayerPed(-1), carryAnimDictPlaying, carryAnimNamePlaying, 3) then
				TaskPlayAnim(GetPlayerPed(-1), carryAnimDictPlaying, carryAnimNamePlaying, 8.0, -8.0, 100000, carryControlFlagPlaying, 0, false, false, false)
			end
			
			
			if carryingBackInProgress then
				local vehicle = GetVehiclePedIsTryingToEnter(ped) --me trae el vehiculo que intento subir.
				local seat = GetSeatPedIsTryingToEnter(ped)
				local class = GetVehicleClass(vehicle)			
			
				if GetVehicleClass(vehicle) == 8 then
					ESX.ShowNotification("No puedes subirte a la moto con alguien cargado!")
					ClearPedTasksImmediately(ped)
					ClearPedTasks(ped)
				elseif seat == -1 then
					ESX.ShowNotification("No puedes manejar con alguien cargado!")
					ClearPedTasksImmediately(ped)
					ClearPedTasks(ped)
				end
				
				--[[
				local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.0, 0, 70)
				--local lockStatus = GetVehicleDoorLockStatus(vehicle)
				if DoesEntityExist(vehicle) and IsVehicleSeatFree(vehicle,-1) then
					local coords = GetEntityCoords(vehicle)
					--print("LLEVO ALGUIEN CARGADO")
					DrawText3D(coords, '[H] meterlo dentro del vehiculo!')
					if IsControlJustReleased(0, 74) then
						local lockStatus = GetVehicleDoorLockStatus(vehicle)
						if lockStatus == 1 then --unlocked
							local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
							for i=maxSeats-1, 0, -1 do
								if GetPedInVehicleSeat(vehicle, i) == 0 then
									carryingBackInProgress = false
									carryingBackInProgress2 = false
									ClearPedSecondaryTask(GetPlayerPed(-1))
									DetachEntity(GetPlayerPed(-1), true, false)
									SubirAuto(VehToNet(vehicle), target)
									break
								end
							end
						elseif lockStatus == 2 then -- locked
							ESX.ShowNotification('El vehiculo esta cerrado')
						end
					end				
				end
				]]--
			end
		end
		if (piggyBackInProgress2 or carryingBackInProgress2) and not tron then
			
			local ped = PlayerPedId()
			
			DisableControlAction(0, 21, true)
			DisableControlAction(0, 22, true)
			DisablePlayerFiring(ped,true)
			
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			
			--print("TE LLEVAN CARGADO")
		end
		Wait(0)
	end
end)

function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
  
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
  
    AddTextComponentString(text)
    DrawText(_x, _y)
end

function SubirAuto(vehicle, target)
	if target ~= 0 then
		TriggerServerEvent('CarryPeople:putInVehicle', target, vehicle)
	end
end


RegisterNetEvent('CarryPeople:putInVehicle')
AddEventHandler('CarryPeople:putInVehicle', function(netVeh)	
	local playerPed = PlayerPedId()
	local vehicle = NetToVeh(netVeh)
	if vehicle ~= 0 then
        local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
        for i=maxSeats-1, 0, -1 do
            if GetPedInVehicleSeat(vehicle, i) == 0 then
				carryingBackInProgress = false
				carryingBackInProgress2 = false
	
				ClearPedSecondaryTask(playerPed)
				DetachEntity(playerPed, true, false)
				TriggerServerEvent("CarryPeople:stop",target)
				SetPedIntoVehicle(playerPed, vehicle, i)
                break
			end
        end
    end
	--[[
    local vehicle = VehicleInFront()
    if vehicle ~= 0 then
        local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
        for i=maxSeats-1, 0, -1 do
            if GetPedInVehicleSeat(vehicle, i) == 0 then
				carryingBackInProgress = false
				carryingBackInProgress2 = false
	
				ClearPedSecondaryTask(playerPed)
				DetachEntity(playerPed, true, false)
				TriggerServerEvent("CarryPeople:stop",target)
				SetPedIntoVehicle(playerPed, vehicle, i)
                break
			end
        end
    end
	]]--
end)

function VehicleInFront()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 3.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end
