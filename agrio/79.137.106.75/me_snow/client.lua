-- ## 3dme : client side

-- ## Variables
local pedDisplaying = {}

-- ## Functions

-- OBJ : draw text in 3d
-- PARAMETERS :
--      - coords : world coordinates to where you want to draw the text
--      - text : the text to display
local function DrawText3D(coords, text, type)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)
    -- Format the text
    local c = Config.visual.color
    SetTextColour(c.r, c.g, c.b, c.a)
    SetTextScale(0.0, Config.visual.scale * scale)
    SetTextFont(Config.visual.font)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()

end
local function DrawText3DO(coords, text, type)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)
    -- Format the text
    local c = Config.visual.color1
    SetTextColour(c.r, c.g, c.b, c.a)
    SetTextScale(0.0, Config.visual.scale * scale)
    SetTextFont(1)
    SetTextDropshadow(246, 111, 18, 100, 55)
    SetTextDropShadow(true)
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()

end
-- OBJ : handle the drawing of text above a ped head
-- PARAMETERS :
--      - coords : world coordinates to where you want to draw the text
--      - text : the text to display
local function Display(ped, text, idw)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local pedCoords = GetEntityCoords(ped)
    local dist = #(playerCoords - pedCoords)
    local player = GetPlayerFromServerId(serverId)
    local color = { 255, 0, 0}
    --local id = '^4DO^1[^4'..GetPlayerName(player)..'^1]^8 '
    if dist <= Config.visual.dist then
        TriggerEvent('chat:addMessage', { args = { idw, text }, color = color })
        pedDisplaying[ped] = (pedDisplaying[ped] or 1) + 1

        -- Timer
        local display = true

        Citizen.CreateThread(function()
            Wait(Config.visual.time)
            display = false
        end)

        -- Display
        local offset = 0.8 + pedDisplaying[ped] * 0.1
        while display do
            if HasEntityClearLosToEntity(playerPed, ped, 17 ) then
                local x, y, z = table.unpack(GetEntityCoords(ped))
                z = z + offset
                DrawText3D(vector3(x, y, z), text)
            end
            Wait(0)
        end

        pedDisplaying[ped] = pedDisplaying[ped] - 1

    end
end
local function DisplayDO(ped, text, idw)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local pedCoords = GetEntityCoords(ped)
    local dist = #(playerCoords - pedCoords)
    local player = GetPlayerFromServerId(serverId)
    local color = { 255, 0, 0}
    --local id = '^4DO^1[^4'..GetPlayerName(player)..'^1]^8 '
    if dist <= Config.visual.dist then
        TriggerEvent('chat:addMessage', { args = { idw, text }, color = color })
        pedDisplaying[ped] = (pedDisplaying[ped] or 1) + 1

        -- Timer
        local display = true

        Citizen.CreateThread(function()
            Wait(Config.visual.time)
            display = false
        end)

        -- Display
        local offset = 0.8 + pedDisplaying[ped] * 0.1
        while display do
            if HasEntityClearLosToEntity(playerPed, ped, 17 ) then
                local x, y, z = table.unpack(GetEntityCoords(ped))
                z = z + offset
                DrawText3DO(vector3(x, y, z), text)
            end
            Wait(0)
        end

        pedDisplaying[ped] = pedDisplaying[ped] - 1

    end
end

local function Displayoop(ped, text, idw)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local pedCoords = GetEntityCoords(ped)
    local dist = #(playerCoords - pedCoords)
    local player = GetPlayerFromServerId(serverId)
    local color = { r = 255, g = 0, b = 0}
    --local id = '^6OOP | '..GetPlayerName(player)..'^0 '
    if dist <= 35 then
        TriggerEvent('chat:addMessage', { args = { idw, text }, color = color })
        --[[pedDisplaying[ped] = (pedDisplaying[ped] or 1) + 1

        -- Timer
        local display = true

        Citizen.CreateThread(function()
            Wait(Config.visual.time)
            display = false
        end)

        -- Display
        local offset = 0.8 + pedDisplaying[ped] * 0.1
        while display do
            if HasEntityClearLosToEntity(playerPed, ped, 17 ) then
                local x, y, z = table.unpack(GetEntityCoords(ped))
                z = z + offset
                DrawText3DO(vector3(x, y, z), text)
            end
            Wait(0)
        end

        pedDisplaying[ped] = pedDisplaying[ped] - 1--]]

    end
end

local function entorno(ped, id)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local pedCoords = GetEntityCoords(ped)
    local dist = #(playerCoords - pedCoords)
    if dist <= 35 then
        TriggerEvent('chat:addMessage', { args = { '['..id..'][ENTORNO]', 'Se ha realizado una llamada de entorno.' }, color = {r=0, g=180, b=255} } )
        --[[pedDisplaying[ped] = (pedDisplaying[ped] or 1) + 1

        -- Timer
        local display = true

        Citizen.CreateThread(function()
            Wait(Config.visual.time)
            display = false
        end)

        -- Display
        local offset = 0.8 + pedDisplaying[ped] * 0.1
        while display do
            if HasEntityClearLosToEntity(playerPed, ped, 17 ) then
                local x, y, z = table.unpack(GetEntityCoords(ped))
                z = z + offset
                DrawText3DO(vector3(x, y, z), text)
            end
            Wait(0)
        end

        pedDisplaying[ped] = pedDisplaying[ped] - 1--]]

    end
end
RegisterNetEvent('snowiSyncEntorno', function(id)
    local player = GetPlayerFromServerId(id)
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        entorno(ped, id)
    end
    
end)
-- ## Events

-- Share the display of 3D text
RegisterNetEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, serverId)
    local player = GetPlayerFromServerId(serverId)
    local color = {255, 0, 0}
    local idw = '^1ME^1[^4'..serverId..'^1]^8 '
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        Display(ped, text, idw)
        --TriggerEvent('chat:addMessage', { args = { id, text }, color = color })
    end
end)
RegisterNetEvent('3dme:shareDisplaydo')
AddEventHandler('3dme:shareDisplaydo', function(text, serverId)
    local player = GetPlayerFromServerId(serverId)
    local color = { 255, 0, 0}
    local idw = '^4DO^1[^4'..serverId..'^1]^8 '
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        DisplayDO(ped, text, idw)
        --TriggerEvent('chat:addMessage', { args = { id, text }, color = color })
    end
end)
RegisterNetEvent('3dme:shareDisplayoop')
AddEventHandler('3dme:shareDisplayoop', function(text, serverId)
    local player = GetPlayerFromServerId(serverId)
    local color = { r = 255, g = 0, b = 0}
    local idw = '^6OOP | '..serverId..'^0 '
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        Displayoop(ped, text, idw)
        --TriggerEvent('chat:addMessage', { args = { id, text } }, { 105, 105, 105 })
    end
end)
local LANGUAGE = Config.language
TriggerEvent('chat:addSuggestion', '/' .. Languages[LANGUAGE].commandName, Languages[LANGUAGE].commandDescription, Languages[LANGUAGE].commandSuggestion)
