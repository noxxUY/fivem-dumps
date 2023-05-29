local bossMenu = nil
local subMenu = {}
local gradeMenu = nil
local gradeSubMenu = {}
local memberMenu = nil
local memberSubMenu = {}
local lockerMenu = nil
local i = 0
local enZonaSegura = false

AddEventHandler('nui:on', function() enZonaSegura = true end)
AddEventHandler('nui:off', function() enZonaSegura = false end)

RegisterNetEvent('Erfan:gang:toggleMenu_boss')
AddEventHandler('Erfan:gang:toggleMenu_boss', function()
	if myGangId ~= nil and activeGangs[myGangId] ~= nil and myGangGrade == 0 then
		--openBossMenu()
		abroMenuJefe()
		--AbrirRetirarArma()
	end
end)

function abroMenuJefe()

	ESX.UI.Menu.CloseAll() -- We close all the menus that may be open and open a new one.
    ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'menu_jefe', -- Change menu name
    {
      title    = ('Menu Mafia | Jefe'),        -- Menu title
      align = 'top-left',                    -- Menu position
      elements ={
        -- {label = _U('money_management'), value = 'accion_dinero'}, --Example elements
        {label = _U('ranks_management'), value = 'manejar_rangos'},  --Example elements
		{label = _U('employee_list'), value = 'lista_miembros'}  --Example elements
		--{label = _U('edit_discord_webHook'), value = 'webhook'}  --Example elements
      } 
      
    },
    function(data, menu) -- This part contains the code that executes when you press enter
      if data.current.value  == 'accion_dinero' then -- This detects which element you have pressed
		abroMenuJefe()
		abroMenuPlata()
      end
      if data.current.value  == 'manejar_rangos' then
		TriggerServerEvent('Erfan:gang:getRanksOfmyGang')
		ESX.UI.Menu.CloseAll()
      end
	  if data.current.value  == 'lista_miembros' then
		TriggerServerEvent('Erfan:gang:getMembersOfmyGang')
		ESX.UI.Menu.CloseAll()
      end
	  --[[if data.current.value  == 'webhook' then
		TriggerEvent('Erfan:gang:sendNotfication','[Gang System]', ''  , _U('sendWebHookinChatBox') , 'CHAR_SOCIAL_CLUB' , 2 )
		ESX.UI.Menu.CloseAll()
      end]]
    end,
    function(data, menu)
        menu.close() -- Action when closing the menu 
    end
  )


end

function abroMenuPlata()

	--ESX.UI.Menu.CloseAll() -- We close all the menus that may be open and open a new one.
    ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'menu_plata', -- Change menu name
    {
      title    = ('Menu Jefe | Banco'),        -- Menu title
      align = 'top-left',                    -- Menu position
      elements ={
		{label = 'Dinero en Cuenta: <span style="color:green;">$'..activeGangs[myGangId].accountMoney..'</span> ', value = ''},
        {label = _U('withdraw_money' ), value = 'accion_retiro'},
        {label = _U('deposit_money' ), value = 'accion_deposito'}
      } 
      
    },
    function(data, menu) -- This part contains the code that executes when you press enter
      if data.current.value  == 'accion_deposito' then -- This detects which element you have pressed


		ESX.UI.Menu.CloseAll()
		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'deposito_dinero', --Change menu name
		{
		  title = ('¿Cuanto querés depositar?')
		},
		function(data, menu2)
		  local amount = tonumber(data.value)
		  if amount == nil then
			exports['okokNotify']:Alert("SERVIDOR", 'Cantidad inválida', 3500, 'error')
		  else
			
			-- Here you put the function you want to perform.
			-- To take text values use: data.value 
			-- To take number values use: amount (declared above)
			menu2.close()
			abroMenuPlata()

			TriggerServerEvent("Erfan:gang:depositMoney", amount )
			
		  end
		end,
		function(data, menu)
		ESX.UI.Menu.CloseAll()
		abroMenuPlata()
	  end)


      end
      if data.current.value  == 'accion_retiro' then
          
		

		ESX.UI.Menu.CloseAll()
		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'retiro_dinero', --Change menu name
		{
		  title = ('¿Cuanto querés retirar?')
		},
		function(data, menu3)
		  local amount = tonumber(data.value)
		  if amount == nil then
			exports['okokNotify']:Alert("SERVIDOR", 'Cantidad inválida', 3500, 'error')
		  else

			TriggerServerEvent("Erfan:gang:withdrawMoney", amount )
			
			menu3.close()
			abroMenuPlata()
		  end
		end,
		function(data, menu)
		ESX.UI.Menu.CloseAll()
		  abroMenuPlata()
	  end)




      end
    end,
    function(data, menu)
		ESX.UI.Menu.CloseAll()
		abroMenuJefe()
    end
  )

end

function openAccountMenu()
	Citizen.CreateThread(function()
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
								TriggerServerEvent("Erfan:gang:withdrawMoney", withdraw )
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
								TriggerServerEvent("Erfan:gang:depositMoney", deposit )
								Citizen.Wait(50)
								openAccountMenu()
							end
						end
					end,
				});
			end, function() end)
		end
	end)
end


RegisterNetEvent('Erfan:gang:openBossActionMembersMenu')
AddEventHandler('Erfan:gang:openBossActionMembersMenu', function(members,grades)
	if myGangId ~= nil and activeGangs[myGangId] ~= nil then
		openMembersMenu(members,grades)
	end
end)
	
function openMembersMenu(members,grades)
	memberMenu = nil
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
											TriggerEvent('Erfan:gang:sendNotfication','[Gang System]', ''  , _U('inCorrectId') , 'CHAR_SOCIAL_CLUB' , 2 )
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
	RageUI.Visible(memberMenu, not RageUI.Visible(memberMenu))
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
							TriggerServerEvent("Erfan:gang:addNewMember", grade.grade , playerId )
						end,
					});
				end
			end, function() end)
		end
	end)
	RageUI.Visible(gradeMenu, not RageUI.Visible(gradeMenu))
end


function openMemberSubMenu(grades,member,members,_key)
	Citizen.CreateThread(function()
		local whileGoSubMenuMember = true
		while whileGoSubMenuMember do
			Citizen.Wait(1.0)
			RageUI.IsVisible(memberSubMenu[_key], function()
				RageUI.Button(_U('fire') , '', {}, true, {
					onSelected = function()
						whileGoSubMenuMember = false
						RageUI.Visible(memberSubMenu[_key], false)
						TriggerServerEvent("Erfan:gang:deleteMemberFromGang", member.playerIdentifiers  )
					end,
				});
				RageUI.Separator(_U('grade' ));
				for _key, grade in pairs(grades) do
					RageUI.Button(grade.name, '', {}, true, {
						onSelected = function()
							whileGoSubMenuMember = false
							TriggerServerEvent("Erfan:gang:changeGradeMemberFromGang", member.playerIdentifiers , grade.grade )
						end,
					});
				end
			end, function() end)
		end
	end)
end



RegisterNetEvent('Erfan:gang:openBossActionGradeMenu')
AddEventHandler('Erfan:gang:openBossActionGradeMenu', function(grades)
	if myGangId ~= nil and activeGangs[myGangId] ~= nil then
		--openGradeMenu(grades)
		abrirMenuGrados(grades)
	end
end)

function abrirMenuGrados(grades)

	local elements = {}

	table.insert(elements, {label = '<span style="color: red;">ㅤㅤㅤㅤㅤㅤㅤㅤㅤ--====X====--</span>', value = ''})

	table.insert(elements, {label = '<span style="color: cyan;">ㅤㅤㅤㅤㅤㅤㅤㅤCrear nuevo rango</span>', name = 'crear_rango', value = 'crear_rango'})

	for k, grade in pairs(grades) do
		table.insert(elements, {label = ''..grade.name..'', aidi = grade.gradeId, name = grade.name, value = grade.name})
	end

	table.insert(elements, {label = '<span style="color: red;">ㅤㅤㅤㅤㅤㅤㅤㅤㅤ--====X====--</span>', value = ''})

	ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'inventario_armas', -- Change menu name
	{
	title    = ('Menu Jefe - Rangos'),        -- Menu title
	align = 'top-left',                    -- Menu position
	elements = elements
	
	},
	function(Armadata, Armamenu) -- This part contains the code that executes when you press enter
	if Armadata.current.value  == "crear_rango" then -- This detects which element you have pressed
		Armamenu.close()

		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'menu_crearRango', --Change menu name
		{
		  title = ('Nombre del rango')
		},
		function(dataCreoRango, menuCreoRango)
		  local amount = tonumber(dataCreoRango.value)
		  if dataCreoRango.value == nil then
			ESX.ShowNotification('Debes introducir un nombre válido')
		  else

			TriggerServerEvent("Erfan:gang:creatNewGrade", dataCreoRango.value )
			
			menuCreoRango.close()

			TriggerServerEvent('Erfan:gang:getRanksOfmyGang')
		  end
		end,
		function(dataCreoRango, menuCreoRango)
		  menuCreoRango.close() -- Action when closing the menu 
		  TriggerServerEvent('Erfan:gang:getRanksOfmyGang')
	  end)

	end
	if Armadata.current.value  ~= nil and Armadata.current.value ~= "crear_rango" then -- This detects which element you have pressed
		Armamenu.close()
		for k,v in pairs(grades) do
			--openGradeSubMenu(grade,k)
			abrirMenuSubGrados(Armadata.current.aidi,Armadata.current.value,k,v)
		end
	end
	end,
	function(Armadata, Armamenu)
		Armamenu.close() -- Action when closing the menu 
		abroMenuJefe()
	end)

end
	
function openGradeMenu(grades)
	gradeMenu = nil
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
									TriggerServerEvent("Erfan:gang:creatNewGrade", name )
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
	RageUI.Visible(gradeMenu, not RageUI.Visible(gradeMenu))
end

function abrirMenuSubGrados(k,v)

local ID = k
local nombre = v


    ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'menuName', -- Change menu name
    {
      title    = ('Editar rango | [<span style="color: cyan;">'..nombre..'</span>]'),        -- Menu title
      align = 'top-left',                    -- Menu position
      elements ={
        {label = 'Cambiar nombre [📝​]', value = 'cambiar_nombre'}, --Example elements
        --{label = 'Editar salario [💸​]', value = 'edito_salario'},  --Example elements
		{label = 'Permitir inventario [​✔️​]', value = 'permitir_inv'},  --Example elements
		{label = 'Bloquear inventario [❌​​]', value = 'bloquear_inv'}  --Example elements
      } 
      
    },
    function(dataRangos, menuRangos) -- This part contains the code that executes when you press enter
      if dataRangos.current.value  == 'cambiar_nombre' then -- This detects which element you have pressed

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'menu_cambiarNombreRango', --Change menu name
				{
				title = ('Nuevo nombre del rango')
				},
				function(data, menu)
				local amount = tonumber(data.value)
				if data.value == nil then
					ESX.ShowNotification('Debes introducir un nombre válido')
				else

					TriggerServerEvent("Erfan:gang:updateGradeData", ID , 'name' , data.value )
					
					menu.close()
					menuRangos.close()
					Citizen.Wait(500)
					TriggerServerEvent('Erfan:gang:getRanksOfmyGang')
				end
				end,
				function(data, menu)
				menu.close() -- Action when closing the menu 
			end)

      end
      --[[if dataRangos.current.value  == 'edito_salario' then

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'menu_cambiarNombreRango', --Change menu name
				{
				title = ('Nuevo nombre del rango')
				},
				function(data, menu)
				local amount = tonumber(data.value)
				if amount == nil then
					ESX.ShowNotification('Debes introducir un salario válido')
				else

					TriggerServerEvent("Erfan:gang:updateGradeData", ID  , 'salary' , amount )
					
					menu.close()
					menuRangos.close()
					Citizen.Wait(500)
					TriggerServerEvent('Erfan:gang:getRanksOfmyGang')
				end
				end,
				function(data, menu)
				menu.close() -- Action when closing the menu 
			end)
      end]]
	  if dataRangos.current.value  == 'permitir_inv' then
		TriggerServerEvent("Erfan:gang:updateGradeData", ID, 'accessArmory', '1' )
      end
	  if dataRangos.current.value  == 'bloquear_inv' then
		TriggerServerEvent("Erfan:gang:updateGradeData", ID, 'accessArmory', '0' )
      end
    end,
    function(dataRangos, menuRangos)
        menuRangos.close() -- Action when closing the menu
		TriggerServerEvent('Erfan:gang:getRanksOfmyGang')
    end
  )

end


RegisterNetEvent('Erfan:gang:toggleMenu_locker')
AddEventHandler('Erfan:gang:toggleMenu_locker', function()
	if myGangId ~= nil and activeGangs[myGangId] ~= nil then
		abrirRopero()
	end
end)

RegisterNetEvent('Erfan:gang:wearGang')
AddEventHandler('Erfan:gang:wearGang', function(cloths)
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

function abrirRopero()


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

RegisterNetEvent('Erfan:gang:toggleMenu_armory')
AddEventHandler('Erfan:gang:toggleMenu_armory', function()

	local ox_inventory = exports.ox_inventory

	ESX.TriggerServerCallback("Homer:gang:veoInventario", function(acceso) 
		if not acceso then return ESX.ShowNotification("No tenes acceso a abrir el inventario", "error") end

		--[[if ox_inventory:openInventory('stash', myGangId) == false then
			TriggerServerEvent('ox:loadStashes')
			ox_inventory:openInventory('stash', 'mafia-'..myGangId..'-stash')
		end]]
	end, myGangId)

end)


