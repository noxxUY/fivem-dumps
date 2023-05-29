ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('agrio_clothes:getPlayerDressing', function(source, cb)
    local xPlayer  = ESX.GetPlayerFromId(source)
  
    TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
        local count    = store.count('dressing')
        local labels   = {}

        for i=1, count, 1 do
            local entry = store.get('dressing', i)
            table.insert(labels, entry.label)
        end
  
        cb(labels)
    end)
end)

RegisterNetEvent("agrio_clothes:removeOutfit")
AddEventHandler("agrio_clothes:removeOutfit", function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent("esx_datastore:getDataStore", "property", xPlayer.getIdentifier(), function(store)
		local dressing = store.get("dressing") or {}

		table.remove(dressing, label)
		store.set("dressing", dressing)
	end)
end)

ESX.RegisterServerCallback('agrio_clothes:getPlayerOutfit', function(source, cb, num)
    local xPlayer  = ESX.GetPlayerFromId(source)
  
    TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
        local outfit = store.get('dressing', num)
        cb(outfit.skin)
    end)
end)

RegisterServerEvent('agrio_clothes:saveOutfit')
AddEventHandler('agrio_clothes:saveOutfit', function(label, skin)
    print(label)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)

		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		table.insert(dressing, {
			label = label,
			skin  = skin
		})

		store.set('dressing', dressing)
	end)
end)

ESX.RegisterServerCallback('agrio_clothes:removeMoney', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getMoney() >= 25 then
        xPlayer.removeMoney(25)
        cb(true)
    else
        xPlayer.showNotification('No tienes suficiente efectivo')
        cb(false)
    end
end)

ESX.RegisterServerCallback('agrio_clothes:removeMoney2', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getMoney() >= 0 then
        xPlayer.removeMoney(0)
        cb(true)
    else
        xPlayer.showNotification('No tienes suficiente efectivo')
        cb(false)
    end
end)


-- RSKIN --
--[[RegisterNetEvent('esfer-rskin:recargararmas')
AddEventHandler('esfer-rskin:recargararmas', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in ipairs(xPlayer.getLoadout()) do
        --xPlayer.removeWeapon(v.name)
        xPlayer.addWeapon(v.name, v.ammo)
    end
end)]]--

