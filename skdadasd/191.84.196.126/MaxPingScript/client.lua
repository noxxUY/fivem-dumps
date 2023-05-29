local MAX_PING = 560
local currentPing = 0
local highPing = false

function TrackPing()
    while true do
        TriggerServerEvent("DesyncPot:TrackPing")
        if not highPing then
            CheckPing()
        end

        Wait(5000)
    end
end

function CheckSession()
    print("Beginning to track session")
    while NetworkIsSessionActive() do
        Wait(60 * 1000)
        print("Sending session check. Host check " .. tostring(NetworkIsHost()))
        TriggerServerEvent("DesyncPot:CheckSession", #GetActivePlayers())
        print("Current Time: " .. tostring(os.time()))
    end
end

function CheckPing()
    if currentPing > MAX_PING then
        highPing = true
        local timeout = 60000
        local startTime = GetGameTimer()

        while math.abs(startTime - GetGameTimer()) < timeout do
            if currentPing < MAX_PING then
                highPing = false
                return
            end

            AddTextEntry("DESYNCFIX", "~r~WARNING:~s~ Vas a ser kickeado en ~r~60 segundos~s~ a causa de tus problemas de conexión (Ping demasiado alto).")
            DisplayHelpTextThisFrame("DESYNCFIX", false)
            Wait(1)
        end

        TriggerServerEvent("DesyncPot:DropPlayer")
        highPing = false
    end
end

RegisterNetEvent("DesyncPot:UpdatePing")
AddEventHandler("DesyncPot:UpdatePing", function(ping)
    currentPing = ping
end)

RegisterNetEvent("DesyncPot:Sessioned")
AddEventHandler("DesyncPot:Sessioned", function(serverCount)
    print("sessioned. need to rejoin " .. #GetActivePlayers() .. " vs " .. serverCount .. " Host " ..
              tostring(NetworkIsHost()))
    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        multiline = true,
        args = {"Fuiste desconectado del servidor para evitar problemas de sincronización en el servidor a causa de tus problemas de conectividad, podes volver a ingresar cuando quieras."}
    })
end)

Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(NetworkGetPlayerIndexFromPed(PlayerPedId())) do
        Wait(500)
    end
    TrackPing()
    CheckSession()
end)

