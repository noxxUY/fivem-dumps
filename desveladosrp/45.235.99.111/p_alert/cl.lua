ESX = exports["es_extended"]:getSharedObject()

local alertas = {}
local select = 1
local msg = ""
local id = 1
local hidden = true

RegisterNetEvent('p_alert:contesta3')
AddEventHandler('p_alert:contesta3', function(id)
    for k,v in pairs(alertas) do
        if v.id == id then
            v.dispo = false
        end
    end 
    update()
end)

RegisterNetEvent('p_alert:alertar')
AddEventHandler('p_alert:alertar', function(msg,pos,id)

    PlaySound(-1, "SELECT", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
    SendNUIMessage({
        target = "listadd";
        msg = msg;
        id = id;
    })

    table.insert(alertas ,{
        msg = msg,
        pos = pos,
        id = id,
        dispo = true
    })

    hidden = false

    update()
    Citizen.Wait(Cfg.DuracionAlertas * 60000)

    for k,v in pairs(alertas) do
        if v.id == id then
            table.remove(alertas, k)
        end
    end 
end)

RegisterCommand("registro", function()  
    SetNuiFocus(true, true) 
    SendNUIMessage({
        target = "showlista";
        mostrar = true;
    })
end)

RegisterNUICallback("closeui", function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        target = "showlista";
        mostrar = false;
    })
end)


Citizen.CreateThread(function()
    
    local lasttimer = GetGameTimer()
    while true do
        local vr = 1500
        --Citizen.Wait(0)

        if #alertas~=0 then
            if select > 1 and select > #alertas then
                select = #alertas
            --    update()
            end
            vr = 0
            if IsControlJustReleased(0, 174) then
                if select > 1 then
                    select = select - 1
                end
                update() 
            elseif IsControlJustReleased(0, 175) then
                if select < #alertas then
                    select = select + 1
                end
                update()
            elseif IsControlJustReleased(0, 74) then
                if alertas[select].pos ~= nil then
                    SetNewWaypoint(alertas[select].pos)
                end
                if alertas[select].dispo then
                    TriggerServerEvent("p_alert:contesta3", alertas[select].id)
                end
            elseif IsControlJustReleased(0, 178) then
                if alertas[select] ~= nil then
                    local id = alertas[select].id
                    for k,v in pairs(alertas) do
                        if v.id == id then
                            table.remove(alertas, k)
                        end
                    end 
                end
                update()
            end

            if GetGameTimer() - lasttimer > 1000 then
                lasttimer = GetGameTimer()
                update()
            end

        else
            update()
            Citizen.Wait(1000)
        end
        Wait(vr)
    end
end)

function update()
    if #alertas==0 then
        hidden = true
        SendNUIMessage({
            target = "mini";
            showmini = hidden;
            inpause = IsPauseMenuActive();
        })
    else
        if select > 1 and select > #alertas then
            select = #alertas
        end
        SendNUIMessage({
            target = "mini";
            inpause = IsPauseMenuActive();
            showmini =  hidden; --
            alertas = select.."/"..#alertas;
            msg =  alertas[select].msg; 
            id = "#"..alertas[select].id;
            dispo = alertas[select].dispo;
        })  
    end
end

RegisterCommand("dispatch",function()
    hidden = not hidden
    update()
end)

RegisterKeyMapping("dispatch","Alternar dispatch","KEYBOARD","O")


--Alertas Tiroteo

local streetName, playerGender

Citizen.CreateThread(function()
	while true do
		local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
        streetName = GetStreetNameFromHashKey(streetName)
        Citizen.Wait(5000)
	end
end)

Citizen.CreateThread(function()
    while true do
        local p = PlayerPedId()
       
        if IsPedShooting(p) then
            local _, wea = GetCurrentPedWeapon(p)
            local pc = GetEntityCoords(p)
            if not (IsPedCurrentWeaponSilenced(p) or (wea==126349499))then
                TriggerServerEvent('p_alert:tiroteox', pc, streetName)
                Citizen.Wait(1000)
            end
        end
        Citizen.Wait(0)
    end
end)

-- Comandos

RegisterCommand('entorno', function(source, args, rawCommand)
    local msg = table.concat(args," ")
    
    local cords = GetEntityCoords(PlayerPedId())

    TriggerServerEvent('p_alert:msg', "police", msg, cords)
    TriggerServerEvent('p_alert:msg', "gna", msg, cords)
    ESX.ShowNotification("Se ha enviado un mensaje a la Policia/Gendarmeria!")
end, false)

RegisterCommand('mecanico', function(source, args, rawCommand)
    local msg = table.concat(args," ")
    local cords = GetEntityCoords(PlayerPedId())

    TriggerServerEvent('p_alert:msg', 
        "mechanic"--[[trabajo]], 
        msg--[[mensaje]], 
        cords--[[posicion]], 
        "Un mecanico se encuentra en camino"--[[mensaje al contestar]]
    )

    
    ESX.ShowNotification("Se ha enviado un mensaje al mecanico!")

end, false)



local cooldown = 0
RegisterCommand('auxilio', function(source, args, rawCommand)
    local t = GetGameTimer()
    if cooldown > t then
        return ESX.ShowNotification("Tienes que esperar "..math.ceil((cooldown - t)/1000).." segundos")
    end

    cooldown = t + 5000

    local msg = table.concat(args," ")
    local cords = GetEntityCoords(PlayerPedId())

    TriggerServerEvent('p_alert:msg', 
        "ambulance"--[[trabajo]], 
        msg--[[mensaje]], 
        cords--[[posicion]], 
        "Un medico se encuentra en camino"--[[mensaje al contestar]]
    )

    
    ESX.ShowNotification("Se ha enviado un mensaje de entorno al SAME!")

end, false)
