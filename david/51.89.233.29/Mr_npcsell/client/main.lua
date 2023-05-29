ESX                 = nil
local myJob     = nil
local selling       = false
local has       = false
local copsc     = false
local WEAPON_UNARMED = GetHashKey('WEAPON_UNARMED')
local currentPed = nil
local customers = {}
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
  TriggerServerEvent('fetchjob')
end)

-- RETURN NUMBER OF ITEMS FROM SERVER
RegisterNetEvent('getjob')
AddEventHandler('getjob', function(jobName)
  myJob = jobName
end)

waittime = 100
Citizen.CreateThread(function()
  while true do
    Wait(waittime)
    local player = GetPlayerPed(-1)
    local playerloc = GetEntityCoords(player, 0)
    local handle, ped = FindFirstPed()
    repeat
      success, ped = FindNextPed(handle)
      local pos = GetEntityCoords(ped)
      local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
      if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
        if DoesEntityExist(ped)then
          if IsPedDeadOrDying(ped) == false then
            if IsPedInAnyVehicle(ped) == false then
              local pedType = GetPedType(ped)
              if pedType ~= 28 and IsPedAPlayer(ped) == false then
                if distance <= 2 and ped  ~= GetPlayerPed(-1) then
                  if not CheckPedWasCustomerBefore(ped) then
                    TriggerServerEvent('checkD')
                    if has == true then
                      if GetSelectedPedWeapon(player) == WEAPON_UNARMED then 
                        waittime = 0
                        ESX.ShowHelpNotification("Presiona ~g~E ~w~para tratar de pasar algo de droga...")
                         if IsControlJustPressed(1, 86) then
                            if (IsPedInMeleeCombat(player) or IsPedSprinting(ped) or IsPedRunning(ped) or IsPedInWrithe(ped) or IsPedGettingUp(ped) or IsPedFleeing(ped) or IsEntityAMissionEntity(ped)) then
                              currentPed = ped
                              table.insert(customers, ped)
                              ESX.ShowNotification("Esta persona no esta en condiciones de comprar nada...")
                              TaskSmartFleePed(ped, GetPlayerPed(-1), -1, -1, true, true)
                              Citizen.Wait(3000)
                            else
                              currentPed = ped
                              SetEntityAsMissionEntity(ped)
                              ClearPedTasksImmediately(ped)
                              TaskStandStill(ped, 19.0)
                              TaskLookAtEntity(ped, player, -1, 2048, 3)
                              TaskLookAtEntity(player, ped, -1, 2048, 3)
                              pos1 = GetEntityCoords(ped)
                              TriggerServerEvent('drugs:trigger')
                              Citizen.Wait(2850)
                              TriggerEvent('sell')
                              table.insert(customers, ped)
                              SetPedAsNoLongerNeeded(ped)
                              TaskSmartFleePed(ped, GetPlayerPed(-1), -1, -1, true, true)
                              waittime = 100
                            end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    until not success
  
    EndFindPed(handle)
  end
end)

function CheckPedWasCustomerBefore(ped)
  local wasCustomer = false
  if #customers > 10 then
    table.remove(customers, 1)
  end
  for i,v in ipairs(customers) do 
    if(v == ped) then
      wasCustomer = true
    end
  end
  return wasCustomer
end

RegisterNetEvent('sell')
AddEventHandler('sell', function()
    waittime = 100
    local player = GetPlayerPed(-1)
    local playerloc = GetEntityCoords(player, 0)
    local distance = GetDistanceBetweenCoords(pos1.x, pos1.y, pos1.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

    if distance <= 2 then
      TriggerServerEvent('drugs:sell')
    elseif distance > 2 then
      TriggerServerEvent('sell_dis')
    end
end)


RegisterNetEvent('checkR')
AddEventHandler('checkR', function(test)
  has = test
end)

RegisterNetEvent('notify_maybe_call')
AddEventHandler('notify_maybe_call', function()
  TaskSmartFleePed(currentPed, GetPlayerPed(-1), -1, -1, true, true)
  Citizen.Wait(3000)
end)

RegisterNetEvent('notifyc')
AddEventHandler('notifyc', function()      
    local player = PlayerPedId()
    local PedPosition = GetEntityCoords(player)

    local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }

    TriggerServerEvent('esx_addons_gcphone:startCall', 'police', 'Alguien esta vendiendo drogas en ', PlayerCoords, {

        PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
    })
end)

RegisterNetEvent('animation')
AddEventHandler('animation', function()
  local pid = PlayerPedId()
  RequestAnimDict("amb@prop_human_bum_bin@idle_b")
  while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do Citizen.Wait(0) end
    if currentPed ~= nil then
      TaskPlayAnim(currentPed,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
    end
    TaskPlayAnim(pid,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
    Wait(1200)
    if currentPed ~= nil then
      StopAnimTask(currentPed, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)
    end
    StopAnimTask(pid, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)
end)
