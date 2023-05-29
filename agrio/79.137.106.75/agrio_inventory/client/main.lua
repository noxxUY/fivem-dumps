local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

local trunkData = nil
local isInInventory = false
ESX = nil
local fastWeapons = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
    [4] = nil,
    [5] = nil
}

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(10)
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if IsControlJustReleased(0, Config.OpenControl) and IsInputDisabled(0) then
                Citizen.Wait(0)
                openInventory()
            end
        end
    end
)
exports('openInventory', openInventory)
function openInventory()
    loadPlayerInventory()
    isInInventory = true
    
    SendNUIMessage(
        {
            action = "display",
            type = "normal"
        }
    )
    SetNuiFocus(true, true)
end


function closeInventory()
    isInInventory = false
    SendNUIMessage(
        {
            action = "hide"
        }
    )
    SetNuiFocus(false, false)
    ClearPedSecondaryTask(GetPlayerPed(-1))
end

RegisterNUICallback(
    "NUIFocusOff",
    function()
        closeInventory()
        Citizen.Wait(100)
    end
)
RegisterNUICallback(
    "GetNearPlayers",
    function(data, cb)
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayers = false
        local elements = {}
        local nombre  = "Desconocido"
        
        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                foundPlayers = true
                
                table.insert(
                    elements,
                    {
                        label = "Desconocido",
                        player = GetPlayerServerId(players[i])
                    }
            )
            end
        end
        
        if not foundPlayers then
            ESX.ShowNotification(_U("players_nearby"))
        else
            SendNUIMessage(
                {
                    action = "nearPlayers",
                    foundAny = foundPlayers,
                    players = elements,
                    item = data.item,
                    nombre = nombre
                }
        )
        end
        
        cb("ok")
    end
)
RegisterNUICallback(
    "UseItem",
    function(data, cb)
        TriggerServerEvent("esx:useItem", data.item.name)
        Citizen.Wait(500)
        loadPlayerInventory()
        
        cb("ok")
    end
)
RegisterNUICallback(
    "DropItem",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end
        
        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
        end
        
        Wait(500)
        loadPlayerInventory()
        
        cb("ok")
    end
)
RegisterNUICallback(
    "GiveItem",
    function(data, cb)
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayer = false
        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                if GetPlayerServerId(players[i]) == data.player then
                    foundPlayer = true
                end
            end
        end
        
        if foundPlayer then
            local count = tonumber(data.number)
            
            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end
            
            TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)
            Wait(500)
            loadPlayerInventory()
        else
            ESX.ShowNotification(_U("player_nearby"))
        end
        cb("ok")
    end
)
function shouldCloseInventory(itemName)
    for index, value in ipairs(Config.CloseUiItems) do
        if value == itemName then
            return true
        end
    end
    
    return false
end

function shouldSkipAccount(accountName)
    for index, value in ipairs(Config.ExcludeAccountsList) do
        if value == accountName then
            return true
        end
    end
    
    return false
end

function getItemWeight(item)
    local weight = 0
    local itemWeight = 0
    if item ~= nil then
        itemWeight = ESX.GetItemWeight(item)
    end
    return itemWeight
end

function getInventoryWeight(inventory)
    local weight = 0
    local itemWeight = 0
    if inventory ~= nil then
        for i = 1, #inventory, 1 do
            if inventory[i] ~= nil then
                itemWeight = ESX.GetItemWeight(inventory[i].name)
                weight = weight + (itemWeight * (inventory[i].count or 1))
            end
        end
    end
    return weight
end

function loadPlayerInventory()
    ESX.TriggerServerCallback("corleon_inventory:getPlayerInventory",
        function(data)
            items = {}
            fastItems = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons
            weight = data.weight
            maxWeight = data.maxweight
            
            if Config.IncludeAccounts and accounts ~= nil then
                for key, value in pairs(accounts) do
                    if not shouldSkipAccount(accounts[key].name) then
                        local canDrop = accounts[key].name ~= "bank"
                        
                        if accounts[key].money > 0 then
                            accountData = {
                                label = accounts[key].label,
                                count = accounts[key].money,
                                type = "item_account",
                                name = accounts[key].name,
                                usable = false,
                                rare = false,
                                limit = -1,
                                canRemove = canDrop
                            }
                            table.insert(items, accountData)
                        end
                    end
                end
            end

            if inventory ~= nil then
                for key, value in pairs(inventory) do
                    if inventory[key].count <= 0 then
                        inventory[key] = nil
                    else
                        inventory[key].type = "item_standard"
                        table.insert(items, inventory[key])
                    end
                end
            end
            
            if Config.IncludeWeapons and weapons ~= nil then
                local totalFound = false

                for key, value in pairs(weapons) do
                    local weaponHash = GetHashKey(weapons[key].name)
                    local playerPed = PlayerPedId()
                    if HasPedGotWeapon(playerPed, weaponHash, false) and weapons[key].name ~= "WEAPON_UNARMED" then
                        local found = false
                        for slot, weapon in pairs(fastWeapons) do
                            if weapon == weapons[key].name then
                                local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                                table.insert(
                                    fastItems,
                                    {
                                        label = weapons[key].label,
                                        count = ammo,
                                        limit = -1,
                                        type = "item_weapon",
                                        name = weapons[key].name,
                                        usable = false,
                                        rare = false,
                                        canRemove = true,
                                        slot = slot
                                    }
                                )
                                found = true
                                totalFound = true
                                break
                            end
                        end
                        if found == false then
                            local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                            table.insert(
                                items,
                                {
                                    label = weapons[key].label,
                                    count = ammo,
                                    limit = -1,
                                    type = "item_weapon",
                                    name = weapons[key].name,
                                    usable = false,
                                    rare = false,
                                    canRemove = true
                                }
                        )
                        end
                    end
                end

                for key, value in pairs(inventory) do
                    local playerPed = PlayerPedId()
                    local found = false
                    for slot, weapon in pairs(fastWeapons) do
                        if weapon == inventory[key].name then
                            table.insert(
                                fastItems,
                                {
                                    label = inventory[key].label,
                                    count = inventory[key].count,
                                    limit = -1,
                                    type = "item_standard",
                                    name = inventory[key].name,
                                    usable = inventory[key].usable,
                                    rare = false,
                                    canRemove = true,
                                    slot = slot
                                }
                            )
                            for k,v in pairs(items) do
                                if v.name == weapon then
                                    table.remove(items, k)
                                    break
                                end
                            end
                            found = true
                            break
                        end
                    end
                end
            end
            
            local texts = _U("player_info", (weight), (maxWeight))
            
            SendNUIMessage(
                {
                    action = "setItems",
                    itemList = items,
                    fastItems = fastItems,
                    text = texts
                }
        )
        end,
        GetPlayerServerId(PlayerId()))
end

function setHurt()
    FreezeEntityPosition(GetPlayerPed(-1), true)
end

function setNotHurt()
    FreezeEntityPosition(GetPlayerPed(-1), false)
end

RegisterNetEvent("corleon_inventory:openTrunkInventory")
AddEventHandler(
    "corleon_inventory:openTrunkInventory",
    function(data, blackMoney, inventory, weapons)
        setTrunkInventoryData(data, blackMoney, inventory, weapons)
        openTrunkInventory()
    end
)
RegisterNetEvent("corleon_inventory:refreshTrunkInventory")
AddEventHandler(
    "corleon_inventory:refreshTrunkInventory",
    function(data, blackMoney, inventory, weapons)
        setTrunkInventoryData(data, blackMoney, inventory, weapons)
    end
)

function openTrunkInventory()
    loadPlayerInventory()
    isInInventory = true
    local playerPed = GetPlayerPed(-1)
    if not IsEntityPlayingAnim(playerPed, 'mini@repair', 'fixing_a_player', 3) then
        ESX.Streaming.RequestAnimDict('mini@repair', function()
            TaskPlayAnim(playerPed, 'mini@repair', 'fixing_a_player', 8.0, -8, -1, 49, 0, 0, 0, 0)
        end)
    end
    
    SendNUIMessage(
        {
            action = "display",
            type = "trunk"
        }
    )
    SetNuiFocus(true, true)
end

-- HIDE WEAPON WHEEL
--[[Citizen.CreateThread(function()
    Citizen.Wait(2000)
    while true do
        Citizen.Wait(0)
        HideHudComponentThisFrame(19)
        HideHudComponentThisFrame(20)
        BlockWeaponWheelThisFrame()
        DisableControlAction(0, Keys["TAB"], true)
    end
end)]]--

--FAST ITEMS
RegisterNUICallback(
    "PutIntoFast",
    function(data, cb)
        if data.item.slot ~= nil then
            fastWeapons[data.item.slot] = nil
        end
        fastWeapons[data.slot] = data.item.name
        TriggerServerEvent("corleon_inventory:changeFastItem", data.slot, data.item.name)
        loadPlayerInventory()
        cb("ok")
    end
)
RegisterNUICallback(
    "TakeFromFast",
    function(data, cb)
        fastWeapons[data.item.slot] = nil
        TriggerServerEvent("corleon_inventory:changeFastItem", 0, data.item.name)
        loadPlayerInventory()
        cb("ok")
    end
)

local itemsDB = nil

RegisterNetEvent('esx:playerLoaded', function()
    Wait(750)
    ESX.TriggerServerCallback('corleon_inventory:getAllItems', function(items)
        itemsDB = items
    end)
end)

AddEventHandler('onResourceStart', function()
    Wait(750)
    ESX.TriggerServerCallback('corleon_inventory:getAllItems', function(items)
        itemsDB = items
    end)
end)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            if IsDisabledControlJustReleased(1, Keys["1"]) then
                if fastWeapons[1] ~= nil then
                    local typeItem = nil
                    local data = ESX.GetPlayerData()
                    local weaponList = ESX.GetWeaponList()

                    for k,v in pairs(itemsDB) do

                        if fastWeapons[1]:lower() == v.name:lower() then
                            typeItem = 'item_standard'
                            break
                        end

                    end

                    if not typeItem then
                        for k,v in pairs(weaponList) do

                            if fastWeapons[1]:lower() == v.name:lower() then
                                typeItem = 'item_weapon'
                                break
                            end
    
                        end
                    end

                    if typeItem == 'item_weapon' then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[1]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED", true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[1], true)
                        end
                    else
                        local count = 0

                        for k,v in pairs(data.inventory) do
                            if v.name:lower() == fastWeapons[1]:lower() then
                                count = v.count
                                break
                            end
                        end

                        if count > 0 then
                            TriggerServerEvent('esx:useItem', fastWeapons[1])
                        end
                    end
                end
            end
            if IsDisabledControlJustReleased(1, Keys["2"]) then
                if fastWeapons[2] ~= nil then
                    local typeItem = nil
                    local data = ESX.GetPlayerData()
                    local weaponList = ESX.GetWeaponList()

                    for k,v in pairs(itemsDB) do

                        if fastWeapons[2]:lower() == v.name:lower() then
                            typeItem = 'item_standard'
                            break
                        end

                    end

                    if not typeItem then
                        for k,v in pairs(weaponList) do

                            if fastWeapons[2]:lower() == v.name:lower() then
                                typeItem = 'item_weapon'
                                break
                            end
    
                        end
                    end

                    if typeItem == 'item_weapon' then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[2]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED", true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[2], true)
                        end
                    else
                        local count = 0

                        for k,v in pairs(data.inventory) do
                            if v.name:lower() == fastWeapons[2]:lower() then
                                count = v.count
                                break
                            end
                        end

                        if count > 0 then
                            TriggerServerEvent('esx:useItem', fastWeapons[2])
                        end
                    end
                end
            end
            if IsDisabledControlJustReleased(1, Keys["3"]) then
                if fastWeapons[3] ~= nil then
                    local typeItem = nil
                    local data = ESX.GetPlayerData()
                    local weaponList = ESX.GetWeaponList()

                    for k,v in pairs(itemsDB) do

                        if fastWeapons[3]:lower() == v.name:lower() then
                            typeItem = 'item_standard'
                            break
                        end

                    end

                    if not typeItem then
                        for k,v in pairs(weaponList) do

                            if fastWeapons[3]:lower() == v.name:lower() then
                                typeItem = 'item_weapon'
                                break
                            end
    
                        end
                    end

                    if typeItem == 'item_weapon' then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[3]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED", true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[3], true)
                        end
                    else
                        local count = 0

                        for k,v in pairs(data.inventory) do
                            if v.name:lower() == fastWeapons[3]:lower() then
                                count = v.count
                                break
                            end
                        end

                        if count > 0 then
                            TriggerServerEvent('esx:useItem', fastWeapons[3])
                        end
                    end
                end
            end
            if IsDisabledControlJustReleased(1, Keys["4"]) then
                if fastWeapons[4] ~= nil then
                    local typeItem = nil
                    local data = ESX.GetPlayerData()
                    local weaponList = ESX.GetWeaponList()

                    for k,v in pairs(itemsDB) do

                        if fastWeapons[4]:lower() == v.name:lower() then
                            typeItem = 'item_standard'
                            break
                        end

                    end

                    if not typeItem then
                        for k,v in pairs(weaponList) do

                            if fastWeapons[4]:lower() == v.name:lower() then
                                typeItem = 'item_weapon'
                                break
                            end
    
                        end
                    end

                    if typeItem == 'item_weapon' then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[4]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED", true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[4], true)
                        end
                    else
                        local count = 0

                        for k,v in pairs(data.inventory) do
                            if v.name:lower() == fastWeapons[4]:lower() then
                                count = v.count
                                break
                            end
                        end

                        if count > 0 then
                            TriggerServerEvent('esx:useItem', fastWeapons[4])
                        end
                    end
                end
            end
            if IsDisabledControlJustReleased(1, Keys["5"]) then
                if fastWeapons[5] ~= nil then
                    local typeItem = nil
                    local data = ESX.GetPlayerData()
                    local weaponList = ESX.GetWeaponList()

                    for k,v in pairs(itemsDB) do

                        if fastWeapons[5]:lower() == v.name:lower() then
                            typeItem = 'item_standard'
                            break
                        end

                    end

                    if not typeItem then
                        for k,v in pairs(weaponList) do

                            if fastWeapons[5]:lower() == v.name:lower() then
                                typeItem = 'item_weapon'
                                break
                            end
    
                        end
                    end

                    if typeItem == 'item_weapon' then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[5]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED", true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[5], true)
                        end
                    else
                        local count = 0

                        for k,v in pairs(data.inventory) do
                            if v.name:lower() == fastWeapons[5]:lower() then
                                count = v.count
                                break
                            end
                        end

                        if count > 0 then
                            TriggerServerEvent('esx:useItem', fastWeapons[5])
                                end
                            end
                        end
                    end
                end
        end
)
--Add Items--
RegisterNetEvent('corleon_inventory:client:addItem')
AddEventHandler('corleon_inventory:client:addItem', function(itemname, itemlabel)
    local data = {name = itemname, label = itemlabel}
    SendNUIMessage({type = "addInventoryItem", addItemData = data})
end)

local authorizedEvents = {'qb-radialmenu:ToggleProps', 'qb-radialmenu:ToggleClothing'}

function isAuthorized(event)
    for k,v in pairs(authorizedEvents) do
        if v == event then
            return true
        end
    end
    return false
end

-- Clothing Menu

RegisterNUICallback('inventory_options', function(data)
    local isAuthorized = isAuthorized(data.event)
    if isAuthorized then
        data.action = data.action or ''
        TriggerEvent(data.event, data.action)
    else
        print('Ha ocurrido un error')
    end
end)
