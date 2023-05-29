-- ====================================================================================================================
-- Local function
-- ====================================================================================================================
function OpenShopMenu()
  ESX.UI.Menu.CloseAll()

  local elements = {
    { 
		label = _U('firstaidkit') .. ' [$' .. Config.Price['ibuprofeno'] .. ']', value = { name = 'ibuprofeno',    price = Config.Price['ibuprofeno'] } 
    },
    { 
      label = _U('defibrillateur') .. ' [$' .. Config.Price['xanax'] .. ']', value = { name = 'xanax', price = Config.Price['xanax'] }
    }
  }

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
      title    = _U('drugstore'),
      align    = 'bottom-right',
      elements = elements
    }, function(data, menu)
      local element = data.current.value
      ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
          title = _U('valid_this_purchase'),
          align = 'bottom-right',
          elements = {
            { label = _U('yes'), value = 'yes' },
            { label = _U('no'),  value = 'no'  }
          }
        }, function(data2, menu2)
			if data2.current.value == 'yes' then
				ESX.TriggerServerCallback('1974_drogas:check', function(serial)
					if serial then
						TriggerServerEvent('esx_pharmacy:buyItem', element.name, element.price, serial)
					end
				end)
				--[[
				ESX.TriggerServerCallback('esx_pharmacy:getMoney', function(money)	
					if money >= Config.Price['bandage'] then
						--TriggerServerEvent('esx_pharmacy:buy', element.price)
						local ped    = GetPlayerPed(-1)
						local health = GetEntityHealth(ped)
						local max    = GetEntityMaxHealth(ped)
						ESX.ShowNotification(health..' / '..max)
						if health > 0 and health < max then
							--TriggerServerEvent('esx_pharmacy:removeItem', itemName)
							ESX.ShowNotification(_U('use_firstaidkit'))
							health = health + (max / 4)
							if health > max then
								health = max
							end
							SetEntityHealth(ped, max)
							ESX.UI.Menu.CloseAll()
						end
					else
						ESX.ShowNotification('~r~No tienes suficiente Dinero')
					end
				end)
				]]
			end	
          menu2.close()
          --setCurrentAction('pharmacy_shop', _U('press_menu'), {})
        end, function(data2, menu2)
          menu2.close()
        end
      )

    end, function(data, menu)
      menu.close()
    end
  )
end

RegisterNetEvent('1974_farmacia:ibuprofeno')
AddEventHandler('1974_farmacia:ibuprofeno', function()
	--ESX.ShowNotification("Me tome un ibuprofeno")
    local ped    = GetPlayerPed(-1)
	local max    = GetEntityMaxHealth(ped)
	loadAnimDict("mp_suicide")
	TaskPlayAnim(ped, "mp_suicide", "pill_fp", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
	Citizen.Wait(3500)
	ClearPedTasksImmediately(ped)
	SetEntityHealth(ped, max)
end)

function loadAnimDict( dict ) 
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 