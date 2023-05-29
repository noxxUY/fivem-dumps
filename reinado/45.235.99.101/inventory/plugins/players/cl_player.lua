RegisterNetEvent('inventory:openPlayerInventory', function (pid, receiveWeapons)
  local weapons = true

  if receiveWeapons == false then 
    weapons = false
  end

  OpenInventory({type = 'player', id = pid, title = Locales.playerTitle, weight = true, receiveWeapons = weapons, delay = 1000})
end)


-- Unijobs 
RegisterNetEvent('inventory:UniJobs')
AddEventHandler('inventory:UniJobs', function (job, label)
    OpenInventory({
        id = job,
        type = 'jobs', 
        title = 'Deposito de '..label,
        weight = 10000000, 
		receiveWeapons = weapons,
		delay = 1000,
        save = true,
        timeout = 1000
    })
end)


RegisterNetEvent('inventory:Drops')
AddEventHandler('inventory:Drops', function ()
    OpenInventory({
        id = 'dropPingon',
        type = 'drops', 
        title = 'Drop',
        weight = 10000000, 
		delay = 1000,
        save = true,
        timeout = 1000
    })
end)

-- Baul 
RegisterNetEvent('inventory:NariBaul')
AddEventHandler('inventory:NariBaul', function (job, label)
    OpenInventory({
        id = job,
        type = 'jobs', 
        title = 'Deposito de '..label,
        weight = 10000000, 
		receiveWeapons = weapons,
		delay = 1000,
        save = true,
        timeout = 1000
    })
end)

-- Property
RegisterNetEvent('inventory:casas')
AddEventHandler('inventory:casas', function (propiedad, owner)
    OpenInventory({
        id = owner..':'..propiedad.label,
        type = 'casas', 
        title = 'Departamento '.. propiedad.label,
        weight = 20000, 
		receiveWeapons = weapons,
		delay = 1000,
        save = true,
        timeout = 1000
    })
end) 


RegisterNUICallback('notify', function(data, cb)
    exports['mythic_notify']:SendAlert(data.type, data.msg, 5000) -- you can change this to whatever notification system you use
    cb("ok")
end)

RegisterNetEvent('inventory:dropAll') 
AddEventHandler('inventory:dropAll', function()
            local playerPed = PlayerPedId()
            local itemData = {count = math.random(1,5), type = "item_standard", inv = "main", index = 0, name = 'nb-armourhigh', canRemove = true, label = 'Chaleco Pesado', weight = 1, canUse = true}
            TriggerEvent('inventory:dropItem', itemData, itemData.count)
            local propHash = GetHashKey("prop_cs_heist_bag_01")
            local prop = CreateObject(propHash, GetEntityCoords(playerPed), true, false, false)
            local timer = Config.DropTimeout
            Citizen.CreateThread(function()
                while true do
                    if timer < 0 then
                        DeleteObject(prop)
                    end
                    timer = timer - 1
                    Wait(1000)
                end
            end)
end)

RegisterNetEvent('inventory:dropItem') 
AddEventHandler('inventory:dropItem', function(itemData, count)
    DropItem(itemData, count)
end)