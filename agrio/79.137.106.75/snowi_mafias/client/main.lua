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

local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastStation               = nil
local LastPart                  = nil
local LastPartNum               = nil
local LastEntity                = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local IsHandcuffed              = false
local IsDragged                 = false
local CopPed                    = 0

ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1000)
  end
end)


function SetVehicleMaxMods(vehicle)

  local props = {
    modEngine       = 2,
    modBrakes       = 2,
    modTransmission = 2,
    modSuspension   = 3,
    modTurbo        = true,
  }

  ESX.Game.SetVehicleProperties(vehicle, props)

end

function OpenArmoryMenu(station)

  

    local elements = {
      {label = _U('get_weapon'), value = 'get_weapon'},
      {label = _U('put_weapon'), value = 'put_weapon'},
      {label = 'Coger objeto',  value = 'get_stock'},
      {label = 'Depositar objeto',  value = 'put_stock'},
      --{label = _U('buy_weapons'), value = 'buy_weapons'}
    }

     ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory',
      {
        title    = _U('armory'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'get_weapon' then
          OpenGetWeaponMenu()
        end

        if data.current.value == 'put_weapon' then
          OpenPutWeaponMenu()
        end

        if data.current.value == 'put_stock' then
              OpenPutStocksMenu()
            end

            if data.current.value == 'get_stock' then
              OpenGetStocksMenu()
            end

      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_armory'
        CurrentActionMsg  = _U('open_armory')
        CurrentActionData = {station = station}
      end
    )
end

function OpenVehicleSpawnerMenu(station, partNum)
  
  
	 ESX.UI.Menu.CloseAll()
  
	
	  local elements = {}
	  local elements2 = {}
    local elements3 = {}
	  ESX.TriggerServerCallback('snowiGetOwnedVehicleOrg', function(ownedCars)
		if #ownedCars == 0 then
			ESX.ShowNotification('Tu organizacion no dispone de ningún vehiculo!')
		else
			for _,v in pairs(ownedCars) do
				
					local hashVehicule = v.vehicle.model
					local vehicleName  = GetDisplayNameFromVehicleModel(hashVehicule)
					local plate        = v.plate
					local labelvehicle
					
					
						if v.stored then
							labelvehicle = '| '..plate..' | '..vehicleName..' | EN GARAJE'
						else
							labelvehicle = '| '..plate..' | '..vehicleName..' | FUERA DE GARAJE'
						end
					
					
					table.insert(elements, {label = labelvehicle, value = v})
				
			end
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
			title    = 'Vehiculos de la organizacion',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value.stored then
				menu.close()
				SpawnVehicle(data.current.value.vehicle, data.current.value.plate, partNum, station)
			else
				table.insert(elements2, {label=data.current.label..' (3500€)', value =data.current.value.plate})
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'desin', {
					title    = 'Desincautar',
					align    = 'bottom-right',
					elements = elements2
				}, function(data2, menu2)
          
          table.insert(elements3, {label='Pagar en mano', value ='mano'})
          table.insert(elements3, {label='Pagar por banco', value ='banco'})
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'desinmano', {
					title    = 'Pago',
					align    = 'bottom-right',
					elements = elements3
				}, function(data3, menu3)
          print(json.encode(data3))
          if data3.current.value == 'mano' then
					ESX.TriggerServerCallback('snowiCheckOrgMoney', function(hasEnoughMoney)
						if hasEnoughMoney then
							ESX.UI.Menu.CloseAll()
							menu3.close()
							--print(json.encode(data.current.value)..data.current.value.plate)
							SpawnPoundedVehicle(data.current.value.vehicle, data.current.value.plate, partNum, station)
						else
							ESX.ShowNotification('No tienes suficiente dinero en mano')
						end
					end)
        elseif data3.current.value == 'banco' then
          ESX.TriggerServerCallback('snowiCheckOrgMoneyBanco', function(hasEnoughMoney)
						if hasEnoughMoney then
							ESX.UI.Menu.CloseAll()
							menu3.close()
							--print(json.encode(data.current.value)..data.current.value.plate)
							SpawnPoundedVehicle(data.current.value.vehicle, data.current.value.plate, partNum, station)
						else
							ESX.ShowNotification('No tienes suficiente dinero en banco')
						end
					end)
        end
        end, function(data3, menu3)
					menu3.close()
				end)
				end, function(data2, menu2)
					menu2.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)

  end
function SpawnPoundedVehicle(vehicle, plate, pt, st)
	DoScreenFadeOut(1000)
	Wait(1000)
	ESX.Game.SpawnVehicle(vehicle.model, {
		x = Config.mafiaTables[PlayerData.job.name].Vehicles[pt].SpawnPoint.x,
		y = Config.mafiaTables[PlayerData.job.name].Vehicles[pt].SpawnPoint.y,
		z = Config.mafiaTables[PlayerData.job.name].Vehicles[pt].SpawnPoint.z
	}, Config.mafiaTables[PlayerData.job.name].Vehicles[pt].SpawnPoint.h, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehicleFixed(callback_vehicle, vehicle)
    SetVehicleDirtLevel(callback_vehicle, 1.0)
	    SetVehicleDeformationFixed(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "RADIO_05_TALK_01")
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
		local playerPed = PlayerPedId()
local vehicle = GetVehiclePedIsIn(playerPed, false)
SetVehRadioStation(vehicle, "RADIO_05_TALK_01")
	end)
	DoScreenFadeIn()
	TriggerServerEvent('snowiSetStateOrg', plate, false, 'desin')
end
  function SpawnVehicle(vehicle, plate, pt, st)
	print(pt)
	ESX.Game.SpawnVehicle(vehicle.model, {
		x = Config.mafiaTables[PlayerData.job.name].Vehicles[pt].SpawnPoint.x,
		y = Config.mafiaTables[PlayerData.job.name].Vehicles[pt].SpawnPoint.y,
		z = Config.mafiaTables[PlayerData.job.name].Vehicles[pt].SpawnPoint.z
	}, Config.mafiaTables[PlayerData.job.name].Vehicles[pt].SpawnPoint.h, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehicleFixed(callback_vehicle, vehicle)
    SetVehicleDirtLevel(callback_vehicle, 1.0)
	    SetVehicleDeformationFixed(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "RADIO_05_TALK_01")
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
		local playerPed = PlayerPedId()
local vehicle = GetVehiclePedIsIn(playerPed, false)
SetVehRadioStation(vehicle, "RADIO_05_TALK_01")
	end)
	
	TriggerServerEvent('snowiSetStateOrg', plate, false, 'garage')
end
function putaway(vehicle, vehicleProps)
	ESX.Game.DeleteVehicle(vehicle)
	TriggerServerEvent('snowiSetStateOrg', vehicleProps.plate, true, 'guardar')
	ESX.ShowNotification('Has guardado el vehiculo en el garaje')
end
jobWL = {
  ['armeriaSur'] = {society='society_armeriasur', logs=''},
  ['armasNorte'] = {society='society_armerianorte', logs=''}, 
  ['LosCorona'] = {society='society_LosCorona', logs='farina'}, 
  ['armeriaSandy'] = {society='society_armeriaSandy', logs=''}, 
  ['armasStraw'] = {society='society_armasStraw', logs=''}, 
  ['TheUnion'] = {society='society_TheUnion', logs='hive'},  
  ['medusa'] = {society='society_medusa', logs='bahamas'},  
  ['bahamas'] = {society='society_bahamas', logs='bahamas'},
  ['BallasChowy'] = {society='society_BallasChowy', logs='ballas'}, 
  ['Families'] = {society='society_Families', logs='verdes'}, 
  ['Crips'] = {society='society_Crips', logs='Crips'}, 
  ['GlockGang'] = {society='society_GlockGang', logs='glock'}, 
  ['armasmenor'] = {society='society_armeriamenor', logs=''}, 
  ['TheMasacre'] = {society='society_TheMasacre', logs='masacre'}, 
  ['TheDarks'] = {society='society_TheDarks', logs='rex'}, 
  ['lawyer'] = {society='society_lawyer', logs='lawyer'}, 
  ['TheCriminals'] = {society='society_TheCriminals', logs='TheCriminals'},
  ['weedshop'] = {society='society_weedshop', logs= 'weedshop'},
  ['LosAngeles'] = {society='society_LosAngeles', logs= 'LosAngeles'},
 -- ['TheDarks'] = {society='society_TheDarks', logs = ''},

}
function MenuInteracionMafias(mafia)
 

   ESX.UI.Menu.CloseAll()

   ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'SnowiMafiasAcciones',
    {
      title    = mafia,
      align    = 'bottom-right',
      elements = {
        {label = _U('citizen_interaction'), value = 'citizen_interaction'},
      },
    },
    function(data, menu)
      if mafia ~= 'lawyer' then
elements = {
  {label = _U('id_card'),       value = 'identity_card'},
  {label = _U('search'),        value = 'body_search'},
  {label = _U('handcuff'),    value = 'handcuff'},
  {label = _U('drag'),      value = 'drag'},
  {label = _U('put_in_vehicle'),  value = 'put_in_vehicle'},
  {label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
  --{label = _U('fine'),            value = 'fine'}
}
else
elements = {}
end
      if data.current.value == 'citizen_interaction' then
        if PlayerData.job.name == 'armeriaSur' or  PlayerData.job.name == 'armasNorte' or PlayerData.job.name == 'armasmenor' or PlayerData.job.name == 'armeriaSandy' or PlayerData.job.name == 'armasStraw' or PlayerData.job.name == 'lawyer' then
          print(json.encode(PlayerData))
          table.insert(elements, {label='Enviar factura', value='bill'})
          if PlayerData.job.grade == 3 then
            table.insert(elements, {label='Controlar sociedad', value='cs'})
          end
        end
        
        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'citizen_interaction',
          {
            title    = _U('citizen_interaction'),
            align    = 'bottom-right',
            elements = elements,
          },
          function(data2, menu2)
            if data2.current.value == 'cs' then
              TriggerEvent('esx_society:openBossMenu', PlayerData.job.name, function(data, menu)
                menu.close()
                CurrentAction     = 'menu_boss_actions'
                CurrentActionMsg  = _U('open_bossmenu')
                CurrentActionData = {}
            
              end,{})
              return
              end
            local player, distance = ESX.Game.GetClosestPlayer()if distance ~= -1 and distance <= 3.0 then if data2.current.value == 'identity_card' then OpenIdentityCardMenu(player) end if data2.current.value == 'body_search' then ExecuteCommand('me Le cachea') OpenBodySearchMenu(player) end

              if data2.current.value == 'handcuff' then
                TriggerServerEvent('snowiMafiashandcuff', GetPlayerServerId(player))
              end
if data2.current.value == 'bill' then
  society = jobWL[PlayerData.job.name].society
  society2 = jobWL[PlayerData.job.name].society
  if society == nil then
    society = 'society_armeriasur'
  end
  if society == nil then
    society = 'society_armasStraw'
  end
  ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
    title = 'Importe de la factura'
  }, function(data3, menu3)
    local amount = tonumber(data3.value)

    if amount == nil or amount < 0 then
      ESX.ShowNotification('Cantidad invalida')
    else
      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      if closestPlayer == -1 or closestDistance > 3.0 then
        ESX.ShowNotification('Ningún jugador cercano')
      else
        menu3.close()
        TriggerServerEvent('esx_billing:senhfgdBill132', GetPlayerServerId(player), society, mafia, amount)
        ESX.ShowNotification('Has enviado una facutra a Desconocido-'..GetPlayerServerId(player)..' de un monto de: '..amount)
      end
    end
  end, function(data3, menu3)
    menu3.close()
  end)
end
              if data2.current.value == 'drag' then
                TriggerServerEvent('snowiMafiasdrag', GetPlayerServerId(player))
              end

              if data2.current.value == 'put_in_vehicle' then
                TriggerServerEvent('snowiMafiasputInVehicle', GetPlayerServerId(player))
              end

              if data2.current.value == 'out_the_vehicle' then
                  TriggerServerEvent('snowiMafiasOutVehicle', GetPlayerServerId(player))
              end

              if data2.current.value == 'fine' then
                OpenFineMenu(player)
              end else ESX.ShowNotification(_U('no_players_nearby')) end end, function(data2, menu2) ESX.UI.Menu.CloseAll()  end ) end end, function(data, menu) menu.close() end )
end
RegisterNetEvent('gEtSnowiUrl MAFIAS jaja . https://discord.com/app/webhooks/9238576  discord.gg/agriorp', function(a)
  urlMafias = a end)

function OpenIdentityCardMenu(player)
  local player, distance = ESX.Game.GetClosestPlayer()
			
      if distance ~= -1 and distance <= 3.0 then
        exports['screenshot-basic']:requestScreenshotUpload(urlMafias, 'files[]', function(data)
          local resp = json.decode(data)
          TriggerEvent('chat:addMessage', { template = "", args = { "^8Has tomado el DNI de ^2[ "..GetPlayerName(player).." ^2] ^5(Nombre OOC)^8, se cargó a la nube con ^2éxito^8!" } })
      end)
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
        TriggerServerEvent(
                    "snowiSyncLogs", "dnis",
                    "­LOGS DNI MAFIAS ("..PlayerData.job.name..")",
                    "**\n ** [ " ..GetPlayerName(PlayerId()).." ] Le cogio el dni con menu de mafia a [ "..GetPlayerName(player).." ] \n Coords: "..GetEntityCoords(GetPlayerPed(-1))
                )
              end
end

function OpenBodySearchMenu(player)
ExecuteCommand("do Que tendria?")
  ESX.TriggerServerCallback('snowiMafiasgetOtherPlayerData', function(data)

    local elements = {}

    local blackMoney = 0

    for i=1, #data.accounts, 1 do
      if data.accounts[i].name == 'black_money' then
        blackMoney = data.accounts[i].money
      end
    end

    table.insert(elements, {
      label          = "Dinero negro x "..blackMoney,
      value          = 'black_money',
      itemType       = 'item_account',
      amount         = blackMoney
    })

    table.insert(elements, {label = '--- Armas ---', value = nil})

    for i=1, #data.weapons, 1 do
      print(json.encode(data.weapons[i]))
      table.insert(elements, {
        label          = ESX.GetWeaponLabel(data.weapons[i].name),
        value          = data.weapons[i].name,
        itemType       = 'item_weapon',
        amount         = data.weapons[i].ammo,
      })
    end

    table.insert(elements, {label = _U('inventory_label'), value = nil})

    for i=1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label          = data.inventory[i].count .. ' ' .. data.inventory[i].label,
          value          = data.inventory[i].name,
          itemType       = 'item_standard',
          amount         = data.inventory[i].count,
        })
      end
    end


    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'body_search',
      {
        title    = _U('search'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        local itemType = data.current.itemType
        local itemName = data.current.value
        local amount   = tonumber(data.current.amount)
				local label = data.current.label

        if data.current.value ~= nil then

          TriggerServerEvent('snowiMafiasconfiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
							ExecuteCommand("me Le quita ["..label.."] x"..amount)

          OpenBodySearchMenu(player)

        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, GetPlayerServerId(player))

end






function OpenGetWeaponMenu()

  ESX.TriggerServerCallback('snowiMafiasgetArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_get_weapon',
      {
        title    = _U('get_weapon_menu'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('snowiMafiasremoveArmoryWeapon', function()
          OpenGetWeaponMenu()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutWeaponMenu()

  local elements   = {}
  local playerPed  = GetPlayerPed(-1)
  local weaponList = ESX.GetWeaponList()

  for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
      local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
      table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
    end

  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'armory_put_weapon',
    {
      title    = _U('put_weapon_menu'),
      align    = 'bottom-right',
      elements = elements,
    },
    function(data, menu)

      menu.close()

      ESX.TriggerServerCallback('snowiMafiasaddArmoryWeapon', function()
        OpenPutWeaponMenu()
      end, data.current.value)

    end,
    function(data, menu)
      menu.close()
    end
  )

end


function OpenGetStocksMenu()

  ESX.TriggerServerCallback('snowiMafiasgetStockItems', function(items)

    print(json.encode(items))

    local elements = {}

     for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name, max = items[i].count})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = 'Armario De Organizacion',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)
            if count > data.current.max then
              TriggerServerEvent('snowiNoDupees', data.current.max,itemName, count,'saca')
              ESX.UI.Menu.CloseAll()
              return end
            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
               ESX.UI.Menu.CloseAll()

              TriggerServerEvent('snowiMafiasgetStockItem', itemName, count);OpenGetStocksMenu()
            end

          end,
          function(data2, menu2)
             ESX.UI.Menu.CloseAll()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu()

  ESX.TriggerServerCallback('snowiMafiasgetPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name, max = item.count})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('inventory'),
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)
print(data.current.max)
if count > data.current.max then
  TriggerServerEvent('snowiNoDupees', data.current.max,itemName, count)
  ESX.UI.Menu.CloseAll()
  return 
end
            if count == nil and count <= data.current.max then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
               ESX.UI.Menu.CloseAll()

              TriggerServerEvent('snowiMafiasputStockItems', itemName, count);OpenPutStocksMenu()
            end

          end,
          function(data2, menu2)
             ESX.UI.Menu.CloseAll()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


AddEventHandler('snowiMafiashasEnteredMarker', function(station, part, partNum)

  if part == 'Cloakroom' then
    CurrentAction     = 'menu_cloakroom'
    CurrentActionMsg  = 'Abrir armario de ropa'
    CurrentActionData = {}
  end

  if part == 'Armory' then
    CurrentAction     = 'menu_armory'
    CurrentActionMsg  = _U('open_armory')
    CurrentActionData = {station = station}
  end

  if part == 'VehicleSpawner' then
    CurrentAction     = 'menu_vehicle_spawner'
    CurrentActionMsg  = _U('vehicle_spawner')
    CurrentActionData = {station = station, partNum = partNum}
  end

  --[[DrawMarker(
	1, 
	-994.32, 
	1550.04, 
	272.03, 
	dirX , 
	dirY , 
	dirZ , 
	rotX , 
	rotY , 
	rotZ , 
	scaleX , 
	scaleY , 
	scaleZ , 
	red , 
	green , 
	blue , 
	alpha , 
	bobUpAndDown , 
	faceCamera , 
	p19 , 
	rotate , 
	textureDict , 
	textureName , 
	drawOnEnts 
)--]]

  if part == 'HelicopterSpawner' then

    local helicopters = Config.mafiaTables[PlayerData.job.name].Helicopters

    if not IsAnyVehicleNearPoint(helicopters[1].SpawnPoint.x, helicopters[1].SpawnPoint.y, helicopters[1].SpawnPoint.z,  3.0) then
      local helis = {}
      for i=1, #Config.mafiaTables[PlayerData.job.name].Helis, 1 do
        local vehicle = Config.mafiaTables[PlayerData.job.name].Helis[i]
        table.insert(helis, {label = vehicle.label, value = vehicle.name})
      end
      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'stocks_menu',
        {
          title    = 'Helipuerto',
          align = 'bottom-right',
          elements = helis
        },
        function(data, menu)
          print(data.current.value)
      ESX.Game.SpawnVehicle(data.current.value, {
        x = helicopters[1].SpawnPoint.x,
        y = helicopters[1].SpawnPoint.y,
        z = helicopters[1].SpawnPoint.z
      }, helicopters[1].Heading, function(vehicle)
        SetVehicleModKit(vehicle, 0)
        SetVehicleLivery(vehicle, 0)
        ESX.UI.Menu.CloseAll()
      end)
    end,
    function(data, menu)
      menu.close()
    end
  )

    end

  end

  if part == 'VehicleDeleter' then

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed, false)

      if DoesEntityExist(vehicle) then
        CurrentAction     = 'delete_vehicle'
        CurrentActionMsg  = _U('store_vehicle')
        CurrentActionData = {vehicle = vehicle}
      end

    end

  end

  if part == 'BossActions' then
    CurrentAction     = 'menu_boss_actions'
    CurrentActionMsg  = _U('open_bossmenu')
    CurrentActionData = {}
  end

end)

AddEventHandler('snowiMafiashasExitedMarker', function(station, part, partNum)
   ESX.UI.Menu.CloseAll()
  CurrentAction = nil
end)

AddEventHandler('snowiMafiashasEnteredEntityZone', function(entity)

  local playerPed = GetPlayerPed(-1)

  if PlayerData.job ~= nil and snowiGetMafia(PlayerData.job.name) and not IsPedInAnyVehicle(playerPed, false) then
    CurrentAction     = 'remove_entity'
    CurrentActionMsg  = _U('remove_object')
    CurrentActionData = {entity = entity}
  end

  if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed)

      for i=0, 7, 1 do
        SetVehicleTyreBurst(vehicle,  i,  true,  1000)
      end

    end

  end

end)

AddEventHandler('snowiMafiashasExitedEntityZone', function(entity)

  if CurrentAction == 'remove_entity' then
    CurrentAction = nil
  end

end)

RegisterNetEvent('snowiMafiashandcuff')
AddEventHandler('snowiMafiashandcuff', function()

  IsHandcuffed    = not IsHandcuffed;
  local playerPed = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    if IsHandcuffed then

      RequestAnimDict('mp_arresting')

      while not HasAnimDictLoaded('mp_arresting') do
        Wait(100)
      end

      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
      SetEnableHandcuffs(playerPed, true)
      SetPedCanPlayGestureAnims(playerPed, false)
      FreezeEntityPosition(playerPed,  true)

    else

      ClearPedSecondaryTask(playerPed)
      SetEnableHandcuffs(playerPed, false)
      SetPedCanPlayGestureAnims(playerPed,  true)
      FreezeEntityPosition(playerPed, false)

    end

  end)
end)

RegisterNetEvent('snowiMafiasdrag')
AddEventHandler('snowiMafiasdrag', function(cop)
  TriggerServerEvent('esx:clientLog', 'starting dragging')
  IsDragged = not IsDragged
  CopPed = tonumber(cop)
end)
local tiempoesposa = 2500
Citizen.CreateThread(function()
  while true do
    Wait(tiempoesposa)
    if IsHandcuffed then
      tiempoesposa = 0
      if IsDragged then
        local ped = GetPlayerPed(GetPlayerFromServerId(CopPed))
        local myped = GetPlayerPed(-1)
        AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
      else
        DetachEntity(GetPlayerPed(-1), true, false)
      end
    else
      tiempoesposa = 2500
    end
  end
end)

RegisterNetEvent('snowiMafiasputInVehicle')
AddEventHandler('snowiMafiasputInVehicle', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  5.0,  0,  71)

    if DoesEntityExist(vehicle) then

      local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
      local freeSeat = nil

      for i=maxSeats - 1, 0, -1 do
        if IsVehicleSeatFree(vehicle,  i) then
          freeSeat = i
          break
        end
      end

      if freeSeat ~= nil then
        TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
      end

    end

  end

end)

RegisterNetEvent('snowiMafiasOutVehicle')
AddEventHandler('snowiMafiasOutVehicle', function(t)
  local ped = GetPlayerPed(t)
  ClearPedTasksImmediately(ped)
  plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
  local xnew = plyPos.x+2
  local ynew = plyPos.y+2

  SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
end)

-- Handcuff

Citizen.CreateThread(function()
  while true do
    Wait(tiempoesposa)
    if IsHandcuffed then
      tiempoesposa= 0
      DisableControlAction(0, 142, true) -- MeleeAttackAlternate
      DisableControlAction(0, 30,  true) -- MoveLeftRight
      DisableControlAction(0, 31,  true) -- MoveUpDown
    else
      tiempoesposa = 2500
    end
  end
end)


-- Display markers
Citizen.CreateThread(function()
  while true do

    Wait(5)
local duerme = true
    if PlayerData.job ~= nil and snowiGetMafia(PlayerData.job.name) then

      local playerPed = GetPlayerPed(-1)
      local coords    = GetEntityCoords(playerPed)

     -- for k,v in pairs(Config.mafiaTables[PlayerData.job.name]) do

     local v = Config.mafiaTables[PlayerData.job.name]

        for i=1, #v.Armories, 1 do
          if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.DrawDistance then
duerme = false
            DrawMarker(21, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, v.color.r, v.color.g, v.color.b, 100, true, true, 2, false, false, false, false)
          end
        end
        for i=1, #v.Cloakrooms, 1 do
          if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.DrawDistance then
duerme = false
DrawMarker(21, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, v.color.r, v.color.g, v.color.b, 100, true, true, 2, false, false, false, false)
          end
        end
        for i=1, #v.Vehicles, 1 do
          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.DrawDistance then
duerme = false
            DrawMarker(21, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, v.color.r, v.color.g, v.color.b, 100, true, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.VehicleDeleters, 1 do
          if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.DrawDistance then
duerme = false
            DrawMarker(21, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, v.color.r, v.color.g, v.color.b, 100, true, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.Helicopters, 1 do
          if GetDistanceBetweenCoords(coords,  v.Helicopters[i].Spawner.x,  v.Helicopters[i].Spawner.y,  v.Helicopters[i].Spawner.z,  true) < Config.DrawDistance then
duerme = false
            DrawMarker(21, v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y, v.Helicopters[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, v.color.r, v.color.g, v.color.b, 100, true, true, 2, false, false, false, false)
          end
        end

        if Config.EnablePlayerManagement and PlayerData.job ~= nil and snowiGetMafia(PlayerData.job.name) and PlayerData.job.grade_name == 'boss' then

          for i=1, #v.BossActions, 1 do
            if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.DrawDistance then
duerme = false
              DrawMarker(21, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, v.color.r, v.color.g, v.color.b, 100, true, true, 2, false, false, false, false)
            end
          end

        end

      --end
    else
      Citizen.Wait(5000)

    end
    if duerme == true then
      Citizen.Wait(3000)

    end
  end
end)

-- Enter / Exit marker events
local otrotempmaf= 2500
Citizen.CreateThread(function()

  while true do

    Wait(otrotempmaf)
local duermeO = true
    if PlayerData.job ~= nil and snowiGetMafia(PlayerData.job.name) then

      local playerPed      = GetPlayerPed(-1)
      local coords         = GetEntityCoords(playerPed)
      local isInMarker     = false
      local currentStation = nil
      local currentPart    = nil
      local currentPartNum = nil

    --  for k,v in pairs(Config.mafiaTables[PlayerData.job.name]) do
--print(json.encode(v))
local v = Config.mafiaTables[PlayerData.job.name]
        for i=1, #v.Armories, 1 do
          if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.MarkerSize.x then
duermeO = false
            isInMarker     = true
otrotempmaf = 5
            currentStation = k
            currentPart    = 'Armory'
            currentPartNum = i
          end
        end
        for i=1, #v.Cloakrooms, 1 do
          if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.MarkerSize.x then
duermeO = false
otrotempmaf = 5
            isInMarker     = true
            currentStation = k
            currentPart    = 'Cloakroom'
            currentPartNum = i
          end
        end
        for i=1, #v.Vehicles, 1 do

          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.MarkerSize.x then
duermeO = false
            isInMarker     = true
otrotempmaf = 5
            currentStation = k
            currentPart    = 'VehicleSpawner'
            currentPartNum = i
          end

          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].SpawnPoint.x,  v.Vehicles[i].SpawnPoint.y,  v.Vehicles[i].SpawnPoint.z,  true) < Config.MarkerSize.x then
duermeO = false
            isInMarker     = true
otrotempmaf = 5
            currentStation = k
            currentPart    = 'VehicleSpawnPoint'
            currentPartNum = i
          end

        end

        for i=1, #v.Helicopters, 1 do

          if GetDistanceBetweenCoords(coords,  v.Helicopters[i].Spawner.x,  v.Helicopters[i].Spawner.y,  v.Helicopters[i].Spawner.z,  true) < Config.MarkerSize.x then
duermeO = false
            isInMarker     = true
otrotempmaf = 5
            currentStation = k
            currentPart    = 'HelicopterSpawner'
            currentPartNum = i
          end

          if GetDistanceBetweenCoords(coords,  v.Helicopters[i].SpawnPoint.x,  v.Helicopters[i].SpawnPoint.y,  v.Helicopters[i].SpawnPoint.z,  true) < Config.MarkerSize.x then
duermeO = false
            isInMarker     = true
otrotempmaf = 5
            currentStation = k
            currentPart    = 'HelicopterSpawnPoint'
            currentPartNum = i
          end

        end

        for i=1, #v.VehicleDeleters, 1 do
          if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.MarkerSize.x then
duermeO = false
            isInMarker     = true
otrotempmaf = 5
            currentStation = k
            currentPart    = 'VehicleDeleter'
            currentPartNum = i
          end
        end

        if Config.EnablePlayerManagement and PlayerData.job ~= nil and snowiGetMafia(PlayerData.job.name) and PlayerData.job.grade_name == 'boss' then

          for i=1, #v.BossActions, 1 do
            if GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.MarkerSize.x then
duermeO = false
              isInMarker     = true
otrotempmaf = 5
              currentStation = k
              currentPart    = 'BossActions'
              currentPartNum = i
            end
          end

        end

    --  end
--
      local hasExited = false

      if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) ) then

        if
          (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
          (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
        then
          TriggerEvent('snowiMafiashasExitedMarker', LastStation, LastPart, LastPartNum)
          hasExited = true
        end

        HasAlreadyEnteredMarker = true
        LastStation             = currentStation
        LastPart                = currentPart
        LastPartNum             = currentPartNum

        TriggerEvent('snowiMafiashasEnteredMarker', currentStation, currentPart, currentPartNum)
      end

      if not hasExited and not isInMarker and HasAlreadyEnteredMarker then

        HasAlreadyEnteredMarker = false

        TriggerEvent('snowiMafiashasExitedMarker', LastStation, LastPart, LastPartNum)
      end
else
  otrotempmaf = 2500
    end
if duermeO == true then
Citizen.Wait(3000)
end

  end
end)
function RopaMafia()
  print('aahah')
  ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
    local elements = {}

    for i=1, #dressing, 1 do
      table.insert(elements, {
        label = dressing[i],
        value = i
      })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
      title    ='Armario organización',
      align    = 'bottom-right',
      elements = elements
    }, function(data2, menu2)
      TriggerEvent('skinchanger:getSkin', function(skin)
       
        ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
          TriggerEvent('skinchanger:loadClothes', skin, clothes)
          TriggerEvent('esx_skin:setLastSkin', skin)

          TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerServerEvent('esx_skin:save', skin)
           
          end)
      
        
        end, data2.current.value) 
      end)

    end, function(data2, menu2)
      menu2.close()
    end)
  end)
end
local puso = false
-- Key Controls
local tiempomafia = 2500
Citizen.CreateThread(function()
  while true do

    Citizen.Wait(tiempomafia)

    if CurrentAction ~= nil then
      tiempomafia = 5

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlPressed(0,  Keys['E']) and PlayerData.job ~= nil and snowiGetMafia(PlayerData.job.name) and (GetGameTimer() - GUI.Time) > 150 then

        if CurrentAction == 'menu_cloakroom' then
          RopaMafia()
        end

        if CurrentAction == 'menu_armory' then
          OpenArmoryMenu(CurrentActionData.station)
        end

        if CurrentAction == 'menu_vehicle_spawner' then
          print(CurrentActionData.partNum)
          OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
        end

        if CurrentAction == 'delete_vehicle' then

          local playerPed    = GetPlayerPed(-1)
          local coords       = GetEntityCoords(playerPed)
          local vehicle      = GetVehiclePedIsIn(playerPed, false)
          local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
          local current 	   = GetPlayersLastVehicle(GetPlayerPed(-1), true)
          local engineHealth = GetVehicleEngineHealth(current)
          local plate        = vehicleProps.plate
          
          ESX.TriggerServerCallback('snowiStoreOwnedVehicleOrg', function(valid)
            if valid then
              if engineHealth < 990 then
                
                  local apprasial = math.floor((1000 - engineHealth)/1000)
                  putaway(vehicle, vehicleProps)
              else
                putaway(vehicle, vehicleProps)
              end	
            else
              ESX.ShowNotification('Has guardado un vehiculo que no pertenece a la organización.')
            	ESX.Game.DeleteVehicle(vehicle)
            end
          end, vehicleProps)
            end

        if CurrentAction == 'menu_boss_actions' then
          local options = {
            wash      = Config.EnableMoneyWash,
          }

           ESX.UI.Menu.CloseAll()

          TriggerEvent('esx_society:openBossMenu', PlayerData.job.name, function(data, menu)

            menu.close()

            CurrentAction     = 'menu_boss_actions'
            CurrentActionMsg  = _U('open_bossmenu')
            CurrentActionData = {}

          end,options)

        end

        if CurrentAction == 'remove_entity' then
          DeleteEntity(CurrentActionData.entity)
        end

        CurrentAction = nil
        GUI.Time      = GetGameTimer()

      end
    else
      tiempomafia = 2500
    end
   

  end
end)
RegisterCommand('menumafia', function()
  print(snowiGetMafia('BallasChowy'))
if PlayerData.job ~= nil and snowiGetMafia(PlayerData.job.name) and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'SnowiMafiasAcciones') and (GetGameTimer() - GUI.Time) > 150 then
  local job = PlayerData.job.name
   
  local job = PlayerData.job.name
  if Config.mafiaTables[job] == nil then
    Config.mafiaTables[job] = {}
    Config.mafiaTables[job].label = 'No registrada/'..job
  end
   MenuInteracionMafias(Config.mafiaTables[job].label)
   print(Config.mafiaTables[job].label)
   GUI.Time = GetGameTimer()
end 
end)
RegisterKeyMapping('menumafia', 'Menu de mafia', 'keyboard', 'F6' )
RegisterNetEvent('snowiEventToMenu', function(job) 
  MenuInteracionMafias(job)
end)
snowiGetMafia = function(job)

  --[[for i, v in pairs(Config.mafiaTables) do
    print(json.encode(v))
    if v.job then
      return true
    end
  end
  return false--]]
  if Config.mafiaTables[job] then
    return true
  else
    print('false')
    return false
  end

end

RegisterCommand('venderarma', function(source, args) 
local arma = args[3]
local id = tonumber(args[1])
local precio = tonumber(args[2])
TriggerEvent('chatMessage', "Vender Armas", {255, 0, 0}, "Has ofrecido ("..arma..") a Desconocido-"..id.." por "..precio.."€")
TriggerServerEvent('comprobarOfertaArma', id, precio, arma)
end)

RegisterNetEvent('compraArmas', function(id, precio, arma) 
  TriggerEvent('chatMessage', "Vender Armas", {255, 0, 0}, "Desconocido-"..id.." Te ha ofrecido  ("..arma..") a por "..precio.."€")
  TriggerEvent('chatMessage',"Vender Armas", {255, 0, 0},"^2 Pulsa [1] ^0 para ACEPTAR o ^2 pulsa [2] ^0 para rechazar la oferta")
  oferta = true
  Citizen.CreateThread(function()
		while oferta do
				if IsControlJustPressed(1, 157) then -- 1 = YES
					TriggerServerEvent('aceptarOfertaS', true, id, precio, arma)
          TriggerEvent('chatMessage',"Vender Armas", {255, 0, 0},"Has aceptado la oferta! Has comprado una "..arma.." por "..precio.."€ a Desconocido-"..id)
					oferta = false
				end
				if IsControlJustPressed(1, 158) then -- 2 = NO
					TriggerServerEvent('aceptarOfertaS', false, id, precio, arma)
          TriggerEvent('chatMessage',"Vender Armas", {255, 0, 0},"Has rechazado la oferta! Has rechazado una "..arma.." por "..precio.."€ a Desconocido-"..id)
					oferta = false
				end
			Citizen.Wait(0)
		end
	end)
end)

RegisterNetEvent('snowiEventToMenu', function(a)
  print(a)
  if a == 'armeriaSur' then
    a = 'Armeria Sur'
  elseif a == 'armasmenor' then
    a = 'Armeria Ciudad'
  elseif a == 'armasStraw' then
    a = 'Armeria Straw'
  end
  MenuInteracionMafias(a)
  end)

  RegisterCommand('wmp400', function(source, args)
    local coordsWash =  {x=-697.39782714844, y=647.69671630859, z=155.16479492188, h=121.88976287842}
    local coordsPed = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(coordsPed,coordsWash.x, coordsWash.y, coordsWash.z, true )
      if distance < 10.0 then
       TriggerServerEvent('snowiSyncWMP')
      else
      TriggerEvent("esx:showNotification", source, "Estas a "..distance.. " metros del lugar admitido para la accion.")
      end
    end)