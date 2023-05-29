ESX = nil
local activo = false
local evento = false
local ped = false

local depoCentral = vector3(408.61, -1625.47, 29.29)
local depoSandy = vector3(1651.38, 3804.84, 38.65)
local depoPaleto = vector3(-234.82, 6198.65, 31.94)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

RegisterNetEvent("esx_admin:convertped")
AddEventHandler("esx_admin:convertped", function(model)
	ped = not ped
	
	local playerped = PlayerPedId()
	
	local hp = GetEntityHealth(playerped)
	local armor = GetPedArmour(playerped)
	
	if not ped then	
		local modelHash = GetHashKey(model)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)		
			ESX.Streaming.RequestModel(modelHash, function()
				SetPlayerModel(PlayerId(), modelHash)
				SetModelAsNoLongerNeeded(modelHash)
				TriggerEvent('esx:restoreLoadout')
				TriggerEvent('skinchanger:loadSkin', skin)
				SetEntityHealth(playerped, hp)
				SetPedArmour(playerped, armor)
			end)
		end)	
	else
		
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			local isMale = skin.sex == 0
			TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
					TriggerEvent('esx:restoreLoadout')
					
					SetEntityHealth(playerped, hp)
					SetPedArmour(playerped, armor)
				end)
			end)
		end)
	end
end)

RegisterNetEvent("esx_admin:vehicleclass")
AddEventHandler("esx_admin:vehicleclass", function()
	local playerPed = PlayerPedId()
	if IsPedInAnyVehicle(playerPed, false) then	
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		print(GetVehicleClass(vehicle))
	else
		ESX.ShowNotification("Debes estar adentro del vehiculo!")
	end
end)

RegisterNetEvent("esx_admin:freezecar")
AddEventHandler("esx_admin:freezecar", function()
	local playerPed = PlayerPedId()
	if IsPedInAnyVehicle(playerPed, false) then	
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		FreezeEntityPosition(vehicle, true)
	else
		ESX.ShowNotification("Debes estar adentro del vehiculo!")
	end
end)

RegisterNetEvent("esx_admin:unfreezecar")
AddEventHandler("esx_admin:unfreezecar", function()
	local playerPed = PlayerPedId()
	if IsPedInAnyVehicle(playerPed, false) then	
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		FreezeEntityPosition(vehicle, false)
	else
		ESX.ShowNotification("Debes estar adentro del vehiculo!")
	end
end)


RegisterCommand('armado', function()
	print(IsPedArmed(PlayerPedId(), 4 | 2))
end, false)

--[[
RegisterCommand('tuning', function()
	local playerPed = PlayerPedId()
	
	if IsPedInAnyVehicle(playerPed, false) then	
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleModKit(vehicle, 0)	
		ESX.Game.SetVehicleProperties(vehicle, {
			plate = 'DINA GAY',
			modTurbo = true,
			modEngine = 3,
			modBrakes = 2,
			modTransmission = 2,
			modSuspension = 3,
			modArmor = 4
		})
	else
		ESX.ShowNotification("Debes estar adentro del vehiculo!")
	end
end, false)
]]

RegisterCommand('policias', function()
	ESX.TriggerServerCallback('esx_policejob:getCops', function(police)
		ESX.ShowNotification(police)
	end)
end, false)

RegisterCommand('getmodel', function()
	local playerPed = PlayerPedId()
	if IsPedInAnyVehicle(playerPed, false) then	
		local car = GetVehiclePedIsIn(playerPed, false)
		local vehicle = GetEntityModel(car)
		ESX.ShowNotification(vehicle)
	end	
end, false)

--[[
RegisterCommand('stop', function()
	local playerPed = PlayerPedId()
	local car = GetVehiclePedIsIn(playerPed, false)
	activo = not activo
	if activo then
		FreezeEntityPosition(car, true)
		SetEntityInvincible(car, true)
	else
		FreezeEntityPosition(car, false)
		SetEntityInvincible(car, false)
	end	
end, false)

RegisterCommand('messi', function()
	PlayerData = ESX.GetPlayerData()
	if PlayerData.job.name == 'taxi' and PlayerData.job.grade_name == 'boss' then
	local modelHash = ''
	activo = not activo
	if activo then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			if skin.sex == 0 then
				modelHash = GetHashKey('a_m_y_bevhills_01')
			else
				modelHash = GetHashKey('a_m_y_bevhills_01')
			end

			ESX.Streaming.RequestModel(modelHash, function()
				SetPlayerModel(PlayerId(), modelHash)
				SetModelAsNoLongerNeeded(modelHash)
				TriggerEvent('esx:restoreLoadout')
			end)
		end)
	else
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			local isMale = skin.sex == 0
			TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
					TriggerEvent('esx:restoreLoadout')
				end)
			end)

		end)
	end
	end
end, false)

RegisterCommand('wachin', function()
	local modelHash = ''
	activo = not activo
	if activo then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			if skin.sex == 0 then
				modelHash = GetHashKey('ig_bankman')
			else
				modelHash = GetHashKey('ig_bankman')
			end

			ESX.Streaming.RequestModel(modelHash, function()
				SetPlayerModel(PlayerId(), modelHash)
				SetModelAsNoLongerNeeded(modelHash)
				TriggerEvent('esx:restoreLoadout')
			end)
		end)
	else
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			local isMale = skin.sex == 0
			TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
					TriggerEvent('esx:restoreLoadout')
				end)
			end)

		end)
	end
end, false)
]]
----------------------------------------------------------------------------------
RegisterNetEvent("esx_admin:killPlayer")
AddEventHandler("esx_admin:killPlayer", function()
	SetEntityHealth(PlayerPedId(), 0)
end)

local lista_tp = {
	{name = "Deposito Ciudad", coords = vector3(408.61, -1625.47, 29.29)},
	{name = "Deposito Sandy", coords = vector3(1661.302,3819.933,35.469)},
	{name = "Deposito Paleto", coords = vector3(-234.82, 6198.65, 31.94)},
	{name = "GC CUBOS", coords = vector3(237.3293,-815.624,30.226)},
	{name = "GC PLAYA", coords = vector3(-2022.15,-456.101,11.540)},
	{name = "PDLC", coords = vector3(425.97, -981.13, 29.76)},
	{name = "GNA", coords = vector3(1854.097,3685.429,34.261)},
	{name = "PFA", coords = vector3(-444.976,6014.540,31.721)},
	{name = "Hospital", coords = vector3(-830.149,-1217.25,6.9341)},
	{name = "Camionero", coords = vector3(146.0555, -3219.3471, 4.89)},
	{name = "Casino", coords = vector3(935.8314, 46.78986, 81.095)},
	{name = "Taxi", coords = vector3(916.0176,-165.564,74.545)},
	{name = "TALLER CHAMBERS", coords = vector3(-177.309,-1153.52,23.111)},
	{name = "TALLER LARAMIE", coords = vector3(823.7169,-992.730,26.498)},
	{name = "TALLER BENNYS", coords = vector3(-222.580,-1324.08,30.890)},
}

RegisterNetEvent("esx_admin:tpdepo2")
AddEventHandler("esx_admin:tpdepo2", function()
	local elements = {}
	
	for i=1, #lista_tp, 1 do
		table.insert(elements, {label = lista_tp[i].name, value = lista_tp[i].coords})
	end
	
	local org = exports['tm1_mafias']:GetGroup()
	
	if org then
		--'Dinero Sucio: <span style="color:red;">org.name</span> ';
		table.insert(elements, {label = '<span style="color:red;">'..org.name..'</span>', value = org.coords})
	end
	
	table.insert(elements, {label = 'Salir', value = "exit"})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = 'Donde quieres Tepearte?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "exit" then
				menu.close()
			else
				ESX.Game.Teleport(PlayerPedId(), data.current.value)
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end)

--2084.705, 3363.020, 45.927

RegisterNetEvent("esx_admin:calamar")
AddEventHandler("esx_admin:calamar", function()
	local elements = {}
	elements = {
		{label = "SI" ,value = "yes"},
		{label = "NO" ,value = "no"}
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = 'Quieres Jugar al Juego del Calamar?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "yes" then
				menu.close()
				local coords = vector3(2084.705, 3363.020, 45.927)	
				SetEntityCoords(PlayerPedId(), coords)
			elseif data.current.value == "no" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end)

RegisterNetEvent("esx_admin:tpdepo")
AddEventHandler("esx_admin:tpdepo", function()
	local elements = {}
	elements = {
		{label = "SI" ,value = "yes"},
		{label = "NO" ,value = "no"}
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = 'Quieres Tepearte a Deposito?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "yes" then
				local coords = GetEntityCoords(PlayerPedId())	
				
				local distance1 = #(coords - depoCentral)
				local distance2 = #(coords - depoSandy)
				local distance3 = #(coords - depoPaleto)
			
			if distance1 < distance2 and distance1 < distance3 then
				SetEntityCoords(PlayerPedId(), depoCentral)
			elseif distance2 < distance1 and distance2 < distance3 then
				SetEntityCoords(PlayerPedId(), depoSandy)
			elseif distance3 < distance1 and distance3 < distance2 then
				SetEntityCoords(PlayerPedId(), depoPaleto)
			end
			elseif data.current.value == "no" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end)

RegisterNetEvent("esx_admin:evento")
AddEventHandler("esx_admin:evento", function()
	local elements = {}
	elements = {
		{label = "SI" ,value = "yes"},
		{label = "NO" ,value = "no"}
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = 'Quieres Participar del Evento Purga?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "yes" then
				evento()
			elseif data.current.value == "no" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end)

function evento()
	local mafia = exports["tm1_mafias"]:GetGroup()
	local ped = PlayerPedId()
	if mafia ~= nil then
		SetEntityCoords(ped, -202.13, 6216.62, 31.49)
		GiveWeaponToPed(ped, "WEAPON_specialcarbine", 250, true, true)
		evento = true
	else
		ESX.ShowNotification("No eres mafia no puedes participar!")
	end
end
--[[
Citizen.CreateThread(function()
	--local mafia = exports["tm1_mafias"]:GetGroup()
	while true do
		Wait(5)
		local ped = PlayerPedId()
		if IsPedDeadOrDying(ped, 1) and evento then --mafia ~= nil and mafia == 'mafia12' and
			--TriggerServerEvent('esx_ambulancejob:reviveDM', GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))))
			--ReviveInjuredPed(ped)
			SetEntityCoords(ped, -202.13, 6216.62, 31.49)
			Wait(1000)
			SetPedArmour(ped, 100)
			GiveWeaponToPed(ped, "WEAPON_SPECIALCARBINE", 30, true, true)
			--GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02")) 
			SetPedInfiniteAmmoClip(ped, true)
		end
	end
end)
]]
RegisterNetEvent("esx_admin:fuel")
AddEventHandler("esx_admin:fuel", function()
	local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)
	if vehicle then
		if GetPedInVehicleSeat(vehicle, -1) == ped then
			exports["LegacyFuel"]:SetFuel(vehicle, 100)
		else
			ESX.ShowNotification("Debes estar sentado en asiento conductor!")
		end
	else
		ESX.ShowNotification("Debes estar arriba de un vehiculo!")
	end
end)

RegisterNetEvent("esx_admin:freezePlayer")
AddEventHandler("esx_admin:freezePlayer", function(input)
    local player = PlayerId()
	local ped = PlayerPedId()
    if input == 'freeze' then
        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, true)
    elseif input == 'unfreeze' then
        SetEntityCollision(ped, true)
	    FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    end
end)

RegisterNetEvent("esx_admin:armor")
AddEventHandler("esx_admin:armor", function(nivel)
	if nivel == 1 then
		SetPedArmour(PlayerPedId(), 25)
	elseif nivel == 2 then
		SetPedArmour(PlayerPedId(), 50)
	elseif nivel == 3 then
		SetPedArmour(PlayerPedId(), 75)
	elseif nivel == 4 then
		SetPedArmour(PlayerPedId(), 100)
	end
end)

RegisterNetEvent('esx_adminplus:extra')
AddEventHandler('esx_adminplus:extra', function(extra)
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	--local coords    = GetEntityCoords(playerPed)
	if DoesEntityExist(vehicle) then
		SetVehicleExtra(vehicle, extra, false)
		ESX.ShowNotification('~g~EXTRAS CARGADO ID: '..extra)
	else
		ESX.ShowNotification('~r~No hay vehiculo!')
	end
end)

RegisterNetEvent('esx_adminplus:remove_extra')
AddEventHandler('esx_adminplus:remove_extra', function(extra)
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	--local coords    = GetEntityCoords(playerPed)
	if DoesEntityExist(vehicle) then
		SetVehicleExtra(vehicle, extra, true)
		ESX.ShowNotification('~g~EXTRAS SACADO ID: '..extra)
	else
		ESX.ShowNotification('~r~No hay vehiculo!')
	end
end)

-------- noclip --------------
local noclip = false
RegisterNetEvent("esx_admin:noclip")
AddEventHandler("esx_admin:noclip", function(input)
    local player = PlayerId()
	local ped = PlayerPedId
	
    local msg = "disabled"
	if(noclip == false)then
		noclip_pos = GetEntityCoords(PlayerPedId(), false)
	end

	noclip = not noclip

	if(noclip)then
		msg = "enabled"
	end

	TriggerEvent("chatMessage", "Noclip has been ^2^*" .. msg)
	end)
	
	local heading = 0
	Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if(noclip)then
			SetEntityCoordsNoOffset(PlayerPedId(), noclip_pos.x, noclip_pos.y, noclip_pos.z, 0, 0, 0)

			if(IsControlPressed(1, 34))then
				heading = heading + 1.5
				if(heading > 360)then
					heading = 0
				end

				SetEntityHeading(PlayerPedId(), heading)
			end

			if(IsControlPressed(1, 9))then
				heading = heading - 1.5
				if(heading < 0)then
					heading = 360
				end

				SetEntityHeading(PlayerPedId(), heading)
			end

			if(IsControlPressed(1, 8))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
			end

			if(IsControlPressed(1, 32))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -1.0, 0.0)
			end

			if(IsControlPressed(1, 27))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 1.0)
			end

			if(IsControlPressed(1, 173))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, -1.0)
			end
		else
			Citizen.Wait(200)
		end
	end
end)

--Thanks to qalle for this code | https://github.com/qalle-fivem/esx_marker
RegisterNetEvent("esx_admin:tpm")
AddEventHandler("esx_admin:tpm", function()
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                break
            end

            Citizen.Wait(5)
        end
        TriggerEvent('chatMessage', _U('teleported'))
    else
        TriggerEvent('chatMessage', _U('set_waypoint'))
    end
end)
