local JSX = {}

TriggerEvent('esx:getSharedObject', function(obj)
    JSX = obj
end)


JSX.RegisterServerCallback('jsx_bandagesystem:server:buyBandage', function(source, cb, itemToGive, price)
    local _ply = JSX.GetPlayerFromId(source)

    if (_ply.getMoney() >= price) then
        _ply.removeMoney(price)
        _ply.addInventoryItem(itemToGive, 1)

        _ply.showNotification('Has comprado 1 '..itemToGive..' por $'..price)
        
        cb(true)
    else
        _ply.showNotification('Te faltan ' .. math.ceil(_ply.getMoney() - price) .. '$')

        cb(false)
    end
end)

JSX.RegisterServerCallback('jsx_bandagesystem:server:buyLicense', function(source, cb, price)
    local _ply = JSX.GetPlayerFromId(source)

    if (_ply.getMoney() >= price) then
        _ply.removeMoney(price)
		TriggerEvent('esx_license:addLicense', source, 'pami', function()
			cb(true)
		end)
        _ply.showNotification('Has comprado la licencia para pami por ~y~$'..price)
        
        cb(true)
    else
        _ply.showNotification('Te faltan ' .. math.ceil(_ply.getMoney() - price) .. '$')

        cb(false)
    end
end)

JSX.RegisterServerCallback('jsx_bandagesystem:server:notify', function(source, cb)
    local _ply = JSX.GetPlayerFromId(source)

    _ply.showNotification('Estimado cliente @' .. _ply.getName() .. '#' .. math.random(1000,9000) .. ', gracias por registrarse en pami.')
end)