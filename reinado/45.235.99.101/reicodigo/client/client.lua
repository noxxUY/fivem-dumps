

--[[
RegisterCommand('11111111111323123123123123123', function(source, args)
    god = not god
    if god then
    SetEntityInvincible(GetPlayerPed(-1), true)
    print("~g~")
  else
    SetEntityInvincible(GetPlayerPed(-1), false)
    print("~r~")
    end
  end)

]]

RegisterNetEvent("openDialogCreate")
AddEventHandler("openDialogCreate", function()
    local input = lib.inputDialog(_U('title'), {
        { type = "input", label = _U('code'), placeholder = "REINADOO-XXXXXXXX" },
        { type = "number", label = _U('maxUse'), default = 1 },
		{ type = 'select', label = 'Premio', options = {
			{ value = 'money', label = 'Efectivo' },
			{ value = 'bank', label = 'Banco' },
			{ value = 'bitcoin', label = 'Bitcoin' },
			{ value = 'item', label = 'Item'},
		}},
        { type = "checkbox", label = "Puede usarse varias veces?", checked = true },
        { type = "number", label = _U('quantity'), default = 1 }
    })

    if input == nil then return end

    ESX.TriggerServerCallback('vyzo_giveaway:createGiveaway', function(cb, code)
        if cb == 'success' then
            ESX.ShowNotification(_U('insert_success'))
            print('Code: ' .. code)
        elseif cb == 'updated' then
            ESX.ShowNotification(_U('updated'))
        else
            ESX.ShowNotification( _U('insert_failed'))
        end
    end, input)
end)

RegisterNetEvent("openDialogRedeem")
AddEventHandler("openDialogRedeem", function()
    local input = lib.inputDialog(_U('redeem'), {
        { type = "input", label = _U('code_redeem'), placeholder = 'VYZO-XXXXXXXX' },
    })

    ESX.TriggerServerCallback('vyzo_giveaway:redeemGiveaway', function(cb)
        if cb == 'success' then
            ESX.ShowNotification(_U('redeem_success'))
        elseif cb == 'empty' then
            ESX.ShowNotification(_U('empty'))
        elseif cb == 'format' then
            ESX.ShowNotification(_U('format'))
        elseif cb == 'not_exist' then
            ESX.ShowNotification(_U('not_exist'))
        elseif cb == 'limit' then
            ESX.ShowNotification(_U('limit'))
        elseif cb == 'full' then
            ESX.ShowNotification(_U('full'))
        elseif cb == 'same_user' then
            ESX.ShowNotification(_U('same_user'))
        end
    end, input)
end)


