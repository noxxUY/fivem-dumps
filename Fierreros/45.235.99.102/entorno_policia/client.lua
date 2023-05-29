local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

--ESX
ESX = exports["es_extended"]:getSharedObject()
local PlayerData = {}

local display = false

function SetDisplay(bool) --método para enviar a js la infomación para activar o desactivar menú
    display = bool
    SetNuiFocus(bool,bool)
    SendNUIMessage({
        type = "ui",
        state = bool,
    })
end

--tecla de activación del menú

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(0, 168) then
            if ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' then
                SetDisplay(not display)
            else
                chat("¡No eres policía!",{255,0,0})
            end
        end 
    end
end)

--Comando para activar el menú

RegisterCommand("entornomenu",function(source)
    if ESX.PlayerData.job.name == 'police' then
        SetDisplay(true)
    else
        chat("¡No eres policía!",{255,0,0})
    end
end)

--recibir respuesta de stop del entorno
RegisterNUICallback("exit",function(data)
    SetDisplay(false)
end)

RegisterNUICallback("update",function(data,cb)
    TriggerServerEvent("updateCount") --restamos una a la cuenta en el servidor
    TriggerServerEvent('removeAlert',data.numeroAlertaEliminada,data.cantidadAlertas)
end)

RegisterNUICallback("markOnMap",function(data)
    if ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' then
        SetNewWaypoint(data.coordenadas.x,data.coordenadas.y)
        chat("Se ha señalizado la localización en el mapa",{70,255,0})
    end 
end)

--FUNCION PARA MENSAJES DE CHAT
function chat(msg,c)
    TriggerEvent('chat:addMessage', {
        color = c,
        multiline = true,
        args = {msg}
    })
end

RegisterNUICallback("playSound",function(data)
    --print("sound is: " ..data.sound)
    TriggerServerEvent('InteractSound_SV:PlayOnSource',data.sound,0.4)
end)

--COMANDO ENTORNO

RegisterCommand("entorno",function(source,args)
    local alerta = table.concat(args, " ")
    chat("ENTORNO: Su señal ha sido enviada", {22,243,199})
    local ped = GetPlayerPed(-1)
    local pedCoords = GetEntityCoords(PlayerPedId())
    local var1 = GetStreetNameAtCoord(pedCoords.x,pedCoords.y,pedCoords.z)
    local posicion = GetStreetNameFromHashKey(var1) 

    local letras = {"A","B","C","D","E","F","G","H","I","J"}
    local codigo = letras[math.random(1,9)] .. math.random(1,99) .. "-" ..math.random(123,200)
    
    --almacenamos en un archivo json
    TriggerServerEvent("writeToJson", posicion,codigo,alerta,GetPlayerName(PlayerId()),pedCoords)
end,false)

local colorNames = {
    ['0'] = "Metallic Black",
    ['1'] = "Metallic Graphite Black",
    ['2'] = "Metallic Black Steal",
    ['3'] = "Metallic Dark Silver",
    ['4'] = "Metallic Silver",
    ['5'] = "Metallic Blue Silver",
    ['6'] = "Metallic Steel Gray",
    ['7'] = "Metallic Shadow Silver",
    ['8'] = "Metallic Stone Silver",
    ['9'] = "Metallic Midnight Silver",
    ['10'] = "Metallic Gun Metal",
    ['11'] = "Metallic Anthracite Grey",
    ['12'] = "Matte Black",
    ['13'] = "Matte Gray",
    ['14'] = "Matte Light Grey",
    ['15'] = "Util Black",
    ['16'] = "Util Black Poly",
    ['17'] = "Util Dark silver",
    ['18'] = "Util Silver",
    ['19'] = "Util Gun Metal",
    ['20'] = "Util Shadow Silver",
    ['21'] = "Worn Black",
    ['22'] = "Worn Graphite",
    ['23'] = "Worn Silver Grey",
    ['24'] = "Worn Silver",
    ['25'] = "Worn Blue Silver",
    ['26'] = "Worn Shadow Silver",
    ['27'] = "Metallic Red",
    ['28'] = "Metallic Torino Red",
    ['29'] = "Metallic Formula Red",
    ['30'] = "Metallic Blaze Red",
    ['31'] = "Metallic Graceful Red",
    ['32'] = "Metallic Garnet Red",
    ['33'] = "Metallic Desert Red",
    ['34'] = "Metallic Cabernet Red",
    ['35'] = "Metallic Candy Red",
    ['36'] = "Metallic Sunrise Orange",
    ['37'] = "Metallic Classic Gold",
    ['38'] = "Metallic Orange",
    ['39'] = "Matte Red",
    ['40'] = "Matte Dark Red",
    ['41'] = "Matte Orange",
    ['42'] = "Matte Yellow",
    ['43'] = "Util Red",
    ['44'] = "Util Bright Red",
    ['45'] = "Util Garnet Red",
    ['46'] = "Worn Red",
    ['47'] = "Worn Golden Red",
    ['48'] = "Worn Dark Red",
    ['49'] = "Metallic Dark Green",
    ['50'] = "Metallic Racing Green",
    ['51'] = "Metallic Sea Green",
    ['52'] = "Metallic Olive Green",
    ['53'] = "Metallic Green",
    ['54'] = "Metallic Gasoline Blue Green",
    ['55'] = "Matte Lime Green",
    ['56'] = "Util Dark Green",
    ['57'] = "Util Green",
    ['58'] = "Worn Dark Green",
    ['59'] = "Worn Green",
    ['60'] = "Worn Sea Wash",
    ['61'] = "Metallic Midnight Blue",
    ['62'] = "Metallic Dark Blue",
    ['63'] = "Metallic Saxony Blue",
    ['64'] = "Metallic Blue",
    ['65'] = "Metallic Mariner Blue",
    ['66'] = "Metallic Harbor Blue",
    ['67'] = "Metallic Diamond Blue",
    ['68'] = "Metallic Surf Blue",
    ['69'] = "Metallic Nautical Blue",
    ['70'] = "Metallic Bright Blue",
    ['71'] = "Metallic Purple Blue",
    ['72'] = "Metallic Spinnaker Blue",
    ['73'] = "Metallic Ultra Blue",
    ['74'] = "Metallic Bright Blue",
    ['75'] = "Util Dark Blue",
    ['76'] = "Util Midnight Blue",
    ['77'] = "Util Blue",
    ['78'] = "Util Sea Foam Blue",
    ['79'] = "Uil Lightning blue",
    ['80'] = "Util Maui Blue Poly",
    ['81'] = "Util Bright Blue",
    ['82'] = "Matte Dark Blue",
    ['83'] = "Matte Blue",
    ['84'] = "Matte Midnight Blue",
    ['85'] = "Worn Dark blue",
    ['86'] = "Worn Blue",
    ['87'] = "Worn Light blue",
    ['88'] = "Metallic Taxi Yellow",
    ['89'] = "Metallic Race Yellow",
    ['90'] = "Metallic Bronze",
    ['91'] = "Metallic Yellow Bird",
    ['92'] = "Metallic Lime",
    ['93'] = "Metallic Champagne",
    ['94'] = "Metallic Pueblo Beige",
    ['95'] = "Metallic Dark Ivory",
    ['96'] = "Metallic Choco Brown",
    ['97'] = "Metallic Golden Brown",
    ['98'] = "Metallic Light Brown",
    ['99'] = "Metallic Straw Beige",
    ['100'] = "Metallic Moss Brown",
    ['101'] = "Metallic Biston Brown",
    ['102'] = "Metallic Beechwood",
    ['103'] = "Metallic Dark Beechwood",
    ['104'] = "Metallic Choco Orange",
    ['105'] = "Metallic Beach Sand",
    ['106'] = "Metallic Sun Bleeched Sand",
    ['107'] = "Metallic Cream",
    ['108'] = "Util Brown",
    ['109'] = "Util Medium Brown",
    ['110'] = "Util Light Brown",
    ['111'] = "Metallic White",
    ['112'] = "Metallic Frost White",
    ['113'] = "Worn Honey Beige",
    ['114'] = "Worn Brown",
    ['115'] = "Worn Dark Brown",
    ['116'] = "Worn straw beige",
    ['117'] = "Brushed Steel",
    ['118'] = "Brushed Black steel",
    ['119'] = "Brushed Aluminium",
    ['120'] = "Chrome",
    ['121'] = "Worn Off White",
    ['122'] = "Util Off White",
    ['123'] = "Worn Orange",
    ['124'] = "Worn Light Orange",
    ['125'] = "Metallic Securicor Green",
    ['126'] = "Worn Taxi Yellow",
    ['127'] = "police car blue",
    ['128'] = "Matte Green",
    ['129'] = "Matte Brown",
    ['130'] = "Worn Orange",
    ['131'] = "Matte White",
    ['132'] = "Worn White",
    ['133'] = "Worn Olive Army Green",
    ['134'] = "Pure White",
    ['135'] = "Hot Pink",
    ['136'] = "Salmon pink",
    ['137'] = "Metallic Vermillion Pink",
    ['138'] = "Orange",
    ['139'] = "Green",
    ['140'] = "Blue",
    ['141'] = "Mettalic Black Blue",
    ['142'] = "Metallic Black Purple",
    ['143'] = "Metallic Black Red",
    ['144'] = "hunter green",
    ['145'] = "Metallic Purple",
    ['146'] = "Metaillic V Dark Blue",
    ['147'] = "MODSHOP BLACK1",
    ['148'] = "Matte Purple",
    ['149'] = "Matte Dark Purple",
    ['150'] = "Metallic Lava Red",
    ['151'] = "Matte Forest Green",
    ['152'] = "Matte Olive Drab",
    ['153'] = "Matte Desert Brown",
    ['154'] = "Matte Desert Tan",
    ['155'] = "Matte Foilage Green",
    ['156'] = "DEFAULT ALLOY COLOR",
    ['157'] = "Epsilon Blue",
}

RegisterCommand("forzar",function()
    
    local ped = GetPlayerPed(-1)

    if IsPedInAnyVehicle(ped, false) then
        
        local pedCoords = GetEntityCoords(PlayerPedId())
        local var1 = GetStreetNameAtCoord(pedCoords.x,pedCoords.y,pedCoords.z)
        local posicion = GetStreetNameFromHashKey(var1) 

        local letras = {"A","B","C","D","E","F","G","H","I","J"}
        local codigo = letras[math.random(1,9)] .. math.random(1,99) .. "-" ..math.random(123,200)
        local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(ped, false))
        local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
        local vehName2 = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
        local primary, secondary = GetVehicleColours(veh)
        primary = colorNames[tostring(primary)]
        TriggerServerEvent("writeToJson", posicion,codigo,"Vehiculo "..vehName2.." forzado con matrícula "..plate.." color: " .. primary,GetPlayerName(PlayerId()),pedCoords)
    end
end)


--EVENTOS DE CLIENTE

RegisterNetEvent('refreshUserUI')
AddEventHandler('refreshUserUI',function(alertCount,information)

    SendNUIMessage({ --mandamos texto de las alertas
        type = "alertInfo",
        info = information
    })

end)

RegisterNetEvent('refreshAlertCount')
AddEventHandler('refreshAlertCount',function(alertCount)

    SendNUIMessage({ --mandamos información de la cantidad de alertas
        type = "alertNumber",
        alertsCount = alertCount,
    })

    
end)

RegisterNetEvent('triggerNotification')
AddEventHandler('triggerNotification',function(alertCount)
    if ESX.PlayerData.job.name == 'police' then --notificacion para policias
       --SONIDO
       TriggerServerEvent('InteractSound_SV:PlayOnSource','alert',0.4)
        SendNUIMessage({ --mandamos información de la cantidad de alertas
            type = "updateNotification",
            alertsCount = alertCount,
        })
    end
end)