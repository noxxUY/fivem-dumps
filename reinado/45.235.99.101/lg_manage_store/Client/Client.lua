local is_choosing_coords = false
local marker = 0
local marker_color = {r = 0, g = 0, b = 0}
local marker_coords = vector3(0.0, 0.0, 0.0)
local offset_marker = 0.0
local scale_marker = 1.0

local is_choosing_moneybox = false
local moneybox_ent = 0

local client_stores = {}
local blips = {}

RegisterCommand(config.command_admin, function()	
    TriggerServerEvent("lg_manage_store:OpenManage")
end)

RegisterKeyMapping('lg_manage_store:'..config.key_open, 'Open Store', 'keyboard', config.key_open)
RegisterCommand('lg_manage_store:'..config.key_open, function()
    local closest, dist = ClosestStore()

    if closest ~= -1 and dist < 2.0 then
        TriggerServerEvent("lg_manage_store:OpenStore", closest.id)
    end
end)

RegisterKeyMapping("lg_manage_store:F5", 'Save Coords', 'keyboard', 'F5')
RegisterCommand("lg_manage_store:F5", function()
    SaveCoords()
    SaveMoneyBox()
end)

RegisterNetEvent("lg_manage_store:OpenStoreClient")
AddEventHandler("lg_manage_store:OpenStoreClient", function()
    local closest, dist = ClosestStore()

    if closest ~= -1 and dist < 2.0 then
        TriggerServerEvent("lg_manage_store:OpenStore", closest.id)
    end
end)

CreateThread(function()
    local sleep = 1000
    while true do
        Wait(sleep)
        if is_choosing_coords then
            ChooseCoords()
            sleep = 0
        elseif is_choosing_moneybox then
            ChooseMoneyBox()
            sleep = 1000
        else
            local closest, dist = ClosestStore()
            if closest ~= -1 and dist < 50.0 then
                ShowMarker(closest)
                sleep = 0
            else
                sleep = 1000
            end
        end
    end
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do 
        Wait(0) 
    end

	Wait(5000)
    TriggerServerEvent('lg_manage_store:LoadStoresClient')
end)

RegisterNetEvent('lg_manage_store:LoadTypes', function(store_type)
    LoadTypes(store_type)
end)
RegisterNetEvent('lg_manage_store:OpenStore', function(information)
    OpenStore(information)
end)
RegisterNetEvent('lg_manage_store:OpenManage', function()
    OpenManage()
end)
RegisterNetEvent('lg_manage_store:UpdateStoresClient',  function(stores)
    UpdateStoresClient(stores)
end)
RegisterNetEvent('lg_manage_store:GetStoreMoney', function(money)
    GetStoreMoney(money)
end)
RegisterNetEvent('lg_manage_store:GetStoreStock', function(stock, products, products_mission)
    GetStoreStock(stock, products, products_mission)
end)
RegisterNetEvent('lg_manage_store:ShowMessage', function(message)
    ShowMessage(message)
end)
RegisterNetEvent('lg_manage_store:ConfirmBuy', function()
    ConfirmBuy()
end)
RegisterNetEvent('lg_manage_store:CancelBuy', function()
    CancelBuy()
end)
RegisterNetEvent('lg_manage_store:ConfirmSell', function()
    ConfirmSell()
end)
RegisterNetEvent('lg_manage_store:CreatedMission', function(missions)
    CreatedMission(missions)
end)
RegisterNetEvent('lg_manage_store:GetAllItems', function(items)
    GetAllItems(items)
end)
RegisterNetEvent('lg_manage_store:ConfirmCart', function(products)
    ConfirmCart(products)
end)
RegisterNetEvent('lg_manage_store:CancelCart', function(products)
    CancelCart(products)
end)
RegisterNetEvent('lg_manage_store:CancelMission', function(missions)
    CancelMission(missions)
end)
RegisterNetEvent('lg_manage_store:DeliverMission', function(missions)
    DeliverMission(missions)
end)
RegisterNetEvent('lg_manage_store:LoadMissions', function(missions)
    LoadMissions(missions)
end)
RegisterNetEvent('lg_manage_store:LoadInformation', function(information)
    LoadInformation(information)
end)
RegisterNetEvent('lg_manage_store:LoadStores', function(stores)
    LoadStores(stores)
end)
RegisterNetEvent('lg_manage_store:TeleportTo', function(store_coords)
    TeleportTo(store_coords)
end)

local configurated = false
function OpenStore(information)
    SetConfigs()
    SendNUIMessage({
        open_store = true,
        information = information,
    })
    SetNuiFocus(true, true)
    TriggerScreenblurFadeIn(1)
end

function OpenManage()
    SetConfigs()
    SendNUIMessage({
        open_manage = true,
    })
    SetNuiFocus(true, true)
    TriggerScreenblurFadeIn(1)
end

function GetStoreMoney(money)
    SendNUIMessage({
        receive_money = true,
        money = money,
    })
end

function LoadTypes(store_types)
    SendNUIMessage({
        load_types = true,
        store_types = store_types,
    })
end

function LoadStores(stores)
    SendNUIMessage({
        receive_stores = true,
        stores = stores,
    })
end

function GetStoreStock(stock, products, products_mission)
    SendNUIMessage({
        receive_stock = true,
        stock = stock,
        products = products,
        products_mission = products_mission,
    })
end

function CreatedMission(missions)
    SendNUIMessage({
        created_mission = true,
        missions = missions,
    })
end

function ShowMarker(store)
    if store.can_marker then
        DrawMarker(store.marker, store.marker_coords.x, store.marker_coords.y, store.marker_coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0+store.marker_scale, 0.0+store.marker_scale, 0.0+store.marker_scale, store.marker_color.r, store.marker_color.g, store.marker_color.b, 50, false, true, 2, true, nil, false)
    end
end

function ShowBlip(store)
    if store.can_blip then
        local blip = AddBlipForCoord(store.marker_coords.x, store.marker_coords.y, store.marker_coords.z)
        SetBlipSprite(blip, store.blip)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, store.blip_color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(store.blip_name)
        EndTextCommandSetBlipName(blip)
        
        
        table.insert(blips, blip)
    end
end

local semaphoro = false
function UpdateStoresClient(stores)   
    while semaphoro do
        Wait(0)
    end
    semaphoro = true

    for i,k in pairs(blips) do
        RemoveBlip(k)
    end

    for i,k in pairs(stores) do
        local r,g,b = ConvertHexToRGB(k.marker_color)
        k.marker_coords = StringToVector3(k.marker_coords)
        k.marker_color = {r=r, g=g, b=b}

        ShowBlip(k)
    end
    
    client_stores = stores
    semaphoro = false
end

function GetAllItems(items)
    SendNUIMessage({
        receive_all_items = true,
        items = items,
    })
end

function ConfirmCart(products)
    SendNUIMessage({
        confirm_cart = true,
        products = products,
    })
end

function CancelCart(products)
    SendNUIMessage({
        cancel_cart = true,
        products = products,
    })
end

function CancelMission(missions)
    SendNUIMessage({
        cancel_mission = true,
        missions = missions,
    })
end

function DeliverMission(missions)
    SendNUIMessage({
        delivered_mission = true,
        missions = missions,
    })
end

function LoadMissions(missions)
    SendNUIMessage({
        load_missions = true,
        missions = missions,
    })
end

function LoadInformation(information)
    SendNUIMessage({
        load_information = true,
        information = information
    })
end

function ClosestStore()
	local ped = GetPlayerPed(-1)
	local pos = GetEntityCoords(ped)
	local min = 99999

	local closest = -1

	for i,k in pairs(client_stores) do
        local dist = #(k.marker_coords - pos)

        if dist < min then
            closest = k
            min = dist
		end
	end

	return closest, min
end

function SaveCoords()
    if is_choosing_coords then
        is_choosing_coords = false

        SendNUIMessage({
            enable_background = true,
            set_coords = true,
            coords = string.format("vector3(%.2f, %.2f, %.2f)", marker_coords.x, marker_coords.y, marker_coords.z),
            scale = string.format("%.2f", scale_marker)
        })
        SetNuiFocus(true, true)
    end
end

function SaveMoneyBox()
    if is_choosing_moneybox then
        is_choosing_moneybox = false

        if moneybox_ent then
            local moneybox_coords = GetEntityCoords(moneybox_ent)
            local moneybox_hash = GetEntityModel(moneybox_ent)

            SetEntityDrawOutline(moneybox_ent, false)

            SendNUIMessage({
                enable_background = true,
                set_moneybox = true,
                coords = string.format("vector3(%.2f, %.2f, %.2f)", moneybox_coords.x, moneybox_coords.y, moneybox_coords.z),
                hash = moneybox_hash,
            })
            SetNuiFocus(true, true)
        end
    end
end

function ChooseCoords()
    local ped = GetPlayerPed(-1)
    marker_coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 2.0, 0.0 + offset_marker)

    HideHudComponentThisFrame(19)
    if IsControlJustReleased(0,  14) then
        offset_marker = offset_marker - 0.2
    elseif IsControlJustReleased(0,  15) then
        offset_marker = offset_marker + 0.2
    elseif IsControlJustReleased(0,  174) then
        scale_marker = scale_marker - 0.2
    elseif IsControlJustReleased(0,  175) then
        scale_marker = scale_marker + 0.2
    end
    
    DrawMarker(marker, marker_coords.x, marker_coords.y, marker_coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0+scale_marker, 0.0+scale_marker, 0.0+scale_marker, marker_color.r, marker_color.g, marker_color.b, 50, false, true, 2, true, nil, false)
end

function ChooseMoneyBox()
    local found, ent = GetEntityPlayerIsFreeAimingAt(PlayerId())
    if found and ent ~= moneybox_ent and not IsEntityAPed(ent) then
        if moneybox_ent then
            SetEntityDrawOutline(moneybox_ent, false)
        end

        SetEntityDrawOutlineShader(0)
        SetEntityDrawOutlineColor(255,0,0,255)
        SetEntityDrawOutline(ent, true)
        moneybox_ent = ent
    end
end

function ConvertHexToRGB(hex)
    local values = {['A'] = 10, ['B'] = 11, ['C'] = 12, ['D'] = 13, ['E'] = 14, ['F'] = 15}
    
    local decimal = {}

    hex = string.sub(hex, 2, string.len(hex))

    for i = 1, string.len(hex) do
        local separated = string.sub(hex, 1, 1)
        hex = string.sub(hex, 2, string.len(hex))

        if not tonumber(separated) then
            separated = values[separated:upper()]
        end

        table.insert(decimal, tonumber(separated))
    end
    local red_int = 16*decimal[1] + decimal[2]
    local green_int = 16*decimal[3] + decimal[4]
    local blue_int = 16*decimal[5] + decimal[6]
    
    return red_int, green_int, blue_int
end

function StringToVector3(text)
    text = string.sub(text, 9, string.len(text)-1)

    local splited = StringSplit(text, ",")
    local vec3 = vector3(tonumber(splited[1]), tonumber(splited[2]), tonumber(splited[3]))

    return vec3
end

function StringSplit(text, separator)
    local splited = {}
    
    while(string.find(text, separator)) do
        local i, j = string.find(text, separator)
        
        if i ~= 1 then
            local start = string.sub(text, 1, i-1)
            table.insert(splited, start)
            text = string.sub(text, i+1, string.len(text))
        end
        Wait(100) -- no crash
    end

    if string.len(text) > 0 then
        table.insert(splited, text)
    end

    return splited
end

function ShowMessage(message)
    SendNUIMessage({
        show_message = true,
        message = message,
    })
end

function ConfirmBuy()
    SendNUIMessage({
        confirm_buy = true,
    })
end

function CancelBuy()
    SendNUIMessage({
        cancel_buy = true,
    })
end

function ConfirmSell()
    SendNUIMessage({
        confirm_sell = true,
    })
end

function TeleportTo(coords)
    local store_coords = StringToVector3(coords)

    DoScreenFadeOut(1000)
    while ( not IsScreenFadedOut() ) do
        Wait(0)
    end	

    local ped = GetPlayerPed(-1)
    FreezeEntityPosition(ped, true)
    StartPlayerTeleport(PlayerId(), store_coords.x, store_coords.y, store_coords.z, 0.0, false, true, true)

    while IsPlayerTeleportActive() do
        Wait(0)
    end

    FreezeEntityPosition(ped, false)  
        
    DoScreenFadeIn(1000)
    while ( not IsScreenFadedIn() ) do
        Wait(0)
    end	  
end

local configurated = false
function SetConfigs()
	if not configurated then
		SendNUIMessage({
			config = true,
			translate = translate,
			weight_system = config.use_weight_system,
            url_images = config.url_images,
			name_resource = GetCurrentResourceName(),
		})

		configurated = true
	end
end

RegisterNUICallback('Close', function(data, cb)
	SetNuiFocus(false, false)
	openned = false
    TriggerScreenblurFadeOut(1)
	cb('ok')
end)

RegisterNUICallback('DisableBackground', function(data, cb)
	SendNUIMessage({
		disable_background = true,
	})
	cb('ok')
end)

RegisterNUICallback('EnableBackground', function(data, cb)
	SendNUIMessage({
		enable_background = true,
	})
	cb('ok')
end)

RegisterNUICallback('ChooseCoords', function(data, cb)
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(1)
	SendNUIMessage({
		disable_background = true,
	})

    marker = data.marker
    local r,g,b = ConvertHexToRGB(data.marker_color)
    marker_color = {r = r, g = g, b = b}

    is_choosing_coords = true

	cb('ok')
end)

RegisterNUICallback('ChooseMoneyBox', function(data, cb)
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(1)
	SendNUIMessage({
		disable_background = true,
	})
    is_choosing_moneybox = true

	cb('ok')
end)

RegisterNUICallback('LoadTypes', function(data, cb)
    TriggerServerEvent("lg_manage_store:LoadTypes")

	cb('ok')
end)

RegisterNUICallback('SaveType', function(data,cb)
    TriggerServerEvent("lg_manage_store:SaveType", data)
    cb('ok')
end)

RegisterNUICallback('SaveStore', function(data,cb)
    TriggerServerEvent("lg_manage_store:SaveStore", data)
    cb('ok')
end)

RegisterNUICallback('GetStoreMoney', function(data,cb)
    TriggerServerEvent("lg_manage_store:GetStoreMoney", data)
    cb('ok')
end)

RegisterNUICallback('DepositMoney', function(data, cb)
    TriggerServerEvent("lg_manage_store:DepositMoney", data)

	cb('ok')
end)

RegisterNUICallback('WithdrawMoney', function(data, cb)
    TriggerServerEvent("lg_manage_store:WithdrawMoney", data)

	cb('ok')
end)

RegisterNUICallback('ChangeStoreName', function(data, cb)
    TriggerServerEvent("lg_manage_store:ChangeStoreName", data)

	cb('ok')
end)

RegisterNUICallback('GetStoreStock', function(data, cb)
    TriggerServerEvent("lg_manage_store:GetStoreStock", data)

	cb('ok')
end)

RegisterNUICallback('RemoveProduct', function(data, cb)
    TriggerServerEvent("lg_manage_store:RemoveProduct", data)

	cb('ok')
end)

RegisterNUICallback('PutForSaleProduct', function(data, cb)
    TriggerServerEvent("lg_manage_store:PutForSaleProduct", data)

	cb('ok')
end)

RegisterNUICallback('ChangePriceProduct', function(data, cb)
    TriggerServerEvent("lg_manage_store:ChangePriceProduct", data)

	cb('ok')
end)

RegisterNUICallback('CreateMission', function(data, cb)
    TriggerServerEvent("lg_manage_store:CreateMission", data)

	cb('ok')
end)

RegisterNUICallback('BuyStore', function(data, cb)
    TriggerServerEvent("lg_manage_store:BuyStore", data)

	cb('ok')
end)

RegisterNUICallback('SellStore', function(data, cb)
    TriggerServerEvent("lg_manage_store:SellStore", data)

	cb('ok')
end)

RegisterNUICallback('SaveColors', function(data, cb)
    TriggerServerEvent("lg_manage_store:SaveColors", data)

	cb('ok')
end)

RegisterNUICallback('GetAllItems', function(data, cb)
    TriggerServerEvent("lg_manage_store:GetAllItems")

	cb('ok')
end)

RegisterNUICallback('BuyWallet', function(data, cb)
    TriggerServerEvent("lg_manage_store:BuyWallet", data)

	cb('ok')
end)

RegisterNUICallback('BuyBank', function(data, cb)
    TriggerServerEvent("lg_manage_store:BuyBank", data)

	cb('ok')
end)

RegisterNUICallback('BuyBlackMoney', function(data, cb)
    TriggerServerEvent("lg_manage_store:BuyBlackMoney", data)

	cb('ok')
end)

RegisterNUICallback('DeliverMission', function(data, cb)
    TriggerServerEvent("lg_manage_store:DeliverMission", data)

	cb('ok')
end)

RegisterNUICallback('LoadMissions', function(data, cb)
    TriggerServerEvent("lg_manage_store:LoadMissions", data)

	cb('ok')
end)

RegisterNUICallback('LoadInformation', function(data, cb)
    TriggerServerEvent("lg_manage_store:LoadInformation", data)

	cb('ok')
end)

RegisterNUICallback('LoadStores', function(data, cb)
    TriggerServerEvent("lg_manage_store:LoadStores")

	cb('ok')
end)

RegisterNUICallback('TeleportTo', function(data, cb)
    TriggerServerEvent("lg_manage_store:TeleportTo", data)

	cb('ok')
end)

RegisterNUICallback('ManageStore', function(data, cb)
    TriggerServerEvent("lg_manage_store:ManageStore", data)

	cb('ok')
end)

RegisterNUICallback('DeleteStore', function(data, cb)
    TriggerServerEvent("lg_manage_store:DeleteStore", data)

	cb('ok')
end)

RegisterNUICallback('RemoveOwner', function(data, cb)
    TriggerServerEvent("lg_manage_store:RemoveOwner", data)

	cb('ok')
end)

RegisterNUICallback('ChangePriceBuy', function(data, cb)
    TriggerServerEvent("lg_manage_store:ChangePriceBuy", data)

	cb('ok')
end)

RegisterNUICallback('ChangePriceSell', function(data, cb)
    TriggerServerEvent("lg_manage_store:ChangePriceSell", data)

	cb('ok')
end)