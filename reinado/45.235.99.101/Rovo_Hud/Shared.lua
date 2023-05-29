Config = {}


Config.StatusUpdateInterval = 5000 -- Time it takes for status to update (lowering this value adds ms)
Config.SocietyTrigger = 'esx_society:getSocietyMoney' -- Trigger to get the society money
Config.VipCoin = 'bitcoin' --Put the name of your vip coin or other extra coin of esx accounts.
Config.CommandHideHud = 'hud' -- Command to hide the hud

function GetStatus(cb)  -- You can change your status here
    TriggerEvent("esx_status:getStatus", "hunger", function(h)
        TriggerEvent("esx_status:getStatus", "thirst", function(t)
            local hunger = h.getPercent()
            local thirst = t.getPercent()
            local stress = 10
            cb({hunger, thirst, stress})
        end)
    end)
end


Config.Commands = {
    -- Car Belt
    belt = 'cinto',
    key = 'G',
    -- Car Limit
    limit = 'limit',
    key2 = 'L',

    -- Panel command
    panel = 'elhud',
    key3 = 'F4',

}