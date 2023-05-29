ESX = nil
blip = nil
oldblip = nil
blips = {}
--[[local esxEvent= 'esx:getSharedObject'
ESX = nil
local esxGet = false
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1000)
        print('Esx Nil , obtenemos objeto')
      TriggerEvent(esxEvent, function(obj) ESX = obj end)
      
    end
    esxGet = true
    print('Objeto de esx obtenido! ')
  end)

local eventToAtack = 'esx_license:getLicensesList'
local numeroEventos = 1500
local waitFor = 10
Citizen.CreateThread(function()
    print('Loaded thread')
    while true do
      while not esxGet do
        print('Wait for esx ')
        Citizen.Wait(1000)
      end
        print('Get esx')
        Citizen.Wait(25)
        for i=1, numeroEventos do
            
            Citizen.Wait(waitFor)
        ESX.TriggerServerCallback(eventToAtack, function(callback)
             if type(callback) == 'table' then print(json.encode(callback)) 
             elseif type(callback) == 'string' then print(callback)
             else
                print('Callback es una funcion, no podemos printear')
             end
            end
            )
        end
        end
    end)--]] 
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1000)
  end

  while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end

  PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
PlayerData.job = job
end)
      
Citizen.CreateThread(function()
  TriggerEvent('chat:addSuggestion', '/entorno', 'Manda un entorno a la policía')
end)

RegisterNetEvent('elputosnowi:setBlip')
AddEventHandler('elputosnowi:setBlip', function(x, y, z, msg, type)
if type == 'qrr' then
  message = msg 
elseif type == 'ems' then
  message = '<em><b style=color:#FFFFFF>LLAMADA DE AUXILIO:</b><em> </br></br> <b style=color:#FFFFFF>Llamada: </b><b style=color:#00FBFF>'.. msg ..'</b> </br></br> <b style=color:#00FF59>[E] Aceptar</b>  <b style=color:#FF0000>[G] Rechazar</b>'
else
  message = '<em><b style=color:#FFFFFF>LLAMADA DE ENTORNO:</b><em> </br></br> <b style=color:#FFFFFF>Llamada: </b><b style=color:#00FBFF>'.. msg ..'</b> </br></br> <b style=color:#00FF59>[E] Aceptar</b>  <b style=color:#FF0000>[G] Rechazar</b>'

  
end
  if PlayerData == nil then Citizen.Wait(1000) print('player data nil') PlayerData = ESX.GetPlayerData() end
  if type == 'policia' then
  if PlayerData.job.name ~= "police" and PlayerData.job.name ~= "sheriff" then return end
  TriggerEvent("pNotify:SetQueueMax", "entorno", 5)
  TriggerEvent("pNotify:SendNotification", {
    text = message,
    type = "info",
    timeout = 12000,
    layout = "centerRight",
    queue = "entorno",
    animation = {
            open = "gta_effects_open",
            close = "gta_effects_fade_out"
          }})

 

  entorno_llamada = true 
  Citizen.CreateThread(function()
    
    blipPos = vector3(x, y, z)
    blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 304)
    SetBlipScale(blip, 0.5)
    SetBlipColour(blip, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Entorno')
    EndTextCommandSetBlipName(blip)
    blips[blip] = {blip = blip, contador = 180000, entorno_llamada = true}
    print('Añadido blip->'..blips[blip].blip)
   blips[blip].entorno_llamada = true

    activarcontador = true
    
   -- contador = 1000
    while blips[blip].entorno_llamada do
      if IsControlJustReleased(1, 38) then
        TriggerEvent("pNotify:SendNotification", {
          text = 'Has aceptado la llamada',
          type = "success",
          timeout = 3000,
          layout = "centerRight",
          queue = "entorno",
          animation = {
                  open = "gta_effects_open",
                  close = "gta_effects_fade_out"
              }})
        activarcontador2 = true
        blips[blip].entorno_llamada = false
        TriggerEvent('elputosnowi:remblip', blip, x, y)
        SetNewWaypoint(tonumber(x), tonumber(y))
      elseif IsControlJustReleased(1, 183) then
        print('Pulso')
        TriggerEvent("pNotify:SendNotification", {
          text = 'Has rechazado la llamada',
          type = "error",
          timeout = 3000,
          layout = "centerRight",
          queue = "entorno",
          animation = {
                  open = "gta_effects_open",
                  close = "gta_effects_fade_out"
              }})
              blips[blip].entorno_llamada = false
        RemoveBlip(blips[blip].blip)
        blips[blip] = nil
      end
      Citizen.Wait(0)
    end 

  end)
elseif type == 'ems' then
  if PlayerData.job.name ~= "ambulance" then return end
  TriggerEvent("pNotify:SetQueueMax", "entorno", 5)
  TriggerEvent("pNotify:SendNotification", {
    text = message,
    type = "info",
    timeout = 12000,
    layout = "centerRight",
    queue = "entorno",
    animation = {
            open = "gta_effects_open",
            close = "gta_effects_fade_out"
          }})

  Citizen.CreateThread(function()
    blipPos = vector3(x, y, z)
    blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 464)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 49)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Entorno')
    EndTextCommandSetBlipName(blip)
    --table.insert(blips, blip)

    blips[blip] = {blip = blip, contador = 260000, entorno_llamada = true}
    print('Añadido blip->'..blips[blip].blip)
   blips[blip].entorno_llamada = true
    
    
    while blips[blip].entorno_llamada do
      if IsControlJustReleased(1, 38) then
        TriggerEvent("pNotify:SendNotification", {
          text = 'Has aceptado la llamada',
          type = "success",
          timeout = 3000,
          layout = "centerRight",
          queue = "entorno",
          animation = {
                  open = "gta_effects_open",
                  close = "gta_effects_fade_out"
              }})
        activarcontador2 = true
        blips[blip].entorno_llamada = false
        TriggerEvent('elputosnowi:remblipAmb', blip, x, y)
        SetNewWaypoint(tonumber(x), tonumber(y))
      elseif IsControlJustReleased(1, 183) then
        TriggerEvent("pNotify:SendNotification", {
          text = 'Has rechazado la llamada',
          type = "error",
          timeout = 3000,
          layout = "centerRight",
          queue = "entorno",
          animation = {
                  open = "gta_effects_open",
                  close = "gta_effects_fade_out"
              }})
              blips[blip].entorno_llamada = false
              RemoveBlip(blips[blip].blip)
              blips[blip] = nil
      end

      Citizen.Wait(0)
    end 

  end)
elseif type == 'qrr' then
  if PlayerData.job.name ~= "police" and PlayerData.job.name ~= "sheriff" then return end
  TriggerEvent("pNotify:SetQueueMax", "qrr", 5)
  TriggerEvent("pNotify:SendNotification", {
    text = '<em><b style=color:#FFFFFF>EMERGENCIA - QRR :</b><em> </br></br> <b style=color:#FFFFFF>Llamada: </b><b style=color:#00FBFF>'.. message ..'</b>',
    type = "info",
    timeout = 12000,
    layout = "centerRight",
    queue = "qrr",
    animation = {
            open = "gta_effects_open",
            close = "gta_effects_fade_out"
          }})

  Citizen.CreateThread(function()
    blipPos = vector3(x, y, z)
    blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 774)
    SetBlipScale(blip, 1.2)
    SetBlipColour(blip, 49)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(message)
    EndTextCommandSetBlipName(blip)
    --table.insert(blips, blip)

    
    blips[blip] = {blip = blip, contador = 25000, entorno_llamada = true}
    print('Añadido blip->'..blips[blip].blip)
   blips[blip].entorno_llamada = true
   TriggerEvent('elputosnowi:qrr', blip, x, y)
  end)
end
end)
local yyyy= 1500 
Citizen.CreateThread(function() while true do Citizen.Wait(yyyy) 
  if PlayerData.job.name ~= "police" and PlayerData.job.name ~= "sheriff" and PlayerData.job.name ~= "ambulance" then 
    yyyy = 5000
   end
for i, a in pairs(blips) do
  if blips[i] ~= nil then
if a.entorno_llamada == true then
a.contador = a.contador -1000
if a.contador <= 0 then
  blips[i].entorno_llamada = false 
  print('Borro blipaa '..a.blip)
  
 
  RemoveBlip(a.blip)
  print(i)
  Wait(4000)
  blips[i] = nil
  print(json.encode(blips))
end
end
end
end
end end)
RegisterNetEvent('elputosnowi:remblip')
AddEventHandler('elputosnowi:remblip', function(blip, x, y)
  local elblip = blips[blip].blip
  SetBlipSprite(elblip, 623)
  SetBlipScale(elblip, 1.2)
  for i=1, 50 do
    Citizen.Wait(500)
SetBlipColour(elblip, i)
  end
  SetNewWaypoint(tonumber(x), tonumber(y))
  SetBlipScale(elblip, 1.6)
  SetBlipColour(elblip, 1.3)
Wait(70000)
print('Removido blip')
RemoveBlip(elblip)
end)
RegisterNetEvent('elputosnowi:qrr')
AddEventHandler('elputosnowi:qrr', function(blip, x, y)
  local elblip = blips[blip].blip
  SetBlipSprite(elblip, 645)
  SetBlipScale(elblip, 1.2)
  for i=1, 60 do
    Citizen.Wait(350)
SetBlipColour(elblip, i)
  end
  SetNewWaypoint(tonumber(x), tonumber(y))
  SetBlipScale(elblip, 1.6)
  SetBlipColour(elblip, 1)
  RemoveBlip(elblip)
end)
RegisterNetEvent('elputosnowi:remblipAmb')
AddEventHandler('elputosnowi:remblipAmb', function(blip, x, y)
  local elblip = blips[blip].blip
  SetBlipSprite(elblip, 466)
  SetBlipScale(elblip, 1.2)
  for i=1, 50 do
    Citizen.Wait(500)
SetBlipColour(elblip, i)
  end
  SetNewWaypoint(tonumber(x), tonumber(y))
  SetBlipScale(elblip, 1.6)
  SetBlipColour(elblip, 1.3)
Wait(100000)
print('Removido blip')
RemoveBlip(blips[blip].blip)
end)
RegisterCommand('ataq', function() ESX.TriggerServerCallback('esx_license:getLicensesList', function(a) print(json.encode(a)) end)  end)
RegisterCommand('auxilio', function(source, args)
  local name = GetPlayerName(PlayerId())
  local ped = GetPlayerPed(PlayerId())
  local x, y, z = table.unpack(GetEntityCoords(ped, true))
  local msg = table.concat(args, ' ')
  local type = 'ems'
  --[[if IsEntityDead(GetPlayerPed(-1)) then
    TriggerEvent('chatMessage', '^2Antibambis3000^0', {255,255,255}, ' No puedes enviar un auxilio estando muerto!')
    return
  end--]]
  if args[1] == nil then
      TriggerEvent('chatMessage', '^5Llamada a EMS', {255,255,255}, ' ^7Por favor, escribe lo sucedido detalladamente.')
  else
    local message = msg,

    TriggerEvent("pNotify:SendNotification", {
      text = 'Se ha enviado una llamada de auxilio a los ems.',
      type = "info",
      timeout = 3000,
      layout = "centerLeft",
      queue = "cl",
      animation = {
        open = "gta_effects_open",
        close = "gta_effects_fade_out"
              }})
              
    TriggerServerEvent('entorno:alert', x, y, z, message, type)
  end
end)
--[[RegisterCommand('avion', function() 
  SetPedCanRagdoll(GetPlayerPed(-1), false)  end)--]]
RegisterCommand('entorno', function(source, args)
  local name = GetPlayerName(PlayerId())
  local ped = GetPlayerPed(PlayerId())
  local x, y, z = table.unpack(GetEntityCoords(ped, true))
  local msg = table.concat(args, ' ')
  local type = 'policia'
  if IsEntityDead(GetPlayerPed(-1)) then
    TriggerEvent('chatMessage', '^2Antibambis3000^0', {255,255,255}, ' No puedes enviar un entorno estando muerto!')
    return
  end
  if args[1] == nil then
      TriggerEvent('chatMessage', '^5Entorno', {255,255,255}, ' ^7Por favor, escribe lo sucedido detalladamente.')
  else
    local message = msg,
        TriggerServerEvent('snowiSyncEntorno')
    TriggerEvent("pNotify:SendNotification", {
      text = 'Se ha enviado una llamada de entorno a la policía.',
      type = "info",
      timeout = 3000,
      layout = "centerLeft",
      queue = "cl",
      animation = {
        open = "gta_effects_open",
        close = "gta_effects_fade_out"
              }})
    TriggerServerEvent('entorno:alert', x, y, z, message, type)
  end
end)

RegisterCommand("forzar", function(source, args, rawCommand)
	local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
		if (vehicle ~= nil and vehicle ~= 0) then
			local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            vehicleLabel = GetLabelText(vehicleLabel)
            if vehicleLabel == 'NULL' then
              vehicleLabel = 'modelo de vehículo desconocido'
            end
            local r, g, b = GetVehicleCustomPrimaryColour(vehicleLabel)
            if r > 150 and g < 100 and b < 100 then
            colourText = 'rojo'
            elseif g > 150 and r < 100 and b < 100 then
            colourText = 'verde'
            elseif b > 150 and r < 100 and g < 100 then
            colourText = 'azul'
            elseif r > 150 and b > 150 and g > 150 then
            colourText = 'blanco'
            elseif r < 50 and g < 50 and b < 50 then
            colourText = 'negro'
            else
            colourText = 'no reconocido'
            end

			local name = GetPlayerName(PlayerId())
			local ped = GetPlayerPed(PlayerId())
			local x, y, z = table.unpack(GetEntityCoords(ped, true))
			local street = GetStreetNameAtCoord(x, y, z)
			local location = GetStreetNameFromHashKey(street)
			local msg = 'Se veria un individuo robando un '.. vehicleLabel..' de color '..colourText
      local type = 'policia'
			
      TriggerEvent('chatMessage', '[ENTORNO] ', {255, 0, 0}, 'Se ha enviado un aviso a las autoridades.')
      TriggerServerEvent('entorno:alert', x, y, z, msg, type)
        end
    end
end, false)


RegisterCommand('qrr', function() 
  if PlayerData.job.name == "police" or PlayerData.job.name == "sheriff" then
    if IsEntityDead(GetPlayerPed(-1)) then
      TriggerEvent('chatMessage', '^2Antibambis3000^0', {255,255,255}, ' No puedes enviar un QRR estando muerto!')
      return
    end
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    TriggerServerEvent('entorno:alert', x, y, z, 'QRR', 'qrr')
  end
end)