local name = GetPlayerName(PlayerId())
local sinpu = true
-- Libreria ESX
ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
    while ESX.GetPlayerData() == nil do
        Citizen.Wait(1000)
    end
    PlayerData = ESX.GetPlayerData()
end)

--[[Citizen.CreateThread(function()
    while true do
        N_0x4757f00bc6323cfe(-1553120962, 0.0) 
        Wait(0)
    end
end)
--[[RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)--]]
Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0)
end)

local function sumarelpo(espo)
    if espo == 'si' then
        TriggerServerEvent('sumaunc', espo)
    elseif espo == 'sali' then
        TriggerServerEvent('sumaunc', espo) else
        print('noespolicia')
    end
end

local vuelve = true
RegisterCommand('lolno', function() 
    if vuelve == true then
    espoli = ESX.GetPlayerData()
    print('check')
    if espoli.job.name == 'police' or espoli.job.name == 'sheriff' then
        --espo = true
        vuelve = false
        print('Suma police')
        Citizen.Wait(200)
        sumarelpo('si')
    else
        sumarelpo('no')
        vuelve = false
    end
end
end)
RegisterKeyMapping('lolno', 'NO TOCAR', 'keyboard', 'W' )
local veces = 0
 local function cargada(pato, veces)
    if pato == 'si' then
        TriggerServerEvent('cargamovildata21', veces)
        Citizen.Wait(15000)
        TriggerEvent('checkplayer', 'si ya esta')
        TriggerServerEvent('cargastore')
        Citizen.Wait(20000)
        TriggerServerEvent('cargaraddondata')
        Citizen.Wait(15000)
        TriggerServerEvent('cargoinventory')
        Citizen.Wait(15000)
    else
        print('Addonacount no cargado')
    end
end
local da = true
local miloko = true
Citizen.CreateThread(function()
    while miloko do
        Citizen.Wait(1)
        if da == true then
            
        if IsControlJustReleased(0, 32) then
            miloko = false
                da = false
                Citizen.Wait(1000)
                veces = veces + 1
                cargada('si', veces)
            end
        end
    end
    
end)

RegisterCommand('mesalgo', function(sali)
 sumarelpo('sali') print('se ejecuto') end)

local function eldime(dime)
    if dime == 'si' then
        TriggerServerEvent('sumanco', dime)
    else print('dime no es si')
    end
end
RegisterNetEvent('lapodisc')
AddEventHandler('lapodisc', function(a)
    a = a
print(a) end)
--[[RegisterCommand('polidispo', function(dime)
eldime('si')
end)--]]

RegisterCommand('dim', function(diselo)
    if diselo then
    ESX.TriggerServerCallback('obtenerpol', function(a) if a then print(a) end end) end
    end)

    RegisterNetEvent('snowitake')
AddEventHandler('snowitake', function(a)
exports['screenshot-basic']:requestScreenshotUpload(a, 'files[]', function(data)
    local resp = json.decode(data)
    ESX.ShowNotification('Has enviado la foto de tu vehículo con su información a la nube! Espera a que alguien te contacte.')
   -- TriggerEvent('chat:addMessage', { template = '<img src="{0}" style="max-width: 300px;" />', args = { resp.files[1].url } })
end)
end)
TriggerEvent('chat:addSuggestion', '/publicarcoche', 'Sube una foto de tu vehiculo a la nube para intentar venderlo!', {
    { name="modelo", help="Pon el nombre de tu coche aqui" },
    { name="velocidad", help="Velocidad aproximada de tu coche" },
    { name="Precio Concesionario", help="Precio del vehículo en concesionario" },
    { name="Precio Tuyo", help="Precio por el que vendes el vehículo" },
    { name="contacto", help="Tu número de telefono" },
    { name="fulltuning", help="Tiene full tuning? Si/No" },
    
})