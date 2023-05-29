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

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
	end
end)
local pagado = false
local comprobado = false
function checkDonador()
	ESX.TriggerServerCallback("snowiCheckDonador", function(es)
		print(es)
		comprobado = true
		pagado = es
	end)
end
function IsAbleToSteal(targetSID, err)
	print(IsEntityDead(GetPlayerPed(GetPlayerFromServerId(targetSID))))
	print('yo ',IsEntityDead(GetPlayerPed(-1)))
	if IsEntityDead(GetPlayerPed(GetPlayerFromServerId(targetSID))) then print('Cacheando a muerto') err(false)  return end
	ESX.TriggerServerCallback('esx_thief:getValue', function(result)
		local result = result
		if result.value then
			err(false)
		else
			err('La persona no tiene las manos levantadas')
		end
	end, targetSID)
end
local veces= 0
RegisterCommand('getcachear', function()
if veces < 2 then
	veces = veces +1
	comprobado = false
else
print('Excediste el limite para comprobar si tienes permiso para cachear!') end end)
function OpenStealMenu(target, target_id)
	ESX.UI.Menu.CloseAll()

	ESX.TriggerServerCallback('esx_thief:getOtherPlayerData', function(data)
		local elements = {}

		if Config.EnableCash then
			table.insert(elements, {
				label = (('[%s] $%s'):format(_U('cash'), ESX.Math.GroupDigits(data.money))),
				value = 'money',
				type = 'item_money',
				amount = data.money
			})
		end

		if Config.EnableBlackMoney then
			local blackMoney = 0

			for i=1, #data.accounts, 1 do
				if data.accounts[i].name == 'black_money' then
					blackMoney = data.accounts[i].money
					break
				end
			end

			table.insert(elements, {
				label = (('[%s] $%s'):format(_U('black_money'), ESX.Math.GroupDigits(blackMoney))),
				value = 'black_money',
				type = 'item_account',
				amount = blackMoney
			})
		end

        if Config.EnableWeapons then
            table.insert(elements, {label = '=== ' .. _U('gun_label') .. ' ===', value = nil})

			for i=1, #data.weapons, 1 do
				--print(elements1)
                table.insert(elements, {
                    label    = ESX.GetWeaponLabel(data.weapons[i].name) .. ' x' .. data.weapons[i].ammo,
                    value    = data.weapons[i].name,
                    type     = 'item_weapon',
                    amount   = data.weapons[i].ammo
                })
            end
        end		

		if Config.EnableInventory then
			table.insert(elements, {label = '--- ' .. _U('inventory') .. ' ---', value = nil})

			for i=1, #data.inventory, 1 do
				if data.inventory[i].count > 0 then
					table.insert(elements, {
						label = data.inventory[i].label .. ' x' .. data.inventory[i].count,
						value = data.inventory[i].name,
						type  = 'item_standard',
						amount = data.inventory[i].count,
					})
				end
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'steal_inventory', {
			title  = _U('target_inventory'),
			elements = elements,
			align = 'top-left'
		}, function(data, menu)

			if data.current.value ~= nil then

				local itemType = data.current.type
				local itemName = data.current.value
				local amount   = data.current.amount
				local label = data.current.label
				--for i=1, #data.weapons, 1 do
				--local label = ESX.GetWeaponLabel(data.current.type)
				--end
				local elements = {}
				table.insert(elements, {label = _U('steal'), action = 'steal', itemType, itemName, amount})
				table.insert(elements, {label = _U('return'), action = 'return'})

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'steal_inventory_item', {
					title = _U('action_choice'),
					align = 'top-left',
					elements = elements
				}, function(data2, menu2)
					if data2.current.action == 'steal' then

						if itemType == 'item_standard' then
							ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'steal_inventory_item_standard', {
								title = _U('amount')
							}, function(data3, menu3)
								local quantity = tonumber(data3.value)
								TriggerServerEvent('esx_thief:stealPlayerItem', GetPlayerServerId(target), itemType, itemName, quantity)
								ExecuteCommand("me Le quita ["..label.."] x"..quantity)
								OpenStealMenu(target)
							
								menu3.close()
								menu2.close()
							end, function(data3, menu3)
								menu3.close()
							end)
						else
							TriggerServerEvent('esx_thief:stealPlayerItem', GetPlayerServerId(target), itemType, itemName, amount)
							ExecuteCommand("me Le quita ["..label.."] x"..amount)
							OpenStealMenu(target)
						end

					elseif data2.current.action == 'return' then
						ESX.UI.Menu.CloseAll()
						OpenStealMenu(target)
					end

				end, function(data2, menu2)
					menu2.close()
				end)
			end

		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(target))
end
local mierda = true
RegisterKeyMapping('cachearpersona', 'Debes apuntarle con un arma, y que levante las manos', 'keyboard', 'G' )
RegisterCommand('cachearpersona', function() 

	if comprobado == false then
		checkDonador()
	end
	local ped = PlayerPedId()
	if pagado == true then
		if IsPedArmed(ped, 7) and not IsEntityDead(ped) and IsPedOnFoot(ped) then
			local target, distance = ESX.Game.GetClosestPlayer()

			if target ~= -1 and distance ~= -1 and distance <= 2.0 then
				local target_id = GetPlayerServerId(target)
			
				IsAbleToSteal(target_id, function(err)
					if(not err)then
						--ExecuteCommand("forzar Se veria una persona armada atracando a un civil")
						ExecuteCommand("me Le cachea...🔎")
						Wait(500)
						ExecuteCommand("do Que tendria...?💭")
						OpenStealMenu(target, target_id)
					else
						ESX.ShowNotification(err)
					end
				end)
			
			elseif distance < 20 and distance > 2.0 then
				ESX.ShowNotification('Debes acercarte más a la persona')
			else
				ESX.ShowNotification('No hay jugadores cerca para cachear')
			end
		end
	end
end )