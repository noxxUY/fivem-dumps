ESX                           = nil

local venta = {x=237.6935,y=-413.040,z=48.111 - 0.95}



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing

function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

RegisterNetEvent('1974_formulario08:abrir')
AddEventHandler('1974_formulario08:abrir', function()
	ExecuteCommand('e clipboard')
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
			title = 'PATENTE:'
		}, function(data, menu)
			local count = data.value

			if count == nil then
				ESX.ShowNotification('~y~DEBES INTRODUCIR LA PATENTE!')
			else
				menu.close()
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					TriggerServerEvent('1974_formulario08:transferir', data.value, GetPlayerServerId(closestPlayer))
					--ExecuteCommand('cancel')
					TriggerEvent('dpemotes:cancel')
				else
					ESX.ShowNotification('~y~EL COMPRADOR NO ESTA CERCA TUYO PARA FIRMAR EL 08!')
					--ExecuteCommand('cancel')
					TriggerEvent('dpemotes:cancel')
				end
				--[[
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = 'ID DEL COMPRADOR:'
					}, function(data2, menu2)
						local count = tonumber(data2.value)

						if count == nil then
							ESX.ShowNotification('~y~DEBES ID DEL COMPRADOR!')
						else
							menu2.close()
							ExecuteCommand('cancel')
							TriggerServerEvent('1974_formulario08:transferir', data.value, data2.value)
						end

				end, function(data2, menu2)
					menu2.close()
					ExecuteCommand('cancel')
				end)
				]]
			end

		end, function(data, menu)
			menu.close()
			TriggerEvent('dpemotes:cancel')
			--ExecuteCommand('cancel')
	end)
end)

Citizen.CreateThread(function()	
	while true do
		Wait(0)
		DrawMarker(27, venta.x, venta.y, venta.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 0, 0, 100, 0, 0, 0, 0)
		
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), venta.x, venta.y, venta.z, true) <= 2.0 then
			Drawing.draw3DText(venta.x, venta.y, venta.z, 'Presiona ~g~[E]~w~ para comprar!', 1, 0.2, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) then -- When they press INPUT_PICKUP (default e)
				Menuventas()
			end
		end
	end
end)

function Menuventas()
	local elements = {}
	elements = {
		{label = "Formulario 08" ,value = "form08"},
		{label = "Escritura Propiedad" ,value = "escritura"}
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = 'Venta de Formularios',
			align  = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "form08" then
				TriggerServerEvent("1974_formulario08:comprar", data.current.value, 10000)
				menu.close()
			elseif data.current.value == "escritura" then
				TriggerServerEvent("1974_formulario08:comprar", data.current.value, 50000)
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

