--[[
local showTags = false
local seeTags = false
local TagDistance = 0

local distance, headDisplayId, isTalking, visable, playerName, color

RegisterNetEvent('showTags')
AddEventHandler('showTags', function()
    if showTags then
        showTags = false
        
        ESX.ShowNotification('Player IDs Desactivado')
     --   TriggerEvent('chat:addMessage', {color = { 0,187,255}, multiline = false, args = {ID.Messages['ChatPrefix'], (ID.Messages['ToggleTags'][1]:format(ID.Messages['ToggleTags'][3]))}})
    else
        showTags =  true
        ESX.ShowNotification('Player IDs Activado')
     --   TriggerEvent('chat:addMessage', {color = { 0,187,255}, multiline = false, args = {ID.Messages['ChatPrefix'], (ID.Messages['ToggleTags'][1]:format(ID.Messages['ToggleTags'][2]))}})
    end
end)
function ManageHeadLabels()
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            local iPed = GetPlayerPed(i)
            local lPed = PlayerPedId()

            if DoesEntityExist(iPed) then
                distance = #(GetEntityCoords(lPed) - GetEntityCoords(iPed))
                if TagDistance == 0 then TagDistance = 5 end
                headDisplayId = CreateFakeMpGamerTag(iPed, "", false, false, "", false)
                isTalking = false
                visable = false
                if NetworkIsPlayerTalking(i) then
                    isTalking = true
                end
                if lPed ~= iPed then
                    if HasEntityClearLosToEntity(lPed, iPed, 17) or seeTags then
                        if distance <= TagDistance  then
                            
                            playerName = GetPlayerServerId(i)
                            color = 0
                            visable = true
                        end
                    end
                end
                SetMpGamerTagVisibility(headDisplayId, 0, visable)
                SetMpGamerTagAlpha(headDisplayId, 4, 225)
                SetMpGamerTagVisibility(headDisplayId, 4, isTalking)
                
                SetMpGamerTagVisibility(headDisplayId, 2, 0)
                SetMpGamerTagName(headDisplayId, playerName)
                SetMpGamerTagColour(headDisplayId, 0, color)
                SetMpGamerTagColour(headDisplayId, 8, color)
                

            end
        end
    end
end

RegisterCommand("ids", function()
    TriggerEvent("showTags", source)
end)

CreateThread(function()
    local sleep = 150
    while true do
        if showTags then
            ManageHeadLabels()
            sleep = 50
        else
            sleep = 500
        end
        Wait(sleep)
    end
end)

ID = {}
ID.Messages = {
    ['ChatPrefix'] = "[ReinadoRP] - IDs: ",
    ['TagDistance'] = "Player ID distance was set to: ^^2%s^0!",
    ['SeeTags'] = {"Player tags trough walls ^^2%s^0", "Enabled", "Disabled"},
    ['ToggleTags'] = {"Ver IDS ^*^2%s^0", "Activado", "Desactivado"}
}
]]


local isPlayerIDActive = false
local playerGamerTags = {}
local Distancia = 5

local gamerTagCompsEnum = {
    GamerName = 0,
    CrewTag = 1,
    HealthArmour = 2,
    BigText = 3,
    AudioIcon = 4,
    UsingMenu = 5,
    PassiveMode = 6,
    WantedStars = 7,
    Driver = 8,
    CoDriver = 9,
    Tagged = 12,
    GamerNameNearby = 13,
    Arrow = 14,
    Packages = 15,
    InvIfPedIsFollowing = 16,
    RankText = 17,
    Typing = 18
}

function cleanUpGamerTags()
    for _, v in pairs(playerGamerTags) do
        if IsMpGamerTagActive(v.gamerTag) then
            RemoveMpGamerTag(v.gamerTag)
        end
    end
    playerGamerTags = {}
end

local function showGamerTags()
    local curCoords = GetEntityCoords(PlayerPedId())
    local allActivePlayers = GetActivePlayers()

    for _, i in ipairs(allActivePlayers) do
        local targetPed = GetPlayerPed(i)
      --  local playerStr = '' .. GetPlayerServerId(i) .. ' | ' .. ' ' .. GetPlayerName(i)
        local playerStr = GetPlayerServerId(i)

        if not playerGamerTags[i] or not IsMpGamerTagActive(playerGamerTags[i].gamerTag) then
            playerGamerTags[i] = {
                gamerTag = CreateFakeMpGamerTag(targetPed, playerStr, false, false, 0),
                ped = targetPed
            }
        end

        local targetTag = playerGamerTags[i].gamerTag

        local targetPedCoords = GetEntityCoords(targetPed)

        if #(targetPedCoords - curCoords) <= Distancia then
            -- Setup name
           SetMpGamerTagVisibility(targetTag, gamerTagCompsEnum.GamerName, 1)

            -- Setup Driver
            if IsPedInAnyVehicle(targetPed) then 
                SetMpGamerTagVisibility(targetTag, gamerTagCompsEnum.Driver, 1)
            else
                SetMpGamerTagVisibility(targetTag, gamerTagCompsEnum.Driver, 0)
            end

            -- Setup Health
            SetMpGamerTagHealthBarColor(targetTag, 006)
            SetMpGamerTagAlpha(targetTag, gamerTagCompsEnum.HealthArmour, 255)
            SetMpGamerTagVisibility(targetTag, gamerTagCompsEnum.HealthArmour, 1)

            -- Setup AudioIcon
            SetMpGamerTagAlpha(targetTag, gamerTagCompsEnum.AudioIcon, 255)
            -- Set audio to red when player is talking
            SetMpGamerTagVisibility(targetTag, gamerTagCompsEnum.AudioIcon, NetworkIsPlayerTalking(i))

        else
            SetMpGamerTagVisibility(targetTag, gamerTagCompsEnum.GamerName, 0)
            SetMpGamerTagVisibility(targetTag, gamerTagCompsEnum.HealthArmour, 0)
            SetMpGamerTagVisibility(targetTag, gamerTagCompsEnum.Driver, 0)
        end
    end
end

function togglePlayerIDsHandler()

    isPlayerIDActive = not isPlayerIDActive
    if not isPlayerIDActive then
        cleanUpGamerTags()
        ESX.ShowNotification('Player IDs Desactivado')
    else
        ESX.ShowNotification('Player IDs Activado')
    end
end

RegisterNUICallback('PlayerNames', function(_, cb)
    togglePlayerIDsHandler()
    cb({})
end)



RegisterCommand('ids', function()
    togglePlayerIDsHandler()
end)

CreateThread(function()
    local sleep = 150
    while true do
        if isPlayerIDActive then
            showGamerTags()
            sleep = 50
        else
            sleep = 500
        end
        Wait(sleep)
    end
end)

