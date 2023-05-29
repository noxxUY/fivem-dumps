ESXMenuHandler = function(d,t,st)
  if t == "Entry" then
    if st == "Owner" then
      MenuOpen = true
      FreezeEntityPosition(PlayerPedId(),true)
      ESXEntryOwnerMenu(d)
    elseif st == "Owned" then
      MenuOpen = true
      FreezeEntityPosition(PlayerPedId(),true)
      ESXEntryOwnedMenu(d)
    elseif st == "Empty" then
      MenuOpen = true
      FreezeEntityPosition(PlayerPedId(),true)
      ESXEntryEmptyMenu(d)
    end
  elseif t == "Garage" then
    if st == "Owner" then
      MenuOpen = true
      FreezeEntityPosition(PlayerPedId(),true)
      ESXGarageOwnerMenu(d)
    elseif st == "Owned" then
      MenuOpen = true
      FreezeEntityPosition(PlayerPedId(),true)
      ESXGarageOwnedMenu(d)
    end
  elseif t == "Exit" then
    if st == "Owner" then
      ESXExitOwnerMenu(d)
    elseif st == "Owned" then
      ESXExitOwnedMenu(d)
    elseif st == "Empty" then
      ESXExitEmptyMenu(d)
    end
  elseif t == "Wardrobe" then
    if st == "Owner" or st == "Owned" then
      ESXWardrobeMenu(d)
    end
  elseif t == "InventoryLocation" then
    OpenInventory(d)
  end
end

-- ESXWardrobeMenu = function(d)
--   local outfits = Callback("Allhousing:GetOutfits")
--   if not outfits or #outfits <= 0 then
--     ShowNotification(Labels['NoOutfits'])
--     return
--   end

--   local elements = {}
--   for k,v in pairs(outfits) do
--     table.insert(elements,{label = v,value = k})
--   end

--   ESX.UI.Menu.Open('default', GetCurrentResourceName(), "wardrobe_menu",{
--       title    = Labels["Wardrobe"],
--       align    = 'left',
--       elements = elements,
--     }, 
--     function(submitData,submitMenu)
--       SetOutfit(submitData.current.value,submitData.current.label)
--     end,
--     function(data,menu)
--       menu.close()
--     end
--   )
-- end

ESXWardrobeMenu = function(d)

  ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)

    local elements = {}

    for i=1, #dressing, 1 do
      table.insert(elements, {label = dressing[i], value = i})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'player_dressing',
      {
        title    = 'Guardarropa',
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        TriggerEvent('skinchanger:getSkin', function(skin)

          ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes, outfit)

            TriggerEvent('skinchanger:loadClothes', skin, clothes)
            TriggerEvent('esx_skin:setLastSkin', skin)

            TriggerEvent('skinchanger:getSkin', function(skin)
              TriggerServerEvent('esx_skin:save', skin)
            end)

          exports['okokNotify']:Alert("SERVIDOR", 'Vestiste el outfit <span style="color: green;">'..outfit..'</span> de tu armario.', 4500, 'info')
          menu.close()

          end, data.current.value)

        end)

      end,
      function(data, menu)
        menu.close()
  
      end
    )

  end)

end

ESXOpenInviteMenu = function(d)
  local elements = {}
  local players = GetNearbyPlayers(d.Entry,10.0)
  local c = 0
  for _,player in pairs(players) do
    if player ~= PlayerId() then
      table.insert(elements,{label = GetPlayerName(player).." [ID:"..GetPlayerServerId(player).."]",value = GetPlayerServerId(player),name = GetPlayerName(player)})
    end
  end
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_invite_menu",{
      title    = Labels['InviteInside'],
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      submitMenu.close()
      InviteInside(d,submitData.current.value)
      exports['okokNotify']:Alert("SERVIDOR", 'Invitaste a '..submitData.current.name..' adentro', 3500, 'info')
    end
  )
end

ESXOpenKeysMenu = function(d)
  local elements = {
    [1] = {label = Labels['GiveKeys'],value = "Give"},
    [2] = {label = Labels['TakeKeys'],value = "Take"}
  }
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_keys_menu",{
      title    = Labels['HouseKeys'],
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      if submitData.current.value == "Give" then
        ESXGiveKeysMenu(d)
      elseif submitData.current.value == "Take" then
        ESXTakeKeysMenu(d)
      end
    end,
    function(data,menu)
      menu.close()
    end
  )
end

ESXGiveKeysMenu = function(d)
  local elements = {}
  local players = GetNearbyPlayers(GetEntityCoords(PlayerPedId()),10.0)
  local c = 0
  for _,player in pairs(players) do
    if player ~= PlayerId() then
      table.insert(elements,{label = GetPlayerName(player).." [ID:"..player.."]",value = GetPlayerServerId(player)})
    end
  end
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_givekeys_menu",{
      title    = Labels['GiveKeys'],
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      GiveKeys(d,submitData.current.value)
    end,
    function(data,menu)
      menu.close()
    end
  )
end

ESXTakeKeysMenu = function(d)
  local elements = {}
  local players = GetNearbyPlayers(d.Entry,10.0)
  local c = 0
  for _,player in pairs(d.HouseKeys) do
    table.insert(elements,{label = player.name,value = player})
  end
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_takekeys_menu",{
      title    = Labels['TakeKeys'],
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      TakeKeys(d,submitData.current.value)
    end,
    function(data,menu)
      menu.close()
    end
  )
end

ESXExitOwnerMenu = function(d)
  local elements = {}
  if Config.UseHouseInventory then
    if Config.AllowHouseSales then
      if d.Shell then
        elements = {

          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
           {
            icon = "fa-solid fa-users",
            title = Labels["InviteInside"],
            value = "Invite",
            description="Invitar personas adentro de la casa."
           },


           {
            icon = "fa-solid fa-key",
            title = Labels["HouseKeys"],
            value = "Keys",
            description = "Gestionar las llaves de la casa."
           },

           {
            icon = "fa-solid fa-money-bill-transfer",
            title = Labels['SellHouse'],
            value = "Sell",
            description = "Poner la casa en venta."
           },

          --  {
          --   icon = "fa-solid fa-chair",
          --   title = Labels['FurniUI'],
          --   value = "Furni",
          --   description = "Gestionar la decoración de la casa."
          --  },

           {
            icon = "fa-solid fa-shirt",
            title = Labels['Wardrobe'],
            value = "Wardrobe",
            description = "Mover el guardaropa de la casa."
           },

           {
            icon = "fa-solid fa-boxes-packing",
            title = Labels['Inventory'],
            value = "Inventory",
            description = "Mover el inventario de la casa."
           },

           {
            icon = "fa-solid fa-lock",
            title = d.Unlocked and Labels["LockDoor"] or Labels["UnlockDoor"],
            value = d.Unlocked and "Lock" or "Unlock",
            description = "Cerrar o abrir las puertas de la casa."
           },

           {
            icon = "fa-solid fa-right-from-bracket",
            title = Labels['LeaveHouse'],
            value = "Leave",
            description = "Salir a la calle."
           }

           

          -- {label = Labels["InviteInside"],value = "Invite"},
          -- {label = Labels["HouseKeys"],value = "Keys"},
          -- {label = Labels["SellHouse"],value = "Sell"},
          -- {label = Labels["FurniUI"],value = "Furni"},
          -- {label = Labels["SetWardrobe"],value = "Wardrobe"},
          -- {label = Labels["SetInventory"],value = "Inventory"},
          -- {label = (d.Unlocked and Labels["LockDoor"] or Labels["UnlockDoor"]),value = (d.Unlocked and "Lock" or "Unlock")},
          -- {label = Labels["LeaveHouse"],value = "Leave"},
        }
      else
        elements = {
          


          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },

           {
            icon = "fa-solid fa-key",
            title = Labels["HouseKeys"],
            value = "Keys",
            description = "Gestionar las llaves de la casa."
           },

           {
            icon = "fa-solid fa-money-bill-transfer",
            title = Labels['SellHouse'],
            value = "Sell",
            description = "Poner la casa en venta."
           },

          --  {
          --   icon = "fa-solid fa-chair",
          --   title = Labels['FurniUI'],
          --   value = "Furni",
          --   description = "Gestionar la decoración de la casa."
          --  },

           {
            icon = "fa-solid fa-shirt",
            title = Labels['Wardrobe'],
            value = "Wardrobe",
            description = "Mover el guardaropa de la casa."
           },

           {
            icon = "fa-solid fa-boxes-packing",
            title = Labels['Inventory'],
            value = "Inventory",
            description = "Mover el inventario de la casa."
           }


          -- {label = Labels["HouseKeys"],value = "Keys"},
          -- {label = Labels["SellHouse"],value = "Sell"},
          -- {label = Labels["FurniUI"],value = "Furni"},
          -- {label = Labels["SetWardrobe"],value = "Wardrobe"},
          -- {label = Labels["SetInventory"],value = "Inventory"},
        }
      end
      if (d.MortgageOwed and d.MortgageOwed >= 1) then
        table.insert(elements,#elements,{label = "Mortgage", value = "Mortgage"})
      end
    else
      if d.Shell then
        elements = {

          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
           {
            icon = "fa-solid fa-users",
            title = Labels["InviteInside"],
            value = "Invite",
            description="Invitar personas adentro de la casa."
           },


           {
            icon = "fa-solid fa-key",
            title = Labels["HouseKeys"],
            value = "Keys",
            description = "Gestionar las llaves de la casa."
           },


          --  {
          --   icon = "fa-solid fa-chair",
          --   title = Labels['FurniUI'],
          --   value = "Furni",
          --   description = "Gestionar la decoración de la casa."
          --  },

           {
            icon = "fa-solid fa-shirt",
            title = Labels['Wardrobe'],
            value = "Wardrobe",
            description = "Mover el guardaropa de la casa."
           },

           {
            icon = "fa-solid fa-boxes-packing",
            title = Labels['Inventory'],
            value = "Inventory",
            description = "Mover el inventario de la casa."
           },

           {
            icon = "fa-solid fa-lock",
            title = d.Unlocked and Labels["LockDoor"] or Labels["UnlockDoor"],
            value = d.Unlocked and "Lock" or "Unlock",
            description = "Cerrar o abrir las puertas de la casa."
           },

           {
            icon = "fa-solid fa-right-from-bracket",
            title = Labels['LeaveHouse'],
            value = "Leave",
            description = "Salir a la calle."
           }



          -- {label = Labels["InviteInside"],value = "Invite"},
          -- {label = Labels["HouseKeys"],value = "Keys"},
          -- {label = Labels["FurniUI"],value = "Furni"},
          -- {label = Labels["SetWardrobe"],value = "Wardrobe"},
          -- {label = Labels["SetInventory"],value = "Inventory"},
          -- {label = (d.Unlocked and Labels["LockDoor"] or Labels["UnlockDoor"]),value = (d.Unlocked and "Lock" or "Unlock")},
          -- {label = Labels["LeaveHouse"],value = "Leave"},
        }
      else
        elements = {


          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },

           {
            icon = "fa-solid fa-key",
            title = Labels["HouseKeys"],
            value = "Keys",
            description = "Gestionar las llaves de la casa."
           },


          --  {
          --   icon = "fa-solid fa-chair",
          --   title = Labels['FurniUI'],
          --   value = "Furni",
          --   description = "Gestionar la decoración de la casa."
          --  },

           {
            icon = "fa-solid fa-shirt",
            title = Labels['Wardrobe'],
            value = "Wardrobe",
            description = "Mover el guardaropa de la casa."
           },

           {
            icon = "fa-solid fa-boxes-packing",
            title = Labels['Inventory'],
            value = "Inventory",
            description = "Mover el inventario de la casa."
           }

          -- {label = Labels["HouseKeys"],value = "Keys"},
          -- {label = Labels["FurniUI"],value = "Furni"},
          -- {label = Labels["SetWardrobe"],value = "Wardrobe"},
          -- {label = Labels["SetInventory"],value = "Inventory"},
        }
      end
      -- if (d.MortgageOwed and d.MortgageOwed >= 1) then
      --   table.insert(elements,#elements,{label = "Mortgage", value = "Mortgage"})
      -- end
    end
  else
    if Config.AllowHouseSales then    
      if d.Shell then
        elements = {

          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
           {
            icon = "fa-solid fa-users",
            title = Labels["InviteInside"],
            value = "Invite",
            description="Invitar personas adentro de la casa."
           },


           {
            icon = "fa-solid fa-key",
            title = Labels["HouseKeys"],
            value = "Keys",
            description = "Gestionar las llaves de la casa."
           },

           {
            icon = "fa-solid fa-money-bill-transfer",
            title = Labels['SellHouse'],
            value = "Sell",
            description = "Poner la casa en venta."
           },

          --  {
          --   icon = "fa-solid fa-chair",
          --   title = Labels['FurniUI'],
          --   value = "Furni",
          --   description = "Gestionar la decoración de la casa."
          --  },

           {
            icon = "fa-solid fa-shirt",
            title = Labels['Wardrobe'],
            value = "Wardrobe",
            description = "Mover el guardaropa de la casa."
           },

           {
            icon = "fa-solid fa-boxes-packing",
            title = Labels['Inventory'],
            value = "Inventory",
            description = "Mover el inventario de la casa."
           },

           {
            icon = "fa-solid fa-lock",
            title = d.Unlocked and Labels["LockDoor"] or Labels["UnlockDoor"],
            value = d.Unlocked and "Lock" or "Unlock",
            description = "Cerrar o abrir las puertas de la casa."
           },

           {
            icon = "fa-solid fa-right-from-bracket",
            title = Labels['LeaveHouse'],
            value = "Leave",
            description = "Salir a la calle."
           },

          -- {label = Labels["InviteInside"],value = "Invite"},
          -- {label = Labels["HouseKeys"],value = "Keys"},
          -- {label = Labels["SellHouse"],value = "Sell"},
          -- {label = Labels["FurniUI"],value = "Furni"},
          -- {label = Labels["Wardrobe"],value = "Wardrobe"},
          -- {label = (d.Unlocked and Labels["LockDoor"] or Labels["UnlockDoor"]),value = (d.Unlocked and "Lock" or "Unlock")},
          -- {label = Labels["LeaveHouse"],value = "Leave"},
        }
      else
        elements = {

          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },

           {
            icon = "fa-solid fa-key",
            title = Labels["HouseKeys"],
            value = "Keys",
            description = "Gestionar las llaves de la casa."
           },

           {
            icon = "fa-solid fa-money-bill-transfer",
            title = Labels['SellHouse'],
            value = "Sell",
            description = "Poner la casa en venta."
           },

          --  {
          --   icon = "fa-solid fa-chair",
          --   title = Labels['FurniUI'],
          --   value = "Furni",
          --   description = "Gestionar la decoración de la casa."
          --  },

           {
            icon = "fa-solid fa-shirt",
            title = Labels['Wardrobe'],
            value = "Wardrobe",
            description = "Mover el guardaropa de la casa."
           }

          -- {label = Labels["HouseKeys"],value = "Keys"},
          -- {label = Labels["SellHouse"],value = "Sell"},
          -- {label = Labels["FurniUI"],value = "Furni"},
          -- {label = Labels["SetWardrobe"],value = "Wardrobe"},
        }
      end
      -- if (d.MortgageOwed and d.MortgageOwed >= 1) then
      --   table.insert(elements,#elements,{label = "Mortgage", value = "Mortgage"})
      -- end
    else
      if d.Shell then
        elements = {

          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
           {
            icon = "fa-solid fa-users",
            title = Labels["InviteInside"],
            value = "Invite",
            description="Invitar personas adentro de la casa."
           },


           {
            icon = "fa-solid fa-key",
            title = Labels["HouseKeys"],
            value = "Keys",
            description = "Gestionar las llaves de la casa."
           },

          --  {
          --   icon = "fa-solid fa-chair",
          --   title = Labels['FurniUI'],
          --   value = "Furni",
          --   description = "Gestionar la decoración de la casa."
          --  },

           {
            icon = "fa-solid fa-shirt",
            title = Labels['Wardrobe'],
            value = "Wardrobe",
            description = "Mover el guardaropa de la casa."
           },

           {
            icon = "fa-solid fa-lock",
            title = d.Unlocked and Labels["LockDoor"] or Labels["UnlockDoor"],
            value = d.Unlocked and "Lock" or "Unlock",
            description = "Cerrar o abrir las puertas de la casa."
           },

           {
            icon = "fa-solid fa-right-from-bracket",
            title = Labels['LeaveHouse'],
            value = "Leave",
            description = "Salir a la calle."
           }


          -- {label = Labels["InviteInside"],value = "Invite"},
          -- {label = Labels["HouseKeys"],value = "Keys"},
          -- {label = Labels["FurniUI"],value = "Furni"},
          -- {label = Labels["Wardrobe"],value = "Wardrobe"},
          -- {label = (d.Unlocked and Labels["LockDoor"] or Labels["UnlockDoor"]),value = (d.Unlocked and "Lock" or "Unlock")},
          -- {label = Labels["LeaveHouse"],value = "Leave"},
        }
      else
        elements = {

          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },


           {
            icon = "fa-solid fa-key",
            title = Labels["HouseKeys"],
            value = "Keys",
            description = "Gestionar las llaves de la casa."
           },

           {
            icon = "fa-solid fa-money-bill-transfer",
            title = Labels['SellHouse'],
            value = "Sell",
            description = "Poner la casa en venta."
           },

          --  {
          --   icon = "fa-solid fa-chair",
          --   title = Labels['FurniUI'],
          --   value = "Furni",
          --   description = "Gestionar la decoración de la casa."
          --  },

           {
            icon = "fa-solid fa-shirt",
            title = Labels['Wardrobe'],
            value = "Wardrobe",
            description = "Mover el guardaropa de la casa."
           },


          {label = Labels["HouseKeys"],value = "Keys"},
          {label = Labels["SellHouse"],value = "Sell"},
          -- {label = Labels["FurniUI"],value = "Furni"},
          {label = Labels["SetWardrobe"],value = "Wardrobe"},
        }
      end
      -- if (d.MortgageOwed and d.MortgageOwed >= 1) then
      --   table.insert(elements,#elements,{label = Labels["Mortgage"], value = "Mortgage"})
      -- end
    end
  end

  ESX.OpenContext("right" , elements, 
  function(menu,element) -- On Select Function

    if (element.value == "Invite") then
      ESXOpenInviteMenu(d)
    elseif (element.value == "Keys") then
      ESXOpenKeysMenu(d)
    elseif (element.value == "Upgrade") then        
      ESXUpgradeMenu(d,true)
    elseif (element.value == "Sell") then
      SellHouse(d)
    elseif (element.value == "Furni") then
      OpenFurniture(d)
    elseif (element.value == "Wardrobe") then
      ESX.CloseContext()
      SetWardrobe(d)
    elseif (element.value == "Inventory") then
      ESX.CloseContext()
      SetInventory(d)
    elseif (element.value == "Leave") then
      ESX.CloseContext()
      LeaveHouse(d)
    elseif (element.value == "Mortgage") then
      ESXPayMortgageMenu(d)
    end

  if element.title == Labels["LockDoor"] then
    LockHouse(d)
  elseif element.title == Labels["UnlockDoor"] then
    UnlockHouse(d)
  end

  ESX.CloseContext()
end, function(menu) -- on close
  MenuOpen = false
end)

end

ESXEntryOwnedMenu = function(d)
  local hasKeys = false
  local identifier = GetPlayerIdentifier()
  for k,v in pairs(d.HouseKeys) do
    if v.identifier == identifier then
      hasKeys = true
      break
    end
  end

  local certifiedPolice = false
  local job = GetPlayerJobName()
  if Config.PoliceJobs[job] then
    if GetPlayerJobRank() >= Config.PoliceJobs[job].minRank then
      certifiedPolice = true
    end
  end

  local certifiedRealestate = false
  if Config.CreationJobs[job] then
    if GetPlayerJobRank() >= Config.CreationJobs[job].minRank then
      certifiedRealestate = true
    end
  end

  local elements = {}

  if d.Shell then
    table.insert(elements,{unselectable=true, icon="fa-solid fa-house", title=Labels['PlayerHouse']})
    if hasKeys or d.Unlocked then
      table.insert(elements,{icon = "fa-solid fa-right-to-bracket",title = Labels['EnterHouse'],value = "Enter",description="Ingresar dentro de la casa."})
    elseif certifiedPolice then
      -- table.insert(elements,{label = Labels['KnockHouse'],value = "Knock"})
      table.insert(elements,{icon = "fa-solid fa-hand-back-fist",title = Labels['KnockHouse'],value = "Knock",description="Golpear la puerta al dueño."})
      if Config.PoliceCanRaid then
        -- table.insert(elements,{label = Labels['RaidHouse'],value = "Raid"})
        table.insert(elements,{icon = "fa-solid fa-gavel",title = Labels['RaidHouse'],value = "Raid",description="Irrumpir dentro de la casa."})
      end
    else
      table.insert(elements,{icon = "fa-solid fa-hand-back-fist",title = Labels['KnockHouse'],value = "Knock",description="Golpear la puerta al dueño."})
      -- table.insert(elements,{label = Labels['KnockHouse'],value = "Knock"})
      if Config.HouseTheft then
        -- table.insert(elements,{label = Labels['BreakIn'],value = "Break In"})
        table.insert(elements,{icon = "fa-solid fa-gavel",title = Labels['BreakIn'],value = "BreakIn",description="Irrumpir dentro de la casa."})
      end
    end
  end

  -- if certifiedRealestate and d.MortgageOwed and d.MortgageOwed > 0 then
  --   table.insert(elements,{label = Labels['Mortgage'],value = "Mortgage"})
  -- end

  if #elements <= 0 then
    FreezeEntityPosition(PlayerPedId(),false)
    return
  end

  ESX.OpenContext("right" , elements, 
  function(menu,element) -- On Select Function

    if (element.value == "Enter") then
      ESX.CloseContext()
      EnterHouse(d,(not hasKeys and true or false))
    elseif (element.value == "Knock") then
      ESX.CloseContext()
      KnockOnDoor(d)
    elseif (element.value == "Raid") then  
      ESX.CloseContext()
      RaidHouse(d)      
    elseif (element.value == "Break In") then
      ESX.CloseContext()
      BreakInHouse(d)
    elseif (element.value == "Mortgage") then
      ESX.CloseContext()  
      ESXMortgageInfoMenu(d)
    end

  ESX.CloseContext()
end, function(menu) -- on close
  MenuOpen = false
end)

end


ESXExitOwnedMenu = function(d)
  local elements = {}
  local identifier = GetPlayerIdentifier()
  local mort = false
  for k,v in pairs(d.HouseKeys) do
    if v.identifier == identifier then
      table.insert(elements,{unselectable=true, icon="fa-solid fa-house", title=Labels['PlayerHouse']})
      if d.Shell then
        table.insert(elements,{icon = "fa-solid fa-users", title = Labels["InviteInside"], value = "Invite", description="Invitar personas adentro de la casa."})
      end
      -- table.insert(elements,{icon = "fa-solid fa-chair",title = Labels['FurniUI'],value = "Furni",description = "Gestionar la decoración de la casa."})
      mort = true
      break
    end
  end
  if d.Shell then
    table.insert(elements,{icon = "fa-solid fa-right-from-bracket", title = Labels['LeaveHouse'], value = "Leave", description = "Salir a la calle."})
  -- elseif d.MortgageOwed and d.MortgageOwed > 0 then
  --   local job = GetPlayerJobName()
  --   if Config.CreationJobs[job] then
  --     if GetPlayerJobRank() >= Config.CreationJobs[job].minRank then
  --       table.insert(elements,{label = Labels['Mortgage'],value = "CheckMortgage"})
  --     end
  --   end
  end

  ESX.OpenContext("right" , elements, 
  function(menu,element) -- On Select Function

    if (element.value == "Invite") then
      ESXOpenInviteMenu(d)
    elseif  (element.value == "Furni") then
      ESX.CloseContext()
      OpenFurniture(d)
    elseif  (element.value == "Lock") then
      LockHouse(d)
    elseif  (element.value == "Unlock") then
      UnlockHouse(d)
    elseif  (element.value == "Leave") then
      ESX.CloseContext()
      LeaveHouse(d)
    elseif  (element.value == "Mortgage") then
      ESXPayMortgageMenu(d)
    elseif  (element.value == "CheckMortgage") then
      ESXMortgageInfoMenu(d)
    end

  ESX.CloseContext()
end, function(menu) -- on close
  MenuOpen = false
end)

end

ESXExitEmptyMenu = function(d)
  local elements = (d.Shell and {[1] = {label = Labels['LeaveHouse'],value = "Leave"}} or {})

  if d.Owned and d.Shell then
    local certifiedPolice = false
    local job = GetPlayerJobName()
    if Config.PoliceJobs[job] then
      if GetPlayerJobRank() >= Config.PoliceJobs[job].minRank then
        certifiedPolice = true
      end
    end

    if Config.PoliceCanRaid and certifiedPolice then
      if d.Unlocked then
        table.insert(elements,{label = Labels['LockHouse'],value = "Lock"})
      else
        table.insert(elements,{label = Labels['UnlockHouse'],value = "Unlock"})
      end
    end
  end

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_empty_menu",{
      title    = Labels['EmptyHouse'],
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      if submitData.current.value == "Leave" then
        LeaveHouse(d)
      elseif submitData.current.value == "Lock" then
        LockHouse(d)
      elseif submitData.current.value == "Unlock" then
        UnlockHouse(d)
      end
    end,
    function(data,menu)
      menu.close()
    end
  )
end

ESXUpgradeMenu = function(d,owner)
  local elements = {}
  local c = 0
  local dataTable = {}
  local sortedTable = {}
  for k,v in pairs(d.Shells) do
    local price = ShellPrices[k]
    if price then
      dataTable[price.."_"..k] = {
        available = v,
        price = price,
        shell = k,
      }
      table.insert(sortedTable,price.."_"..k)
    end
  end
  table.sort(sortedTable)

  for key,price in pairs(sortedTable) do
    local data = dataTable[price]
    if data.available and d.Shell ~= data.shell then
      elements[#elements+1] = {label = data.shell.." [$"..data.price.."]", data = data}
      c = c + 1
    end    
  end

  if c == 0 then
    exports['okokNotify']:Alert("SERVIDOR", Labels['NoUpgrades'], 3500, 'info')
    return
  end

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "owner_upgrade_menu",{
      title    = Labels['UpgradeHouse2'],
      align    = 'left',
      elements = elements,
    },function(data,menu) 
      if owner then
        UpgradeHouse(d,data.current.data)
      end
    end,
    function(data,menu)
      menu.close()
    end
  )
end

DoOpenESXGarage = function(d)
  local vehicles = GetVehiclesAtHouse(d)

  local elements = {}
  if (#vehicles > 0) then
    for _,vehData in pairs(vehicles) do
      table.insert(elements,{label = "["..vehData.vehicle.plate.."] "..vehData.nombre, value = vehData})
    end
  else
    table.insert(elements,{label = Labels['NoVehicles']})
  end
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "entry_owner_menu",{
      title    = "Player Garage",
      align    = 'left',
      elements = elements,
    }, 
    (#vehicles > 0 and function(submitData,submitMenu)
      TriggerServerEvent('Allhousing:VehicleSpawned',submitData.current.value.vehicle.plate)
      SpawnVehicle(d.Garage,submitData.current.value.vehicle.model,submitData.current.value.vehicle)
    end or false),
    function(data,menu)
      menu.close()
    end,
    function(...)
    end,
    function(...)
      MenuOpen = false
      FreezeEntityPosition(PlayerPedId(),false)
    end
  )
end

ESXGarageOwnerMenu = function(d)
  local ped = PlayerPedId()
  if IsPedInAnyVehicle(ped,false) then
    local veh = GetVehiclePedIsUsing(ped)
    local props = GetVehicleProperties(veh)
    local ownerInfo = Callback("Allhousing:GetVehicleOwner",props.plate)
    local canStore = false
    if ownerInfo.owned and ownerInfo.owner then
      canStore = true
    elseif ownerInfo.owned and Config.StoreStolenPlayerVehicles then
      canStore = true
    else
      canStore = false
    end

    if canStore then
      TaskEveryoneLeaveVehicle(veh)
      SetEntityAsMissionEntity(veh,true,true)
      DeleteVehicle(veh)  
      TriggerServerEvent("Allhousing:VehicleStored",d.Id,props.plate,props)
      exports['okokNotify']:Alert("SERVIDOR", string.format(Labels['VehicleStored'], d.Id), 3500, 'success')
    else
      exports['okokNotify']:Alert("SERVIDOR", Labels['CantStoreVehicle'], 3500, 'error')
    end
    FreezeEntityPosition(PlayerPedId(),false)
  else
    local vehicles = GetVehiclesAtHouse(d)

    local elements = {}
    if (#vehicles > 0) then
      for _,vehData in pairs(vehicles) do
        table.insert(elements,{label = "["..vehData.vehicle.plate.."] "..vehData.nombre, value = vehData})
      end
    else
      table.insert(elements,{label = Labels['NoVehicles']})
    end
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), "entry_owner_menu",{
        title    = Labels['Garage'],
        align    = 'left',
        elements = elements,
      }, 
      (#vehicles > 0 and function(submitData,submitMenu)
        TriggerServerEvent('Allhousing:VehicleSpawned',submitData.current.value.vehicle.plate)
        SpawnVehicle(d.Garage,submitData.current.value.vehicle.model,submitData.current.value.vehicle)
      end or false),
      function(data,menu)
        menu.close()
      end,
      function(...)
      end,
      function(...)
        MenuOpen = false
        FreezeEntityPosition(PlayerPedId(),false)
      end
    )
  end
end

ESXGarageOwnedMenu = function(d)
  local plyPed = PlayerPedId()  
  if IsPedInAnyVehicle(plyPed,false) then
    local veh = GetVehiclePedIsUsing(plyPed)
    local props = GetVehicleProperties(veh)
    local ownerInfo = Callback("Allhousing:GetVehicleOwner",props.plate)
    local canStore = false
    if ownerInfo.owned and ownerInfo.owner then
      canStore = true
    elseif ownerInfo.owned and Config.StoreStolenPlayerVehicles then
      canStore = true
    else
      canStore = false
    end

    if canStore then
      TaskEveryoneLeaveVehicle(veh)
      SetEntityAsMissionEntity(veh,true,true)
      DeleteVehicle(veh)  
      TriggerServerEvent("Allhousing:VehicleStored",d.Id,props.plate,props)
      exports['okokNotify']:Alert("SERVIDOR", string.format(Labels['VehicleStored'], d.Id), 3500, 'success')
    else
      exports['okokNotify']:Alert("SERVIDOR", Labels['CantStoreVehicle'], 3500, 'error')
    end
    FreezeEntityPosition(PlayerPedId(),false)
  else
    local myId = GetPlayerIdentifier()
    for k,v in pairs(d.HouseKeys) do
      if v.identifier == myId then
        DoOpenESXGarage(d)
        return
      end
    end

    if not Config.GarageTheft then 
      FreezeEntityPosition(PlayerPedId(),false)
      return
    end

    if Config.LockpickRequired then
      local hasItem = CheckForLockpick()
      if not hasItem then
        exports['okokNotify']:Alert("SERVIDOR", Labels['NoLockpick'], 3500, 'info')
        FreezeEntityPosition(PlayerPedId(),false)
        return
      end
    end

    while not HasAnimDictLoaded("mini@safe_cracking") do RequestAnimDict("mini@safe_cracking"); Citizen.Wait(100); end
    TaskPlayAnim(plyPed, "mini@safe_cracking", "idle_base", 1.0, 1.0, -1, 1, 0, 0, 0, 0 ) 
    Wait(2000)

    if Config.UsingLockpickV1 then
      TriggerEvent("lockpicking:StartMinigame",4,function(didWin)
        if didWin then
          ClearPedTasksImmediately(plyPed)
          DoOpenESXGarage(d)
        else
          ClearPedTasksImmediately(plyPed)
          TriggerServerEvent("Allhousing:BreakLockpick")
        end
        FreezeEntityPosition(PlayerPedId(),false)
      end)
    elseif Config.UsingLockpickV2 then
      exports["lockpick"]:Lockpick(function(didWin)
        if didWin then
          ClearPedTasksImmediately(plyPed)
          DoOpenESXGarage(d)
          exports['okokNotify']:Alert("SERVIDOR", Labels['LockpickSuccess'], 3500, 'success')
        else
          ClearPedTasksImmediately(plyPed)
          TriggerServerEvent("Allhousing:BreakLockpick")
          exports['okokNotify']:Alert("SERVIDOR", Labels['LockpickFailed'], 3500, 'error')
        end
        FreezeEntityPosition(PlayerPedId(),false)
      end)
    else
      if Config.UsingProgressBars then
        exports["progressBars"]:startUI(Config.LockpickTime * 1000,Labels["ProgressLockpicking"])
      end
      Wait(Config.LockpickTime * 1000)
      if math.random(100) < Config.LockpickFailChance then
        local plyPos = GetEntityCoords(PlayerPedId())
        local zoneName = GetNameOfZone(plyPos.x,plyPos.y,plyPos.z)
        if Config.LockpickBreakOnFail then
          TriggerServerEvent("Allhousing:BreakLockpick")
        end
        exports['okokNotify']:Alert("SERVIDOR", Labels['LockpickFailed'], 3500, 'error')
        for k,v in pairs(Config.PoliceJobs) do
          TriggerServerEvent("Allhousing:NotifyJobs",k,"Someone is attempting to break into a garage at "..zoneName)
        end
        ClearPedTasksImmediately(plyPed)
      else
        exports['okokNotify']:Alert("SERVIDOR", Labels['LockpickSuccess'], 3500, 'success')
        ClearPedTasksImmediately(plyPed)
        DoOpenESXGarage(d)
      end
      FreezeEntityPosition(PlayerPedId(),false)
    end
  end
end

ESXEntryOwnerMenu = function(d)
  local elements
  if Config.AllowHouseSales then
    if d.Garage and Config.AllowGarageMovement then
      if d.Shell then
        elements = {
          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
           {
            icon = "fa-solid fa-right-to-bracket",
            title = Labels['EnterHouse'],
            value = "entrar",
            description="Ingresar dentro de la casa."
           },
           {
            icon = "fa-solid fa-lock",
            title = d.Unlocked and Labels['LockDoor'] or Labels['UnlockDoor'],
            value = "cerrar",
            description = "Cerrar o abrir las puertas de la casa."
           },
           {
            icon = "fa-solid fa-garage",
            title = Labels['MoveGarage'],
            value = "movergarage",
            description = "Mover el garage de lugar."
           },
           {
            icon = "fa-solid fa-money-bill-transfer",
            title = Labels['SellHouse'],
            value = "vender",
            description = "Poner la casa en venta."
           }
        }
      else
        elements = {
          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
          {
            icon = "fa-solid fa-garage",
            title = Labels['MoveGarage'],
            value = "movergarage",
            description = "Mover el garage de lugar."
           },
           {
            icon = "fa-solid fa-money-bill-transfer",
            title = Labels['SellHouse'],
            value = "vender",
            description = "Poner la casa en venta."
           }
        }
      end
    else
      if d.Shell then
        elements = {
          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
           {
            icon = "fa-solid fa-right-to-bracket",
            title = Labels['EnterHouse'],
            value = "entrar",
            description="Ingresar dentro de la casa."
           },
           {
            icon = "fa-solid fa-lock",
            title = d.Unlocked and Labels['LockDoor'] or Labels['UnlockDoor'],
            value = "cerrar",
            description = "Cerrar o abrir las puertas de la casa."
           },
           {
            icon = "fa-solid fa-money-bill-transfer",
            title = Labels['SellHouse'],
            value = "vender",
            description = "Poner la casa en venta."
           }

        }
      else
        elements = {
          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
          {
            icon = "fa-solid fa-money-bill-transfer",
            title = Labels['SellHouse'],
            value = "vender",
            description = "Poner la casa en venta."
           }
        }
      end
    end
  else
    if d.Garage and Config.AllowGarageMovement then
      if d.Shell then
        elements = {

          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
           {
            icon = "fa-solid fa-right-to-bracket",
            title = Labels['EnterHouse'],
            value = "entrar",
            description="Ingresar dentro de la casa."
           },
           {
            icon = "fa-solid fa-lock",
            title = d.Unlocked and Labels['LockDoor'] or Labels['UnlockDoor'],
            value = "cerrar",
            description = "Cerrar o abrir las puertas de la casa."
           },
           {
            icon = "fa-solid fa-garage",
            title = Labels['MoveGarage'],
            value = "movergarage",
            description = "Mover el garage de lugar."
           }

        }
      else
      end
    else
      if d.Shell then
        elements = {
          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
           {
            icon = "fa-solid fa-right-to-bracket",
            title = Labels['EnterHouse'],
            value = "entrar",
            description="Ingresar dentro de la casa."
           },
           {
            icon = "fa-solid fa-lock",
            title = d.Unlocked and Labels['LockDoor'] or Labels['UnlockDoor'],
            value = "cerrar",
            description = "Cerrar o abrir las puertas de la casa."
           },
        }
      else
        elements = {
          {
            unselectable=true,
            icon="fa-solid fa-house",
            title=Labels['MyHouse'],
           },
           {
            disabled= true, -- Set Element as Disabled
            icon="fa-solid fa-triangle-exclamation",
            title=Labels["NothingToDisplay"],
           }
        }
      end
    end
  end


ESX.OpenContext("right" , elements, 
  function(menu,element) -- On Select Function

  --- for a simple element
  if element.value == "entrar" then
    ESX.CloseContext()
    EnterHouse(d)
  elseif element.value == "movergarage" then
    ESX.CloseContext()
    MoveGarage(d)
  elseif element.value == "vender" then
    ESX.CloseContext()
    SellHouse(d)  
  end

  if element.title == Labels["LockDoor"] then
    LockHouse(d)
  elseif element.title == Labels["UnlockDoor"] then
    UnlockHouse(d)
  end

  ESX.CloseContext()
end, function(menu) -- on close
  MenuOpen = false
  FreezeEntityPosition(PlayerPedId(),false)
end)
end

ESXConfirmSaleMenu = function(d,floored)
  local elements = {
    [1] = {label = Labels['ConfirmSale'], value = "yes"},
    [2] = {label = Labels['CancelSale'], value = "no"}
  }
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_verify_sell",{
      title    = string.format(Labels["SellingHouse"],floored),
      align    = 'left',
      elements = elements,
    }, 
    function(data,menu)
      if (data.current.value == "yes") then
        exports['okokNotify']:Alert("SERVIDOR", string.format(Labels["SellingHouse"],floored), 3500, 'info')
        d.Owner = ""
        d.Owned = false

        if InsideHouse then LeaveHouse(d); end
        TriggerServerEvent("Allhousing:SellHouse",d,floored)
      end
      ESX.UI.Menu.CloseAll()
    end
  )
end


ESXMortgageInfoMenu = function(d)
  local mortgage_info = Callback("Allhousing:GetMortgageInfo",d)
  local elements = {
    {label = string.format(Labels["MoneyOwed"],tostring(mortgage_info.MortgageOwed))},
    {label = string.format(Labels['LastRepayment'],tostring(mortgage_info.LastRepayment))},
    {label = "Revoke Tenancy", value = "Revoke"}
  }

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "mortgage_menu",{
      title    = Labels['MortgageInfo'],
      align    = 'left',
      elements = elements,
    }, 
    function(data,menu)
      if (data.current.value and data.current.value == "Revoke") then
        RevokeTenancy(d)
      end
    end,
    function(data,menu)
      menu.close()
    end,
    function(...)
    end,
    function(...)
    end
  )
end

ESXPayMortgageMenu = function(d)
  local mortgage_info = Callback("Allhousing:GetMortgageInfo",d)
  local elements = {
    {label = string.format(Labels["MoneyOwed"],tostring(mortgage_info.MortgageOwed))},
    {label = string.format(Labels['LastRepayment'],tostring(mortgage_info.LastRepayment))},
    {label = Labels['PayMortgage'], value = "Pay"}
  }

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "mortgage_menu",{
      title    = Labels['MortgageInfo'],
      align    = 'left',
      elements = elements,
    }, 
    function(data,menu)
      if data.current.value and data.current.value == "Pay" then
        menu.close()
        RepayMortgage(d)
      end
    end,
    function(data,menu)
      menu.close()
    end,
    function(...)
    end,
    function(...)
    end
  )
end


ESXEntryEmptyMenu = function(d)

  local Elements = {}

  if d.ResaleJob and d.ResaleJob:len() > 0 and Config.AllowMortgage then
    if d.Shell then
      Elements = {
        {
          unselectable=true,
          icon="fa-solid fa-house",
          title=Labels['EmptyHouse'],
         },
         {
          icon = "fa-solid fa-cart-shopping",
          title = Labels['Buy'],
          value = "comprar",
          description="Comprar esta casa por [$"..d.Price.."]"
         },
         {
          icon = "fa-solid fa-eye",
          title = Labels['View'],
          value = "mirar",
          description = "Echar un vistazo a la casa."
         },
         {
          icon = "fa-solid fa-pen-to-square",
          title = Labels['Upgrades'],
          value = "update",
          description = "Ver actualizaciones de la casa."
         }
        -- [2] = {label = Labels['Mortgage'].." [$"..math.floor((d.Price / 100)*Config.MortgagePercent).."]", value='Mortgage'},
      }
    else
      Elements = {
        -- [1] = {label = Labels['Buy'].." [$"..d.Price.."]", value = "Buy"}
        -- [2] = {label = Labels['Mortgage'].." [$"..math.floor((d.Price / 100)*Config.MortgagePercent).."]", value='Mortgage'}
        {
          unselectable=true,
          icon="fa-solid fa-house",
          title=Labels['EmptyHouse'],
         },
        {
          icon = "fa-solid fa-cart-shopping",
          title = Labels['Buy'],
          value = "comprar",
          description="Comprar esta casa por [$"..d.Price.."]"
         }
      }
    end
  else
    if d.Shell then
      Elements = {
        {
          unselectable=true,
          icon="fa-solid fa-house",
          title=Labels['EmptyHouse'],
         },
         {
          icon = "fa-solid fa-cart-shopping",
          title = Labels['Buy'],
          value = "comprar",
          description="Comprar esta casa por [$"..d.Price.."]"
         },
         {
          icon = "fa-solid fa-eye",
          title = Labels['View'],
          value = "mirar",
          description = "Echar un vistazo a la casa."
         },
         {
          icon = "fa-solid fa-pen-to-square",
          title = Labels['Upgrades'],
          value = "update",
          description = "Ver actualizaciones de la casa."
         }
      }
    else
      Elements = {
        {
          unselectable=true,
          icon="fa-solid fa-house",
          title=Labels['EmptyHouse'],
         },
        {
          icon = "fa-solid fa-cart-shopping",
          title = Labels['Buy'],
          value = "comprar",
          description="Comprar esta casa por [$"..d.Price.."]"
         }
      }
    end
  end
  
  ESX.OpenContext("right" , Elements, 
    function(menu,element) -- On Select Function
  
    --- for a simple element
    if element.value == "comprar" then
      ESX.CloseContext()
      BuyHouse(d)
    elseif element.value == "mirar" then
      ESX.CloseContext()
      ViewHouse(d)
    elseif element.value == "update" then
      ESX.CloseContext()
      ESXUpgradeMenu(d,false)   
    end
  
    ESX.CloseContext()
  end, function(menu) -- on close
    FreezeEntityPosition(PlayerPedId(),false)
  end)

end

