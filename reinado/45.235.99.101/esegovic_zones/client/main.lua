ESX = nil
Zones = {}
blipTable = {}
beingCaptured = false
local a = false
local b = false
local c = true
Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                Config.ESXLibrary,
                function(d)
                    ESX = d
                end
            )
            Citizen.Wait(0)
        end
        Citizen.Wait(4000)
        getZones()
    end
)
RegisterNetEvent("esx:playerLoaded")
AddEventHandler(
    "esx:playerLoaded",
    function(e)
        PlayerData = e
    end
)
RegisterNetEvent("esx:setJob")
AddEventHandler(
    "esx:setJob",
    function(f)
        ESX.PlayerData.job = f
        RemoveBlips()
        Wait(500)
        getZones()
    end
)
RegisterNetEvent("esegovic:UpdatedClient")
AddEventHandler(
    "esegovic:UpdatedClient",
    function(g)
        RemoveBlips()
        Wait(500)
        getZones()
    end
)
RemoveBlips = function()
    if blipTable[1] ~= nil then
        for h = 1, #blipTable, 1 do
            RemoveBlip(blipTable[h])
            blipTable[h] = nil
        end
    end
end
getZones = function()
    ESX.TriggerServerCallback(
        "esegovic:getZones",
        function(g)
            Zones = g
            MakeBlips()
        end
    )
end
MakeBlips = function()
    if IsPlayerWhitelisted() then
        for i, j in pairs(Zones) do
            if j.zone then
                if j.owner == "noowner" then
                    x = tonumber(j.x)
                    y = tonumber(j.y)
                    z = tonumber(j.z)
                    local k = vector3(x, y, z)
                    local l = j.zone
                    TriggerEvent("esegovic:addBlipNoOwner", k, l)
                else
                    x = tonumber(j.x)
                    y = tonumber(j.y)
                    z = tonumber(j.z)
                    local m = j.job
                    local k = vector3(x, y, z)
                    local l = j.zone
                    TriggerEvent("esegovic:addBlipOwner", k, l, m)
                end
            end
        end
    end
end
FirstLetterUpperCase = function(n)
    return n:gsub("^%l", string.upper)
end
RegisterNetEvent("esegovic:addBlipNoOwner")
AddEventHandler(
    "esegovic:addBlipNoOwner",
    function(k, o)
        ay = AddBlipForRadius(k, 90.0)
        SetBlipHighDetail(ay, true)
        SetBlipColour(ay, Config.BlipRadisuFree)
        SetBlipAlpha(ay, 128)
        blip1 = AddBlipForCoord(k)
        SetBlipHighDetail(blip1, true)
        SetBlipSprite(blip1, Config.BlipSpiritFree)
        SetBlipScale(blip1, 0.6)
        SetBlipColour(blip1, 64)
        SetBlipAsShortRange(ay, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~y~*~r~" .. FirstLetterUpperCase(o) .. "~y~*~s~ - FREE")
        EndTextCommandSetBlipName(blip1)
        table.insert(blipTable, ay)
        table.insert(blipTable, blip1)
    end
)
RegisterNetEvent("esegovic:addBlipOwner")
AddEventHandler(
    "esegovic:addBlipOwner",
    function(k, o, p)
        xd123 = AddBlipForRadius(k, 90.0)
        SetBlipHighDetail(xd123, true)
        SetBlipColour(xd123, Config.BlipRadiusTaken)
        SetBlipAlpha(xd123, 128)
        blip12 = AddBlipForCoord(k)
        SetBlipHighDetail(blip12, true)
        SetBlipSprite(blip12, Config.BlipSpiritTaken)
        SetBlipScale(blip12, 0.6)
        SetBlipColour(blip12, 64)
        SetBlipAsShortRange(xd123, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~y~*~g~" .. FirstLetterUpperCase(o) .. " ~y~*~s~ - " .. FirstLetterUpperCase(p))
        EndTextCommandSetBlipName(blip12)
        table.insert(blipTable, xd123)
        table.insert(blipTable, blip12)
    end
)
IsPlayerWhitelisted = function()
    for i, j in pairs(Config.Gangs) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == j then
            return true
        end
    end
    return false
end
DRAWME = function(q)
    SetTextFont(4)
    SetTextScale(0.6, 0.6)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(q)
    DrawText(0.4, 0.1)
end
local p
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            local r = true
            for i, j in pairs(Zones) do
                if j.zone then
                    x = tonumber(j.x)
                    y = tonumber(j.y)
                    z = tonumber(j.z)
                    local k = vector3(x, y, z)
                    local s = GetEntityCoords(PlayerPedId())
                    local t = #(k - s)
                    if IsPlayerWhitelisted() then
                        if t < 90 then
                            r = false
                            if j.owner == "noowner" then
                                p = Config.Translate[10]
                                DRAWME(Config.Translate[11] .. j.zone .. " ~s~- ~g~" .. p .. "~s~")
                                if t < 15 then
                                    ESX.Game.Utils.DrawText3D(k, Config.Translate[0], 0.7)
                                    if t < 2 then
                                        if IsControlJustReleased(0, 38) then
                                            CaptureTaken(j.zone, k)
                                        end
                                    end
                                end
                            else
                                p = j.owner
                                DRAWME(
                                    Config.Translate[11] ..
                                        j.zone .. " ~s~" .. Config.Translate[12] .. " ~b~" .. p .. "~s~"
                                )
                                if t < 15 then
                                    ESX.Game.Utils.DrawText3D(k, Config.Translate[0], 0.7)
                                    if t < 2 then
                                        if IsControlJustReleased(0, 38) then
                                            if p == ESX.PlayerData.job.label then
                                                ESX.ShowNotification(Config.Translate[14])
                                            else
                                                CaptureTaken(j.zone, k)
                                            end
                                        end
                                    end
                                end
                            end
                            if t < 15 then
                                ESX.Game.Utils.DrawText3D(k, Config.Translate[0], 0.7)
                            end
                        end
                    else
                        Citizen.Wait(500)
                    end
                end
            end
            if r then
                Citizen.Wait(1000)
            end
        end
    end
)
CaptureFree = function(u)
    Timer()
end
CaptureTaken = function(u, k)
    if Config.CheckPlayersForCapturing then
        local v, w = ESX.Game.GetClosestPlayer()
        if v <= Config.MinPlayersToCapture then
            ESX.ShowNotification(Config.Translate[15])
        else
            local A = ESX.PlayerData.job.label
            local f = ESX.PlayerData.job.name
            TriggerServerEvent("esegovic:messageCapturing", f, u, A)
            CapturingTime = Config.CapturingTime
            TriggerServerEvent("esegovic:syncTimer", f, A, u, k)
            beingCaptured = true
            while beingCaptured do
                Citizen.Wait(0)
                local s = GetEntityCoords(PlayerPedId())
                local B = k
                local t = #(s - B)
                local x, y, z = table.unpack(k)
                local C = vector3(x, y, z + 0.1)
                if ESX.PlayerData.job and ESX.PlayerData.job.name == f then
                    if t < 150 then
                        DrawMarker(
                            1,
                            k,
                            0.0,
                            0.0,
                            0.0,
                            0,
                            0.0,
                            0.0,
                            150.0,
                            150.0,
                            150.0,
                            255,
                            0,
                            0,
                            100,
                            false,
                            true,
                            2,
                            true,
                            false,
                            false,
                            false
                        )
                        DRAWME(Config.Translate[13] .. " ~r~" .. CapturingTime .. "~s~ sec")
                    else
                        TriggerServerEvent("esegovic:capturingFailed", f, A, u, k)
                        break
                    end
                    if IsEntityDead(PlayerPedId()) then
                        TriggerServerEvent("esegovic:capturingFailed", f, A, u, k)
                        break
                    end
                else
                    if t < 150 then
                        DrawMarker(
                            1,
                            k,
                            0.0,
                            0.0,
                            0.0,
                            0,
                            0.0,
                            0.0,
                            150.0,
                            150.0,
                            150.0,
                            255,
                            0,
                            0,
                            100,
                            false,
                            true,
                            2,
                            true,
                            false,
                            false,
                            false
                        )
                        DRAWME(Config.Translate[16] .. " ~r~" .. CapturingTime .. "~s~ sec")
                    end
                end
            end
        end
    else
        local A = ESX.PlayerData.job.label
        local f = ESX.PlayerData.job.name
        TriggerServerEvent("esegovic:messageCapturing", f, u, A)
        CapturingTime = Config.CapturingTime
        TriggerServerEvent("esegovic:syncTimer", f, A, u, k)
        beingCaptured = true
        while beingCaptured do
            Citizen.Wait(0)
            local s = GetEntityCoords(PlayerPedId())
            local B = k
            local t = #(s - B)
            local x, y, z = table.unpack(k)
            local C = vector3(x, y, z + 0.1)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == f then
                if t < 150 then
                    DrawMarker(
                        1,
                        k,
                        0.0,
                        0.0,
                        0.0,
                        0,
                        0.0,
                        0.0,
                        150.0,
                        150.0,
                        150.0,
                        255,
                        0,
                        0,
                        100,
                        false,
                        true,
                        2,
                        true,
                        false,
                        false,
                        false
                    )
                    DRAWME(Config.Translate[13] .. " ~r~" .. CapturingTime .. "~s~ sec")
                else
                    TriggerServerEvent("esegovic:capturingFailed", f, A, u, k)
                    break
                end
                if IsEntityDead(PlayerPedId()) then
                    TriggerServerEvent("esegovic:capturingFailed", f, A, u, k)
                    break
                end
            else
                if t < 150 then
                    DrawMarker(
                        1,
                        k,
                        0.0,
                        0.0,
                        0.0,
                        0,
                        0.0,
                        0.0,
                        150.0,
                        150.0,
                        150.0,
                        255,
                        0,
                        0,
                        100,
                        false,
                        true,
                        2,
                        true,
                        false,
                        false,
                        false
                    )
                    DRAWME(Config.Translate[16] .. " ~r~" .. CapturingTime .. "~s~ sec")
                end
            end
        end
    end
end
RegisterNetEvent("esegovic:syncTimerClient")
AddEventHandler(
    "esegovic:syncTimerClient",
    function(f, A, u, k)
        CapturingTime = Config.CapturingTime
        for h = 1, Config.CapturingTime do
            Citizen.Wait(1000)
            CapturingTime = CapturingTime - 1
            if CapturingTime == 0 then
                CapturingTime = 0
                beingCaptured = false
                TriggerServerEvent("esegovic:ZoneCaptured", f, u, A)
                break
            end
        end
    end
)
RegisterNetEvent("esegovic:refreshZones")
AddEventHandler(
    "esegovic:refreshZones",
    function(f, A, u, k)
        CapturingTime = 0
        beingCaptured = false
    end
)
