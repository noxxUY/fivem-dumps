--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX, QBCore, JobData, on_duty = nil, nil, {}, true

Citizen.CreateThread(function()
    if Config.Framework == 'esx' then
        while ESX == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
            Citizen.Wait(100)
        end
        JobData = ESX.PlayerData.job or {}
        if JobData.onDuty ~= nil then
            on_duty = JobData.onDuty
        end

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function(xPlayer)
            JobData = xPlayer.job or {}
            if JobData.onDuty ~= nil then
                on_duty = JobData.onDuty
            end
            while not Authorised do Citizen.Wait(1000) end
            TriggerServerEvent('cd_dispatch:PlayerLoaded')
        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(job)
            local last_job = GetJob()
            JobData = job or {}
            if last_job ~= job.name then
                TriggerServerEvent('cd_dispatch:JobSet', GetJob())
            end
            if job.onDuty ~= nil and job.onDuty ~= on_duty then
                on_duty = job.onDuty
                TriggerServerEvent('cd_dispatch:OnDutyChecks', on_duty)
            end
        end)


    elseif Config.Framework == 'qbcore' then
        while QBCore == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
            if QBCore == nil then
                QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
            end
            Citizen.Wait(100)
        end
        JobData = QBCore.Functions.GetPlayerData().job or {}
        if #JobData > 0 then
            on_duty = QBCore.Functions.GetPlayerData().job.onduty
        end

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function()
            JobData = QBCore.Functions.GetPlayerData().job or {}
            on_duty = QBCore.Functions.GetPlayerData().job.onduty
            while not Authorised do Citizen.Wait(1000) end
            TriggerServerEvent('cd_dispatch:PlayerLoaded')
        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(JobInfo)
            local last_job = GetJob()
            JobData = JobInfo or {}
            if last_job == JobInfo.name then return end
            TriggerServerEvent('cd_dispatch:JobSet', GetJob())
        end)

        RegisterNetEvent('QBCore:Client:SetDuty')
        AddEventHandler('QBCore:Client:SetDuty', function(boolean)
            if on_duty == boolean then return end
            on_duty = boolean
            TriggerServerEvent('cd_dispatch:OnDutyChecks', on_duty)
        end)
    

    elseif Config.Framework == 'other' then
        --add your framework code here.

    end
end)

function GetJob()
    if Config.Framework == 'esx' then
        while JobData.name == nil do Citizen.Wait(0) end
        return JobData.name
    
    elseif Config.Framework == 'qbcore' then
        while JobData.name == nil do Citizen.Wait(0) end
        return JobData.name

    elseif Config.Framework == 'other' then
        return 'unemployed' --return a players job name (string).
    end
end

function GetJob_grade()
    if Config.Framework == 'esx' then
        while JobData.grade == nil do Wait(0) end
        return JobData.grade
    
    elseif Config.Framework == 'qbcore' then
        while JobData.grade.level == nil do Citizen.Wait(0) end
        return JobData.grade.level

    elseif Config.Framework == 'other' then
        return 0 --return a players job grade (number).
    end
end

function IsAllowed()
    local job = GetJob()
    if CheckMultiJobs(job) and on_duty then
        return true
    end
    return false
end

function CheckJob(job_table, job)
    if job_table then
        if job == nil then
            job = GetJob()
        end
        for c, d in pairs(job_table) do
            if job == d and on_duty then
                return true
            end
        end
    end
    return false
end


--██╗  ██╗███████╗██╗   ██╗███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--██║  ██╗███████╗   ██║   ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


Citizen.CreateThread(function()
    while not Authorised do Citizen.Wait(1000) end 
    if Config.small_ui.ENABLE then
        TriggerEvent('chat:addSuggestion', '/'..Config.small_ui.command, Config.small_ui.description)
        RegisterCommand(Config.small_ui.command, function()
            TriggerEvent('cd_dispatch:KEY_smallui') --The event to toggle the small UI.
        end)
    end
    if Config.large_ui.ENABLE then
        TriggerEvent('chat:addSuggestion', '/'..Config.large_ui.command, Config.large_ui.description)
        RegisterCommand(Config.large_ui.command, function()
            TriggerEvent('cd_dispatch:KEY_largeui') --The event to open the large UI.
        end)
    end
    if Config.respond.ENABLE then
        RegisterKeyMapping(Config.respond.command, Config.respond.description, 'keyboard', Config.respond.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.respond.command, Config.respond.description)
        RegisterCommand(Config.respond.command, function()
            TriggerEvent('cd_dispatch:KEY_responding') --The event to toggle the responding.
        end)
    end
    if Config.move_mode.ENABLE then
        TriggerEvent('chat:addSuggestion', '/'..Config.move_mode.command, Config.move_mode.description)
        RegisterCommand(Config.move_mode.command, function()
            TriggerEvent('cd_dispatch:EnableMoveMode') --The event to enable move mode.
        end)
    end
    if Config.small_ui_left.ENABLE then
        RegisterKeyMapping(Config.small_ui_left.command, Config.small_ui_left.description, 'keyboard', Config.small_ui_left.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.small_ui_left.command, Config.small_ui_left.description)
        RegisterCommand(Config.small_ui_left.command, function()
            Decreasecount() --The function to scroll left through notifications on the small UI.
        end)
    end
    if Config.small_ui_right.ENABLE then
        RegisterKeyMapping(Config.small_ui_right.command, Config.small_ui_right.description, 'keyboard', Config.small_ui_right.key)
        TriggerEvent('chat:addSuggestion', '/'..Config.small_ui_right.command, Config.small_ui_right.description)
        RegisterCommand(Config.small_ui_right.command, function()
            Increasecount() --The function to scroll right through notifications on the small UI.
        end)
    end
end)


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(notif_type, message)
    if notif_type and message then
        if Config.NotificationType.client == 'esx' then
            ESX.ShowNotification(message)
        
        elseif Config.NotificationType.client == 'qbcore' then
            if notif_type == 1 then
                QBCore.Functions.Notify(message, 'success')
            elseif notif_type == 2 then
                QBCore.Functions.Notify(message, 'primary')
            elseif notif_type == 3 then
                QBCore.Functions.Notify(message, 'error')
            end

        elseif Config.NotificationType.client == 'mythic_old' then
            if notif_type == 1 then
                exports['mythic_notify']:DoCustomHudText('success', message, 10000)
            elseif notif_type == 2 then
                exports['mythic_notify']:DoCustomHudText('inform', message, 10000)
            elseif notif_type == 3 then
                exports['mythic_notify']:DoCustomHudText('error', message, 10000)
            end

        elseif Config.NotificationType.client == 'mythic_new' then
            if notif_type == 1 then
                exports['mythic_notify']:SendAlert('success', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 2 then
                exports['mythic_notify']:SendAlert('inform', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 3 then
                exports['mythic_notify']:SendAlert('error', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            end

        elseif Config.NotificationType.client == 'chat' then
            TriggerEvent('chatMessage', message)
            
        elseif Config.NotificationType.client == 'other' then
            --add your own notification.
            
        end
    end
end


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


function BlipSound(sound)
    if sound == 1 then
        DispatchSound('normal')
    elseif sound == 2 then
        DispatchSound('normal')
        Wait(800)
        DispatchSound('normal')
    elseif sound ==  3 or sound == 4 then
        if Config.PanicButton.play_sound_in_distance then
            TriggerServerEvent('cd_dispatch:PanicSoundInDistance', GetClosestPlayers(5))
        else
            DispatchSound('panic')
        end
    end
end

RegisterNetEvent('cd_dispatch:PanicSoundInDistance')
AddEventHandler('cd_dispatch:PanicSoundInDistance', function()
    DispatchSound('panic')
end)

function TabletAnimation(boolean)
    local ped = PlayerPedId()
    if boolean then
        PlayAnimation('amb@world_human_seat_wall_tablet@female@base', 'base', -1)
        tablet_prop = CreateObject(`prop_cs_tablet`, 0, 0, 0, true, true, true)
        AttachEntityToEntity(tablet_prop, ped, GetPedBoneIndex(ped, 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
        SetModelAsNoLongerNeeded(tablet_prop)
    else
        StopAnimTask(ped, 'amb@world_human_seat_wall_tablet@female@base', 'base' ,8.0, -8.0, -1, 50, 0, false, false, false)
        NetworkRequestControlOfEntity(tablet_prop)
        SetEntityAsMissionEntity(tablet_prop)
        DeleteEntity(tablet_prop)
        tablet_prop = nil
    end
end

if Config.EnableTestCommand then
    RegisterCommand('dispatchtest', function() --THIS IS A TEST COMMAND.
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police'}, --{'police', 'sheriff} 
            coords = data.coords,
            title = '10-15 - Store Robbery',
            message = 'A '..data.sex..' robbing a store at '..data.street, 
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = '911 - Store Robbery',
                time = (5*60*1000), --(5 mins)
                sound = 1,
            }
        })
    end)
end

RegisterNetEvent('cd_dispatch:OnDutyChecks')
AddEventHandler('cd_dispatch:OnDutyChecks', function(boolean)
    if type(boolean) == 'boolean' then
        on_duty = boolean
        TriggerServerEvent('cd_dispatch:OnDutyChecks', boolean)
    end
end)

RegisterNetEvent('cd_dispatch:ScriptRestarted')
AddEventHandler('cd_dispatch:ScriptRestarted', function()
    while not Authorised do Citizen.Wait(1000) end
    TriggerServerEvent('cd_dispatch:PlayerLoaded')
    if Config.Framework == 'esx' then
        if JobData.onDuty ~= nil then
            on_duty = JobData.onDuty
        end
    elseif Config.Framework == 'qbcore' then
        on_duty = QBCore.Functions.GetPlayerData().job.onduty
    end
end)

if Config.DebugPrints then
    CreateThread(function()
        while not Authorised do Wait(1000) end
        print('^6-----------------------^0')
        print('^6CODESIGN DEBUG^0')
        print('^6Job: '..GetJob()..'^0')
        print('^6Job Grade: '..GetJob_grade()..'^0')
        print('^6On Duty: '..tostring(on_duty)..'^0')
        print('^6Is Allowed: '..tostring(IsAllowed())..'^0')
        print('^6-----------------------^0')
        TriggerServerEvent('cd_dispatch:Debug')
    end)
end