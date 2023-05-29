-- CARRY CARGAR

local carry = {
	InProgress = false,
	targetSrc = -1,
	type = "",
	personCarrying = {
		animDict = "missfinale_c2mcs_1",
		anim = "fin_c2_mcs_1_camman",
		flag = 49,
	},
	personCarried = {
		animDict = "nm",
		anim = "firemans_carry",
		attachX = 0.27,
		attachY = 0.15,
		attachZ = 0.63,
		flag = 33,
	}
}

local function drawNativeNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _,playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(targetCoords-playerCoords)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end
	if closestDistance ~= -1 and closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

local function ensureAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            
		Wait(1000)
        end        
    end
    return animDict
end



weaponblacklist = {
	"WEAPON_UNARMED"
}

RegisterCommand("cargar",function(source, args)
	local ply = PlayerPedId()
	nothing, weapon = GetCurrentPedWeapon(playerPed, true)
	
	
	if IsPedDeadOrDying(PlayerPedId()) then
		drawNativeNotification("~r~¡No puedes cargar estando muerto pelado!")
	else
		if isWeaponBlacklisted(weapon) then
		
				if not carry.InProgress and IsPedOnFoot(ply) then
					local closestPlayer = GetClosestPlayer(3)
					if closestPlayer then
						local targetSrc = GetPlayerServerId(closestPlayer)
						if targetSrc ~= -1 then
							carry.InProgress = true
							carry.targetSrc = targetSrc
							TriggerServerEvent("CarryPeople:sync",targetSrc)
							ensureAnimDict(carry.personCarrying.animDict)
							carry.type = "carrying"
						else
							drawNativeNotification("~r~¡Nadie cerca para cargar!")
						end
					else
						drawNativeNotification("~r~¡Nadie cerca para cargar!")
					end
				else
					print('Estas cargando')
					carry.InProgress = false
					
					ClearPedSecondaryTask(PlayerPedId())
					DetachEntity(PlayerPedId(), true, false)
					TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
					carry.targetSrc = 0
				end
		else
		
			drawNativeNotification("~r~¡No puedes cargar con un arma!")
			
		end
	end
	
	
	
	
	
end,false)


-- RegisterNetEvent('Roda_Carry:client:descargar')
-- AddEventHandler('Roda_Carry:client:descargar', function ()

-- 	local alert = lib.alertDialog({
-- 		header = 'Descargar',
-- 		content = 'Quieres que '..GetPlayerName(PlayerId())..' se descargue?',
-- 		centered = true,
-- 		cancel = true
-- 	})
-- end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end

	return false
end



RegisterNetEvent("CarryPeople:syncTarget")
AddEventHandler("CarryPeople:syncTarget", function(targetSrc)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(targetSrc))


	local alert = lib.alertDialog({
        header = 'Cargar',
        content = 'Haz recibido una solicitud para que tecargen. ¿Quieres aceptar?',
        centered = true,
        cancel = true
    })

    if alert == 'confirm' then
		carry.InProgress = true
		
		DisableControlAction(0, 21,true)
		ensureAnimDict(carry.personCarried.animDict)
		AttachEntityToEntity(PlayerPedId(), targetPed, 0, carry.personCarried.attachX, carry.personCarried.attachY, carry.personCarried.attachZ, 0.5, 0.5, 180, false, false, false, false, 2, false)
		carry.type = "beingcarried"
	else
		TriggerServerEvent('CarryPeople:refuse', targetSrc)
    end


end)

RegisterNetEvent("CarryPeople:cl_stop")
AddEventHandler("CarryPeople:cl_stop", function()
	carry.InProgress = false

	
	DisableControlAction(0, 21,false)
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

Citizen.CreateThread(function()
	while true do
		if carry.InProgress then
			if carry.type == "beingcarried" then
				if not IsEntityPlayingAnim(PlayerPedId(), carry.personCarried.animDict, carry.personCarried.anim, 3) then
					TaskPlayAnim(PlayerPedId(), carry.personCarried.animDict, carry.personCarried.anim, 8.0, -8.0, 100000, carry.personCarried.flag, 0, false, false, false)
				end
			elseif carry.type == "carrying" then
				if not IsEntityPlayingAnim(PlayerPedId(), carry.personCarrying.animDict, carry.personCarrying.anim, 3) then
					TaskPlayAnim(PlayerPedId(), carry.personCarrying.animDict, carry.personCarrying.anim, 8.0, -8.0, 100000, carry.personCarrying.flag, 0, false, false, false)
				end
			end
		end
		Wait(3000)
	end
end)