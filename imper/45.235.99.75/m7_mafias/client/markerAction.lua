local bossMenu = nil
local subMenu = {}
local gradeMenu = nil
local gradeSubMenu = {}
local memberMenu = nil
local memberSubMenu = {}
local lockerMenu = nil
local i = 0

RegisterNetEvent('m7_mafias:toggleMenu_boss')
AddEventHandler('m7_mafias:toggleMenu_boss', function()
	if myGangId ~= nil and activeGangs[myGangId] ~= nil and myGangGrade == 0 then
		openBossMenu()
	end
end)

function openBossMenu() 
	
	--[[bossMenu = RageUI.CreateMenu(_U('boss_menu'), _U('boss_menu'))
	bossMenu:DisplayGlare(true)
	bossMenu:DisplayPageCounter(true)
	bossMenu.EnableMouse = false
	
	subMenu.account = RageUI.CreateMenu(_U('money_management'), _U('money_management'))
	subMenu.account:DisplayGlare(true)
	subMenu.account:DisplayPageCounter(true)
	
	subMenu.ranks = RageUI.CreateMenu(_U('ranks_management'), _U('ranks_management'))
	subMenu.ranks:DisplayGlare(true)
	subMenu.ranks:DisplayPageCounter(true)
	
	subMenu.employes = RageUI.CreateMenu(_U('employee_list'), _U('employee_list'))
	subMenu.employes:DisplayGlare(true)
	subMenu.employes:DisplayPageCounter(true)

	Citizen.CreateThread(function()
		local whileGo = true 
		while whileGo do
			Citizen.Wait(1.0)
			bossMenu.Closed = function()
				whileGo = false
			end
			RageUI.IsVisible(bossMenu, function()
				RageUI.Button( _U('money_management'), _U('account_management_help') , {}, true, {
					onHovered = function()
						Visual.Subtitle(  _U('account_money',activeGangs[myGangId].accountMoney) , 5000)
					end,
					onSelected = function()
						openAccountMenu()
					end,
				},subMenu.account);
				RageUI.Button( _U('ranks_management'), _U('ranks_management_help') , {}, true, {
					onSelected = function()
						whileGo = false
						TriggerServerEvent('m7_mafias:getRanksOfmyGang')
						--RageUI.Visible(bossMenu, false)
					end,
				},subMenu.ranks);
				RageUI.Button( _U('employee_list'), _U('employee_management') , {}, true, {
					onSelected = function()
						whileGo = false
						TriggerServerEvent('m7_mafias:getMembersOfmyGang')
					end,
				},subMenu.employes);
				RageUI.Button( _U('edit_discord_webHook'), _U('discord_webHook_help') , {}, true, {
					onSelected = function()
						TriggerEvent('m7_mafias:sendNotfication','[Mafia]', ''  , _U('sendWebHookinChatBox') , 'CHAR_SOCIAL_CLUB' , 2 )
					end,
				});
			end, function() end)
		end
	end)
	RageUI.Visible(bossMenu, not RageUI.Visible(bossMenu))]]

	local elements = {
		{label = _U('ranks_management'),  value = 'ranks_management'},
		{label = _U('employee_list'),  value = 'employee_list'},
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'boss_menu',
		{
			title    = _U('boss_menu'),
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)		
			if data.current.value == 'money_management' then
				openAccountMenu()
			elseif data.current.value == 'ranks_management' then
				TriggerServerEvent('m7_mafias:getRanksOfmyGang')
			elseif data.current.value == 'employee_list' then
				TriggerServerEvent('m7_mafias:getMembersOfmyGang')
			elseif data.current.value == 'edit_discord_webHook' then
				TriggerEvent('m7_mafias:sendNotfication','[Mafia]', ''  , _U('sendWebHookinChatBox') , 'CHAR_SOCIAL_CLUB' , 2 )
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function openAccountMenu()
	--[[Citizen.CreateThread(function()
		local whileGoSubMenuAccount = true
		while whileGoSubMenuAccount do
			Citizen.Wait(1.0)
			RageUI.IsVisible(subMenu.account, function()
				RageUI.Separator(_U('account_money',activeGangs[myGangId].accountMoney));
				RageUI.Button(_U('withdraw_money' ) , ''  , {}, true, {
					onSelected = function()
						AddTextEntry('enter_pric_to_withdraw', _U('enter_pric_to_withdraw'))
						DisplayOnscreenKeyboard(1, "enter_pric_to_withdraw", "", "" , "", "", "", 10)
						while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
							Citizen.Wait(7)
						end
						local withdraw = GetOnscreenKeyboardResult()
						if ( withdraw ~= nil ) then
							withdraw = tonumber(withdraw)
							if withdraw ~= '' and withdraw >= 0  then 
								whileGoSubMenuAccount = false
								TriggerServerEvent("m7_mafias:withdrawMoney", withdraw )
								Citizen.Wait(50)
								openAccountMenu()
							end
						end
					end,
				});
				RageUI.Button(_U('deposit_money' ) , ''  , {}, true, {
					onSelected = function()
						AddTextEntry('enter_pric_to_deposit', _U('enter_pric_to_deposit'))
						DisplayOnscreenKeyboard(1, "enter_pric_to_deposit", "", "" , "", "", "", 10)
						while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
							Citizen.Wait(7)
						end
						local deposit = GetOnscreenKeyboardResult()
						if ( deposit ~= nil ) then
							deposit = tonumber(deposit)
							if deposit ~= '' and deposit >= 0  then 
								whileGoSubMenuAccount = false
								TriggerServerEvent("m7_mafias:depositMoney", deposit )
								Citizen.Wait(50)
								openAccountMenu()
							end
						end
					end,
				});
			end, function() end)
		end
	end)]]

	local elements = {
		{label = 'En la cuenta tienes <span style="color:green;"> $' .. activeGangs[myGangId].accountMoney .. '</span>', value = 'account_money'},
		{label = _U('deposit_money'), value = 'deposit_money'},
		{label = _U('withdraw_money'),  value = 'withdraw_money'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'account_money',
		{
			title    = 'Dinero de grupo',
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)		
			if data.current.value == 'withdraw_money' then
				AddTextEntry('enter_pric_to_withdraw', _U('enter_pric_to_withdraw'))
				DisplayOnscreenKeyboard(1, "enter_pric_to_withdraw", "", "" , "", "", "", 10)
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait(7)
				end
				local withdraw = GetOnscreenKeyboardResult()
				if ( withdraw ~= nil ) then
					withdraw = tonumber(withdraw)
					if withdraw ~= '' and withdraw >= 0  then 
						whileGoSubMenuAccount = false
						TriggerServerEvent("m7_mafias:withdrawMoney", withdraw, Config.Orgs[getGangID()].Society)
						menu.close()
					end
				end
			elseif data.current.value == 'deposit_money' then
				AddTextEntry('enter_pric_to_deposit', _U('enter_pric_to_deposit'))
				DisplayOnscreenKeyboard(1, "enter_pric_to_deposit", "", "" , "", "", "", 10)
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait(7)
				end
				local deposit = GetOnscreenKeyboardResult()
				if ( deposit ~= nil ) then
					deposit = tonumber(deposit)
					if deposit ~= '' and deposit >= 0  then 
						whileGoSubMenuAccount = false
						TriggerServerEvent("m7_mafias:depositMoney", deposit, Config.Orgs[getGangID()].Society)
						menu.close()
					end
				end
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent('m7_mafias:openBossActionMembersMenu')
AddEventHandler('m7_mafias:openBossActionMembersMenu', function(members,grades)
	if myGangId ~= nil and activeGangs[myGangId] ~= nil then
		openMembersMenu(members, grades)
	end
end)
	
function openMembersMenu(members, grades)
	--[[memberMenu = nil
	collectgarbage()
		
	memberMenu = RageUI.CreateMenu(_U('employee_list'), _U('employee_list'))
	memberMenu:DisplayGlare(true)
	memberMenu:DisplayPageCounter(true)
	memberMenu.EnableMouse = false
	
	for _key, member in pairs(members) do
		memberSubMenu[_key] = RageUI.CreateSubMenu(memberMenu , _U('employee_management'), member.name)
		memberSubMenu[_key]:DisplayGlare(true)
		memberSubMenu[_key]:DisplayPageCounter(true)
	end
				
	Citizen.CreateThread(function()
		local whileGoGrade = true 
		while whileGoGrade do
			Citizen.Wait(1.0)
			memberMenu.Closed = function()
				whileGoGrade = false
			end
			RageUI.IsVisible(memberMenu, function()
					local numberOfCanGet = activeGangs[myGangId].slotPlayer
					local numberOfMember = #members
					RageUI.Separator(_U('number_of_player',numberOfMember ,numberOfCanGet ));
					RageUI.Button( _U('add_new_member'), '' , {}, ( numberOfMember >=  numberOfCanGet and false or true ), {
						onSelected = function()
							if numberOfMember <  numberOfCanGet then
								AddTextEntry('playerID', _U('playerID'))
								DisplayOnscreenKeyboard(1, "playerID", "", "" , "", "", "", 16)
								while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
									Citizen.Wait(7)
								end
								local playerID = GetOnscreenKeyboardResult()
								if ( playerID ~= nil ) then
									playerID = string.gsub(playerID, "^%s*(.-)%s*$", "%1")
									if playerID ~= ''  then 
										local id = GetPlayerFromServerId(tonumber(playerID))
										if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId()  and #(GetEntityCoords(GetPlayerPed(id)) - GetEntityCoords(PlayerPedId())) < 20 then
											openGradeMenuForAddMember(grades,tonumber(playerID))
										else
											TriggerEvent('m7_mafias:sendNotfication','[Mafia]', ''  , _U('inCorrectId') , 'CHAR_SOCIAL_CLUB' , 2 )
										end	
									end
								end
							end
						end,
					});
					RageUI.Separator(_U('employee_list' ));
				for _key, member in pairs(members) do
					RageUI.Button(member.name, _U('edit_player'), {}, true, {
						onSelected = function()
							openMemberSubMenu(grades,member,members,_key)
						end,
					},memberSubMenu[_key]);
				end
			end, function() end)
		end
	end)
	RageUI.Visible(memberMenu, not RageUI.Visible(memberMenu))]]

	local numberOfCanGet = activeGangs[myGangId].slotPlayer
	local numberOfMember = #members

	local elements = {{ label = '-- Número de miembros ' .. numberOfMember .. '/' .. numberOfCanGet .. ' --', value = '-' },{ label = _U('add_new_member'), value = 'add_new_member' },{ label = '-- Miembros --', value = '-' }}

	for _key, member in pairs(members) do
		table.insert(elements, { label = member.name, value = _key })
		memberSubMenu[_key] = member
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'employee_list',
		{
			title    = _U('employee_list'),
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)		
			if data.current.value == 'add_new_member' then
				if numberOfMember <  numberOfCanGet then
					AddTextEntry('playerID', _U('playerID'))
					DisplayOnscreenKeyboard(1, "playerID", "", "" , "", "", "", 16)
					while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
						Citizen.Wait(7)
					end
					local playerID = GetOnscreenKeyboardResult()
					if ( playerID ~= nil ) then
						playerID = string.gsub(playerID, "^%s*(.-)%s*$", "%1")
						if playerID ~= ''  then 
							local id = GetPlayerFromServerId(tonumber(playerID))
							if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId()  and #(GetEntityCoords(GetPlayerPed(id)) - GetEntityCoords(PlayerPedId())) < 20 then
								openGradeMenuForAddMember(grades,tonumber(playerID))
							else
								TriggerEvent('m7_mafias:sendNotfication','[Mafia]', ''  , _U('inCorrectId') , 'CHAR_SOCIAL_CLUB' , 2 )
							end	
						end
					end
				end
			else
				openMemberSubMenu(grades, memberSubMenu[data.current.value], members, data.current.value)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function openGradeMenuForAddMember(grades,playerId)
	gradeMenu = nil
	collectgarbage()
		
	gradeMenu = RageUI.CreateMenu(_U('grade'), _U('grade'))
	gradeMenu:DisplayGlare(true)
	gradeMenu:DisplayPageCounter(true)
	gradeMenu.EnableMouse = false
				
	Citizen.CreateThread(function()
		local whileGoGradeAdd = true 
		while whileGoGradeAdd do
			Citizen.Wait(1.0)
			gradeMenu.Closed = function()
				whileGoGradeAdd = false
			end
			RageUI.IsVisible(gradeMenu, function()
				for _key, grade in pairs(grades) do
					RageUI.Button(grade.name, _U('edit_grade'), {}, true, {
						onSelected = function()
							whileGoGradeAdd = false
							TriggerServerEvent("m7_mafias:addNewMember", grade.grade , playerId )
						end,
					});
				end
			end, function() end)
		end
	end)
	RageUI.Visible(gradeMenu, not RageUI.Visible(gradeMenu))
end
function openMemberSubMenu(grades,member,members,_key)
	--[[Citizen.CreateThread(function()
		local whileGoSubMenuMember = true
		while whileGoSubMenuMember do
			Citizen.Wait(1.0)
			RageUI.IsVisible(memberSubMenu[_key], function()
				RageUI.Button(_U('fire') , '', {}, true, {
					onSelected = function()
						whileGoSubMenuMember = false
						RageUI.Visible(memberSubMenu[_key], false)
						TriggerServerEvent("m7_mafias:deleteMemberFromGang", member.playerIdentifiers  )
					end,
				});
				RageUI.Separator(_U('grade' ));
				for _key, grade in pairs(grades) do
					RageUI.Button(grade.name, '', {}, true, {
						onSelected = function()
							whileGoSubMenuMember = false
							TriggerServerEvent("m7_mafias:changeGradeMemberFromGang", member.playerIdentifiers , grade.grade )
						end,
					});
				end
			end, function() end)
		end
	end)]]

	local elements = {{ label = '-- Acción --', value = '-' }, { label = _U('fire'), value = 'fire' },{ label = '-- Dar rango --', value = '-' }}

	for _key, grade in pairs(grades) do
		table.insert(elements, { label = grade.name, value = _key })
		gradeSubMenu[_key] = grade
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'edit_player',
		{
			title    = _U('edit_player'),
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)		
			if data.current.value == 'fire' then
				TriggerServerEvent("m7_mafias:deleteMemberFromGang", member.playerIdentifiers)
			else
				TriggerServerEvent("m7_mafias:changeGradeMemberFromGang", member.playerIdentifiers , gradeSubMenu[data.current.value].grade)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end











RegisterNetEvent('m7_mafias:openBossActionGradeMenu')
AddEventHandler('m7_mafias:openBossActionGradeMenu', function(grades)
	if myGangId ~= nil and activeGangs[myGangId] ~= nil then
		openGradeMenu(grades)
	end
end)
	
function openGradeMenu(grades)
	--[[gradeMenu = nil
	collectgarbage()
		
	gradeMenu = RageUI.CreateMenu(_U('ranks_management'), _U('ranks_management'))
	gradeMenu:DisplayGlare(true)
	gradeMenu:DisplayPageCounter(true)
	gradeMenu.EnableMouse = false
	
	for _key, grade in pairs(grades) do
		gradeSubMenu[_key] =  RageUI.CreateSubMenu(gradeMenu, grade.name , _U('ranks_management'))
		gradeSubMenu[_key]:DisplayGlare(true)
		gradeSubMenu[_key]:DisplayPageCounter(true)
	end
				
	Citizen.CreateThread(function()
		local whileGoGrade1 = true 
		while whileGoGrade1 do
			Citizen.Wait(1.0)
			gradeMenu.Closed = function()
				whileGoGrade1 = false
			end
			RageUI.IsVisible(gradeMenu, function()
					RageUI.Button( _U('add_new_grade'), '' , {}, true, {
						onSelected = function()
							Visual.Subtitle("onSelected", 100)
							AddTextEntry('enter_grade_name', _U('enter_grade_name'))
							DisplayOnscreenKeyboard(1, "enter_grade_name", "", "" , "", "", "", 16)
							while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
								Citizen.Wait(7)
							end
							local name = GetOnscreenKeyboardResult()
							if ( name ~= nil ) then
								name = string.gsub(name, "^%s*(.-)%s*$", "%1")
								if name ~= ''  then 
									whileGoGrade1 = false
									RageUI.Visible(gradeMenu, false)
									TriggerServerEvent("m7_mafias:creatNewGrade", name )
								end
							end
						end,
					});
				for _key, grade in pairs(grades) do
					RageUI.Button(grade.name, _U('edit_grade'), {}, true, {
						onSelected = function()
							openGradeSubMenu(grade,_key)
						end,
					},gradeSubMenu[_key]);
				end
			end, function() end)
		end
	end)
	RageUI.Visible(gradeMenu, not RageUI.Visible(gradeMenu))]]


	local elements = {{ label = '-- Añadir --', value = '-' },{ label = _U('add_new_grade'), value = 'add_new_grade' },{ label = '-- Rangos --', value = '-' }}

	for _key, grade in pairs(grades) do
		table.insert(elements, { label = grade.name, value = _key })
		gradeSubMenu[_key] = grade
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'ranks_management',
		{
			title    = _U('ranks_management'),
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)		
			if data.current.value == 'add_new_grade' then
				AddTextEntry('enter_grade_name', _U('enter_grade_name'))
				DisplayOnscreenKeyboard(1, "enter_grade_name", "", "" , "", "", "", 16)
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait(7)
				end
				local name = GetOnscreenKeyboardResult()
				if ( name ~= nil ) then
					name = string.gsub(name, "^%s*(.-)%s*$", "%1")
					if name ~= ''  then 
						whileGoGrade1 = false
						TriggerServerEvent("m7_mafias:creatNewGrade", name )
					end
				end
			else
				openGradeSubMenu(gradeSubMenu[data.current.value], data.current.value)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)


end

function openGradeSubMenu(grade,_key)
	--[[Citizen.CreateThread(function()
		local whileGoSubMenuGrade = true
		while whileGoSubMenuGrade do
			Citizen.Wait(1.0)
			RageUI.IsVisible(gradeSubMenu[_key], function()
				RageUI.Button(_U('echo_grade_name' , grade.name) , _U('edit_grade_name'), {}, true, {
					onSelected = function()
						AddTextEntry('enter_grade_name', _U('enter_grade_name'))
						DisplayOnscreenKeyboard(1, "enter_grade_name", "", "" , "", "", "", 16)
						while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
							Citizen.Wait(7)
						end
						local name = GetOnscreenKeyboardResult()
						if ( name ~= nil ) then
							name = string.gsub(name, "^%s*(.-)%s*$", "%1")
							if name ~= ''  then 
								whileGoSubMenuGrade = false
								TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'name' , name )
								Citizen.Wait(50)
								grade.name = name
								openGradeSubMenu(grade,_key )
							end
						end
					end,
				});
				RageUI.Button(_U('echo_grade_salary' , grade.salary) , _U('edit_grade_salary'), {}, true, {
					onSelected = function()
						AddTextEntry('enter_grade_salary', _U('enter_grade_salary'))
						DisplayOnscreenKeyboard(1, "enter_grade_salary", "", grade.accountMoney , "", "", "", 16)
						while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
							Citizen.Wait(7)
						end
						local accountMoney = GetOnscreenKeyboardResult()
						if ( accountMoney ~= nil ) then
							accountMoney = tonumber(accountMoney)
							if accountMoney ~= '' and accountMoney >= 0  then 
								whileGoSubMenuGrade = false
								TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId  , 'salary' , accountMoney )
								Citizen.Wait(50)
								grade.salary = accountMoney
								openGradeSubMenu(grade,_key )
							end
						end
					end,
				});
				RageUI.Checkbox(_U('access_vehicle' ), _U('access_vehicle_help' ),  (grade.accessVehicle  and  true or  false  ), {}, {
					onChecked = function()
						whileGoSubMenuGrade = false
						RageUI.Visible(gradeSubMenu[_key], false)
						TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'accessVehicle' , '1' )
						Citizen.Wait(50)
						grade.accessVehicle = true
						RageUI.Visible(gradeSubMenu[_key], true)
						openGradeSubMenu(grade,_key )
					end,
					onUnChecked = function()
						whileGoSubMenuGrade = false
						RageUI.Visible(gradeSubMenu[_key], false)
						TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'accessVehicle' , '0' )
						Citizen.Wait(50)
						grade.accessVehicle = false
						RageUI.Visible(gradeSubMenu[_key], true)
						openGradeSubMenu(grade,_key )
					end,
					onSelected = function() end,
				});
				RageUI.Checkbox(_U('access_armory' ), _U('access_armory_help' ),  (grade.accessArmory and  true or  false  ), {}, {
					onChecked = function()
						whileGoSubMenuGrade = false
						RageUI.Visible(gradeSubMenu[_key], false)
						TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'accessArmory' , '1' )
						Citizen.Wait(50)
						grade.accessArmory = true
						RageUI.Visible(gradeSubMenu[_key], true)
						openGradeSubMenu(grade,_key )
					end,
					onUnChecked = function()
						whileGoSubMenuGrade = false
						RageUI.Visible(gradeSubMenu[_key], false)
						TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'accessArmory' , '0' )
						Citizen.Wait(50)
						grade.accessArmory = false
						RageUI.Visible(gradeSubMenu[_key], true)
						openGradeSubMenu(grade,_key )
					end,
					onSelected = function() end,
				});
				RageUI.Button(_U('set_male_skin') , _U('set_male_skin_help'), {}, true, {
					onSelected = function()
						TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'maleSkin' , json.encode(getPlayerSkin()) )		
					end,
				});
				RageUI.Button(_U('set_female_skin') , _U('set_female_skin_help'), {}, true, {
					onSelected = function()
						TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'femaleSkin' , json.encode(getPlayerSkin()) )		
					end,
				});
			end, function() end)
		end
	end)]]

	local yes_no = {{ label = 'Si', value = 'yes' },{ label = 'No', value = 'no' }}

	if grade.accessVehicle then
		curr_val1 = 'Si'
	else
		curr_val1 = 'No'
	end
	if grade.accessArmory then
		curr_val2 = 'Si'
	else
		curr_val2 = 'No'
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'ranks_management',
		{
			title    = 'Modificar ' .. grade.name,
			align    = 'bottom-right',
			elements = {
				{ label = _U('edit_grade_name'), value = 'edit_grade_name' },
				--{ label = _U('edit_grade_salary'), value = 'edit_grade_salary' },
				{ label = _U('access_vehicle') .. ' <span style="color:green;">' .. curr_val1 .. '</span>', value = 'access_vehicle' },
				{ label = _U('access_armory') .. ' <span style="color:green;">' .. curr_val2 .. '</span>', value = 'access_armory' },
				{ label = _U('set_male_skin'), value = 'set_male_skin' },
				{ label = _U('set_female_skin'), value = 'set_female_skin' }
			}
		},
		function(data, menu)		
			if data.current.value == 'edit_grade_name' then
				AddTextEntry('enter_grade_name', _U('enter_grade_name'))
				DisplayOnscreenKeyboard(1, "enter_grade_name", "", "" , "", "", "", 16)
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait(7)
				end
				local name = GetOnscreenKeyboardResult()
				if ( name ~= nil ) then
					name = string.gsub(name, "^%s*(.-)%s*$", "%1")
					if name ~= ''  then 
						whileGoSubMenuGrade = false
						TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'name' , name )
						Citizen.Wait(50)
						grade.name = name
						openGradeSubMenu(grade,_key )
					end
				end
			elseif data.current.value == 'access_vehicle' then
				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'access_vehicle',
					{
						title    = _U('access_vehicle'),
						align    = 'bottom-right',
						elements = yes_no
					},
					function(data2, menu2)		
						if data2.current.value == 'yes' then
							TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'accessVehicle' , '1' )
						elseif data2.current.value == 'no' then
							TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'accessVehicle' , '0' )
						end
						menu2.close()
					end,
					function(data2, menu2)
						menu2.close()
					end
				)
			elseif data.current.value == 'access_armory' then
				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'access_armory',
					{
						title    = _U('access_armory'),
						align    = 'bottom-right',
						elements = yes_no
					},
					function(data2, menu2)		
						if data2.current.value == 'yes' then
							TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'accessArmory' , '1' )
						elseif data2.current.value == 'no' then
							TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'accessArmory' , '0' )
						end
						menu2.close()
					end,
					function(data2, menu2)
						menu2.close()
					end
				)
			elseif data.current.value == 'set_male_skin' then
				TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'maleSkin' , json.encode(getPlayerSkin()) )
			elseif data.current.value == 'set_female_skin' then
				TriggerServerEvent("m7_mafias:updateGradeData", grade.gradeId , 'femaleSkin' , json.encode(getPlayerSkin()) )
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent('m7_mafias:toggleMenu_locker')
AddEventHandler('m7_mafias:toggleMenu_locker', function()
	if myGangId ~= nil and activeGangs[myGangId] ~= nil then
		openlockerMenu()
	end
end)

RegisterNetEvent('m7_mafias:wearGang')
AddEventHandler('m7_mafias:wearGang', function(cloths)
	local allCloths = {}
	if isPlayerPedMale() then
		allCloths = json.decode(cloths.maleSkin)
	else
		allCloths = json.decode(cloths.femaleSkin)
	end
	local playerPed = PlayerPedId()
	SetPedArmour(playerPed, 0 )
	ClearPedProp(playerPed, 9 )	
	for _key, cloth in pairs(allCloths) do
		
		if cloth.d == -1 then
			ClearPedProp(playerPed, cloth.c )
		else
			if cloth.d  and 	cloth.t and 	cloth.t >= 0 and cloth.d >= 0 then
				SetPedComponentVariation(playerPed, cloth.c , cloth.d ,	cloth.t , 2)
			end
		end
	end
	SetPedComponentVariation(playerPed, 9 , 0 ,	0 , 2)
end)

--[[function openlockerMenu() 
	lockerMenu = nil
	collectgarbage()
	lockerMenu = RageUI.CreateMenu(_U('locker_room'), _U('locker_room'))
	lockerMenu:DisplayGlare(true)
	lockerMenu:DisplayPageCounter(true)
	lockerMenu.EnableMouse = false
	
	Citizen.CreateThread(function()
		local whileGoCloths = true 
		while whileGoCloths do
			Citizen.Wait(1.0)
			lockerMenu.Closed = function()
				whileGoCloths = false
			end
			RageUI.IsVisible(lockerMenu, function()
				RageUI.Button( _U('citizen_wear'), '' , {}, true, {
					onSelected = function()
						local playerPed = PlayerPedId()
						SetPedArmour(playerPed, 0 )
						ClearPedProp(playerPed, 9 )
						citizenWear()
					end,
				});
				RageUI.Button( _U('gang_wear'),'' , {}, true, {
					onSelected = function()
						local playerPed = PlayerPedId()
						TriggerServerEvent("m7_mafias:wearGang")	
						SetPedArmour(playerPed, 0 )
						ClearPedProp(playerPed, 9 )	
					end,
				});
				if activeGangs[myGangId].maxArmor > 0 then
					RageUI.Button( _U('Bulletproof'), '' , {}, true, {
						onSelected = function()
							local playerPed = PlayerPedId()
							SetPedArmour(playerPed, activeGangs[myGangId].maxArmor )
							SetPedComponentVariation(playerPed, 9 , Config.Bulletproof.typeNumber , Config.Bulletproof.colorNumber , 2)
							Citizen.CreateThread(function()
								local playerPed = PlayerPedId()
								while GetPedArmour(playerPed) > 0 do
									Citizen.Wait(1000)
								end
								ClearPedProp(playerPed, 9 )
								SetPedComponentVariation(playerPed, 9 , 0 ,	0 , 2)
							end)
						end,
					});
				end
			end, function() end)
		end
	end)
	RageUI.Visible(lockerMenu, not RageUI.Visible(lockerMenu))
end]]

function openlockerMenu() 

	local elements = {
		{label = _U('citizen_wear'), value = 'citizen_wear'},
		{label = _U('gang_wear'), value = 'gang_wear'}
	}

	if activeGangs[myGangId].maxArmor > 0 then
		table.insert(elements, {label = _U('Bulletproof'), value = 'put_bulletproof'})
	end
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'locker_room',
		{
			title    = _U('locker_room'),
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			local playerPed = PlayerPedId()
			if data.current.value == 'citizen_wear' then
				SetPedArmour(playerPed, 0 )
				ClearPedProp(playerPed, 9 )
				citizenWear()
			elseif data.current.value == 'gang_wear' then
				TriggerServerEvent("m7_mafias:wearGang")	
				SetPedArmour(playerPed, 0 )
				ClearPedProp(playerPed, 9 )
			else
				SetPedArmour(playerPed, activeGangs[myGangId].maxArmor )
				SetPedComponentVariation(playerPed, 9 , Config.Bulletproof.typeNumber , Config.Bulletproof.colorNumber , 2)
				Citizen.CreateThread(function()
					while GetPedArmour(playerPed) > 0 do
						Citizen.Wait(1000)
					end
					ClearPedProp(playerPed, 9 )
					SetPedComponentVariation(playerPed, 9 , 0 ,	0 , 2)
				end)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent('m7_mafias:toggleMenu_armory')
AddEventHandler('m7_mafias:toggleMenu_armory', function()
	if myGangId ~= nil and activeGangs[myGangId] ~= nil then

		--[[local armoryMenu = RageUI.CreateMenu(_U('armory'), _U('armory'))
		armoryMenu:DisplayGlare(true)
		armoryMenu:DisplayPageCounter(true)
		armoryMenu.EnableMouse = false
		Citizen.CreateThread(function()
			local whileGoArmoryMenu = true 
			while whileGoArmoryMenu do
				Citizen.Wait(1.0)
				armoryMenu.Closed = function()
					whileGoArmoryMenu = false
				end
				RageUI.IsVisible(armoryMenu, function()
					RageUI.Button( _U('armory_deposit'), '' , {}, true, {
						onSelected = function()
							whileGoArmoryMenu = false
							RageUI.Visible(armoryMenu, false)
							TriggerServerEvent("m7_mafias:armory_deposit")
						end,
					});
					RageUI.Button( _U('armory_withdraw'),'' , {}, true, {
						onSelected = function()
							whileGoArmoryMenu = false
							RageUI.Visible(armoryMenu, false)
							TriggerServerEvent("m7_mafias:armory_withdraw")
						end,
					});
				end, function() end)
			end
		end)
		RageUI.Visible(armoryMenu, not RageUI.Visible(armoryMenu))]]
		local elements = {
		
			{label = _U('buy_weapons'),  value = 'buy_weapons'},
		}

		local society_name = Config.Orgs[getGangID()].Society
	
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
					OpenGetWeaponMenu(society_name)
				elseif data.current.value == 'put_weapon' then
					OpenPutWeaponMenu(society_name)
				elseif data.current.value == 'put_stock' then
					OpenPutStocksMenu(society_name)
				elseif data.current.value == 'get_stock' then
					OpenGetStocksMenu(society_name)
				elseif data.current.value == 'buy_weapons' then
					OpenBuyWeaponMenu()
				end
			end,
			function(data, menu)
		
				menu.close()
		
			end
		)
	end
end)

function OpenGetWeaponMenu(society_name)

	ESX.TriggerServerCallback('m7_mafias:getArmoryWeapons', function(weapons)
  
	  local elements = {}
  
	  	for i=1, #weapons, 1 do
			local weapon = weapons[i]
  
			if weapon.count > 0 then
			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name) .. ' [' .. weapon.count .. ']',
				value = weapon.name,
			})
			end
		end
  
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'get_weapon',
			{
			title    = _U('get_weapon'),
			align    = 'bottom-right',
			elements = elements,
			},
			function(data, menu)
	
			menu.close()
	
			ESX.TriggerServerCallback('m7_mafias:removeArmoryWeapon', function()
				ESX.SetTimeout(300, function()
				OpenGetWeaponMenu(society_name)
				end)
			end, data.current.value, society_name)
	
			end,
			function(data, menu)
			menu.close()
			end
		)
	
	end, society_name)
  
end

function OpenPutWeaponMenu(society_name)

	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()
  
	for i=1, #weaponList, 1 do
	  local weaponHash = GetHashKey(weaponList[i].name)
	  if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
		local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
		table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
	  end
	end
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'put_weapon',
	  {
		title    = _U('put_weapon'),
		align    = 'bottom-right',
		elements = elements,
	  },
	  function(data, menu)
  
		menu.close()
  
		ESX.TriggerServerCallback('m7_mafias:addArmoryWeapon', function()
		  OpenPutWeaponMenu(society_name)
		end, data.current.value, society_name)
  
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  
end
  
function OpenGetStocksMenu(society_name)
	ESX.TriggerServerCallback('m7_mafias:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			if items[i].count > 0 then
				table.insert(elements, {label = ('x%s %s'):format(items[i].count, items[i].label), value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_object', {
			title    = _U('remove_object'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('m7_mafias:getStockItem', itemName, count, society_name)

					Citizen.Wait(300)
					OpenGetStocksMenu(society_name)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, society_name)
end
  
function OpenBuyWeaponMenu()
	local elements = {}

	local gangid = getGangID()

	if Config.Orgs[gangid].Shop.Weapons then
		for i=1, #Config.Orgs[gangid].Shop.Weapons, 1 do
			local weapon = Config.Orgs[gangid].Shop.Weapons[i]
			table.insert(elements, {label = ('%s - <span style="color:green;"> $ %s</span>'):format(ESX.GetWeaponLabel(weapon.name), ESX.Math.GroupDigits(weapon.price)), value = weapon.name, price = weapon.price, type = 'w'})
		end
	end
	for i=1, #Config.Orgs[gangid].Shop.Items, 1 do
		local item = Config.Orgs[gangid].Shop.Items[i]
		table.insert(elements, {label = ('%s - <span style="color:green;"> $ %s</span>'):format(item.name, ESX.Math.GroupDigits(item.price)), value = item.item, price = item.price, type = 'i'})
	end		
  
	ESX.UI.Menu.CloseAll()
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'armory',
	  {
		title    = 'Compra de objetos',
		align    = 'bottom-right',
		elements = elements,
	  },
	  function(data, menu)
		local i_or_w = data.current.value
		local price = data.current.price
		if data.current.type == 'w' then
 			TriggerServerEvent('m7_mafias:giveWeapon', i_or_w, price)
			menu.close()
		else
			TriggerServerEvent('m7_mafias:giveItem', i_or_w, price)
		end
	  end,
	  function(data, menu)
  
		menu.close()

	  end
	)
end
  
function OpenPutStocksMenu(society_name)
	ESX.TriggerServerCallback('m7_mafias:getPlayerInventory', function(inventory)
		local elements = {}

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = _U('dirty_money', ESX.Math.GroupDigits(inventory.blackMoney)),
				type  = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'deposit_object', {
				title    = _U('deposit_object'),
				align    = 'bottom-right',
				elements = elements
			}, function(data, menu)
				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
					title = _U('quantity')
				}, function(data2, menu2)
					local count = tonumber(data2.value)

					if not count then
						ESX.ShowNotification(_U('quantity_invalid'))
					else
						menu2.close()
						menu.close()
						TriggerServerEvent('m7_mafias:putStockItems', itemName, count, data.current.type, society_name)

						Citizen.Wait(300)
						OpenPutStocksMenu(society_name)
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			end, function(data, menu)
				menu.close()
		end)
	end)
end


--[[RegisterNetEvent('m7_mafias:armory_deposit_open')
AddEventHandler('m7_mafias:armory_deposit_open', function(inventois)
	if myGangId ~= nil and activeGangs[myGangId] ~= nil then

		local depositMenu = RageUI.CreateMenu(_U('armory_deposit'), _U('armory_deposit'))
		depositMenu:DisplayGlare(true)
		depositMenu:DisplayPageCounter(true)
		depositMenu.EnableMouse = false
		Citizen.CreateThread(function()
			local whileGodepositMenu = true 
			while whileGodepositMenu do
				Citizen.Wait(1.0)
				depositMenu.Closed = function()
					whileGodepositMenu = false
				end
				RageUI.IsVisible(depositMenu, function()
					local typeItem = nil
					for _key, inventory in pairs(inventois) do
						if typeItem ~= inventory.itemType then
							RageUI.Separator(_U('list_of_'..inventory.itemType ))
							typeItem = inventory.itemType
						end
						RageUI.Button(inventory.label .. inventory.amount , _U('armory_deposit_help'), {}, true, {
							onSelected = function()
								if inventory.itemType ~= 'weapon' then
									AddTextEntry('deposit_amount', _U('deposit_amount'))
									DisplayOnscreenKeyboard(1, "deposit_amount", "", "" , "", "", "", 16)
									while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
										Citizen.Wait(7)
									end
									local number = GetOnscreenKeyboardResult()
									if ( number ~= nil ) then
										number = string.gsub(number, "^%s*(.-)%s*$", "%1")
										if number ~= ''  then 
											number = tonumber(number)
											if number <= inventory.amount then
												whileGodepositMenu = false
												RageUI.Visible(depositMenu, false)
												TriggerServerEvent("m7_mafias:armory_depositing" , inventory , number )
												Citizen.Wait(500)
												TriggerServerEvent("m7_mafias:armory_deposit")
											else
												TriggerEvent('m7_mafias:sendNotfication','[Mafia]', ''  , _U('invalid_amount') , 'CHAR_SOCIAL_CLUB' , 2 )
											end	
										end
									end
								else
									whileGodepositMenu = false
									RageUI.Visible(depositMenu, false)
									TriggerServerEvent("m7_mafias:armory_depositing" , inventory , inventory.amount )
									Citizen.Wait(500)
									TriggerServerEvent("m7_mafias:armory_deposit")
								end
							end,
						});
					end
				end, function() end)
			end
		end)
		RageUI.Visible(depositMenu, not RageUI.Visible(depositMenu))
	end
end)

RegisterNetEvent('m7_mafias:armory_withdraw_open')
AddEventHandler('m7_mafias:armory_withdraw_open', function(inventois)
	if myGangId ~= nil and activeGangs[myGangId] ~= nil then

		local withdrawMenu = RageUI.CreateMenu(_U('armory_withdraw'), _U('armory_withdraw'))
		withdrawMenu:DisplayGlare(true)
		withdrawMenu:DisplayPageCounter(true)
		withdrawMenu.EnableMouse = false
		
		local allItemType = {'account' , 'weapon' , 'item'}
		local allItemsSorted = {}
		for k, ItemType in pairs(allItemType) do
			for _key, inventoy in pairs(inventois) do
				if ( inventoy.itemType == ItemType ) then	
					table.insert(allItemsSorted,inventoy)
					--table.remove(inventois,_key)
				end
			end
		end
		Citizen.CreateThread(function()
			local whileGoWithdrawMenu = true 
			while whileGoWithdrawMenu do
				Citizen.Wait(1.0)
				withdrawMenu.Closed = function()
					whileGoWithdrawMenu = false
				end
				RageUI.IsVisible(withdrawMenu, function()
					local typeItem = nil
					for _key, inventoy in pairs(allItemsSorted) do
						if typeItem ~= inventoy.itemType then
							RageUI.Separator(_U('list_of_'..inventoy.itemType ))
							typeItem = inventoy.itemType
						end
						RageUI.Button(inventoy.label .. inventoy.amount , _U('armory_withdraw_help'), {}, true, {
							onSelected = function()
								if inventoy.itemType ~= 'weapon' then
									AddTextEntry('withdraw_amount', _U('withdraw_amount'))
									DisplayOnscreenKeyboard(1, "withdraw_amount", "", "" , "", "", "", 16)
									while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
										Citizen.Wait(7)
									end
									local number = GetOnscreenKeyboardResult()
									if ( number ~= nil ) then
										number = string.gsub(number, "^%s*(.-)%s*$", "%1")
										if number ~= ''  then 
											number = tonumber(number)
											if number <= inventoy.amount then
												whileGoWithdrawMenu = false
												RageUI.Visible(withdrawMenu, false)
												TriggerServerEvent("m7_mafias:armory_withdrawing" , inventoy , number )
												Citizen.Wait(500)
												TriggerServerEvent("m7_mafias:armory_withdraw")
											else
												TriggerEvent('m7_mafias:sendNotfication','[Mafia]', ''  , _U('invalid_amount') , 'CHAR_SOCIAL_CLUB' , 2 )
											end	
										end
									end
								else
									whileGoWithdrawMenu = false
									RageUI.Visible(withdrawMenu, false)
									TriggerServerEvent("m7_mafias:armory_withdrawing" , inventoy , inventoy.amount )
									Citizen.Wait(500)
									TriggerServerEvent("m7_mafias:armory_withdraw")
								end
							end,
						});
					end
				end, function() end)
			end
		end)
		RageUI.Visible(withdrawMenu, not RageUI.Visible(withdrawMenu))
	end
end)]]
