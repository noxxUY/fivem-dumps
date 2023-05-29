local display = false
local InSpectatorMode, ShowInfos = false, false
local TargetSpectate, LastPosition, cam
local polarAngleDeg = 0
local azimuthAngleDeg = 90
local radius = -3.5
local PlayerDate = {}
local specteando = false

RegisterKeyMapping('amenu', 'Abrir Menu Admin', 'keyboard', 'INSERT') -- Open Key

RegisterCommand("amenu", function(source, args)
	playerlist = getPlayers()
    ESX.TriggerServerCallback('kilombo_amenu:getGroup', function(grp, servicio)
        if grp ~= 'user' then
			if not servicio then return exports['okokNotify']:Alert("STAFF", "No estás en servicio para usar esto", 5500, 'error') end
            TriggerEvent('kilombo_amenu:getAdmins')
            SendNUIMessage({type = 'open', players = playerlist})
            SetDisplay(true)
        end
    end)
end)

RegisterNUICallback("refreshplayers", function(data)
	playerlist = getPlayers()
    ESX.TriggerServerCallback('kilombo_amenu:getGroup', function(grp)
        if grp ~= 'user' then
            TriggerEvent('kilombo_amenu:getAdmins')
            SendNUIMessage({type = 'open', players = playerlist})
        end
    end)
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("refreshplayercounts", function(data)
    TriggerEvent('kilombo_amenu:getAdmins')
end)

RegisterNetEvent('tpgoto')
AddEventHandler('tpgoto',function(coords)
	SetEntityCoords(PlayerPedId(), coords)
end)
RegisterNetEvent('tpbring')
AddEventHandler('tpbring',function(coords)
	SetEntityCoords(PlayerPedId(), coords)
end)
RegisterNUICallback("action", function(data)
	--print(data.da)
    --[[if data.da == 'kick' then
        TriggerServerEvent('kilombo_amenu:kickbru', data.target, data.grund)]]
    if data.da == 'spec' then
		local target = data.target
        TriggerServerEvent("requestSpectate", target)
	elseif data.da == 'goto' then
		local target = data.target
        TriggerServerEvent("goto", target)
	elseif data.da == 'bring' then
		local target = data.target
        TriggerServerEvent("bring", target)
	elseif data.da == 'screenshot' then
		local target = data.target
        TriggerServerEvent("screenshot", target)
	--[[elseif data.da == 'freeze' then
		local target = data.target
        TriggerServerEvent("freeze", target)
	elseif data.da == 'screenshot' then
		local target = data.target
        TriggerServerEvent("screenshot", target)
	elseif data.da == 'ban' then
		local target = data.target
		local grund = data.grund
		local time = data.time
		--print(time)
        TriggerServerEvent("ban", target, grund, time)]]
    end
end)

--local freezed = false


--[[RegisterNUICallback("banlist", function(data)
	ESX.TriggerServerCallback('kilombo_amenu:getbanlist', function(banList)
		local BanList
		local BanList = banList

		for i = 1, #BanList, 1 do
			--print(json.encode(BanList[i]))
			if BanList[i].permanent == 1 then
				local perm = 1
				--print("Permanente")
			else
				local perm = 0
				--print("No permanente")
			end
			SendNUIMessage({
				type = "banlistap",
				name = tostring(BanList[i].targetname),
				reason = tostring(BanList[i].reason),
				license = tostring(BanList[i].license),
				source = tostring(BanList[i].sourcename),
				expire = tostring(BanList[i].expire),
				perma = tonumber(BanList[i].permanent),
			})
		end
	end)
end)


RegisterNUICallback("unban", function(data)
   TriggerServerEvent("unban", data.license)
end)


RegisterNetEvent("frezzecl")
AddEventHandler("frezzecl", function()
	if frozen then 
		frozen = false
	else
		frozen = true
	end
end)]]


RegisterNUICallback("main", function(data)
    ESX.TriggerServerCallback('kilombo_amenu:getInfo', function(infos, loadout, inventory)
        SendNUIMessage({
            type = "invhr"
        })
        for i,k in pairs(infos) do
            if i == 'lastname' then
                lastname = k
            elseif i == 'dob' then
                dob = k
            elseif i == 'height' then
                height = k
            elseif i == 'blackmoney' then
                blackmoney = k
            elseif i == 'firstname' then
                firstname = k
            elseif i == 'sex' then
                sex = k
            elseif i == 'bankmoney' then
                bankmoney = k
            elseif i == 'cash' then
                cash = k
            end
        end

        SendNUIMessage({
            type = "refreshinfos",
            lastname = lastname,
            dob = dob,
            height = height,
            blackmoney = blackmoney,
            firstname = firstname,
            sex = sex,
            bankmoney = bankmoney,
            cash = cash,
        })
        
        for i,k in pairs(inventory) do
            if k.count > 0 then
                SendNUIMessage({
                    type = "playeritems",
                    amount = k.count,
                    label = k.label
                })
            end
        end

        SendNUIMessage({
            type = "playerhr"
        })

        for i,k in pairs(loadout) do
            --print(i,json.encode(k))
            SendNUIMessage({
                type = "playeritems",
                amount = k.ammo,
                label = k.name
            })
        end

    end, data.selected)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

RegisterNetEvent('kilombo_amenu:getAdmins')
AddEventHandler('kilombo_amenu:getAdmins', function()
    ESX.TriggerServerCallback('kilombo_amenu:getAdmins', function(tbl)
        SendNUIMessage({
            type = "setplayers",
            admins = tbl.admins,
            players = tbl.players
        })
    end)
end)

function getPlayers()
	local players = {}
	ESX.TriggerServerCallback('kilombo_amenu:getPlayers', function(www)
		www = json.decode(www)
		for _, player in ipairs(www) do
        	table.insert(players, {id = player.id, name = player.name})
			----print(player.name, player.id)
    	end
		table.sort(players, function(a,b) return a.id < b.id end)
    end)
	return players
end

--[[Citizen.CreateThread( function()
	while true do
		Citizen.Wait(0)
		if frozen then
			local localPlayerPedId = PlayerPedId()
			FreezeEntityPosition(localPlayerPedId, frozen)
			if IsPedInAnyVehicle(localPlayerPedId, true) then
				FreezeEntityPosition(GetVehiclePedIsIn(localPlayerPedId, false), frozen)
			end 
		else
			local localPlayerPedId = PlayerPedId()
			FreezeEntityPosition(localPlayerPedId, frozen)
			if IsPedInAnyVehicle(localPlayerPedId, true) then
				FreezeEntityPosition(GetVehiclePedIsIn(localPlayerPedId, false), frozen)
			end 
			Citizen.Wait(200)
		end
	end
end)]]

Citizen.CreateThread( function()
	while true do
		Citizen.Wait(500)
		if drawInfo and not stopSpectateUpdate then
			local localPlayerPed = PlayerPedId()
			local targetPed = GetPlayerPed(drawTarget)
			local targetGod = GetPlayerInvincible(drawTarget)
			
			local tgtCoords = GetEntityCoords(targetPed)
			if tgtCoords and tgtCoords.x ~= 0 then
				SetEntityCoords(localPlayerPed, tgtCoords.x, tgtCoords.y, tgtCoords.z - 10.0, 0, 0, 0, false)
			end
		else
			Citizen.Wait(1000)
		end
	end
end)

RegisterNetEvent("requestSpectate")
AddEventHandler('requestSpectate', function(playerServerId, tgtCoords)
	local localPlayerPed = PlayerPedId()
----print(tgtCoords, playerServerId)
	if ((not tgtCoords) or (tgtCoords.z == 0.0)) then tgtCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerServerId))) end
	if playerServerId == GetPlayerServerId(PlayerId()) then 
		if oldCoords then
			RequestCollisionAtCoord(oldCoords.x, oldCoords.y, oldCoords.z)
			Wait(500)
			SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, 0, 0, 0, false)
			oldCoords=nil
		end
		spectatePlayer(GetPlayerPed(PlayerId()),GetPlayerFromServerId(PlayerId()),GetPlayerName(PlayerId()))
		frozen = false
		return 
	else
		if not oldCoords then
			oldCoords = GetEntityCoords(PlayerPedId())
		end
	end
	SetEntityCoords(localPlayerPed, tgtCoords.x, tgtCoords.y, tgtCoords.z - 10.0, 0, 0, 0, false)
	frozen = true
	stopSpectateUpdate = true
	specteando = true
	local adminPed = localPlayerPed
	local playerId = GetPlayerFromServerId(playerServerId)
	repeat
		Wait(200)
		playerId = GetPlayerFromServerId(playerServerId)
	until ((GetPlayerPed(playerId) > 0) and (playerId ~= -1))
	spectatePlayer(GetPlayerPed(playerId),playerId,GetPlayerName(playerId))
	stopSpectateUpdate = false 
end)




local active = false
function spectatePlayer(targetPed,target,name)
	local playerPed = PlayerPedId() -- yourself
	enable = true
	if (target == PlayerId() or target == -1) then 
		enable = false
		----print("Target Player is ourselves, disabling spectate.")
		exports['okokNotify']:Alert("SERVIDOR", "No te podes spectear a vos mism@.", 4500, 'error')
	end
	if(enable)then
		if(active)then
			if oldCoords then
				RequestCollisionAtCoord(oldCoords.x, oldCoords.y, oldCoords.z)
				Wait(500)
				SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, 0, 0, 0, false)
				oldCoords=nil
			end
			NetworkSetInSpectatorMode(false, targetPed)
			frozen = false
			active = false
			Citizen.Wait(200) -- to prevent staying invisible
			SetEntityVisible(playerPed, true, 0)
			SetEntityCollision(playerPed, true, true)
			SetEntityInvincible(playerPed, false)
			NetworkSetEntityInvisibleToNetwork(playerPed, false)
		else
		SetEntityVisible(playerPed, false, 0)
		SetEntityCollision(playerPed, false, false)
		SetEntityInvincible(playerPed, true)
		NetworkSetEntityInvisibleToNetwork(playerPed, true)
		Citizen.Wait(200) -- to prevent target player seeing you
		if targetPed == playerPed then
			Wait(500)
			targetPed = GetPlayerPed(target)
		end
		active = true
		local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))
		RequestCollisionAtCoord(targetx,targety,targetz)
		NetworkSetInSpectatorMode(true, targetPed)
		end
	else
		if oldCoords then
			RequestCollisionAtCoord(oldCoords.x, oldCoords.y, oldCoords.z)
			Wait(500)
			SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, 0, 0, 0, false)
			oldCoords=nil
		end
		NetworkSetInSpectatorMode(false, targetPed)
		frozen = false
		active = false
		Citizen.Wait(200) -- to prevent staying invisible
		SetEntityVisible(playerPed, true, 0)
		SetEntityCollision(playerPed, true, true)
		SetEntityInvincible(playerPed, false)
		NetworkSetEntityInvisibleToNetwork(playerPed, false)
	end
	----print(enable)
end



RegisterNUICallback("leavespecpls", function(data)
	local playerPed = PlayerPedId() -- yourself
	enable = true
	if (target == PlayerId() or target == -1) then 
		enable = false
		----print("Target Player is ourselves, disabling spectate.")
		exports['okokNotify']:Alert("SERVIDOR", "No te podes spectear a vos mism@.", 4500, 'error')
	end
	if(specteando) then
		specteando = false
		if(enable)then
			if(active)then
				if oldCoords then
					RequestCollisionAtCoord(oldCoords.x, oldCoords.y, oldCoords.z)
					Wait(500)
					SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, 0, 0, 0, false)
					oldCoords=nil
				end
				NetworkSetInSpectatorMode(false, targetPed)
				frozen = false
				active = false
				Citizen.Wait(200) -- to prevent staying invisible
				SetEntityVisible(playerPed, true, 0)
				SetEntityCollision(playerPed, true, true)
				SetEntityInvincible(playerPed, false)
				NetworkSetEntityInvisibleToNetwork(playerPed, false)
			else
			SetEntityVisible(playerPed, false, 0)
			SetEntityCollision(playerPed, false, false)
			SetEntityInvincible(playerPed, true)
			NetworkSetEntityInvisibleToNetwork(playerPed, true)
			Citizen.Wait(200) -- to prevent target player seeing you
			if targetPed == playerPed then
				Wait(500)
				targetPed = GetPlayerPed(target)
			end
			active = true
			local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))
			RequestCollisionAtCoord(targetx,targety,targetz)
			NetworkSetInSpectatorMode(true, targetPed)
			end
		else
			if oldCoords then
				RequestCollisionAtCoord(oldCoords.x, oldCoords.y, oldCoords.z)
				Wait(500)
				SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, 0, 0, 0, false)
				oldCoords=nil
			end
			NetworkSetInSpectatorMode(false, targetPed)
			frozen = false
			active = false
			Citizen.Wait(200) -- to prevent staying invisible
			SetEntityVisible(playerPed, true, 0)
			SetEntityCollision(playerPed, true, true)
			SetEntityInvincible(playerPed, false)
			NetworkSetEntityInvisibleToNetwork(playerPed, false)
		end
	else
		return exports['okokNotify']:Alert("SERVIDOR", "No estás specteando a nadie.", 4500, 'error')
	end
end)