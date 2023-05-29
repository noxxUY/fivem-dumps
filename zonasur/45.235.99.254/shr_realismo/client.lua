local hurt = false
local player = PlayerPedId()
local injuredcounter = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if GetEntityHealth(GetPlayerPed(-1)) <= 159 then
			setHurt()
			StillInjured = true
		elseif hurt and GetEntityHealth(GetPlayerPed(-1)) > 160 then
			setNotHurt()
			showNotHurt()
		end
	end
end)

function setHurt()
hurt = true
RequestAnimSet("move_m@injured")
SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
Citizen.Wait(10000)
showHurt()
end
 
function showHurt()
	DisplayNotification("¡Necesitas atención médica debido a tus heridas!")
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if injuredcounter == 20000 then
			ApplyDamageToPed(GetPlayerPed(-1),  23, false)
		elseif injuredcounter == 36000 then
			local ped = GetPlayerPed(-1)
			local currentHealth = GetEntityHealth(ped)
			GetEntityHealth(ped, currentHealth - 5)
			Citizen.Wait(5000)
		elseif injuredcounter == 46000 then -- 46000
			DisplayNotification("¡Necesitas atención inmediata, dirígete al hospital cuanto antes!")
		elseif injuredcounter == 54000 then -- 54000
			ApplyDamageToPed(player, 800, false)
			DisplayNotification("¡Has muerto debido a que tus heridas no fueron tratadas a tiempo!")
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		if StillInjured then
			injuredcounter = injuredcounter + 1
		else
			Citizen.Wait(0)
		end
	end
end)

function DisplayNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end



function showNotHurt()
	DisplayNotification("¡Fuiste tratado y sanaste correctamente!")
end

function setNotHurt()
	hurt = false
	StillInjured = false
	injuredcounter = 0
	ResetPedMovementClipset(GetPlayerPed(-1))
	ResetPedWeaponMovementClipset(GetPlayerPed(-1))
	ResetPedStrafeClipset(GetPlayerPed(-1))
end

--- DAÑOS DE BALA

local sh = GetEntityHealth(ply)
--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local ply = GetPlayerPed(-1)
            if HasEntityBeenDamagedByAnyPed(ply) then
				dam = sh - GetEntityHealth(ply)
				local chance = math.random(1, 3)
				if chance == 1 then
					if (dam > 0) and (GetPedArmour(ply) <= 25) then
						if (dam >= 0) and (dam <= 5) then
							hurtMedium(ply, dam)
						elseif (dam >= 6) and (dam <= 10) then
							hurtMediumBad(ply, dam)
						elseif (dam >= 11) and (dam <= 16) then
							hurtPainful(ply, dam)
						elseif dam >= 17 then
							hurtPainful(ply, dam)
						end
					end
					sh = GetEntityHealth(ply)
				end
			end
		ClearEntityLastDamageEntity(ply)
	 end
end)
]]
function hurtMedium(ped, r)
    if IsEntityDead(ped) then return false end
    SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
end

function hurtMediumBad(ped, r)
    if IsEntityDead(ped) then return false end
    SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
end

function hurtBad(ped, r)
    if IsEntityDead(ped) then return false end
    SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
end

function hurtPainful(ped, r)
    if IsEntityDead(ped) then return false end
    SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
end
----- CAM SHAKE

playerMoving = false

Citizen.CreateThread(function()
	while true do Wait(0)
		if not IsPedInAnyVehicle(PlayerPedId(), false) and GetEntitySpeed(PlayerPedId()) >= 0.5 and GetFollowPedCamViewMode() ~= 4 then
			if playerMoving == false then
				ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 0.55)
				playerMoving = true
			end
		else
			if playerMoving == true then
				StopGameplayCamShaking(false)
				playerMoving = false
			end
		end
	end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(100)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0)
  end
end)