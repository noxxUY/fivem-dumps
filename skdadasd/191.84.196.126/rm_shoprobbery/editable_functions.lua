function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0, 1)
end

RegisterNetEvent('shoprobbery:client:showNotification')
AddEventHandler('shoprobbery:client:showNotification', function(str)
    if not clientStart then
        ShowNotification(str)
    end
end)

--This event send to all police players
RegisterNetEvent('shoprobbery:client:policeAlert')
AddEventHandler('shoprobbery:client:policeAlert', function(targetCoords)
    ShowNotification(Strings['police_alert'])
    local alpha = 250
    local shopBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 200.0)

-- Set the blip properties to make it more noticeable
SetBlipHighDetail(shopBlip, true)
SetBlipColour(shopBlip, 1)
SetBlipAlpha(shopBlip, alpha)
SetBlipAsShortRange(shopBlip, false)
SetBlipFlashes(shopBlip, true)

-- Set the blip to follow the player for 2 minutes
SetBlipFlashesAlternate(shopBlip, true)
SetBlipFlashTimer(shopBlip, 120000)

-- While the blip is active, gradually decrease its alpha
while alpha ~= 0 do
    Citizen.Wait(500)
    alpha = alpha - 1
    SetBlipAlpha(shopBlip, alpha)

    if alpha == 0 then
        RemoveBlip(shopBlip)
        return
    end
end
end)