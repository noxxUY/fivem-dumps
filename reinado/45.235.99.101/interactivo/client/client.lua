ESX = exports["es_extended"]:getSharedObject()


-- Crear Blip en el mapa
CreateBlip = function(coords, sprite, colour, text, scale)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.6)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end

-- Crear el box target

for i=1, #Config.LoNpcLoco do
	exports.ox_target:addBoxZone({

		coords = vec3(Config.LoNpcLoco[i].coords),
		size = vec3(2, 2, 2),
		rotation = 45,
		debug = drawZones,
		options = {
			{
				name = 'box',
				event = Config.LoNpcLoco[i].accionped,
				icon = Config.LoNpcLoco[i].icono,
				label = Config.LoNpcLoco[i].label,
				store = Config.LoNpcLoco[i],
				canInteract = function(entity, distance, coords, name)
					return true
				end
			}
		}
	})
	
        if Config.LoNpcLoco[i].blip.enabled then
            CreateBlip(Config.LoNpcLoco[i].coords, Config.LoNpcLoco[i].blip.sprite, Config.LoNpcLoco[i].blip.color, Config.LoNpcLoco[i].label, Config.LoNpcLoco[i].blip.scale)
        end

end



Citizen.CreateThread(function()
    while true do
        local wait = 500

        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)
			local dist = #(pedC - vector3(230.5, -1005.07, -99.0))
			if dist < 10 then
				wait = 0
				DrawMarker(2, vector3(230.5, -1005.07, -99.0 + 0.20), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
				if dist < 10 then
				--	ESX.ShowFloatingHelpNotification('Presiona ~r~E~w~ para cambiar de ped', vector3(230.5, -1005.07, -99.0 + 0.50))
					if dist < 2 then
						if IsControlJustPressed(0, 38) then
							TriggerEvent('esx_skin:openSaveableMenu')
						end
					end
				end
			end
        Citizen.Wait(wait)
    end
end)



-- Agregado
-- Agregado
Citizen.CreateThread(function() 
    while true do   
		
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
            local lock = GetVehicleDoorLockStatus(veh)

            if lock == 7 then
                SetVehicleDoorsLocked(veh, 2)
            end
                 
            local pedd = GetPedInVehicleSeat(veh, -1)

            if pedd then                   
                SetPedCanBeDraggedOut(pedd, false)
            end             
        end   
        Citizen.Wait(1)	
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -261.7065, -966.0638, 31.2243, true) <= 10 then 
			
			Drawing.draw3DText(-261.7065, -966.0638, 30.5243, "Centro de Trabajo [H]", 6, 1.0, 0.8)
		end

		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 230.5, -1005.07, -100.0, true) <= 10 then 
			Drawing.draw3DText(230.5, -1005.07, -100.0, "Cambiar Personaje [E]", 6, 1.0, 0.8)
		end



        
	end
end)


Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing

function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*3
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 150)
    SetTextDropshadow(1, 1, 1, 0, 255)
    SetTextEdge(2, 0, 0, 0, 220)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
-- Agregado
-- Agregado
-- Agregado

-- Ped spawn thread
local pedSpawned = {}
local pedPool = {}
CreateThread(function()
	while true do
		local sleep = 1500
        local playerPed = cache.ped
        local pos = GetEntityCoords(playerPed)
		for i=1, #Config.LoNpcLoco do
			local dist = #(pos - Config.LoNpcLoco[i].coords)
			if dist <= 20 and not pedSpawned[i] then
				pedSpawned[i] = true
                lib.requestModel(Config.LoNpcLoco[i].ped, 100)
                lib.requestAnimDict('mini@strip_club@idles@bouncer@base', 100)
				pedPool[i] = CreatePed(28, Config.LoNpcLoco[i].ped, Config.LoNpcLoco[i].coords.x, Config.LoNpcLoco[i].coords.y, Config.LoNpcLoco[i].coords.z-1, Config.LoNpcLoco[i].heading, false, false)
				FreezeEntityPosition(pedPool[i], true)
				SetEntityInvincible(pedPool[i], true)
				SetBlockingOfNonTemporaryEvents(pedPool[i], true)
				TaskPlayAnim(pedPool[i], 'mini@strip_club@idles@bouncer@base','base', 8.0, 0.0, -1, 1, 0, 0, 0, 0)
			elseif dist >= 21 and pedSpawned[i] then
				local model = GetEntityModel(pedPool[i])
				SetModelAsNoLongerNeeded(model)
				DeletePed(pedPool[i])
				SetPedAsNoLongerNeeded(pedPool[i])
                pedPool[i] = nil
				pedSpawned[i] = false
			end
		end
		Wait(sleep)
	end
end)

-------------------------------

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()																							
	while true do
		Citizen.Wait(1)
		player = GetPlayerPed(-1)
		coords = GetEntityCoords(player)
		
		for k, v in pairs(Config.Teleport) do
			if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.View then 
				ESX.Game.Utils.DrawText3D(vector3(v.Pos.x, v.Pos.y, v.Pos.z), v.Text, 1.2, 4)
				if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Activate then
					if IsControlJustPressed(0, 38) then
						if Config.OnlyCars then
							if IsPedInAnyVehicle(player, false) then
								if Config.Blackout then
									DoScreenFadeOut(1000)
									Citizen.Wait(1500)
								end
								SetEntityHeading(player, v.Heading)
								ESX.Game.Teleport(GetVehiclePedIsUsing(player), v.Posout)
								if Config.Blackout then
									DoScreenFadeIn(1500)
								end
							end
						else
							if not IsPedInAnyVehicle(player, false) then
								if Config.Animation then
									RequestAnimDict("timetable@jimmy@doorknock@")
									while not HasAnimDictLoaded("timetable@jimmy@doorknock@") do
									Citizen.Wait(1000)
									end
										
									Citizen.Wait(200)
									TaskPlayAnim(player,"timetable@jimmy@doorknock@","knockdoor_idle",1.0, 1.0, 3000, 9, 1.0, 0, 0, 0)
									Citizen.Wait(3000)
								end
								if Config.Blackout then
									DoScreenFadeOut(1000)
									Citizen.Wait(1500)
								end
								SetEntityHeading(player, v.Heading)
								ESX.Game.Teleport(player, v.Posout) 
								if Config.Blackout then
									DoScreenFadeIn(1500)
								end
							end
						end
					end
				end
			end
		end
    	end
end)


