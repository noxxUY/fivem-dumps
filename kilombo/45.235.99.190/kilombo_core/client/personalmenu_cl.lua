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

function OpenLicensesInformation()
  ESX.UI.Menu.Close()

  ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
  { 
  title = _U('titleInfo'), 
  align = 'bottom-right', 
  elements = {
      {label = _U('seeguns'), value = 'seeGuns'},
      {label = _U('showguns'), value = 'showGuns'},
    },
  }, function(data, menu)

    local player, distance = ESX.Game.GetClosestPlayer()
    
    if data.current.value == 'seeGuns' then
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')  -- jsfour-idcard
    elseif data.current.value == 'showGuns' then
      if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')  -- jsfour-idcard
      else
        ESX.ShowNotification('No hay jugadores <span style="color:yellow">cerca</span>')  -- Change notification (I have custom nofitifactions, thats why im using <span>)
      end
    end
  end, function(data, menu) 
  menu.close() 
  end)
end

function OpenMenuPersonal()
    ESX.UI.Menu.CloseAll()

    --ESX.TriggerServerCallback('segundotrabajo', function(result)
    local DataJob = ESX.GetPlayerData()
    local ids = true
    local job = DataJob.job.label
    local jobgrade = DataJob.job.grade_label

    --local job2 = result[1].secondjob
    --local jobgrade2 = result[1].secondjob_grade

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'menu_personal',
      {
        title    = _U('title'),
        align    = 'bottom-right',
        elements = {
          {label = _U('headerJob'), value = 'header'},
          {label = "<i class='fa-solid fa-arrow-right-from-bracket'></i> "..job .. " - " .. jobgrade, value = 'job_interaction'},
         -- {label = job2 .. " - ".. jobgrade2, value = 'job_interaction'},
          {label = _U('headerGeneral'), value = 'header'},
          {label = _U('billing'), value = 'billing_menu'},
          {label = _U('headerLicenses'), value = 'header'},
          {label = _U('showid'), value = 'showid'},
          {label = _U('seeid'), value = 'seeid'},
          {label = _U('infoLicenses'), value = 'licenses_interaction'},
        },
      },
      function(data, menu)

        local player, distance = ESX.Game.GetClosestPlayer()

        if data.current.value == 'job_interaction' then
          -- ExecuteCommand("trabajo") -- Useless
        elseif data.current.value == 'showid' then
          local player, distance = ESX.Game.GetClosestPlayer()
          if distance ~= -1 and distance <= 3.0 then
	          TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))  -- jsfour-idcard
          else
            ESX.ShowNotification('No hay nadie cerca')  -- Change notification (I have custom nofitifactions, thats why im using <span>)
          end
        elseif data.current.value == 'seeid' then
          TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))   -- jsfour-idcard
          ESX.UI.Menu.CloseAll()
        elseif data.current.value == 'licenses_interaction' then
          OpenLicensesInformation()
        elseif data.current.value == 'billing_menu' then
          ShowBillsMenu()                                      -- esx_billing
        end
      end,
      function(data, menu)
        menu.close()
      end
    )
end

function ShowBillsMenu()

	ESX.TriggerServerCallback('esx_billing:getBills', function(bills)
		ESX.UI.Menu.CloseAll()
		local elements = {}

    if next(bills) == nil then
      table.insert(elements, {label = "<i class='fa-solid fa-check'></i> No tenés ningúna factura"})
    else
        for i=1, #bills, 1 do
          table.insert(elements, {
            label  = ('%s - <span style="color:red;">%s</span>'):format(bills[i].label, _U('invoices_item', ESX.Math.GroupDigits(bills[i].amount))),
            billID = bills[i].id
          })
        end
    end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing',
		{
			title    = _U('invoices'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('esx_billing:payBill', function()
				ShowBillsMenu()
			end, data.current.billID)
		end, function(data, menu)
			menu.close()
		end)
	end)

end

RegisterCommand("personalmenu", function()
  if not IsPauseMenuActive() and not isDead then 
    OpenMenuPersonal()
  end
end, false)

RegisterKeyMapping('personalmenu', 'Menu de datos personales', 'keyboard', 'F7')

AddEventHandler('esx:onPlayerDeath', function(data) isDead = true end)
AddEventHandler('esx:onPlayerSpawn', function(spawn) isDead = false end)