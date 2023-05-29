ESX = nil
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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local letsleep = true
        local ped = GetEntityCoords(PlayerPedId(-1))
        for k,v in pairs(Cyclus.OffDuty) do
            local dist = GetDistanceBetweenCoords(ped, v.coords.x, v.coords.y, v.coords.z, true)
            if PlayerData.job ~= nil then
                if PlayerData.job.name == v.job or PlayerData.job.name == v.offjob then
                    if dist < v.distancetext then
                        letsleep = false
                        DrawMarker(20, vector3(v.coords.x, v.coords.y, v.coords.z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
                        DrawScriptText(v.coords.x, v.coords.y, v.coords.z + 0.25, v.text)
                        if IsControlJustReleased(0, 38) then
                            OpenMenu(v.job, v.offjob, v.img)
                        end
                    else
                        if dist < v.distancemarker then
                            DrawMarker(20, vector3(v.coords.x, v.coords.y, v.coords.z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
                            letsleep = false
                        end
                    end
                end
            end
        end
        if letsleep then
            Citizen.Wait(1000)
        end
    end         
end)


function OpenMenu(job, offjob, img)
    SetNuiFocus(true, true)
    TriggerScreenblurFadeIn(0)
    SendNUIMessage({
        action = 'open',
        steamnaam = GetPlayerName(PlayerId()),
        job = job,
        offjob = offjob,
        img = img
    })
end

RegisterNUICallback("veranderjob", function(data, cb)
    TriggerServerEvent("cyclus-offduty:veranderjob", data.job)
end)

RegisterNUICallback("close", function()
    TriggerScreenblurFadeOut(0)
    SetNuiFocus(false, false)
end)

AddEventHandler('onResourceStart', function()
    if GetCurrentResourceName() == 'cyclus-offduty' then
        return
    else
        print('Resource renamen is niet toegestaan')
        print('T.O.S overtreding opgemerkt en verzonden naar development.')
    end
end)


DrawScriptText = function(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end