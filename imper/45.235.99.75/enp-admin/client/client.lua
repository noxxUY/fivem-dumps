ESX = nil

ENP_noclip = false
ENP_godmode = false
ENP_vanish = false
ENP_noclipSpeed = 2.01
ENP = {}
isAdmin = nil

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(5)
    end
end)

RegisterNetEvent('enp-admin:checkAdmin')
AddEventHandler('enp-admin:checkAdmin', function(state)
    isAdmin = state
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if IsControlJustReleased(0, 56) then 
			if isAdmin then
				MunuAdmin()
			elseif isAdmin == nil then
				TriggerServerEvent('enp-admin:isAdministrator')
			end
        end
        if ENP_noclip then
            local ped = GetPlayerPed(-1)
            local x,y,z = getPosition()
            local dx,dy,dz = getCamDirection()
            local speed = ENP_noclipSpeed

            SetEntityVelocity(ped, 0.05,  0.05,  0.05)
  
            if IsControlPressed(0, 32) then
                x = x + speed * dx
                y = y + speed * dy
                z = z + speed * dz
            end
  
            if IsControlPressed(0, 269) then
                x = x - speed * dx
                y = y - speed * dy
                z = z - speed * dz
            end
  
            SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
        end
	end
end)




function MunuAdmin()
    local elements = {}

    local elements = {
        {label = "Noclip", value = "noclip"},
        {label = "Borrar vehículo", value = "clearVehicle"},
		{label = "Reparar coche", value = "fix"},
		{label = "Invisible",     value = "inv"},
		{label = "Cerrar",             value = "close"}
    }


    ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'adminMenu',
		{
			title  = "Menu administrativo",
			elements = elements
		},
		function(data, menu)
			if data.current.value == "noclip" then
				TriggerEvent('enp-admin:nocliped')
				ESX.UI.Menu.CloseAll()
			elseif data.current.value == "godmode" then
				TriggerEvent('enp-admin:godmodePlayer')
				ESX.UI.Menu.CloseAll()
			elseif data.current.value == "tpoint" then
				if DoesBlipExist(GetFirstBlipInfoId(8)) then
					if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
						teleportByCar()
					else
						teleportToPoint()
					end
				else
					TriggerEvent('esx:showNotification', "Tienes que seleccionar un punto en el mapa.")
				end
			elseif data.current.value == "spawnCar" then
				openGetterMenu('spawnCar')
			elseif data.current.value == "clearVehicle" then
				TriggerEvent('esx:deleteVehicle')
				TriggerEvent('esx:showNotification', "Vehículo ~r~eliminado~w~.")
			elseif data.current.value == "clearChat" then
				TriggerEvent('enp-admin:clearchat')
			elseif data.current.value == "heal" then
				TriggerEvent('enp-admin:healPlayer')
			elseif data.current.value == "fix" then
				TriggerEvent( 'np-admin:repairVehicle')
			elseif data.current.value == "inv" then
				TriggerEvent('enp-admin:invisible')
			elseif data.current.value == "anuncio" then
				TriggerServerEvent('enp-admin:announce')
			elseif data.current.value == "close" then
				ESX.UI.Menu.CloseAll()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function openGetterMenu(type)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'getterAdminMenu',
	{
		title = "Ingrese el parámetro correspondiente",
	}, function(data, menu)
		local parameter = data.value
		if type == "spawnCar" then
			TriggerEvent('esx:spawnVehicle', parameter)
			TriggerEvent('esx:showNotification', "Se ha intentado spawnear un : ~g~"..parameter.."~w~.")
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

--[[
	REGISTROS
]]

RegisterNetEvent('enp-admin:nocliped')
AddEventHandler('enp-admin:nocliped',function()
	ENP_noclip = not ENP_noclip
    local ped = GetPlayerPed(-1)

    if ENP_noclip then
    	SetEntityInvincible(ped, true)
    	SetEntityVisible(ped, false, false)
    else
    	SetEntityInvincible(ped, false)
    	SetEntityVisible(ped, true, false)
    end

    if ENP_noclip == true then 
exports['mythic_notify']:SendAlert('inform', 'Has activado el Noclip', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
    else
exports['mythic_notify']:SendAlert('inform', 'Has desactivado el Noclip', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
    end
end)

RegisterNetEvent('enp-admin:invisible')
AddEventHandler('enp-admin:invisible', function()
	ENP_vanish = not ENP_vanish
    local ped = GetPlayerPed(-1)
    SetEntityVisible(ped, not ENP_vanish, false)
    if ENP_vanish == true then 
        ESX.ShowNotification('Has activado el ~g~invisible.')
    else
        ESX.ShowNotification('Has desactivado el ~r~invisible.')
    end
end)

RegisterNetEvent('enp-admin:godmodePlayer')
AddEventHandler('enp-admin:godmodePlayer', function()
	ENP_godmode = not ENP_godmode
	local playerPed = PlayerPedId()
	SetEntityInvincible(playerPed, not ENP_godmode, false)
	if ENP_godmode then
		ESX.ShowNotification('Has activado el ~g~ Godmode.')
	else
		ESX.ShowNotification('Has desactivado el ~r~Godmode.')
	end
end)

RegisterNetEvent("enp-admin:clearchat")
AddEventHandler("enp-admin:clearchat", function()
    TriggerEvent('chat:clear', -1)
  ESX.ShowNotification('~g~Has limpiado todo el chat.')
end)

RegisterNetEvent('np-admin:repairVehicle')
AddEventHandler('np-admin:repairVehicle', function()
    local ply = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(ply)
    if IsPedInAnyVehicle(ply) then 
        SetVehicleFixed(plyVeh)
        SetVehicleDeformationFixed(plyVeh)
        SetVehicleUndriveable(plyVeh, false)
        SetVehicleEngineOn(plyVeh, true, true)
        ESX.ShowNotification('~g~Has reparado el coche')
    else
        ESX.ShowNotification('~r~Debes estar en un vehículo para poder repararlo')
    end
end)

RegisterNetEvent('enp-admin:teleport')


RegisterNetEvent('enp-admin:healPlayer')
AddEventHandler('enp-admin:healPlayer', function()
    if isAdmin then 
        local ENP_ped = PlayerPedId()
        SetEntityHealth(ENP_ped, 200)
        ESX.ShowNotification('~y~Te has curado.')
        ClearPedBloodDamage(ENP_ped)
        ResetPedVisibleDamage(ENP_ped)
        ClearPedLastWeaponDamage(ENP_ped)
    else
        ESX.ShowNotification('~r~No eres administrador.')
    end
end)

--[[
	FUNCIONES
]]

getPosition = function()
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  	return x,y,z
end

getCamDirection = function()
	local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
	local pitch = GetGameplayCamRelativePitch()
  
	local x = -math.sin(heading*math.pi/180.0)
	local y = math.cos(heading*math.pi/180.0)
	local z = math.sin(pitch*math.pi/180.0)
  
	local len = math.sqrt(x*x+y*y+z*z)
	if len ~= 0 then
	  x = x/len
	  y = y/len
	  z = z/len
	end
  
	return x,y,z
end

teleportByCar = function()
	local player = GetPlayerPed(-1)
	local blip = GetFirstBlipInfoId(8)
	local coche =  GetVehiclePedIsIn(GetPlayerPed(-1),false)
		local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
		SetEntityCoords(coche,coord.x,coord.y,coord.z+5)
		TriggerEvent('esx:showNotification', "Te has teletransportado ~g~correctamente.")
		SetPedIntoVehicle(GetPlayerPed(-1), coche, - 1)
		DrawNotification(false, true)
end

teleportToPoint = function()
    local player = GetPlayerPed(-1)
	local blip = GetFirstBlipInfoId(8)
	local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
	SetEntityCoords(player,coord.x,coord.y,coord.z)
	TriggerEvent('esx:showNotification', "Te has teletransportado ~g~correctamente.")
	DrawNotification(false, true)
end