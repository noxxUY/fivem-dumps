local ESX = exports['es_extended']:getSharedObject()

-- base
local xcustomcmd = ''
-- suggestions
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'players', 'see players id and name above head')
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'dv', 'delete vehicle')
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'godmode', 'admin godmode')
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'noclip', 'admin noclip')
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'clearchat', 'clear chat for all players')
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'mute', 'mute player from chat and voice', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'unmute', 'unmute player from chat and voice', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'check', 'check player', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'spectate', 'spectate player', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'warn', 'send warn player', {{ name='player', help='player id' }, { name='warn', help='warn text' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'giveveh', 'give vehicle to player', {{ name='player', help='player id' }, { name='name', help='vehicle name' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'fixveh', 'fix vehicle player', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'setped', 'change ped player', {{ name='player', help='player id' }, { name='name', help='ped name' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'freeze', 'freeze player', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'unfreeze', 'unfreeze player', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'screenshot', 'screenshot player', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'slay', 'slay player', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'announce', 'send announce for all players', {{ name='announce', help='announce text' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'bring', 'teleport player to me', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'goto', 'teleport me to player', {{ name='player', help='player id' }})
TriggerEvent('chat:addSuggestion', '/'..xcustomcmd..'kick', 'kick player', {{ name='player', help='player id' }, { name='reason', help='kick reason' }})
-- functions
function ShowNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end
-- mute & unmute
local mute = false
Citizen.CreateThread(function()
	while true do
		if mute then
			DisableControlAction(0, 245, true)
			DisableControlAction(0, 249, true)
			Citizen.Wait(0)
		else
			Citizen.Wait(1000)
		end
	end
end)
RegisterNetEvent('xadmin:mute')
AddEventHandler('xadmin:mute', function()
	mute = true
end)
RegisterNetEvent('xadmin:unmute')
AddEventHandler('xadmin:unmute', function()
	mute = false
end)
-- check
RegisterNetEvent('xadmin:check')
AddEventHandler('xadmin:check', function(check)
	ShowNotification('Check !!!\n'..check)
end)
-- tpw
RegisterNetEvent('xadmin:tpw')
AddEventHandler('xadmin:tpw', function()
	local WaypointHandle = GetFirstBlipInfoId(8)
	if DoesBlipExist(WaypointHandle) then
		local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
		for height = 1, 1000 do
			SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords['x'], waypointCoords['y'], height + 0.0)
			local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords['x'], waypointCoords['y'], height + 0.0)
			if foundGround then
				SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords['x'], waypointCoords['y'], height + 0.0)
				break
			end
			Wait(1)
		end
	end
end)
-- spectate
local cdspectate = false
local spectate = false
local lastcoords = nil
local positionped = nil
local spectateped = nil
RegisterNetEvent('xadmin:spectate')
AddEventHandler('xadmin:spectate', function(coords, playerId)
	if not cdspectate then
		cdspectate = true
		if spectate then
			spectate = false
			Wait(300)
			RequestCollisionAtCoord(positionped)
			NetworkSetInSpectatorMode(false, spectateped)
			FreezeEntityPosition(PlayerPedId(), false)
			SetEntityCoords(PlayerPedId(), lastcoords)
			SetEntityVisible(PlayerPedId(), true)
			lastcoords = nil
			positionped = nil
			spectateped = nil
			cdspectate = false
		else
			spectate = true
			foundplayer = false
			lastcoords = GetEntityCoords(PlayerPedId())
			SetEntityVisible(PlayerPedId(), false)
			SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z + 10.0)
			FreezeEntityPosition(PlayerPedId(), true)
			Wait(1500)
			SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z - 10.0)
			for _, i in ipairs(GetActivePlayers()) do
				if NetworkIsPlayerActive(i) and tonumber(GetPlayerServerId(i)) == tonumber(playerId) then
					foundplayer = true
					ped = GetPlayerPed(i)
					positionped = GetEntityCoords(ped)
					spectateped = ped
					RequestCollisionAtCoord(positionped)
					NetworkSetInSpectatorMode(true, spectateped)
					cdspectate = false
					while spectate do
						Wait(100)
						local cped = GetEntityCoords(spectateped)
						if cped.x == 0 and cped.y == 0 and cped.z == 0 then
							spectate = false
							Wait(300)
							RequestCollisionAtCoord(positionped)
							NetworkSetInSpectatorMode(false, spectateped)
							FreezeEntityPosition(PlayerPedId(), false)
							SetEntityCoords(PlayerPedId(), lastcoords)
							SetEntityVisible(PlayerPedId(), true)
							lastcoords = nil
							positionped = nil
							spectateped = nil
							cdspectate = false
						else
							SetEntityCoords(PlayerPedId(), cped.x, cped.y, cped.z - 10.0)
						end
					end
					break
				end
			end
			if not foundplayer then
				FreezeEntityPosition(PlayerPedId(), false)
				SetEntityCoords(PlayerPedId(), lastcoords)
				SetEntityVisible(PlayerPedId(), true)
				lastcoords = nil
				spectate = false
				cdspectate = false
			end
		end
	end
end)
-- players
local players = false
RegisterNetEvent('xadmin:players')
AddEventHandler('xadmin:players', function()
	players = not players
end)
Citizen.CreateThread(function()
	while true do
		if players then
			for _, i in ipairs(GetActivePlayers()) do
				if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= PlayerPedId() then
					PPed = GetPlayerPed(i)
					PPlayer = CreateFakeMpGamerTag(PPed, '[' .. GetPlayerServerId(i) .. '] ' .. GetPlayerName(i), false, false, '', false)
					SetMpGamerTagVisibility(PPlayer, 0, true)
					if NetworkIsPlayerTalking(i) then
						SetMpGamerTagVisibility(PPlayer, 9, true)
						
					else
						SetMpGamerTagVisibility(PPlayer, 9, false)
					end
				end
			end
			Citizen.Wait(100)
		else
			for _, i in ipairs(GetActivePlayers()) do
				if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= PlayerPedId() then
					PPed = GetPlayerPed(i)
					PPlayer = CreateFakeMpGamerTag(PPed, '[' .. GetPlayerServerId(i) .. '] ' .. GetPlayerName(i), false, false, '', false)
					SetMpGamerTagVisibility(PPlayer, 0, false)
					SetMpGamerTagVisibility(PPlayer, 9, false)
				end
			end
			Citizen.Wait(1000)
		end
	end
end)
-- dv
RegisterNetEvent('xadmin:dv')
AddEventHandler('xadmin:dv', function()
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		local xveh = GetVehiclePedIsIn(PlayerPedId(), false)
		SetEntityAsMissionEntity(xveh, false, false)
		DeleteEntity(xveh)
	end
end)
-- warn
RegisterNetEvent('xadmin:warn')
AddEventHandler('xadmin:warn', function(reason)
	ShowNotification('Warn !!!\n'..reason)
	AnimpostfxPlay('ExplosionJosh3', 3000, false)
end)
-- fixveh
RegisterNetEvent('xadmin:fixveh')
AddEventHandler('xadmin:fixveh', function()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		SetVehicleOnGroundProperly(vehicle)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn(vehicle, true, true)
		SetVehicleFixed(vehicle)
		SetVehicleDirtLevel(vehicle, 0)
	end
end)
-- setped
RegisterNetEvent('xadmin:setped')
AddEventHandler('xadmin:setped', function(name)
	local pedloadstatus = true
	local pedhash = GetHashKey(name)
	RequestModel(pedhash)
	local waiting = 0
	while not HasModelLoaded(pedhash) do
		if waiting > 10000 then					
			pedloadstatus = false
			break
		else
			Wait(100)
			waiting = waiting + 100
		end
	end
	if pedloadstatus then
		SetPlayerModel(PlayerId(), pedhash)
		SetModelAsNoLongerNeeded(pedhash)
	end
end)
-- giveveh
RegisterNetEvent('xadmin:giveveh')
AddEventHandler('xadmin:giveveh', function(name)
	local sveh = true
	local vehiclehash = GetHashKey(name)
	RequestModel(vehiclehash)
	local waiting = 0
	while not HasModelLoaded(vehiclehash) do
		if waiting > 10000 then					
			sveh = false
			break
		else
			Wait(100)
			waiting = waiting+100
		end
	end
	if sveh then
		local coords = GetEntityCoords(PlayerPedId(), true)
		local veh = CreateVehicle(vehiclehash, coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()), true, false)
		SetVehicleDirtLevel(veh, 0)
		SetVehicleEngineOn(veh, true, true, true)
		SetPedIntoVehicle(PlayerPedId(), veh, -1)
		SetModelAsNoLongerNeeded(vehiclehash)
	end
end)
-- freeze & unfreeze
RegisterNetEvent('xadmin:freeze')
AddEventHandler('xadmin:freeze', function()
	FreezeEntityPosition(PlayerPedId(), true)
end)
RegisterNetEvent('xadmin:unfreeze')
AddEventHandler('xadmin:unfreeze', function()
	FreezeEntityPosition(PlayerPedId(), false)
end)
-- screenshot
RegisterNetEvent('xadmin:screenshot')
AddEventHandler('xadmin:screenshot', function(xswebhook)
	if xswebhook ~= 'none' then
		exports['screenshot-basic']:requestScreenshotUpload(xswebhook, 'files[]')
	end
end)
-- godmode
local godmode = false
RegisterNetEvent('xadmin:godmode')
AddEventHandler('xadmin:godmode', function()
	NetworkSetFriendlyFireOption(godmode)
	SetEntityInvincible(PlayerPedId(), not godmode)
	godmode = not godmode
end)
-- announce
RegisterNetEvent('xadmin:announce')
AddEventHandler('xadmin:announce', function(announce)
	ShowNotification('Announce !!!\n'..announce)
end)

-- Noclip V2

local noclip = false

local noclip_config = {
	Speeds = {
        -- You can add or edit existing speeds with relative label
        { speed = 0 },
        { speed = 0.5 },
        { speed = 1 },
        { speed = 3 },
        { speed = 5 },
        { speed = 7 },
    },
}

local noclip_entity = false
local noclip_cam = true
local index = 1
local noclip_speed = noclip_config.Speeds[index].speed

local freeze              = false
local isMenuOpened        = false
local isMenuOpenedPlayers = false


local firstSpawn = true


RegisterNetEvent('reinado_staff:nocliped')
AddEventHandler('reinado_staff:nocliped', function(menu)

		
		local ped = PlayerPedId()
		if not noclip then
			if IsPedInAnyVehicle(PlayerPedId(), false) then
				noclip_entity = GetVehiclePedIsIn(PlayerPedId(), false)
			else
				noclip_entity = PlayerPedId()
			end
	
			SetEntityAlpha(noclip_entity, 51, 0)
			if(noclip_entity ~= PlayerPedId()) then
				SetEntityAlpha(PlayerPedId(), 51, 0)
			end
		else
			ResetEntityAlpha(noclip_entity)
			if(noclip_entity ~= PlayerPedId()) then
				ResetEntityAlpha(PlayerPedId())
			end
		end
	
		SetEntityCollision(noclip_entity, noclip, noclip)
		FreezeEntityPosition(noclip_entity, not noclip)
		SetEntityInvincible(noclip_entity, not noclip)
		SetEntityVisible(noclip_entity, noclip, not noclip);
		SetEveryoneIgnorePlayer(PlayerPedId(), not noclip);
		SetPoliceIgnorePlayer(PlayerPedId(), not noclip);
	
		noclip = not noclip

end)


Citizen.CreateThread(function()
	buttons = setupScaleform("instructional_buttons")
	while true do
		while noclip do
			if IsPedArmed(PlayerPedId(), 4) then
				SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
				DisablePlayerFiring(PlayerPedId(), true)
				SetWeaponDamageModifierThisFrame(GetSelectedPedWeapon(cache.ped), -1000)
				-- change weapon status
				TriggerEvent('inventory:changeWeaponStatus')
			end
			DrawScaleformMovieFullscreen(buttons)
			local yoff = 0.0
			local zoff = 0.0

			if IsDisabledControlPressed(0, 32) then
				yoff = 0.5
			end
			
			if IsDisabledControlPressed(0, 33) then
				yoff = -0.5
			end

			if IsDisabledControlPressed(0, 85) then
				zoff = 0.2
			end
			
			if IsDisabledControlPressed(0, 48) then
				zoff = -0.2
			end

			if not noclip_cam and IsDisabledControlPressed(0, 34) then
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())+3)
			end
			
			if not noclip_cam and IsDisabledControlPressed(0, 35) then
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())-3)
			end
			
			local newPos = GetOffsetFromEntityInWorldCoords(noclip_entity, 0.0, yoff * (noclip_speed + 0.3), zoff * (noclip_speed + 0.3))
			local heading = GetEntityHeading(noclip_entity)
			
			SetEntityVelocity(noclip_entity, 0.0, 0.0, 0.0)
			SetEntityRotation(noclip_entity, 0.0, 0.0, 0.0, 0, false)
			if(noclip_cam) then
				SetEntityHeading(noclip_entity, GetGameplayCamRelativeHeading());
			else
				SetEntityHeading(noclip_entity, heading);
			end
			SetEntityCoordsNoOffset(noclip_entity, newPos.x, newPos.y, newPos.z, true, true, true)

			SetLocalPlayerVisibleLocally(true);
			Citizen.Wait(0)
		end
		Citizen.Wait(0)
	end
end)


function Button(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function setupScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(1)
    end

    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    Button(GetControlInstructionalButton(0, 21, true))
    ButtonMessage("Velocidad: "..noclip_speed)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end


function getPosition()
	local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
	return x, y, z
end

function getCamDirection()
	local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
	local pitch   = GetGameplayCamRelativePitch()
	
	local x       = -math.sin(heading * math.pi / 180.0)
	local y       = math.cos(heading * math.pi / 180.0)
	local z       = math.sin(pitch * math.pi / 180.0)
	
	local len     = math.sqrt(x * x + y * y + z * z)
	if len ~= 0 then
		x = x / len
		y = y / len
		z = z / len
	end
	
	return x, y, z
end



-- clearchat
RegisterNetEvent('xadmin:clearchat')
AddEventHandler('xadmin:clearchat', function()
	TriggerEvent('chat:clear')
end)



				RegisterCommand('noclip_cam', function()
					noclip_cam = not noclip_cam
				end, false)
				
				RegisterCommand('noclip_speed', function()
					if index ~= #noclip_config.Speeds then
						index = index + 1
						noclip_speed = noclip_config.Speeds[index].speed
					else
						noclip_speed = noclip_config.Speeds[1].speed
						index = 1
					end
					setupScaleform("instructional_buttons")
				end, false)



