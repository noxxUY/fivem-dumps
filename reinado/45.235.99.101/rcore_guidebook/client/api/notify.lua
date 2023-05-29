local gameName = GetGameName()

ESX = exports['es_extended']:getSharedObject()

function Notify (txt)
    if gameName == GameType.REDM then
        TriggerEvent('redem_roleplay:NotifyLeft', 'Help', txt, "generic_textures", "tick", 8000)
    elseif gameName == GameType.FIVEM then

        AddTextEntry('rcore_notify', txt)
        BeginTextCommandThefeedPost('rcore_notify')
        EndTextCommandThefeedPostTicker(false)
        
        ESX.ShowNotification(txt)
    end
end

function showHelpText(txt)
    if gameName == GameType.REDM then
        TriggerEvent('redem_roleplay:Tip', txt, 8000)
    elseif gameName == GameType.FIVEM then
        --Default GTA native
       -- AddTextEntry('showHelpNotify', txt)
     --   BeginTextCommandDisplayHelp('showHelpNotify')
   --     EndTextCommandDisplayHelp(0, false, true, -1)
        ESX.ShowNotification(txt)
    end
end

RegisterNetEvent(triggerName('notification'), function(text, type)
    Notify(text)
end)

