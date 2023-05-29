function OpenStorage(owner)
ESX.UI.Menu.CloseAll()
 
     ESX.UI.Menu.Open(
         'default', GetCurrentResourceName(), 'storage',
     {
         title = 'Inventario',
         align = 'bottom-right',
         elements = {
             {label = "Guardar Cosas", value = 's'},
             {label = "Retirar Cosas", value = 'w'}
         },
     },
     function(data, menu)
         if data.current.value == 's' then
 
             ESX.TriggerServerCallback('1974_motel_sandy:getInventory', function(inv)
 
                 local elements = {}
 				
 				if (inv['black_money']) > 0 then
 					table.insert(elements, {
 						label =  'Dinero Sucio: <span style="color:red;">$'..ESX.Math.GroupDigits(inv['black_money'])..'</span>',
 						type  = 'item_account',
 						value = 'black_money'
 					})
 				end
         
                 for k, v in pairs(inv['weapons']) do
                     table.insert(elements, {label = ('%s | x%s %s'):format(ESX.GetWeaponLabel(v['name']), v['ammo'], 'Balas'), weapon = v['name'], ammo = v['ammo'], type = 'weapon'})        
                 end
 				
 				for k, v in pairs(inv['items']) do
 					if v['count'] >= 1 then
 						table.insert(elements, {label = ('x%s %s'):format(v['count'], v['label']), type = 'item', value = v['name']})
 					end
 				end
 
                 ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'storeItem', {
                     title = 'Inventario',
                     align = 'bottom-right',
                     elements = elements
                 }, function(data2, menu2)
 					if data2.current.type == 'weapon' then
 						--ESX.ShowNotification(data2.current.type)
 						TriggerServerEvent('1974_motel_sandy:storeItem', data2.current.type , data2.current.weapon, data2.current.ammo, owner)
 						menu2.close()
 					else
 						ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putAmount', {title = 'Cantidad: '}, function(data3, menu3)
 							local amount = tonumber(data3.value)
 
 							if amount == nil then
 								ESX.ShowNotification('~r~Debes ingresar cantidad!')
 							else
                             if amount >= 0 then
 									TriggerServerEvent('1974_motel_sandy:storeItem', data2.current.type, data2.current.value, tonumber(data3.value), owner)
 									menu3.close()
 									menu2.close()
 								else
 									ESX.ShowNotification('~r~Cantidad invalida!')
 								end
 							end
 							end, function(data3, menu3)
 							menu3.close()
 						end)
 					end
                 end, function(data2, menu2)
                     menu2.close()
end)

      end)

  elseif data.current.value == 'w' then
				
      ESX.TriggerServerCallback('1974_motel_sandy:getMotelInv', function(inv)

local elements = {}
				
				if (inv['black_money']) > 0 then
    table.insert(elements, {
        label =  'Dinero Sucio: <span style="color:red;">$'..ESX.Math.GroupDigits(inv['black_money'])..'</span>',
        type  = 'item_account',
        value = 'black_money'
    })
end
				
				for k, v in pairs(inv['weapons']) do
    table.insert(elements, {label = ('%s | x%s %s'):format(ESX.GetWeaponLabel(v['name']), v['ammo'], 'Balas'), weapon = v['name'], ammo = v['ammo'], type = 'weapon'})
end

for k, v in pairs(inv['items']) do
    if v['count'] > 0 then
        table.insert(elements, {label = ('x%s %s'):format(v['count'], v['label']), type = 'item', value = v['name']})
    end
end
         

ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'withdrawItem', {
    title = 'Armario Motel',
    align = 'bottom-right',
    elements = elements
}, function(data2, menu2)
				
					if data2.current.type == 'weapon' then
						TriggerServerEvent('1974_motel_sandy:withdrawItem', 'weapon', data2.current.weapon, data2.current.ammo, owner)
						menu2.close()
					else
						ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putAmount', {title = 'Cantidad:'}, function(data3, menu3)
							local amount = tonumber(data3.value)

							if amount == nil then
								ESX.ShowNotification("~r~Debe ingresar una cantidad!")
							else
								if amount >= 0 then
									TriggerServerEvent('1974_motel_sandy:withdrawItem', data2.current.type, data2.current.value, tonumber(data3.value), owner)
									menu3.close()
									menu2.close()
								else
									ESX.ShowNotification('~r~Cantidad invalida!')
								end
							end
						end, function(data3, menu3)
							menu3.close()
						end)
					end	
end, function(data2, menu2)
    menu2.close()
end)

      end, owner)

  end

    end, function(data, menu)
  menu.close()
    end)
end

ChooseItemMenu = function(callback)
    local playerInventory = ESX.GetPlayerData()["inventory"]

    local menuElements = {}

    if Config.DirtyMoney then
  local playerAccounts = ESX.GetPlayerData()["accounts"]

  for accountIndex, accountData in pairs(playerAccounts) do
      if accountData["name"] == "black_money" then
accountData["count"] = accountData["money"]
accountData["type"] = "black_money"
				
table.insert(menuElements, {
    ["label"] = accountData["label"] .. " - $" .. accountData["count"],
    ["action"] = accountData
})
      end
  end
    end
    
    if Config.Weapons then
		
  local weaponLoadout = ESX.GetPlayerData()["loadout"]
		
  for loadoutIndex, loadoutData in ipairs(weaponLoadout) do
      loadoutData["count"] = loadoutData["ammo"]
      loadoutData["type"] = "weapon"
      
      table.insert(menuElements, {
["label"] = loadoutData["label"] .. " - " .. loadoutData["count"] .. "x",
["action"] = loadoutData
      })
  end
		
    end

    for itemIndex, itemData in ipairs(playerInventory) do
  if itemData["count"] > 0 then
      itemData["type"] = "item"

      table.insert(menuElements, {
["label"] = itemData["label"] .. " - " .. itemData["count"] .. "x",
["action"] = itemData
      })
  end
    end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "main_storage_inventory_menu", {
  ["title"] = "Selecciona una acción.",
  ["align"] = Config.AlignMenu,
  ["elements"] = menuElements
    }, function(menuData, menuHandle)
  local action = menuData["current"]["action"]

  if type(action) == "table" then
      if action["type"] == "weapon" then
callback(action)
 
menuHandle.close()
else
ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "main_storage_inventory_count", {
   ["title"] = "¿Cuanto?"
}, function(menuData, dialogHandle)
   local newCount = tonumber(menuData["value"])

   if not newCount then
       return ESX.ShowNotification("Por favor, introduce un número.")
   elseif newCount > action["count"] then
      return ESX.ShowNotification("~r~No hay esa cantidad!")
   elseif newCount < 1 then
       newCount = 1
   end
 					
   action["count"] = newCount

   dialogHandle.close()
   menuHandle.close()

   callback(action)
end, function(menuData, dialogHandle)
   dialogHandle.close()
end)
end
end
end, function(menuData, menuHandle)
menuHandle.close()
end)
 end
 
 AddItemToStorage = function(storageId, newItem)
local cachedStorage = cachedData["storages"][storageId]
 
if not cachedStorage then
cachedData["storages"][storageId] = {}
cachedData["storages"][storageId]["items"] = {}
end
 
local itemFound = false
 
if newItem["type"] == "weapon" then
newItem["uniqueId"] = NetworkGetRandomInt()
else
for itemIndex, itemData in ipairs(cachedStorage["items"]) do
if itemData["name"] == newItem["name"] then
cachedData["storages"][storageId]["items"][itemIndex]["count"] = cachedStorage["items"][itemIndex]["count"] + newItem["count"]

itemFound = true

break
end
end
end
 
if not itemFound then
table.insert(cachedData["storages"][storageId]["items"], newItem)
end
 
ESX.TriggerServerCallback("1974_motel_sandy:addItemToStorage", function(updated)
if updated then
ESX.ShowNotification("Has guardado " .. newItem["count"] .. "x - " .. newItem["label"])
end
end, cachedData["storages"][storageId], newItem, storageId)
 end
 
 TakeItemFromStorage = function(storageId, newItem)
local cachedStorage = cachedData["storages"][storageId]
 
if not cachedStorage then
return
end
 
local itemFound = false
 
for itemIndex, itemData in ipairs(cachedStorage["items"]) do
if newItem["type"] == "weapon" then
if itemData["uniqueId"] == newItem["uniqueId"] then
itemFound = true
table.remove(cachedData["storages"][storageId]["items"], itemIndex)
break
end
else
if itemData["name"] == newItem["name"] and cachedStorage["items"][itemIndex]["count"] >= newItem["count"] then
itemFound = true
 
if cachedStorage["items"][itemIndex]["count"] - newItem["count"] <= 0 then
   newItem["count"] = cachedStorage["items"][itemIndex]["count"]
   table.remove(cachedData["storages"][storageId]["items"], itemIndex)
else
   cachedData["storages"][storageId]["items"][itemIndex]["count"] = cachedData["storages"][storageId]["items"][itemIndex]["count"] - newItem["count"]
end				
 				
 				break
end
end
end
 	
 	
if not itemFound then		
--ESX.ShowNotification("~r~No hay esa cantidad!")
 		ESX.UI.Menu.CloseAll()
 		return ESX.ShowNotification("~r~No hay esa cantidad!")
end
 	
 	ESX.TriggerServerCallback("1974_motel_sandy:takeItemFromStorage", function(updated)
 		if updated then
 			ESX.ShowNotification("Has sacado " .. newItem["count"] .. "x - " .. newItem["label"])
 		end
 	end, cachedData["storages"][storageId], newItem, storageId)
 	
 end