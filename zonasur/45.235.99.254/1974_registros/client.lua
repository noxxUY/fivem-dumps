ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local currentjob = ""

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
    local job = xPlayer.job.name

    currentjob = job
    if job == "police" or job == "police2" or job == "ambulance" or job == "mechanic" or job == "taxi" or job == "telefe" or job == "seguridad" or job == "mechanic2" or job == "gendarme" then -- job's name here
        TriggerServerEvent("utk_sl:userjoined", job)
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    if currentjob == "police" or currentjob == "police2" or currentjob == "ambulance" or currentjob == "mechanic" or currentjob == "taxi" or currentjob == "telefe" or currentjob == "seguridad" or currentjob == "mechanic2" or currentjob == "gendarme" then -- job's name here
        if not (currentjob == job.name) then
            TriggerServerEvent("utk_sl:jobchanged", currentjob, job.name, 1)
        end
    else
        if job.name == "police" or job.name == "police2" or job.name == "ambulance" or job.name == "mechanic" or job.name == "taxi" or job.name == "telefe" or job.name == "seguridad" or job.name == "mechanic2" or job.name == "gendarme" then -- job's name here
            TriggerServerEvent("utk_sl:jobchanged", currentjob, job.name, 0)
        end
    end
    currentjob = job.name
end)
