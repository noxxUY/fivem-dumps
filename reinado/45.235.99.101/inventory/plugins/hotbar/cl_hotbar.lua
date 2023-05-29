if Config.Hotbar then 
  hbSoftLock = false
  WeaponLock = false
  WeaponEquipped = nil

  
  local isInFFA = false
  local isInPurga = false

  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1000)
      isInFFA = exports['hex_ffa']:isInZone()
      isInPurga = exports['lapurga']:InPurge()
    --  print(isInPurga,isInFFA)
    end
  end)


  CreateThread(function ()
    while true do 
      Wait(1)
      
      if isInFFA or isInPurga then
        ShowHudComponentThisFrame(19)
        ShowHudComponentThisFrame(20)
        ShowHudComponentThisFrame(17)
        -- print('entro show')
      else
        HideHudComponentThisFrame(19)
        HideHudComponentThisFrame(20)
        HideHudComponentThisFrame(17)
      end
    end
  end)

  -- CreateThread(function ()
  --   while true do
  --     Wait(1)
  --     for k,v in pairs(Config.HotbarKeys) do
  --       if IsDisabledControlJustPressed(0, v) then
  --         UseItemFromHotbar(tostring(k-1))
  --       end
  --     end
  --   end
  -- end)

  CreateThread(function ()
    while true do
      Wait(1)
      if not isInFFA then        
        for k,v in pairs(Config.HotbarKeys) do
          if IsDisabledControlJustPressed(0, v) then
            UseItemFromHotbar(tostring(k-1))
          end
        end
      end

    end
  end)

  
  CreateThread(function()
    while true do
      Wait(1)
      if not isInFFA or not isInPurga then
              if WeaponLock then
                DisableControlAction(0, 37, true) --Disable Tab
                DisableControlAction(1, 159, true) -- El Seis
                DisableControlAction(1, 161, true) -- El Siete
                DisableControlAction(1, 162, true) -- El Ocho
                DisableControlAction(1, 163, true) -- El Nueve
                DisableControlAction(1, 25, true )
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
                DisableControlAction(1, 23, true)
                DisablePlayerFiring(PlayerPedId(), true)
              end
      else 
          DisableControlAction(0, 37, true)
          EnableControlAction(1, 25, true )
          EnableControlAction(1, 140, true)
          DisableControlAction(1, 141, true)
          EnableControlAction(1, 142, true)
          EnableControlAction(1, 23, true)
      end
    end
  end)


  
  RegisterNetEvent('inventory:onItemRemove', function (item)
    if item.type == 'item_weapon' then
      if WeaponEquipped then
        if WeaponEquipped.name == item.name then
          WeaponEquipped = nil
        end
      end
    end
  end)


  RegisterCommand('showHotbar', function ()
    local ped = PlayerPedId()

    if IsPauseMenuActive() then return end
    if IsPlayerDead(ped) then return end
    if isInFFA then return end
    if isInPurga then return end

    local hotbar = Events.TriggerServerEvent('inventory:getHotbar')
    SendNUIMessage({
      type = 'showHotbar',
      hotbar = hotbar
    })  
  end)


  -- RegisterCommand('showHotbar', function ()
  --   local ped = PlayerPedId()
    
  --   if not isInFFA then
  --       if IsPauseMenuActive() then return end
  --       if IsPlayerDead(ped) then return end

  --       local hotbar = Events.TriggerServerEvent('inventory:getHotbar')
  --       SendNUIMessage({
  --         type = 'showHotbar',
  --         hotbar = hotbar
  --       }) 
    
  --     elseif not isInPurga then
  --       if IsPauseMenuActive() then return end
  --       if IsPlayerDead(ped) then return end

  --       local hotbar = Events.TriggerServerEvent('inventory:getHotbar')
  --       SendNUIMessage({
  --         type = 'showHotbar',
  --         hotbar = hotbar
  --       }) 

  --     else


  --   end
    

  -- end)



  RegisterKeyMapping('showHotbar', 'Hotbar', 'keyboard', 'tab')

  function UseItemFromHotbar(slot)
    if hbSoftLock then
      return
    end

    lockHB()

    local playerData = Events.TriggerServerEvent('inventory:getPlayerItems')
    local hotbarItem = playerData.hotbar[slot]
    local item = nil

    if not hotbarItem then 
      return
    end

    for k,v in pairs(playerData.items) do 
      if v.name == hotbarItem.name then 
        item = v
      end
    end

    local ped = PlayerPedId()

    if item then 
      if item.type == 'item_standard' then 
        if item.canUse then
          TriggerServerEvent(Config.ESXPrefix..':useItem', item.name)
        end
      elseif item.type == 'item_weapon' then 
        if WeaponLock then 
          return
        end

        WeaponLock = true

        if not WeaponEquipped or WeaponEquipped.name ~= item.name then 
          WeaponEquipped = item
          if Config.WeaponAnimation then
            LoadAnimDict('reaction@intimidation@1h', function ()
              TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, -1, 48, 2, 0, 0, 0)
              Wait(1500)
              ClearPedTasks(ped)
              SetCurrentPedWeapon(ped, item.name, true)
              SetWeaponsNoAutoswap(true)
              WeaponLock = false
            end)
          else 
            SetCurrentPedWeapon(ped, item.name, true)
            SetWeaponsNoAutoswap(true)
            WeaponLock = false
          end

        else  
          WeaponEquipped = nil
          if Config.WeaponAnimation then
            LoadAnimDict('reaction@intimidation@1h', function ()
              TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, -1, 48, 2, 0, 0, 0)
              Wait(1500)
              ClearPedTasks(ped)
              SetCurrentPedWeapon(ped, "WEAPON_UNARMED", true)
              WeaponLock = false
            end)
          else 
            SetCurrentPedWeapon(ped, "WEAPON_UNARMED", true)
            WeaponLock = false
          end
        end
      end
    end
  end

  function lockHB()
    hbSoftLock = true
    SetTimeout(500, function ()
      hbSoftLock = false
    end)
  end
end