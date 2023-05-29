
local isMinero, isInMarker, isInPublicMarker, hintIsShowed, HasAlreadyEnteredMarker = false, false, false, false, false
local LastZone, CurrentAction, CurrentActionMsg
local CurrentActionData, Blips, PlayerData = {}, {}, {}
local hintToDisplay = "no hint to display"

ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)




function IsJobTrue()
    return true
end



function IsGradeBoss()
    if PlayerData ~= nil then
        local IsGradeBoss = false
        if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'viceboss' then
            IsGradeBoss = true
        end
        return IsGradeBoss
    end
end



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

function cleanPlayer(playerPed)
  ClearPedBloodDamage(playerPed)
  ResetPedVisibleDamage(playerPed)
  ClearPedLastWeaponDamage(playerPed)
  ResetPedMovementClipset(playerPed, 0)
end

function setClipset(playerPed, clip)
  RequestAnimSet(clip)
  while not HasAnimSetLoaded(clip) do
    Citizen.Wait(0)
  end
  SetPedMovementClipset(playerPed, clip, true)
end

function OpenFundicionMenu()
    local elements = {
      {label = "Lavar piedra", value = 'piedra'},
      {label = "Fundir oro", value = 'oro'},
      {label = "Fundir plata", value = 'plata'}
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fundicion', {
        title    = "Fundición",
        align    = 'bottom-right',
        elements = elements,
      }, function(data, menu)

        if data.current.value == 'piedra' then
          TriggerServerEvent('delux:piedra')
        end

        if data.current.value == 'oro' then
          TriggerServerEvent('delux:oro')
        end

        if data.current.value == 'plata' then
          TriggerServerEvent('delux:plata')
        end

      end, function(data, menu)

        menu.close()

        CurrentAction = 'fundicion'
        CurrentActionMsg = _U('open_vault')
        CurrentActionData = {}
      end)
end

AddEventHandler('esx_minerojob:hasEnteredMarker', function(zone)
    if zone == 'Fundicion' then
      CurrentAction     = 'fundicion'
      CurrentActionMsg  = "~y~[E]~s~ para fundir los minerales"
      CurrentActionData = {}
    end
end)

AddEventHandler('esx_minerojob:hasExitedMarker', function(zone)
    CurrentAction = nil
    ESX.UI.Menu.CloseAll()
end)

-- MARCAS
Citizen.CreateThread(function()
    while true do

        Wait(0)
        if IsJobTrue() then

            local coords = GetEntityCoords(GetPlayerPed(-1))

            for k,v in pairs(Config.Zones) do
                if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
                    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
                end
            end
        end
    end
end)

-- EVENTOS
Citizen.CreateThread(function()
    while true do

        Wait(0)
        if IsJobTrue() then
            local coords      = GetEntityCoords(GetPlayerPed(-1))
            local isInMarker  = false
            local currentZone = nil

            for k,v in pairs(Config.Zones) do
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                    isInMarker  = true
                    currentZone = k
                end
            end

            if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
                HasAlreadyEnteredMarker = true
                LastZone                = currentZone
                TriggerEvent('esx_minerojob:hasEnteredMarker', currentZone)
            end

            if not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent('esx_minerojob:hasExitedMarker', LastZone)
            end
        end
    end
end)

-- KEYS
Citizen.CreateThread(function()
  local playerPed = PlayerPedId()
  local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
  while true do

    Citizen.Wait(0)

    if CurrentAction ~= nil then
      ESX.ShowFloatingHelpNotification(CurrentActionMsg, GetEntityCoords(PlayerPedId()))

      if IsControlJustReleased(0,  38) and IsJobTrue() then

        if CurrentAction == 'fundicion' then
          OpenFundicionMenu()
        end

        CurrentAction = nil
      end
    end
  end
end)





