ESX = nil

local PlayerData = {}

local bloqueo = {
	Cayo = false,
	Grepesed = false,
}

local x = 200.0
local tron = false
local toggle = false

local zona = {
	Cayo = false,
	Grepesed = false,
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Config.Mansion) do
		local blip = AddBlipForRadius(v.x, v.y, v.z, x)
		SetBlipColour(blip, 1)
		SetBlipAlpha (blip, 64)
		local blipMansion = AddBlipForCoord(v.x, v.y, v.z)	
		SetBlipSprite (blipMansion, 310)
		SetBlipDisplay(blipMansion, 4)
		SetBlipScale  (blipMansion, 0.5)
		SetBlipColour (blipMansion, 1)
		SetBlipAsShortRange(blipMansion, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(k)
		EndTextCommandSetBlipName(blipMansion)
	end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	for k,v in pairs(zona) do
		if v then
			TriggerServerEvent('1974_mansion:bloqueo', k)
		end
	end
end)

RegisterNetEvent("1974_mansion:tron")
AddEventHandler("1974_mansion:tron", function(bool)
	tron = bool
end)

RegisterNetEvent("1974_mansion:start")
AddEventHandler("1974_mansion:start", function(zone)
	bloqueo['Cayo'] = false
	bloqueo['Grepesed'] = false
	zona[zone] = true
end)

RegisterNetEvent("1974_mansion:bloqueo")
AddEventHandler("1974_mansion:bloqueo", function(zone)
	bloqueo[zone] = true
end)

Citizen.CreateThread(function()
	while true do
		Wait(5)
		for k,v in pairs(bloqueo) do
			if v and not tron then
				local ped = PlayerPedId()
				local playerCoords = GetEntityCoords(ped)
				local distance = #(playerCoords - Config.Mansion[k])
				if distance < x and not IsPedDeadOrDying(ped, 1) then		
					ESX.ShowNotification("~r~NO PUEDES ESTAR AQUI, YA FUISTE ABATIDO EN ESTE LUGAR!")
					ApplyDamageToPed(ped, 10, false)
					Wait(4000)
				end
			end
			
		end
		
		--[[
		if bloqueo and not tron then
			local ped = PlayerPedId()
			local playerCoords = GetEntityCoords(ped)
			local distance = #(playerCoords - Config.Mansion)
			if distance < x and not IsPedDeadOrDying(ped, 1) then		
				ESX.ShowNotification("~r~NO PUEDES ESTAR AQUI, YA FUISTE ABATIDO EN ESTE LUGAR!")
				ApplyDamageToPed(ped, 10, false)
				Wait(4000)
			end
		end
		]]--
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(250)
		local ped = PlayerPedId()
		local playerCoords = GetEntityCoords(ped)
		
		for k,v in pairs(zona) do
			if v then
				local distance = #(playerCoords - Config.Mansion[k])
				if distance < x and not toggle then
					toggle = true
					TriggerServerEvent('1974_mansion:addlist', k)
					TriggerServerEvent('esx_ambulancejob:farmeo', true)
				elseif distance > x and toggle then
					toggle = false
					TriggerServerEvent('1974_mansion:removelist', k)
					TriggerServerEvent('esx_ambulancejob:farmeo', false)
				end
			end
		end
		
		--[[
		local distance = #(playerCoords - Config.Mansion)
		if distance < x and not toggle then
			toggle = true
			TriggerServerEvent('1974_mansion:addlist')
			TriggerServerEvent('esx_ambulancejob:farmeo', true)
		elseif distance > x and toggle then
			toggle = false
			TriggerServerEvent('1974_mansion:removelist')
			TriggerServerEvent('esx_ambulancejob:farmeo', false)
		end
		]]--
	end
end)