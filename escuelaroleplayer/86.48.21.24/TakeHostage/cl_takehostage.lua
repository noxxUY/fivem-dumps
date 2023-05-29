

QBCore = exports['qb-core']:GetCoreObject()

local takeHostage = {
	allowedWeapons = {
		`WEAPON_PISTOL`,
		`WEAPON_COMBATPISTOL`,
		`WEAPON_SNSPISTOL`,
		`WEAPON_HEAVYPISTOL`,
		`WEAPON_PISTOL50`,
		`WEAPON_APPISTOL`,
		`WEAPON_CERAMICPISTOL`,
		--etc add guns you want
	},
	InProgress = false,
	type = "",
	targetSrc = -1,
	agressor = {
		animDict = "anim@gangops@hostage@",
		anim = "perp_idle",
		flag = 49,
	},
	hostage = {
		animDict = "anim@gangops@hostage@",
		anim = "victim_idle",
		attachX = -0.24,
		attachY = 0.11,
		attachZ = 0.0,
		flag = 49,
	}
}

local function drawNativeNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local function ensureAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(0)
        end
    end
    return animDict
end

local function drawNativeText(str)
	SetTextEntry_2("STRING")
	AddTextComponentString(str)
	EndTextCommandPrint(1000, 1)
end

exports['qb-target']:AddGlobalPlayer({
	options = {
	  	{
			label = 'Tomar como rehén',
			icon = 'fa-solid fa-person-rifle',
			canInteract = function()
				local weapon = GetSelectedPedWeapon(PlayerPedId())

				return (weapon == `WEAPON_COMBATPISTOL` or weapon == `WEAPON_SNSPISTOL` or weapon == `WEAPON_HEAVYPISTOL` or weapon == `WEAPON_PISTOL`)
			end,
			action = function(entity)
				callTakeHostage(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)))
			end
		}
	},
	distance = 2.5
})

function callTakeHostage(targetSrc)
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)

	local canTakeHostage = false
	for i=1, #takeHostage.allowedWeapons do
		if HasPedGotWeapon(PlayerPedId(), takeHostage.allowedWeapons[i], false) then
			if GetAmmoInPedWeapon(PlayerPedId(), takeHostage.allowedWeapons[i]) > 0 then
				canTakeHostage = true
				foundWeapon = takeHostage.allowedWeapons[i]
				break
			end
		end
	end

	if not canTakeHostage then
			QBCore.Functions.Notify('Necesitas una pistola con munición para tomarlo de rehen!', 'error', 8000)
	end

	if not takeHostage.InProgress and canTakeHostage then
		if targetSrc ~= -1 then
			SetCurrentPedWeapon(PlayerPedId(), foundWeapon, true)
			takeHostage.InProgress = true
			takeHostage.targetSrc = targetSrc
			TriggerServerEvent("TakeHostage:sync",targetSrc)
			ensureAnimDict(takeHostage.agressor.animDict)
			takeHostage.type = "agressor"
		else
			QBCore.Functions.Notify('No hay nadie cerca para tomar como rehén', 'error', 8000)
		end
	end
end

RegisterNetEvent("TakeHostage:syncTarget")
AddEventHandler("TakeHostage:syncTarget", function(target)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	takeHostage.InProgress = true
	ensureAnimDict(takeHostage.hostage.animDict)
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, takeHostage.hostage.attachX, takeHostage.hostage.attachY, takeHostage.hostage.attachZ, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
	takeHostage.type = "hostage"
end)

RegisterNetEvent("TakeHostage:releaseHostage")
AddEventHandler("TakeHostage:releaseHostage", function()
	takeHostage.InProgress = false
	takeHostage.type = ""
	DetachEntity(PlayerPedId(), true, false)
	ensureAnimDict("reaction@shove")
	TaskPlayAnim(PlayerPedId(), "reaction@shove", "shoved_back", 8.0, -8.0, -1, 0, 0, false, false, false)
	Wait(250)
	ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent("TakeHostage:killHostage")
AddEventHandler("TakeHostage:killHostage", function()
	takeHostage.InProgress = false
	takeHostage.type = ""
	SetEntityHealth(PlayerPedId(),0)
	DetachEntity(PlayerPedId(), true, false)
	ensureAnimDict("anim@gangops@hostage@")
	TaskPlayAnim(PlayerPedId(), "anim@gangops@hostage@", "victim_fail", 8.0, -8.0, -1, 168, 0, false, false, false)
end)

RegisterNetEvent("TakeHostage:cl_stop")
AddEventHandler("TakeHostage:cl_stop", function()
	takeHostage.InProgress = false
	takeHostage.type = ""
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

Citizen.CreateThread(function()
	while true do
		if takeHostage.type == "agressor" then
			if not IsEntityPlayingAnim(PlayerPedId(), takeHostage.agressor.animDict, takeHostage.agressor.anim, 3) then
				TaskPlayAnim(PlayerPedId(), takeHostage.agressor.animDict, takeHostage.agressor.anim, 8.0, -8.0, 100000, takeHostage.agressor.flag, 0, false, false, false)
				QBCore.Functions.Notify('Agarra el arma con cuidado.', 'success', 8000)

			end
		elseif takeHostage.type == "hostage" then
			if not IsEntityPlayingAnim(PlayerPedId(), takeHostage.hostage.animDict, takeHostage.hostage.anim, 3) then
				TaskPlayAnim(PlayerPedId(), takeHostage.hostage.animDict, takeHostage.hostage.anim, 8.0, -8.0, 100000, takeHostage.hostage.flag, 0, false, false, false)
				QBCore.Functions.Notify('Te han tomado de rehen, valora tu vida.', 'success', 8000)

			end
		end
		Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		if takeHostage.type == "agressor" then
			DisableControlAction(0,24,true) -- disable attack
			DisableControlAction(0,25,true) -- disable aim
			DisableControlAction(0,47,true) -- disable weapon
			DisableControlAction(0,58,true) -- disable weapon
			DisableControlAction(0,21,true) -- disable sprint
			DisableControlAction(0,60,true) -- disable ctrl izquierdo
			DisableControlAction(0,62,true) -- disable ctrl izquierdo
			DisableControlAction(0,132,true) -- disable ctrl izquierdo
			DisableControlAction(0,224,true) -- disable ctrl izquierdo
			DisableControlAction(0,281,true) -- disable ctrl izquierdo
			DisableControlAction(0,280,true) -- disable ctrl izquierdo
			DisableControlAction(0,326,true) -- disable ctrl izquierdo


			DisablePlayerFiring(PlayerPedId(),true)
			drawNativeText("[G] para soltar, [F9] para matar")

			if IsEntityDead(PlayerPedId()) then
				takeHostage.type = ""
				takeHostage.InProgress = false
				ensureAnimDict("reaction@shove")
				TaskPlayAnim(PlayerPedId(), "reaction@shove", "shove_var_a", 8.0, -8.0, -1, 168, 0, false, false, false)
				TriggerServerEvent("TakeHostage:releaseHostage", takeHostage.targetSrc)
			end

			if IsDisabledControlJustPressed(0,47) then --release
				takeHostage.type = ""
				takeHostage.InProgress = false
				ensureAnimDict("reaction@shove")
				TaskPlayAnim(PlayerPedId(), "reaction@shove", "shove_var_a", 8.0, -8.0, -1, 168, 0, false, false, false)
				TriggerServerEvent("TakeHostage:releaseHostage", takeHostage.targetSrc)
			elseif IsDisabledControlJustPressed(0,56) then --kill
				takeHostage.type = ""
				takeHostage.InProgress = false
				ensureAnimDict("anim@gangops@hostage@")
				TaskPlayAnim(PlayerPedId(), "anim@gangops@hostage@", "perp_fail", 8.0, -8.0, -1, 168, 0, false, false, false)
				TriggerServerEvent("TakeHostage:killHostage", takeHostage.targetSrc)
				TriggerServerEvent("TakeHostage:stop",takeHostage.targetSrc)
				Wait(100)
				SetPedShootsAtCoord(PlayerPedId(), 0.0, 0.0, 0.0, 0)
			end
		elseif takeHostage.type == "hostage" then
			DisableControlAction(0,21,true) -- disable sprint
			DisableControlAction(0,24,true) -- disable attack
			DisableControlAction(0,25,true) -- disable aim
			DisableControlAction(0,47,true) -- disable weapon
			DisableControlAction(0,58,true) -- disable weapon
			DisableControlAction(0,263,true) -- disable melee
			DisableControlAction(0,264,true) -- disable melee
			DisableControlAction(0,257,true) -- disable melee
			DisableControlAction(0,140,true) -- disable melee
			DisableControlAction(0,141,true) -- disable melee
			DisableControlAction(0,142,true) -- disable melee
			DisableControlAction(0,143,true) -- disable melee
			DisableControlAction(0,75,true) -- disable exit vehicle
			DisableControlAction(27,75,true) -- disable exit vehicle
			DisableControlAction(0,22,true) -- disable jump
			DisableControlAction(0,32,true) -- disable move up
			DisableControlAction(0,268,true)
			DisableControlAction(0,33,true) -- disable move down
			DisableControlAction(0,269,true)
			DisableControlAction(0,34,true) -- disable move left
			DisableControlAction(0,270,true)
			DisableControlAction(0,35,true) -- disable move right
			DisableControlAction(0,271,true)
			DisableControlAction(0,60,true) -- disable ctrl izquierdo
			DisableControlAction(0,62,true) -- disable ctrl izquierdo
			DisableControlAction(0,132,true) -- disable ctrl izquierdo
			DisableControlAction(0,224,true) -- disable ctrl izquierdo
			DisableControlAction(0,281,true) -- disable ctrl izquierdo
			DisableControlAction(0,280,true) -- disable ctrl izquierdo
			DisableControlAction(0,326,true) -- disable ctrl izquierdo
			DisableControlAction(0,183,true) -- disable G
			DisableControlAction(0,47,true) -- disable G
		end
		Wait(0)
	end
end)