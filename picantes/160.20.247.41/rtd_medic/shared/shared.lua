W = function(src)
    return Citizen.Wait(src)
end

SN = function(txt)
    return ESX.ShowNotification(txt)
end

SHN = function(txt)
    return ESX.ShowHelpNotification(txt)
end

CT = function(h) Citizen.CreateThread(h) end

TSE = function(e, ...) TriggerServerEvent(e, ...) end

RSE = function(e, h) RegisterServerEvent(e); ADH(e, h) end

ADH = function(e, h) AddEventHandler(e, h) end

TE = function(e, ...) TriggerEvent(e, ...) end