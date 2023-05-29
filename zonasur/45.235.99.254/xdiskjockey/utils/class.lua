------------------------------------------------------------------
-- Need to be changed to your framework, for now default is ESX --
------------------------------------------------------------------
-- ESX
if Config.ESX then
    PlayerData = {}
    ESX = nil

    CreateThread(function()
        local breakme = 0
        while ESX == nil do
            Wait(100)
            breakme = breakme + 1
            TriggerEvent(Config.ESX_Object, function(obj) ESX = obj end)
            if breakme == 10 then
                return
            end
        end

        if ESX.IsPlayerLoaded() then
            PlayerData = ESX.GetPlayerData()
        end
    end)

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        PlayerData = xPlayer
    end)

    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        PlayerData.job = job
    end)

    function isAtJob(name)
		local mafia = exports["tm1_mafias"]:GetGroup()
        return PlayerData.job.name == name or PlayerData.identifier == name or mafia.enclosure == name
    end
end

-- QBCORE
if Config.QBCore then
    local jobName = ""
    RegisterNetEvent('QBCore:Player:SetPlayerData')
    AddEventHandler('QBCore:Player:SetPlayerData', function(data)
        jobName = data.job.name
    end)

    function isAtJob(name)
        return jobName == name
    end
end

-- Standalone
if Config.StandAlone then
    function isAtJob(name)
        return true
    end
end
------------------------
-- Optional to change --
------------------------
function showNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(0, 1)
end

-- display custom marker/Text whatever
--- @pos vector3
--- @name string
-- Will be called every tick if close.
function DisplayMarker(pos, name)
    DrawMarker(31, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 100, false, true, 2, false, false, false, false)
    DrawMarker(20, pos.x, pos.y, pos.z - 0.3, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 100, false, true, 2, true, false, false, false)
    DrawMarker(25, pos.x, pos.y, pos.z - 0.9, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
end
