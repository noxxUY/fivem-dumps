
local ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('Roda_Tops:ShowMillonarios')
AddEventHandler('Roda_Tops:ShowMillonarios', function (data, name, fotos)
    SetNuiFocus(true, true)
    SendNUIMessage({
        open = true;
        datos = data;
        nombre = name;
        fotos = fotos;
    })
end)


RegisterNUICallback("exit" , function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        open = false;
    })
end)


function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end

RegisterCommand('fotito', function()
    local url = nil 
    CreateMobilePhone(1)
    CellCamActivate(true, true) 
    CellFrontCamActivate(true)
    Citizen.Wait(1000)
    exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/945401887321100308/n71IN0Nbs3qjcqu36jW9oCH3jrNqvMlFrz0rWr0aWMGXQaIN84KkYWM5T7egFQZfCzZu', "files[]", function(data)
        local image = json.decode(data)
        url = image.attachments[1].url
        TriggerServerEvent('Roda_Tops:SaveImg', url)
    end)
    Citizen.Wait(3000)
    DestroyMobilePhone()
    CellCamActivate(false, false) 
end)