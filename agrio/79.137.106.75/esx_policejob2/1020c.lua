ESX = nil
blip = nil
blips = {}
local PlayerData = {}
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)
function loadESX()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(0)
	end
end

--[[RegisterNetEvent('police:blip1020')
AddEventHandler('police:blip1020', function(x, y, z)
	loadESX()
	blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, 56)
	SetBlipScale(blip, 1.0)
	SetBlipColour(blip, 3)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('10-20')
	EndTextCommandSetBlipName(blip)
	table.insert(blips, blip)
	Wait(60 * 1000)
	for i, blip in pairs(blips) do 
		RemoveBlip(blip)
	end
end)

RegisterCommand('1020', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    if PlayerData.job and PlayerData.job.name == 'police' then
		TriggerEvent('chatMessage', '', {255,255,255}, '^8 [OOC] Has envíado tu 10-20 a todas las unidades!')
		TriggerServerEvent('1020:police', location, msg, x, y, z, tipo)
		local msg = '10-20'
	local job = PlayerData.job.name
    TriggerServerEvent('esx_jobChat:chat', job, msg)
    else
		ESX.ShowNotification('Esta función solo está permitida para unidades policiales!')
	end
end)--]]