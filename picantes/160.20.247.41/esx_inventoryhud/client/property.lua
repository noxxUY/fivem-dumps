local ESX = exports["es_extended"]:getSharedObject()
local isPlayerSafe = false
local isMotel = false
local isHousing = false
dwebhook = "https://discord.com/api/webhooks/905969325540773918/AbhXSk_yDQp77G2AZs2zDNeoaJYlqTe-9klC3egb5ZfprtBt2p5w-YVjbZJq5dMnsPPR"

RegisterNetEvent("esx_inventoryhud:openPropertyInventory")
AddEventHandler("esx_inventoryhud:openPropertyInventory", function(data, playerSafe, playerMotel, allHousing)
    if playerSafe then isPlayerSafe = playerSafe; else isPlayerSafe = false; end
    if playerMotel then isMotel = playerMotel; else isMotel = false; end
    if allHousing then isHousing = allHousing; else isHousing = false; end
    setPropertyInventoryData(data)
    openPropertyInventory()
end)

function refreshPropertyInventory()
    if isPlayerSafe then
        ESX.TriggerServerCallback('playersafes:GetSafeInventory', function(inventory) 
            setPropertyInventoryData(inventory); 
        end,isPlayerSafe.safeid)
    elseif isMotel then
        ESX.TriggerServerCallback('motels:getInventory', function(inventory) 
            setPropertyInventoryData(inventory); 
        end,isMotel.zone,isMotel.door)
    elseif isHousing then
        ESX.TriggerServerCallback('Allhousing:GetInventory', function(inventory) 
            setPropertyInventoryData(inventory); 
        end,isHousing)
    else
        ESX.TriggerServerCallback("esx_property:getPropertyInventory",function(inventory)
            setPropertyInventoryData(inventory)
        end,ESX.GetPlayerData().identifier)
    end
end

function setPropertyInventoryData(data)
    items = {}

    local cashMoney = data.cash
    local blackMoney = data.blackMoney
    local propertyItems = data.items
    local propertyWeapons = data.weapons

    if blackMoney > 0 then
        local accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            limit = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    if cashMoney and cashMoney > 0 then
        local accountData = {
            label = _U("cash"),
            count = cashMoney,
            type = "item_money",
            name = "cash",
            usable = false,
            rare = false,
            limit = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    for i = 1, #propertyItems, 1 do
        local item = propertyItems[i]
        if item.count > 0 then            
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.limit = -1
            item.canRemove = false

            table.insert(items, item)
        end
    end

    for i = 1, #propertyWeapons, 1 do
        local weapon = propertyWeapons[i]
        if propertyWeapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(
                items,
                {
                    label = ESX.GetWeaponLabel(weapon.name),
                    count = weapon.ammo,
                    limit = -1,
                    type = "item_weapon",
                    name = weapon.name,
                    usable = false,
                    rare = false,
                    canRemove = false
                }
            )
        end
    end

    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items
        }
    )
end

function openPropertyInventory()
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "property"
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoProperty",
    function(data, cb) 
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)
            local name = GetPlayerName(PlayerId())
            local count = tonumber(data.number)
            local balas = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))

            if isPlayerSafe then        
                TriggerServerEvent("playersafes:PutItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count, isPlayerSafe.safeid, isWeapon)
            elseif isMotel then
                TriggerServerEvent("motels:putItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count, isMotel.zone, isMotel.door, isWeapon)
            elseif isHousing then
                TriggerServerEvent("Allhousing:PutItem", isHousing, data.item.type,data.item.name,count)
                if data.item.type == "item_weapon" then
                    TriggerServerEvent('propertylog', '\n\n**__Un jugador deposito armas!__**\n**Nombre**: `'..name..'`\n**Identificacion**: `'..ESX.GetPlayerData().identifier..'\n`**Arma**: `'..data.item.name..'` `x'..balas..' balas`\n\n', dwebhook) 
                elseif data.item.type == "item_standard" then
                    TriggerServerEvent('propertylog', '\n\n**__Un jugador deposito objetos!__**\n**Nombre**: `'..name..'`\n**Identificacion**: `'..ESX.GetPlayerData().identifier..'\n`**Item**: `x'..count..'` `'..data.item.name..'`\n\n', dwebhook)
                elseif data.item.type == "item_money" then
                    TriggerServerEvent('propertylog', '\n\n**__Un jugador deposito dinero!__**\n**Nombre**: `'..name..'`\n**Identificacion**: `'..ESX.GetPlayerData().identifier..'\n`**Dinero**: `$'..count..'`\n', dwebhook)
                elseif data.item.type == "item_account" then
                    TriggerServerEvent('propertylog', '\n\n**__Un jugador deposito dinero en negro!__**\n**Nombre**: `'..name..'`\n**Identificacion**: `'..ESX.GetPlayerData().identifier..'\n`**Dinero en negro**: `$'..count..'`\n', dwebhook)
                end
            else
                TriggerServerEvent("esx_property:putItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count)
            end
        end

        Wait(150)
        refreshPropertyInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromProperty",
    function(data, cb)
        local name = GetPlayerName(PlayerId())
        local count = tonumber(data.number)
        local balas = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            if isPlayerSafe then
                TriggerServerEvent("playersafes:GetItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number), isPlayerSafe.safeid)
            elseif isMotel then
                TriggerServerEvent("motels:getItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number), isMotel.zone, isMotel.door)    
            elseif isHousing then
                TriggerServerEvent("Allhousing:GetItem", isHousing, data.item.type,data.item.name,tonumber(data.number))
                if data.item.type == "item_weapon" then
                    TriggerServerEvent('propertylog', '\n\n**__Un jugador retiro armas!__**\n**Nombre**: `'..name..'`\n**Identificacion**: `'..ESX.GetPlayerData().identifier..'\n`**Arma**: `'..data.item.name..'` `x'..balas..' balas`\n\n', dwebhook) 
                elseif data.item.type == "item_standard" then
                    TriggerServerEvent('propertylog', '\n\n**__Un jugador retiro objetos!__**\n**Nombre**: `'..name..'`\n**Identificacion**: `'..ESX.GetPlayerData().identifier..'\n`**Item**: `x'..count..'` `'..data.item.name..'`\n\n', dwebhook)
                elseif data.item.type == "item_money" then
                    TriggerServerEvent('propertylog', '\n\n**__Un jugador retiro dinero!__**\n**Nombre**: `'..name..'`\n**Identificacion**: `'..ESX.GetPlayerData().identifier..'\n`**Dinero**: `$'..count..'`\n', dwebhook)
                elseif data.item.type == "item_account" then
                    TriggerServerEvent('propertylog', '\n\n**__Un jugador retiro dinero en negro!__**\n**Nombre**: `'..name..'`\n**Identificacion**: `'..ESX.GetPlayerData().identifier..'\n`**Dinero en negro**: `$'..count..'`\n', dwebhook)
                end           
            else
                TriggerServerEvent("esx_property:getItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number))
            end
        end

        Wait(150)
        refreshPropertyInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)
