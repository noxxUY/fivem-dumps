--[[ Vehicle Spawner ]]
function LuxuSpawnVehicle(model, cb, coords, isnetworked)
      local model = GetHashKey(model)
      local ped = PlayerPedId()
      if coords then
            coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
      else
            coords = GetEntityCoords(ped)
      end
      local isnetworked = isnetworked or true
      if not IsModelInCdimage(model) then
            return
      end
      RequestModel(model)
      while not HasModelLoaded(model) do
            Wait(10)
      end
      local veh = CreateVehicle(model, coords.x, coords.y, coords.z, coords.w, isnetworked, false)
      local netid = NetworkGetNetworkIdFromEntity(veh)
      SetVehicleHasBeenOwnedByPlayer(veh, true)
      SetNetworkIdCanMigrate(netid, true)
      SetVehicleNeedsToBeHotwired(veh, false)
      SetVehRadioStation(veh, 'OFF')
      if cb then
            cb(veh)
      end
      SetModelAsNoLongerNeeded(model)
end

--[[ Revive ]]
RegisterNetEvent("LuxuAdminMenu:Revive", function()
      if not CheckPerm('luxuadmin.revive') then return end

      if Config.Framework == 'qb' then
            TriggerEvent('hospital:client:Revive', PlayerPedId())
      else
            TriggerEvent('esx_ambulancejob:revive')
      end
end)



--[[ Gives Player the current vehicle ped is in  ]]
RegisterNetEvent('LuxuAdminMenu:SaveCar', function(veh_model)
      local ped = PlayerPedId()
      local veh = GetVehiclePedIsIn(ped)
      --[[ QBCore ]]
      if Config.Framework == 'qb' then
            if veh ~= nil and veh ~= 0 then
                  local plate = QBCore.Functions.GetPlate(veh)
                  local props = QBCore.Functions.GetVehicleProperties(veh)
                  local vehname = veh_model
                  if VehiclesInfo[vehname] ~= nil and next(VehiclesInfo[vehname]) ~= nil then
                        TriggerServerEvent('LuxuAdminMenu:Server:SaveCar', props, VehiclesInfo[vehname],
                              GetHashKey(veh),
                              plate)
                  else
                        Notify("error.no_store_vehicle_garage", 'error', 2000)
                  end
            else
                  Notify("error.no_vehicle", 'error', 2000)
            end

            --[[ ESX ]]
      elseif Config.Framework == 'esx' then
            local vehicleProperties = ESX.Game.GetVehicleProperties(veh)
            local vehname = veh_model
            if VehiclesInfo[vehname] ~= nil and next(VehiclesInfo[vehname]) ~= nil then
                  TriggerServerEvent('LuxuAdminMenu:Server:SaveCar', vehicleProperties, VehiclesInfo[vehname],
                        GetHashKey(veh))
            else
                  Notify("error.no_store_vehicle_garage", 'error', 2000)
            end
      else

      end
end)


--[[ Weather ⛅ ]]
RegisterNetEvent('LuxuAdminMenu:ChangeWeather', function(type)
      --[[ Only being used by ESX ]]
      ClearWeatherTypePersist()

      SetWeatherTypeNow(type)
      SetWeatherTypeNowPersist(type)
end)


--[[ TIME ⏲️ ]]
RegisterNetEvent('LuxuAdminMenu:ChangeTime', function(data)
      --[[ Only being used by ESX ]]
      local hours = data.hours
      local minutes = data.minutes
      NetworkOverrideClockTime(hours, minutes, 0)
end)

--[[ FREEZE TIME ]]
local TimeIsFrozen = false
RegisterNetEvent('LuxuAdminMenu:FreezeTime', function()
      --[[ Only being used by ESX ]]
      TimeIsFrozen = not TimeIsFrozen
      Notify('Time Frozen: ' .. tostring(TimeIsFrozen), 'primary', 2500)
      local hours = GetClockHours()
      local minutes = GetClockMinutes()
      local seconds = GetClockSeconds()
      while TimeIsFrozen do
            if TimeIsFrozen then NetworkOverrideClockTime(hours, minutes, seconds) end
            Wait(60000)
      end
end)


--[[ Spectate ]]
local isSpectating = false
local lastSpectateCoord

RegisterNetEvent('LuxuAdminMenu:Spectate', function(targetServerID, coords)
      local myPed = PlayerPedId()
      local targetPlayerId, targetPed

      if not isSpectating then
            isSpectating = true
            lastSpectateCoord = GetEntityCoords(myPed) -- save my last coords
            RequestCollisionAtCoord(coords)
            SetEntityVisible(myPed, false)             -- Set invisible
            SetEntityCoords(myPed, coords.x, coords.y, coords.z)
            Wait(500)
            targetPlayerId = GetPlayerFromServerId(targetServerID)
            targetPed = GetPlayerPed(targetPlayerId)
            SetEntityCollision(myPed, false, false)              -- Set collision
            SetEntityInvincible(myPed, true)                     -- Set invincible
            NetworkSetEntityInvisibleToNetwork(myPed, isVisible) -- Set invisibility
            NetworkSetInSpectatorMode(true, targetPed)           -- Enter Spectate Mode
      else
            isSpectating = false
            targetPlayerId = GetPlayerFromServerId(targetServerID)
            targetPed = GetPlayerPed(targetPlayerId)
            NetworkSetInSpectatorMode(false, targetPed)          -- Remove From Spectate Mode
            NetworkSetEntityInvisibleToNetwork(myPed, isVisible) -- Set Visible
            SetEntityCollision(myPed, true, true)                -- Set collision
            SetEntityCoords(myPed, lastSpectateCoord)            -- Return Me To My Coords
            SetEntityVisible(myPed, true)                        -- Remove invisible
            if (IsGodmode == false) then
                  SetEntityInvincible(myPed, false)              -- Remove godmode
            end                                                  -- Remove godmode
            lastSpectateCoord = nil                              -- Reset Last Saved Coords
      end
end)

--[[ Control Specation ]]
local isSpectatingControl = false
local previousCoords

RegisterNetEvent('LuxuAdminMenu:SpectateControl', function(targetServerID, coords)
      local myPed = PlayerPedId()
      local targetPlayerId, targetPed



      if not isSpectatingControl then
            isSpectatingControl = true
            RequestCollisionAtCoord(coords)
            previousCoords = GetEntityCoords(myPed) -- get my current coords
            SetEntityVisible(myPed, false)          -- Set invisible
            SetEntityCoords(myPed, coords.x, coords.y, coords.z)
            Wait(500)
            targetPlayerId = GetPlayerFromServerId(targetServerID)
            targetPed = GetPlayerPed(targetPlayerId)
            SetEntityCollision(myPed, false, false)              -- Set collision
            SetEntityInvincible(myPed, true)                     -- Set invincible
            NetworkSetEntityInvisibleToNetwork(myPed, isVisible) -- Set invisibility
            NetworkSetInSpectatorMode(true, targetPed)           -- Enter Spectate Mode
      else
            isSpectatingControl = false
            targetPlayerId = GetPlayerFromServerId(targetServerID)
            targetPed = GetPlayerPed(targetPlayerId)
            NetworkSetInSpectatorMode(false, targetPed)          -- Remove From Spectate Mode
            SetEntityCoords(myPed, previousCoords.x, previousCoords.y, previousCoords.z)
            NetworkSetEntityInvisibleToNetwork(myPed, isVisible) -- Set Visible
            SetEntityCollision(myPed, true, true)                -- Set collision
            SetEntityVisible(myPed, true)                        -- Remove invisible
            if (IsGodmode == false) then
                  SetEntityInvincible(myPed, false)              -- Remove godmode
            end
      end
end)






RegisterNetEvent('LuxuAdmin:ToggleGodmode', function(mode, adminsrc)
      if not CheckPerm('luxuadmin.togglegodmode', adminsrc) then return end

      local ped = PlayerPedId()
      IsGodmode = mode
      SetEntityInvincible(ped, mode)
end)



RegisterNetEvent('LuxuAdmin:Client:KillSelf', function()
      SetEntityHealth(PlayerPedId(), 0)
end)
