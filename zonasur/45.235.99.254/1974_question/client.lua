ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local questionOpen = false
local firstSpawn = true
--[[
AddEventHandler('playerSpawned', function()
	if firstSpawn then
		local src = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
		TriggerServerEvent('antirpquestion:didQuestion', src)
		firstSpawn = false
	end
end)


AddEventHandler('playerSpawned', function(spawn)
	local src = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
	TriggerServerEvent('antirpquestion:didQuestion', src)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source)
	CreateThread(function()
		Wait(5000)
		local src = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
		TriggerServerEvent('antirpquestion:didQuestion', src)
	end)
end)

AddEventHandler('esx:onPlayerSpawn', function()
	if firstSpawn then
		firstSpawn = false
		local src = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
		TriggerServerEvent('antirpquestion:didQuestion', src)
	end	
end)
]]
RegisterNetEvent('antirpquestion:notMade')
AddEventHandler('antirpquestion:notMade', function()	
	--local player = PlayerId()
	--local ped = PlayerPedId()
	--SetEntityCollision(ped, false)
    --FreezeEntityPosition(ped, true)
    --SetPlayerInvincible(player, true)
	
	while not ESX.IsPlayerLoaded() do 
        Citizen.Wait(500)
    end
	
	local ped = PlayerPedId()
	
	if ESX.IsPlayerLoaded() then
		Wait(500)
		FreezeEntityPosition(ped, true)
		SetEntityCollision(ped, false)
	end
	
	while true do
		Wait(5)
		x, y, z = table.unpack(GetEntityCoords(ped, true))	
		DrawText3Ds(x, y, z , "PRESIONA ~g~[E]~w~ PARA ABRIR EL CUESTIONARIO")
		if IsControlJustPressed(1, 38) then
			openGui()
			break
		end
	end	
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.65, 0.65)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

RegisterNetEvent('antirpquestion:cerrar')
AddEventHandler('antirpquestion:cerrar', function()
	closeGui()
end)

-- ***************** Open Gui and Focus NUI
function openGui()
	--local ped = PlayerPedId()
	questionOpen = true
	--FreezeEntityPosition(ped, true)
	SetNuiFocus(true)
	SendNUIMessage({openQuestion = true})
end

-- ***************** Close Gui and disable NUI
function closeGui()
	local ped = PlayerPedId()
	questionOpen = false
	FreezeEntityPosition(ped, false)
	SetEntityCollision(ped, true)
	SetNuiFocus(false)
	SendNUIMessage({openQuestion = false})
end

-- ***************** Disable controls while GUI open


Citizen.CreateThread(function()
	while true do
		if questionOpen then
			local ply = GetPlayerPed(-1)
			local active = true
			DisableControlAction(0, 1, active) -- LookLeftRight
			DisableControlAction(0, 2, active) -- LookUpDown
			DisablePlayerFiring(ply, true) -- Disable weapon firing
			DisableControlAction(0, 142, active) -- MeleeAttackAlternate
			DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
			if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
				SendNUIMessage({type = "click"})
			end
		end
    Citizen.Wait(0)
	end
end)

-- ***************** NUI Callback Methods
-- Callbacks pages opening

RegisterNUICallback('question', function(data, cb)
	SendNUIMessage({openSection = "question"})
	cb('ok')
end)

-- Callback actions triggering server events
RegisterNUICallback('close', function(data, cb)
	closeGui()	
	TriggerServerEvent('antirpquestion:success')
	--local player = PlayerId()
    --SetPlayerInvincible(player, false)
	cb('ok')
end)

RegisterNUICallback('kick', function(data, cb)
	closeGui()
	TriggerServerEvent('antirpquestion:kick')
	cb('ok')
end)
--[[
RegisterCommand('testeando', function()
	local src = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
	local playerPed = PlayerPedId()
	ESX.ShowNotification(src)
	TriggerServerEvent('antirpquestion:didQuestion', src)
end, false)
]]