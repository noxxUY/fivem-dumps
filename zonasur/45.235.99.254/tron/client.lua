local group 
local duty = false
local gps = false

ESX = nil

RegisterCommand('gps', function()
	gps = not gps
	DisplayRadar(gps)
end, false)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function GetTron()
	return duty
end

--exports["IDsAboveHead"]:Tron()

function cleanPlayer(playerPed)
    SetPedArmour(playerPed, 0)
    ClearPedBloodDamage(playerPed)
    ResetPedVisibleDamage(playerPed)
    ClearPedLastWeaponDamage(playerPed)
    ResetPedMovementClipset(playerPed, 0)
end

function setUniform(playerPed)
    local playerPed = PlayerPedId()
    
    TriggerEvent('skinchanger:getSkin', function(skin)
		ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
			if skin.sex == 0 then
				if group == "superadmin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.superadmin.male, true)
				elseif group == "ds" then				
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.ds.male, true)
				elseif group == "sl" then
					 TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.sl.male, true)
				elseif group == "gm" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.gm.male, true)
                elseif group == "admin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.admin.male, true)
                elseif group == "mod" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.mod.male, true)				
                end
            else
                if group == "superadmin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.superadmin.female, true)
				elseif group == "ds" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.ds.female, true)
				elseif group == "sl" then
					TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.sl.female, true)
				elseif group == "gm" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.gm.female, true)
                elseif group == "admin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.admin.female, true)
                elseif group == "mod" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.mod.female, true)				
                end
            end
        end)
    end)
end

RegisterNetEvent("toggleDuty")
AddEventHandler("toggleDuty", function()
    local playerPed = PlayerPedId()
    if duty then
        duty = false
		exports["IDsAboveHead"]:Tron(false)
        TriggerEvent("chatMessage", "^1Te saliste de servicio^7 como admin.")
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
		TriggerEvent('esx_thief:tron', false)
		TriggerEvent('CarryPeople:tron', false)
		TriggerEvent('1974_mansion:tron', false)
    else
        duty = true
		exports["IDsAboveHead"]:Tron(true)
        TriggerEvent("chatMessage", "^2Entraste en servicio^7 como admin.")
        setUniform()
		TriggerEvent('esx_thief:tron', true)
		TriggerEvent('CarryPeople:tron', true)
		TriggerEvent('1974_mansion:tron', true)
    end 
end)

RegisterNetEvent("tron:dutyoff")
AddEventHandler("tron:dutyoff", function()
    local playerPed = PlayerPedId()
    if duty then
        duty = false
		exports["IDsAboveHead"]:Tron(false)
        TriggerEvent("chatMessage", "^1Te saliste de servicio^7 como admin.")
		TriggerEvent('esx_thief:tron', false)
		TriggerEvent('CarryPeople:tron', false)
		TriggerEvent('1974_mansion:tron', false)
    end 
end)

RegisterNetEvent('es_admin:setGroup')
AddEventHandler('es_admin:setGroup', function(g)
	print('group setted ' .. g)
	group = g
end)

RegisterNetEvent("textsent")
AddEventHandler('textsent', function(tPID, names2)
	TriggerEvent('chatMessage', "", {205, 205, 0}, " Respuesta enviada a:^0 " .. names2 .."  ".."^0  - " .. tPID)
	--[[
	local msg = 'Respuesta enviada a: '..names2..' '..' - '..tPID
	TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; width:550px;"><i class="fas fa-info"></i> <b>REPORT:</b> {1}</div>',
        args = { fal, msg }
    })
	]]
end)

RegisterNetEvent("textmsg")
AddEventHandler('textmsg', function(source, textmsg, names2, names3 )
	TriggerEvent('chatMessage', "", {205, 205, 0}, "  STAFF " .. names3 .."  ".."^0: " .. textmsg)
	--[[
	local msg = names3..' : '..textmsg
	TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; width:550px;"><i class="fas fa-info"></i> <b>STAFF |</b> {1}</div>',
        args = { fal, msg }
    })
	]]
end)

RegisterNetEvent('sendReport')
AddEventHandler('sendReport', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
	-- TriggerEvent('chat:addMessage', {
        -- template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; width:550px;"><i class="fas fa-info"></i> Tu reporte ha sido enviado a los admins online!</div>',
        -- args = { fal, msg }
    -- })
    TriggerEvent('chatMessage', "", {255, 0, 0}, "Tu reporte ha sido enviado a los admins online!")
	-- TriggerEvent('chat:addMessage', {
        -- template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; width:550px;"><i class="fas fa-info"></i><b> REPORTE | {0} {1}:</b> {2}</div>',
        -- args = { id, name, message }
    -- })
	TriggerEvent('chatMessage', "", {255, 0, 0}, " [REPORT] | [".. id .."]" .. name .."  "..":^0  " .. message)
  elseif group ~= 'user' and pid ~= myId then
	-- TriggerEvent('chat:addMessage', {
        -- template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; width:550px;"><i class="fas fa-info"></i><b> REPORTE | {0} {1}:</b> {2}</div>',
        -- args = { id, name, message }
    -- })
    TriggerEvent('chatMessage', "", {255, 0, 0}, " [REPORT] | [".. id .."]" .. name .."  "..":^0  " .. message)
  end
end)

RegisterNetEvent('tron:forzar')
AddEventHandler('tron:forzar', function()
	local playerPed = PlayerPedId()
	local vehicle   = ESX.Game.GetVehicleInDirection()
	local coords    = GetEntityCoords(playerPed)

	if IsPedSittingInAnyVehicle(playerPed) then
		ESX.ShowNotification('No puedes estar dentro del vehiculo')
		return
	end
	if duty then
		if DoesEntityExist(vehicle) then
			
				isBusy = true
				--TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
				Citizen.CreateThread(function()
				--Citizen.Wait(2000)

				SetVehicleDoorsLocked(vehicle, 1)
				SetVehicleDoorsLockedForAllPlayers(vehicle, false)
				--ClearPedTasksImmediately(playerPed)

				ESX.ShowNotification('Vehiculo desbloqueado')
				isBusy = false
			end)
			
		else
			ESX.ShowNotification('No hay vehiculos cerca')
		end
	else
		ESX.ShowNotification('No estas en servicio')
	end
end)

RegisterNetEvent('tron:reparar')
AddEventHandler('tron:reparar', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local vehicle   = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
	
	--[[
	if IsPedSittingInAnyVehicle(playerPed) then
		ESX.ShowNotification('No puedes estar dentro del vehiculo')
		return
	end
	]]
	
	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	end
	
	if duty then
		if DoesEntityExist(vehicle) then
			SetVehicleFixed(vehicle)
			SetVehicleDeformationFixed(vehicle)
			SetVehicleUndriveable(vehicle, false)
			SetVehicleEngineOn(vehicle, true, true)
			ClearPedTasksImmediately(playerPed)
			ESX.ShowNotification('~g~VEHICULO REPARADO!')
		else
			ESX.ShowNotification('~r~No hay vehiculo cerca!')
		end
	else
		ESX.ShowNotification('No estas en servicio')
	end
end)

RegisterNetEvent('tron:limpiar')
AddEventHandler('tron:limpiar', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local vehicle   = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
	

	if IsPedSittingInAnyVehicle(playerPed) then
		ESX.ShowNotification('No puedes estar dentro del vehiculo')
		return
	end
	
	if duty then
		if DoesEntityExist(vehicle) then
			SetVehicleDirtLevel(vehicle, 0)
			ESX.ShowNotification('~g~VEHICULO LIMPIO!')
		else
			ESX.ShowNotification('~r~No hay vehiculo cerca!')
		end
	else
		ESX.ShowNotification('No estas en servicio')
	end
end)


RegisterNetEvent('tron:hpcar')
AddEventHandler('tron:hpcar', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local vehicle   = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

	if IsPedSittingInAnyVehicle(playerPed) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	end
	
	if duty then
		if DoesEntityExist(vehicle) then
			ESX.ShowNotification(GetVehicleEngineHealth(vehicle))
		else
			ESX.ShowNotification('~r~No hay vehiculo cerca!')
		end
	else
		ESX.ShowNotification('No estas en servicio')
	end
end)