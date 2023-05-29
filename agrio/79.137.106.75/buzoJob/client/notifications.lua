function notify(text, timer)
    if timer == nil then
        timer = 5000
    end
    -- exports['mythic_notify']:DoCustomHudText('inform', text, timer)
    -- exports.pNotify:SendNotification({layout = 'centerLeft', text = text, type = 'error', timeout = timer})
    ESX.ShowNotification(text)
end