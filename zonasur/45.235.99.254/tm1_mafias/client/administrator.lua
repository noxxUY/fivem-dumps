-------------------
-----VARIABLES-----
-------------------
ESX                           = nil
local HasAlreadyEnteredMarker = false
local isInAGroup = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local enclosuressociedad = {}
local esposado = false

broyale = false
-------------------
------CITIZEN------
-------------------
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function HUD_(bool)
	ISMENUACTIVE = bool
end

function Esposado(bool)
	esposado = bool
end

local administratorLocal = {
	put = "Añadir personas al grupo",
	remove = "Expulsar personas al grupo",
	administrate = "Administrar miembros",
	titleSecondary = "Acciones de grupo",
	close = "Cerrar",
	title = "Administrador de grupo",
	accept = "Aceptar invitacion",
	unaccept = "Denegar invitacion",
	promoteTitle = "¿Que deseas hacer con ",
	promote = "Ascender",
	unpromote = "Degradar",
	removeGroup = "Eliminar grupo",
	yes = "Si",
	no = "No",
	removeGroupTitle = "¿Deseas eliminar el grupo ",
	errorRank = "No puedes expulsar a esa persona",
	exitGroup = "Salir del grupo",
	exitGroupQ = "¿Deseas salir del grupo?",
	noGroupSelected = "No estás en ningun grupo"
}

RegisterNetEvent("tm1_mafias:broyale")
AddEventHandler("tm1_mafias:broyale", function(bool)
	broyale = bool
end)

Citizen.CreateThread(function()
	local isOpen  = false
	while true do
		Citizen.Wait(0)
			if IsControlJustReleased(0, 246) and isOpen == false and group.rank then
				CurrentAction     = 'principalAdministratorGroup'
				isOpen  = true
				OpenShopMenuB()
			elseif IsControlJustReleased(0, 344) then
				if not(group.enclosure == nil) then
					if not broyale then
						ESX.TriggerServerCallback('tm1_mafias:getStockItems', function(inventory)
							OpenShopMenuC(inventory.blackMoney, inventory.money)
						end, 'society_'..group.enclosure)
					end
				--else
					--OpenShopMenuC(0)
				end
			elseif IsControlJustReleased(0, 246) and isOpen == true then
				CurrentAction = nil
				isOpen  = false
				ESX.UI.Menu.CloseAll()
			end
	end
end)

function OpenShopMenuB()
	local elements = {}
	
	if group.rank == 5 then
		elements = {
			{label = administratorLocal.put ,value = "put_person"},
			{label = administratorLocal.remove ,value = "remove_person"},
			{label = administratorLocal.administrate ,value = "group_administrate"},
			{label = administratorLocal.exitGroup ,value = "exit_group"},
			{label = administratorLocal.close ,value = "close"}
		}
	elseif group.rank == 6 then
		elements = {
			{label = administratorLocal.put ,value = "put_person"},
			{label = administratorLocal.remove ,value = "remove_person"},
			{label = administratorLocal.administrate ,value = "group_administrate"},
			{label = administratorLocal.removeGroup ,value = "remove_group"},
			{label = administratorLocal.close ,value = "close"}
		}
	else
		elements = {
			{label = administratorLocal.exitGroup ,value = "exit_group"},
			{label = administratorLocal.close ,value = "close"}
		}
	end
	
	


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = group.name,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "put_person" then
				OpenAddPeopleMenu(group.aprove, group.groupid, group.slot)
			elseif data.current.value == "remove_person" then
				if group.aprove == 2 then
					OpenRemovePeopleMenu()
				else
					ESX.ShowNotification('~r~PARA EXPULSAR A ALGUIEN DEBES PEDIR CK.')
				end
			elseif data.current.value == "group_administrate" then
				OpenAdministratePeopleMenu()
			elseif data.current.value == "remove_group" then
				ESX.ShowNotification('~r~NO PUEDES ELIMINAR LA ORG, DEBES PEDIR CK.')
				--OpenRemoveGroupMenu(group,"remove")
			elseif data.current.value == "exit_group" then
				ESX.ShowNotification('~r~NO PUEDES ABANDONAR, SOLICITA CK VIA TICKET.')
				--OpenRemoveGroupMenu(group,"exit")
			elseif data.current.value == "close" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenShopMenuC(blackMoney, money)
	local elements = {}

	if not(group.name == "") then
	--INFO
	if not(group.name == "") then
		table.insert(elements,{label = '<b><span style="color: red;">'..group.name..'</span></b>', value = 'title'})
	else
		table.insert(elements,{label = '<b><span style="color: red;">'..administratorLocal.noGroupSelected..'</span></b>', value = 'title'})
	end
	
	if not(group.enclosure == nil) then
		table.insert(elements,{label = '<span style="color: pink;">RADIO Nº: '..radios[group.enclosure]..'</span>', value = 'radio'})
	end
	
	if not(money == nil) then
		table.insert(elements,{label = '<span style="color: green;">DINERO : $ '..ESX.Math.GroupDigits(money)..'</span>', value = 'money'})
	end

	if not(blackMoney == nil) then
		table.insert(elements,{label = '<span style="color: red;">DINERO NEGRO : $ '..ESX.Math.GroupDigits(blackMoney)..'</span>', value = 'blackMoney'})
	end
	--[[
	if not(group.rank == nil) then
		table.insert(elements,{label = '<span style="color: cyan;">RANGO : '..rankLabel[group.rank]..'</span>', value = 'rank'})
	end

	if not(group.aprove == nil) then
		table.insert(elements,{label = '<span style="color: yellow;">PRESTIGIO : '..grouplabel[group.aprove]..'</span>', value = 'aprove'})
	end
	]]--
	
	--Acciones
	--table.insert(elements,{label = '<b><span style="color: white;">'..'ACCIONES'..'</span></b>', value = 'title'})
	if not(group.name == "") then
		if ISMENUACTIVE == true then
			table.insert(elements,{label = '<b><span style="color: white;">HUD : <span style="color: green;">'..'ON'..'</span></span></b>', value = 'info'})
		else
			table.insert(elements,{label = '<b><span style="color: white;">HUD : <span style="color: red;">'..'OFF'..'</span></span></b>', value = 'info'})
		end
	end


	--table.insert(elements,{label = '<b><span style="color: white;">'..'PRESTIGIO'..'</span></b>', value = 'title'})
	if not(group.name == "") then
		if group.aprove == 1 or group.aprove == 3 then
			table.insert(elements,{label = '<b><span style="color: white;">📡 Pedir refuerzo 📡'..'</span></b>', value = 'refuerzo'})
			table.insert(elements,{label = '<b><span style="color: white;">🔐 Esposar 🔐'..'</span></b>', value = 'hardcuff'})
			table.insert(elements,{label = '<b><span style="color: white;">🔑 Desesposar 🔑'..'</span></b>', value = 'uncuff'})
			table.insert(elements,{label = '<b><span style="color: white;">Mover o dejar de mover'..'</span></b>', value = 'move'})
			table.insert(elements,{label = '<b><span style="color: white;">Meter en el coche'..'</span></b>', value = 'putOn'})
			table.insert(elements,{label = '<b><span style="color: white;">Sacar del coche'..'</span></b>', value = 'putOff'})
			table.insert(elements,{label = '<b><span style="color: white;">Sacar DNI'..'</span></b>', value = 'dni'})
		else
			table.insert(elements,{label = '<b><span style="color: white;">No tienes suficiente prestigio'..'</span></b>', value = 'nop'})
		end
	end

	--table.insert(elements,{label = '<b><span style="color: white;">'..'------------------'..'</span></b>', value = 'title'})
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = administratorLocal.titleSecondary,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			local player, distance = ESX.Game.GetClosestPlayer()
			if data.current.value == "info" then
				ISMENUACTIVE = not ISMENUACTIVE
				menu.close()
			else
				if data.current.value == "radio" then
					TriggerEvent('rp-radio:Toggleorg', radios[group.enclosure])
					--exports["mumble-voip"]:SetRadioChannel(radios[group.enclosure])
				elseif data.current.value == 'refuerzo' then
					ESX.UI.Menu.CloseAll()
					TriggerServerEvent('tm1_mafias:refuerzo', GetEntityCoords(GetPlayerPed(PlayerId()), true), group.enclosure)	
				else
					if player ~= -1 and distance <= 3.0 then						
						if data.current.value == 'hardcuff' then
							--local target, distance = ESX.Game.GetClosestPlayer()	
							if not IsEntityDead(GetPlayerPed(player)) then	
								playerheading = GetEntityHeading(GetPlayerPed(-1))
								playerlocation = GetEntityForwardVector(PlayerPedId())
								playerCoords = GetEntityCoords(GetPlayerPed(-1))
								local target_id = GetPlayerServerId(player)
								TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'cuff', 1.0)
								TriggerServerEvent('esx_policejob:requesthard', target_id, playerheading, playerCoords, playerlocation)	
							else
								ESX.ShowNotification('La persona esta inconsciente!')
							end
						elseif data.current.value == 'uncuff' then
							--local target, distance = ESX.Game.GetClosestPlayer()
							playerheading = GetEntityHeading(GetPlayerPed(-1))
							playerlocation = GetEntityForwardVector(PlayerPedId())
							playerCoords = GetEntityCoords(GetPlayerPed(-1))
							local target_id = GetPlayerServerId(player)
							TriggerServerEvent('esx_policejob:requestrelease', target_id, playerheading, playerCoords, playerlocation)
							Citizen.Wait(1200)
							TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'uncuff', 0.5)					
						elseif data.current.value == "move" then
							if not IsEntityDead(GetPlayerPed(player)) then	
								TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(player))
							else
								ESX.ShowNotification('La persona esta inconsciente!')
							end
						elseif data.current.value == "putOn" then
							TriggerServerEvent('esx_policejob:putInVehicle_zs', GetPlayerServerId(player))
						elseif data.current.value == "putOff" then
							if not IsPedInAnyVehicle(GetPlayerPed(-1),  false) then
								TriggerServerEvent('esx_policejob:OutVehicle_zs', GetPlayerServerId(player))
							else
								ESX.ShowNotification('~r~Bajate del vehiculo!')
							end
						elseif data.current.value == "dni" then
							--OpenIdentityCardMenu(player)
							menu.close()
							Cerrar()
							SacarDni(player)
							--TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
						elseif data.current.value == "close" then
							menu.close()
						end
					else
						ESX.ShowNotification('~r~Ninguna persona cerca...')
					end	
				end
			end	
		end,
		function(data, menu)
			menu.close()
		end
	)
	end
end

RegisterCommand('ubi', function()
	if group.enclosure and not IsPedDeadOrDying(PlayerPedId()) and not esposado then
		TriggerServerEvent('tm1_mafias:refuerzo', GetEntityCoords(GetPlayerPed(PlayerId()), true), group.enclosure)	
	end
end, false)

local blips2 = nil

RegisterNetEvent('tm1_mafias:refuerzo')
AddEventHandler('tm1_mafias:refuerzo', function(coords)
	local ped = PlayerPedId()
	if not IsEntityDead(ped) then
		PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
		Citizen.Wait(300)
		PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
		Citizen.Wait(300)
		PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
		local blips = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipSprite(blips, 161)
		SetBlipScale(blips, 1.5)
		SetBlipColour(blips, 3)
		PulseBlip(blips)

		Citizen.CreateThread(function()
			while blips do
				Citizen.Wait(0)
				if IsControlJustReleased(0, 73) then
					if blips2 then
						RemoveBlip(blips2)
					end
					blips2 = AddBlipForCoord(coords.x, coords.y, coords.z)
					SetBlipRoute(blips2, true)
				end
			end
		end)
		
		Wait(10000)
		RemoveBlip(blips)
		blips = false
		
		Wait(120000)
		if blips2 then
			RemoveBlip(blips2)
		end
	end
end)

function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Wait(10)
	end
end

function SacarDni(player)
	local ped = PlayerPedId()
	local animacion = 'missbigscore2aig_7@driver'
	LoadAnim(animacion)
	ExecuteCommand('me le busca el dni por todo el cuerpo')
	TaskPlayAnim(ped, animacion, 'boot_r_loop', 1.0, 1.0, 4000, 1, 0, false, false, false)
	Wait(3000)
	ExecuteCommand('do encontraria el dni')
	--ClearPedTasksImmediately(ped)
	Wait(2000)
	ExecuteCommand('me toma el dni y lo observa')
	Wait(2000)
	Ver(player)
end

local dniopen = false
local badgeProp = nil

function Ver(player)
	local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    badgeProp = CreateObject(GetHashKey('prop_cs_swipe_card'), coords.x, coords.y, coords.z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(ped, 36029)
        
    AttachEntityToEntity(badgeProp, ped, boneIndex, 0.08, 0.04, 0.05, -130.0, -50.0, 0.0, true, true, false, true, 1, true)
	
	local ad = "missfam4"
	LoadAnim(ad)
	
    TaskPlayAnim(ped,ad,'base',2.0,2.0, -1, 51, 0, false, false, false)
	
	TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
	dniopen = true
	DniAbierto()
end

function DniAbierto()
	while dniopen do
	Wait(5)
		if IsControlJustPressed(0, 202) then
			Cerrar()
		end
	end
end

function Cerrar()
	local ped = PlayerPedId()
	ClearPedSecondaryTask(ped)
    DeleteObject(badgeProp)
	dniopen = false
end

function OpenAcceptPendingMenu(ownerid, name)

	local elements = {
		{label = administratorLocal.accept ,value = "accept"},
		{label = administratorLocal.unaccept ,value = "unaccept"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'acceptgroup',
		{
			title  = 'Aceptar invitacion para: '..name,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "accept" then
				TriggerServerEvent('tm1_mafias:groupAccepted',ownerid)
				menu.close()
			else
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenIdentityCardMenu(player)
	local targetName, jobLabel
	
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)		
		targetName = data.firstname .. ' ' .. data.lastname
		jobLabel = data.job.label .. ' - ' .. data.job.grade_label
		--[[
		if data.job ~= nil and  data.job ~= '' then
			jobLabel = data.job .. ' - ' .. data.job.grade
		else
			
		end
		]]
		local elements = {
			{label = ('Nombre %s'):format(targetName)},
			{label = ('Trabajo: %s'):format(jobLabel)}
		}

		
		table.insert(elements, {label = ('Sexo: %s'):format(data.sex)})
		table.insert(elements, {label = ('Fecha Nacimiento: %s'):format(data.dob)})
		table.insert(elements, {label = ('Altura: %s'):format(data.height)})


		if data.drunk then
			table.insert(elements, {label = ('Estado: %s'):format(data.drunk)})
		end

		if data.licenses then
			table.insert(elements, {label = 'Licencias'})

			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
			title    = 'Informacion',
			align		= 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenAddPeopleMenu(aprove, groupid, slot)
	local playerPed = PlayerPedId()
	local playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)

	if #playersNearby > 0 then
		local players = {}
		elements = {}

		for k,playerNearby in ipairs(playersNearby) do
			players[GetPlayerServerId(playerNearby)] = true
		end

		ESX.TriggerServerCallback('esx:getPlayerNames', function(returnedPlayers)
			for playerId,playerName in pairs(returnedPlayers) do
				table.insert(elements, {
					label = playerName,
					playerId = playerId
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'give_item_to', {
					title    = 'Invitar miembro a '..group.name,
					align    = 'bottom-right',
					elements = elements
				}, function(data2, menu2)
					local selectedPlayer, selectedPlayerId = GetPlayerFromServerId(data2.current.playerId), data2.current.playerId
					playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
					playersNearby = ESX.Table.Set(playersNearby)
					if playersNearby[selectedPlayer] then
						local selectedPlayerPed = GetPlayerPed(selectedPlayer)
						ESX.TriggerServerCallback('esx:getOtherPlayerData', function(datos)
							if IsPedOnFoot(selectedPlayerPed) and not IsPedFalling(selectedPlayerPed) then
								local maximo = nil
								
								if group.enclosure ~= 'mafia6' and group.enclosure ~= 'mafia14' then
									if group.enclosure == 'mafia4' then
										maximo = 13
									elseif group.enclosure == 'banda6' then
										maximo = 18
									else
										if aprove == 0 then
											maximo = 6
										elseif aprove == 2 then
											maximo = 6
										elseif aprove == 1 then
											maximo = 9
										elseif aprove == 3 then
											maximo = 12
										end
									end									
								else
									maximo = 16
								end
								TriggerServerEvent('tm1_mafias:pendingGroup',datos.identifier, selectedPlayerId, groupid, slot)
								menu2.close()
							else
								ESX.ShowNotification('~r~Que se baje del vehiculo!')
							end
						end, selectedPlayerId)	
					else
						ESX.ShowNotification('~r~La persona se alejo!')
						menu2.close()
					end
				end, function(data2, menu2)
					menu2.close()
			end)
		end, players)
	else
		ESX.ShowNotification('~r~Ninguna persona cerca.')
	end
	--[[
	ESX.TriggerServerCallback('tm1_mafias:requestPlayers', function(users)
		local elements = users
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'addPerson',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			TriggerServerEvent('tm1_mafias:pendingGroup',data.current.identifier,data.current.value)
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
		)
	end)
	]]
end

function OpenRemovePeopleMenu()
	ESX.TriggerServerCallback('tm1_mafias:requestGroupPlayers', function(users)
		local elements = users
		
		for a,b in pairs(elements) do
			if b.rango == 6 then
				b.label = b.label.." - ".."PATRON"
			elseif b.rango == 5 then
				b.label = b.label.." - ".."MANO DERECHA"
			elseif b.rango == 4 then
				b.label = b.label.." - ".."CAPO"
			elseif b.rango == 3 then
				b.label = b.label.." - ".."SICARIO"
			elseif b.rango == 2 then
				b.label = b.label.." - ".."MATON"
			elseif b.rango == 1 then
				b.label = b.label.." - ".."SOLDADITO"
			end				
		end
		
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'removePerson',
		{
			title  = group.name,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if (group.rank == 4 or group.rank == 5) and data.current.rango == 5 then
				TriggerServerEvent('tm1_mafias:advert',administratorLocal.errorRank)
			else
			TriggerServerEvent('tm1_mafias:userRemoved',data.current.value,data.current.id)
			end
			ESX.UI.Menu.CloseAll()
		end,
		function(data, menu)
			menu.close()
		end
		)
	end, group.groupid)
end

function OpenAdministratePeopleMenu()
	--ESX.ShowNotification(group.groupid)
	ESX.TriggerServerCallback('tm1_mafias:requestGroupPlayers', function(users)
		local elements = users
		
		for a,b in pairs(elements) do
			if b.rango == 6 then
				b.label = b.label.." - ".."PATRON"
			elseif b.rango == 5 then
				b.label = b.label.." - ".."MANO DERECHA"
			elseif b.rango == 4 then
				b.label = b.label.." - ".."CAPO"
			elseif b.rango == 3 then
				b.label = b.label.." - ".."SICARIO"
			elseif b.rango == 2 then
				b.label = b.label.." - ".."MATON"
			elseif b.rango == 1 then
				b.label = b.label.." - ".."SOLDADITO"
			end	
		end
		
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'removePerson',
		{
			title  = group.name,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			OpenPromoteMenu(data.current.label,data.current.rango,data.current.value)		
		end,
		function(data, menu)
			menu.close()
		end
		)
	end, group.groupid)
end

function OpenPromoteMenu(name,rango,steamid)

	local elements = {
		{label = administratorLocal.promote ,value = "promote"},
		{label = administratorLocal.unpromote ,value = "unpromote"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'promoteMenu',
		{
			title  = administratorLocal.promoteTitle..name.."?",
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "promote" then
				if group.rank == 5 and rango == 5 then
					TriggerServerEvent('tm1_mafias:advert',"No puedes autoascenderte a jefe.")
				elseif group.rank == 5 and rango == 4 then
					TriggerServerEvent('tm1_mafias:advert',"Solo el Patron puede elegir su Mano Derecha!")
				elseif group.rank == 6 and rango == 5 then
					TriggerServerEvent('tm1_mafias:advert',"Tu eres el Patron no puedes dar tu rango.")
				else
					TriggerServerEvent('tm1_mafias:promotesSystem',group.groupid,rango,steamid,"promote", group.enclosure)
				end
				--menu.close()
				OpenPromoteMenu(name,rango,steamid)
			elseif data.current.value == "unpromote" then
				if group.rank == 5 and rango == 6 then
					TriggerServerEvent('tm1_mafias:advert',"No puedes degradar a un rango superior al tuyo.")
				elseif group.rank == 6 and rango == 6 then
					TriggerServerEvent('tm1_mafias:advert',"No puedes dejar de ser el Patron!")
				elseif group.rank == 5 and rango == 5 then
					TriggerServerEvent('tm1_mafias:advert',"No puedes degradar a un rango igual al tuyo.")
				else
				TriggerServerEvent('tm1_mafias:promotesSystem',group.groupid,rango,steamid,"unpromote", group.enclosure)
				end
				--menu.close()
				OpenPromoteMenu(name,rango,steamid)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenRemoveGroupMenu(group,opc)

	local elements = {
		{label = administratorLocal.yes ,value = "accept"},
		{label = administratorLocal.no ,value = "unaccept"}
	}
	if opc == "remove" then
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'acceptgroup',
			{
				title  = administratorLocal.removeGroupTitle..group.name.."?",
				align    = 'bottom-right',
				elements = elements
			},
			function(data, menu)
				if data.current.value == "accept" then
					TriggerServerEvent("tm1_mafias:RemoveGroup",group.groupid)
					menu.close()
				else
					menu.close()
				end
			end,
			function(data, menu)
				menu.close()
			end
		)
	elseif opc == "exit" then
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'exitgroup',
			{
				title  = administratorLocal.exitGroupQ,
				align    = 'bottom-right',
				elements = elements
			},
			function(data, menu)
				if data.current.value == "accept" then
					TriggerServerEvent("tm1_mafias:exitGroup",group.groupid)
					menu.close()
				else
					menu.close()
				end
			end,
			function(data, menu)
				menu.close()
			end
		)
	end
end

RegisterNetEvent('tm1_mafias:acceptPending')
AddEventHandler('tm1_mafias:acceptPending',function(ownerid, name)
	OpenAcceptPendingMenu(ownerid, name)
end)