ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand('pedmenu', function ()
    OpenPedMenu()
end)

RegisterKeyMapping('pedmenu', "Abrir Ped Menu", 'keyboard', 'F5')

RegisterNetEvent('gacha_peds:client:openDeletePedMenu')
AddEventHandler('gacha_peds:client:openDeletePedMenu', function(results, currentSource)
    if next(results) ~= nil then
        OpenDeletePedMenu(currentSource, results)
    else
        --ESX.ShowNotification('The player dont have any ped')
    end
end)