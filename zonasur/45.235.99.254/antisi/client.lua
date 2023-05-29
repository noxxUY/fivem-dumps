ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local firstSpawn = true

AddEventHandler('esx:onPlayerSpawn', function()
	if firstSpawn then
		firstSpawn = false
		local min,max = GetModelDimensions(`mp_m_freemode_01`)
        if min.y < -0.29 or max.z > 0.98 then
            TriggerServerEvent('arandor:dimensionHit')
			--TriggerServerEvent('1974_anticheat:BanSystem', "Citizen de Balas Infinitas")
        end
	end	
end)

--[[
Citizen.CreateThread(function()
    while true do
        local min,max = GetModelDimensions(`mp_m_freemode_01`)
        if min.y < -0.29 or max.z > 0.98 then
            TriggerServerEvent('arandor:dimensionHit', min, max)
			--TriggerServerEvent('1974_anticheat:BanSystem', "Citizen de Balas Infinitas")
        end
        Wait(4000)
    end
end)
]]--