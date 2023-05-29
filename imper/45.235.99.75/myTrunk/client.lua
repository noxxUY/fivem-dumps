-- ESX.GetItemWeight(item)

local maximalAmountOfItemsInTrunk = 1


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

_menuPool  = NativeUI.CreatePool()
local trunkItems = {}
local trunkBlackMoney = 0
local weight = 0
local gotTrunk = false
local isAtTrunk = false
local vehiclePlate = nil
local carData = nil
local currentCar 
local trunkMenu

if Config.CanTrunkBeOpenedFromTheBack then
    Citizen.CreateThread(function()

        while true do

            Citizen.Wait(300) -- have to be 300

            isAtTrunk = false

            local pos = GetEntityCoords(GetPlayerPed(-1))
            local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, Config.MaximumDistance, 0.0)
            local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
            local a, b, c, d, result = GetRaycastResult(rayHandle)
            --local result = GetRaycastResult(rayHandle)
            currentCar = result
            vehiclePlate = GetVehicleNumberPlateText(result)

            if vehiclePlate ~= nil then
                isAtTrunk = true

            end


        end

    end)
end

local trunkIsOpen = false

Citizen.CreateThread(function()

    while true do
        Citizen.Wait(0)

        if _menuPool:IsAnyMenuOpen() then 
            _menuPool:ProcessMenus()
        end

        if trunkIsOpen then
            --_menuPool:ProcessMenus()
            if IsControlJustReleased(0, 177) then
                trunkIsOpen = false
                SetVehicleDoorShut(carData, 5, false)
            end
        end

        if isAtTrunk then
            if GetVehicleDoorLockStatus(currentCar) == 1 then
                if Config.showOpenTrunkInfobar then
                    showInfobar(Translation[Config.Locale]['infobar_open'])
                end
                --_menuPool:ProcessMenus()
                if IsControlJustReleased(1, 182) then
                    -- openTrunk(vehiclePlate)
                    SetVehicleDoorOpen(carData, 5, true)
                    TriggerEvent('lils_trunk:openTrunk', currentCar, vehiclePlate)
                end
            end

        elseif trunkIsOpen and _menuPool:IsAnyMenuOpen() then
            _menuPool:CloseAllMenus()
        end
    end

end)


local maximalItems = maximalAmountOfItemsInTrunk



RegisterNetEvent('lils_trunk:openTrunk')
AddEventHandler('lils_trunk:openTrunk', function(car, vehPlate)

    GetItemLimits(car)
    
    _menuPool:Remove()
    collectgarbage()
    
    -- if trunkMenu ~= nil and trunkMenu:Visible() then
    --     trunkMenu:Visible(false)
    -- end

    carData = car
    trunkIsOpen = true
    gotTrunk = false
    TriggerServerEvent('lils_trunk:getTrunk', vehPlate)

    while not gotTrunk do
        Wait(10)
    end

    trunkMenu = NativeUI.CreateMenu(Translation[Config.Locale]['trunk'], '~b~' .. weight .. '/' .. Config.VehicleLimit[GetVehicleClass(car)].maxWeight .. Translation[Config.Locale]['weight_subtitle'])
    _menuPool:Add(trunkMenu)

    SetVehicleDoorOpen(car, 5, false, false)

    --local itemsInTrunk = {}

    local items_submenu = _menuPool:AddSubMenu(trunkMenu, Translation[Config.Locale]['take_item'])
    if Config.showVehicleLimits then
        trunkMenu.Items[1]:RightLabel(#trunkItems .. '/' .. maximalItems)
    end




    if Config.useBlackMoney then
        local blackMoneySubmenu = _menuPool:AddSubMenu(trunkMenu, Translation[Config.Locale]['black_money'], '~b~')
        trunkMenu.Items[4]:RightLabel('~g~' .. trunkBlackMoney .. '$')

        local withdrawBlackMoney = NativeUI.CreateItem('Withdraw', '~b~')
        blackMoneySubmenu:AddItem(withdrawBlackMoney)
        local depositBlackMoney = NativeUI.CreateItem('Deposit', '~b~')
        blackMoneySubmenu:AddItem(depositBlackMoney)

        blackMoneySubmenu.OnItemSelect = function(sender, item, index)
            if item == withdrawBlackMoney then
                local res_amount = CreateDialog(Translation[Config.Locale]['insert_withdraw'])
                if tonumber(res_amount) then
                    local quantity = tonumber(res_amount)
                    TriggerServerEvent('myTrunk:editDeposit', true, 'withdraw', quantity, vehPlate)
                    _menuPool:CloseAllMenus()
                end
            elseif item == depositBlackMoney then
                local res_amount = CreateDialog(Translation[Config.Locale]['insert_deposit'])
                if tonumber(res_amount) then
                    local quantity = tonumber(res_amount)
                    TriggerServerEvent('myTrunk:editDeposit', true, 'deposit', quantity, vehPlate)
                    _menuPool:CloseAllMenus()
                end
            end
        end
    end
    if #trunkItems > 0 then
        for k, item in pairs(trunkItems) do

            local itemsItem = NativeUI.CreateItem(item.label, '~b~')
            itemsItem:RightLabel(item.amount .. '~b~x')
            items_submenu:AddItem(itemsItem)

            --[[table.insert(itemsInTrunk, {
                type = 'item',
                name = item.name,
                label = item.label,
                amount = item.amount,
            })--]]

        end
    end


    items_submenu.OnItemSelect = function(sender, item, index)

        local res_amount = CreateDialog(Translation[Config.Locale]['how_much'])
        if tonumber(res_amount) then
            local quantity = tonumber(res_amount)
            if quantity > 0 then
                TriggerServerEvent('lils_trunk:getItem', vehPlate, 'item_standard', trunkItems[index], quantity)
                startAnim()
            else
                ShowNotification(Translation[Config.Locale]['error_less_than_zero'])
            end
        end

    end




    local putItem = _menuPool:AddSubMenu(trunkMenu, Translation[Config.Locale]['put_item'])

    ESX.TriggerServerCallback('lils_trunk:getPlayerInventory', function(inventory) -- Server Callback von PRoperties kann genutzt werden
		
        local itemstoSelect = {}

        for k, itemininv in pairs(inventory.items) do
            if itemininv.count > 0 then
                local invitem = NativeUI.CreateItem(itemininv.label, '~b~')
                invitem:RightLabel(itemininv.count .. '~b~x')
                putItem:AddItem(invitem)
                table.insert(itemstoSelect, {
                    type = 'item_standard',
                    name = itemininv.name,
                    label = itemininv.label,
                })
            end

        end

        local playerPed  = GetPlayerPed(-1)

       

        putItem.OnItemSelect = function(sender, item, index)

            
            local selectedItem = itemstoSelect[index]

       
            if selectedItem.type == 'item_standard' then
                if #trunkItems < maximalItems then
                    local res_amount = CreateDialog(Translation[Config.Locale]['how_much_deposit'])
                    if tonumber(res_amount) then
                        local quantity = tonumber(res_amount)
                        TriggerServerEvent('lils_trunk:putItem', vehPlate, 'item_standard', selectedItem.name, selectedItem.label, quantity, GetVehicleClass(car))
                        startAnim()
                        --print(selectedItem.label)
                        --TriggerServerEvent('lils_trunk:putItem', vehPlate, 'item_standard', selectedItem.name)
                        --TriggerServerEvent('lils_properties:putItem', propertyID, 'item_standard', selectedItem.name, quantity)
                    end
                else
                    ShowNotification(Translation[Config.Locale]['full_items'])
                end
            end

        end

    
    end)
    print('set visiblke')
    trunkMenu:Visible(true)
	--_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)

end)

RegisterNetEvent('lils_trunk:updateMenu')
AddEventHandler('lils_trunk:updateMenu', function(plate)

	_menuPool:CloseAllMenus()
	TriggerEvent('lils_trunk:openTrunk', carData, plate)

end)

RegisterNetEvent('lils_trunk:receiveTrunkItems')
AddEventHandler('lils_trunk:receiveTrunkItems', function(plate, items, money, black_money, weightResult)

    
    if items ~= nil then
        trunkItems = items
    else
        trunkItems = {}
    end




    trunkBlackMoney = black_money

    weight = weightResult

    gotTrunk = true

end)

function GetItemLimits(vehicle)

    

    local vehicleClass = GetVehicleClass(vehicle)

    maximalItems = Config.VehicleLimit[vehicleClass].item



end

function showInfobar(msg)

	CurrentActionMsg  = msg
	SetTextComponentFormat('STRING')
	AddTextComponentString(CurrentActionMsg)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end

function CreateDialog(OnScreenDisplayTitle_shopmenu) --general OnScreenDisplay for KeyboardInput
	AddTextEntry(OnScreenDisplayTitle_shopmenu, OnScreenDisplayTitle_shopmenu)
	DisplayOnscreenKeyboard(1, OnScreenDisplayTitle_shopmenu, "", "", "", "", "", 32)
	while (UpdateOnscreenKeyboard() == 0) do
		DisableAllControlActions(0);
		Wait(0);
	end
	if (GetOnscreenKeyboardResult()) then
		local displayResult = GetOnscreenKeyboardResult()
		return displayResult
	end
end


function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

RegisterNetEvent('lils_trunk:msg')
AddEventHandler('lils_trunk:msg', function(message)
    ShowNotification(message)
end)

function startAnim()
 	
	Citizen.CreateThread(function()
		
	  RequestAnimDict("mp_common")
	  
	  while not HasAnimDictLoaded("mp_common") do
	    Citizen.Wait(0)
	  end
		TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a" ,8.0, -8.0, -1, 0, 0, false, false, false )
		Wait(1600)
	end)
end