local spawnedWeeds = 16
local spawnedWeedsCoke = 13
local weedPlants = {}
local weedCokePlants = {}
local isPickingUp, isProcessing = false, false
local estoy_farmeando = false
local OnDuty = false
local notengomashojas = true
local plantado = false
local plantado_coke = false


function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end  

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerPed = GetPlayerPed(-1)
		local coords = GetEntityCoords(playerPed)
		local coord = vector3(2224.91, 5576.86, 53.85)
		
		if GetDistanceBetweenCoords(coords, coord, true) < 15 and not plantado then
			plantado = true
			SpawnWeedPlants()
			--[[
			ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
				if cops >= 1 then
					SpawnWeedPlants()	
				else
					ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
					plantado = false
				end
			end)
			]]--			
		end
		
		if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedFieldCoke.coords, true) < 20 and not plantado_coke then
			plantado_coke = true
			SpawnWeedPlantsCoke()
			--[[
			ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
				if cops >= 1 then
					SpawnWeedPlantsCoke()	
				else
					ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ Vuelve mas tarde!")
					plantado_coke = false	
				end
			end)
			]]--
		end
	end
end) 

--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.RopaCoca.x, Config.RopaCoca.y, Config.RopaCoca.z, true) <= 1.0 then
			DisplayHelpText("Presiona ~INPUT_PICKUP~ para ~g~cambiarte de Ropa~w~.")
			if IsControlJustPressed(1, 38) then
				OpenCloakroomMenu()
			end
		end
		DrawMarker(27, Config.RopaCoca.x, Config.RopaCoca.y, Config.RopaCoca.z - 0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 0, 0, 100, 0, 0, 0, 0)
	end	
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerPed = GetPlayerPed(-1)
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedProcessing.coords, true) < 1 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('weed_processprompt'))
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
				isProcessing = true
				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessWeed()
						else
							OpenBuyLicenseMenu('weed_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'weed_processing')
				else
					ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
						if cops >= 1 then
							ESX.TriggerServerCallback('esx_drugs:cannabis_count', function(xCannabis)
								if xCannabis == 1 then
									ProcessWeed(xCannabis)
								else
									isProcessing = false
									ESX.ShowNotification('~r~No tienes mas Cannabis!')
								end	
							end)
						else
							isProcessing = false
							ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
						end
					end)	
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.CokeProcessing.coords, true) < 1 then
			if not isProcessing then
				Drawing.draw3DText(Config.ProcesoHoja.x, Config.ProcesoHoja.y, Config.ProcesoHoja.z - 1.5, 'Presiona ~g~[E]~w~ para Procesar', 1, 0.2, 0.1, 255, 255, 255, 215)
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
				if OnDuty then
				isProcessing = true
				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessWeed()
						else
							OpenBuyLicenseMenu('weed_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'weed_processing')
				else
					ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
						if cops >= 1 then
							ESX.TriggerServerCallback('esx_drugs:coke_count', function(Hojas)
								if Hojas == 1 then
									ProcessCoke(Hojas)
								else
									isProcessing = false
									ESX.ShowNotification('~r~No tienes mas Hojas!')
								end	
							end)
						else
							isProcessing = false
							ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
						end
					end)
				end
				else
					ESX.ShowNotification("~y~Debes ponerte la ropa de Laboratorio!")
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.ProcesoQuimico.coords, true) < 1 then
			if not isProcessing then
				Drawing.draw3DText(Config.ProcesoQuimico.x, Config.ProcesoQuimico.y, Config.ProcesoQuimico.z - 1.5, 'Presiona ~g~[E]~w~ para Procesar', 1, 0.2, 0.1, 255, 255, 255, 215)
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
				if OnDuty then
				isProcessing = true
				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessWeed()
						else
							OpenBuyLicenseMenu('weed_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'weed_processing')
				else
					ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
						if cops >= 1 then
							ESX.TriggerServerCallback('esx_drugs:quimicos', function(Hojas)
								if Hojas == 0 then
									ProcessQuimicos(1)
								elseif Hojas == 1 then
									isProcessing = false
									ESX.ShowNotification('~r~No tienes mas Hojas Procesadas!')
								elseif Hojas == 2 then
									isProcessing = false
									ESX.ShowNotification('~r~No tienes mas Quimicos!')
								else
									isProcessing = false
									ESX.ShowNotification('~r~No tienes mas Hojas ni Quimicos!')
								end	
							end)
						else
							isProcessing = false
							ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
						end
					end)
				end
				else
					ESX.ShowNotification("~y~Debes ponerte la ropa de Laboratorio!")
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.ProcesoCoca.coords, true) < 1 then
			if not isProcessing then
				Drawing.draw3DText(Config.ProcesoCoca.x, Config.ProcesoCoca.y, Config.ProcesoCoca.z - 1.5, 'Presiona ~g~[E]~w~ para Procesar', 1, 0.2, 0.1, 255, 255, 255, 215)
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
				if OnDuty then
				isProcessing = true
				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessWeed()
						else
							OpenBuyLicenseMenu('weed_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'weed_processing')
				else
					ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
						if cops >= 1 then
							ESX.TriggerServerCallback('esx_drugs:coca', function(tengo)
								if tengo == 0 then
									ProcessCoca(1)
								else
									isProcessing = false
									ESX.ShowNotification('~r~No tienes mas ClorHidrato de Coca!')
								end	
							end)
						else
							isProcessing = false
							ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
						end
					end)
				end
				else
					ESX.ShowNotification("~y~Debes ponerte la ropa de Laboratorio!")
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)
]]--

function ProcessCoca(Hojas)
	--isProcessing = true
	local playerPed = PlayerPedId()
	ESX.ShowNotification(_U('weed_processingstarted3'))
	--TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
	FreezeEntityPosition(playerPed, true)
	SetEntityHeading(playerPed, 222.03)
	--TaskPlayAnim(playerPed,'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 1.0, 1.0, 8000, 51, -1, false, false, false)
	ExecuteCommand('e mechanic4')
	if(Hojas <= 1) then
		Hojas = 0
	end
	
	local timeLeft = (Config.Delays.WeedProcessing * Hojas) / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1
		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.Config.ProcesoCoca.coords, false) > 4 then
			ESX.ShowNotification(_U('weed_processingtoofar2'))
			TriggerServerEvent('esx_drugs:cancelProcessing')
			TriggerServerEvent('esx_drugs:outofbound')
			break
		end
	end
	Citizen.Wait(8000)
	ExecuteCommand('cancel')
	--ClearPedTasksImmediately(playerPed)
	ESX.TriggerServerCallback('esx_drugs:check', function(can)
		TriggerServerEvent('esx_drugs:processCoca_zs', can)
	end)
	--TriggerServerEvent('esx_drugs:processCoca_zs')
	FreezeEntityPosition(playerPed, false)
	isProcessing = false
	
end

function ProcessCoke(Hojas)
	--isProcessing = true
	local playerPed = PlayerPedId()
	ESX.ShowNotification(_U('weed_processingstarted2'))
	--TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
	FreezeEntityPosition(playerPed, true)
	SetEntityHeading(playerPed, 39.14)
	--TaskPlayAnim(playerPed,'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 1.0, 1.0, 8000, 51, -1, false, false, false)
	ExecuteCommand('e mechanic4')
	if(Hojas <= 1) then
		Hojas = 0
	end
	
	local timeLeft = (Config.Delays.WeedProcessing * Hojas) / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1
	
		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.CokeProcessing.coords, false) > 4 then
			ESX.ShowNotification(_U('weed_processingtoofar2'))
			TriggerServerEvent('esx_drugs:cancelProcessing')
			TriggerServerEvent('esx_drugs:outofbound')
			break
		end
	end
	Citizen.Wait(8000)
	ExecuteCommand('cancel')
	--ClearPedTasksImmediately(playerPed)
	ESX.TriggerServerCallback('esx_drugs:check', function(can)
		TriggerServerEvent('esx_drugs:processCoke_zs', can)
	end)
	--TriggerServerEvent('esx_drugs:processCoke_zs')
	FreezeEntityPosition(playerPed, false)
	isProcessing = false
	
end

function ProcessQuimicos(Hojas)
	--isProcessing = true
	local playerPed = PlayerPedId()
	ESX.ShowNotification(_U('weed_processingstarted3'))
	--TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
	FreezeEntityPosition(playerPed, true)
	SetEntityHeading(playerPed, 309.8)
	--TaskPlayAnim(playerPed,'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 1.0, 1.0, 8000, 51, -1, false, false, false)
	ExecuteCommand('e mechanic4')
	if(Hojas <= 1) then
		Hojas = 0
	end
	
	local timeLeft = (Config.Delays.WeedProcessing * Hojas) / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1
	
		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.ProcesoQuimico.coords, false) > 4 then
			ESX.ShowNotification(_U('weed_processingtoofar2'))
			TriggerServerEvent('esx_drugs:cancelProcessing')
			TriggerServerEvent('esx_drugs:outofbound')
			break
		end
	end
	Citizen.Wait(8000)
	ExecuteCommand('cancel')
	--ClearPedTasksImmediately(playerPed)
	
	ESX.TriggerServerCallback('esx_drugs:check', function(can)
		TriggerServerEvent('esx_drugs:processClorHidrato_zs', can)
	end)
	--TriggerServerEvent('esx_drugs:processClorHidrato_zs')
	FreezeEntityPosition(playerPed, false)
	isProcessing = false
	
end

function ProcessWeed(xCannabis)
	local playerPed = PlayerPedId()
	ESX.ShowNotification(_U('weed_processingstarted'))
	FreezeEntityPosition(playerPed, true)
	SetEntityHeading(playerPed, 177.91)
	ExecuteCommand('e mechanic4')
	if(xCannabis <= 1) then
		xCannabis = 0
	end
	
	local timeLeft = (Config.Delays.WeedProcessing * xCannabis) / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1
	
		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.WeedProcessing.coords, false) > 4 then
			ESX.ShowNotification(_U('weed_processingtoofar'))
			TriggerServerEvent('esx_drugs:cancelProcessing')
			TriggerServerEvent('esx_drugs:outofbound')
			break
		end
	end
	Citizen.Wait(8000)
	--ExecuteCommand('cancel')
	TriggerEvent('dpemotes:cancel')
	
	ESX.TriggerServerCallback('esx_drugs:check', function(can)
		TriggerServerEvent('esx_drugs:processCannabis_zs', can)
	end)
	--TriggerServerEvent('esx_drugs:processCannabis_zs')
	FreezeEntityPosition(playerPed, false)
	isProcessing = false
	
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #weedPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(weedPlants[i]), false) < 1 and not isPickingUp then
				nearbyObject, nearbyID = weedPlants[i], i
				local x, y, z = table.unpack(GetEntityCoords(weedPlants[i]))
				Drawing.draw3DText(x,y,z - 0.6, 'Presiona ~g~[E]~w~ para Procesar', 1, 0.2, 0.1, 255, 255, 255, 215)
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then
			if IsControlJustReleased(0, 38) and not isPickingUp then
				isPickingUp = true
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

						Citizen.Wait(2000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(weedPlants, nearbyID)
						
						ESX.TriggerServerCallback('esx_drugs:check', function(can)
							TriggerServerEvent('esx_drugs:pickedUpCannabis_zs', can)
						end)
						
						Citizen.Wait(6000)
						isPickingUp = false
						
						spawnedWeeds = spawnedWeeds - 1
						
						if spawnedWeeds == 0 then
							spawnedWeeds = 16
							SpawnWeedPlants()
							--[[
							ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
								if cops >= 1 then
									SpawnWeedPlants()
								else
									ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
								end
							end)
							]]--							
						end	
			end	
		else
			Citizen.Wait(500)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID
		

		for i=1, #weedCokePlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(weedCokePlants[i]), false) < 1 and not isPickingUp then
				nearbyObject, nearbyID = weedCokePlants[i], i
				local x, y, z = table.unpack(GetEntityCoords(weedCokePlants[i]))
				Drawing.draw3DText(x,y,z, 'Presiona ~g~[E]~w~ para Procesar', 1, 0.2, 0.1, 255, 255, 255, 215)
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then
			if not isPickingUp then
				--ESX.ShowHelpNotification(_U('weed_processpromptCoke'))
				
			end

			if IsControlJustReleased(0, 38) and not isPickingUp then
				isPickingUp = true
				--ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
					--if cops >= 1 then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

						Citizen.Wait(2000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(weedCokePlants, nearbyID)
						spawnedWeedsCoke = spawnedWeedsCoke - 1
						if spawnedWeedsCoke == 0 then
							spawnedWeedsCoke = 13
							SpawnWeedPlantsCoke()
							--[[
							ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
								if cops >= 1 then
									SpawnWeedPlantsCoke()
								else
									ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
								end
							end)	
							]]--
						end
						
						ESX.TriggerServerCallback('esx_drugs:check', function(can)
							TriggerServerEvent('esx_drugs:pickedUpCoke_zs', can)
						end)
						--TriggerServerEvent('esx_drugs:pickedUpCoke_zs')
						Citizen.Wait(6000)
						isPickingUp = false
					--else
						--isPickingUp = false
						--ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
					--end
				--end)
			end	
		else
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(weedPlants) do
			ESX.Game.DeleteObject(v)
		end
		for k, v in pairs(weedCokePlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnWeedPlants()		
	for i=1, #Config.spawnLocations, 1 do	
		local coord = vector3(Config.spawnLocations[i].x, Config.spawnLocations[i].y, Config.spawnLocations[i].z)
		ESX.Game.SpawnLocalObject('prop_weed_02', coord, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)
			table.insert(weedPlants, obj)
		end)
	end
end

function SpawnWeedPlantsCoke()
	for i=1, #Config.spawnCoke, 1 do	
		local coord = vector3(Config.spawnCoke[i].x, Config.spawnCoke[i].y, Config.spawnCoke[i].z)
		ESX.Game.SpawnLocalObject('prop_plant_fern_02a', coord, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)
			table.insert(weedCokePlants, obj)
		end)
	end	
end

function ValidateWeedCoord(plantCoord)
	if spawnedWeeds > 0 then
		local validate = true

		for k, v in pairs(weedPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.WeedField.coords, false) > 20 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function ValidateWeedCokeCoord(plantCoord)
	if spawnedWeedsCoke > 0 then
		local validate = true

		for k, v in pairs(weedCokePlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 2.5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.WeedFieldCoke.coords, false) > 20 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateWeedCokeCoords()
	while true do
		Citizen.Wait(1)

		local weedCoordCokeX, weedCoordCokeY

		math.randomseed(GetGameTimer())
		local modX = math.random(-6, 6)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-10, 10)

		weedCoordCokeX = Config.CircleZones.WeedFieldCoke.coords.x + modX
		weedCoordCokeY = Config.CircleZones.WeedFieldCoke.coords.y + modY

		--local coordZ = GetCoordZ(weedCoordCokeX, weedCoordCokeY)
		local coord = vector3(weedCoordCokeX, weedCoordCokeY, 79.34)

		if ValidateWeedCokeCoord(coord) then
			return coord
		end

	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end

function OpenCloakroomMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = 'Vestuario Clandestino',
		align    = 'bottom-right',
		elements = {
			{label = 'Ropa Civil', value = 'citizen_wear'},
			{label = 'Ropa Laboratorio', value = 'coca_wear'},
	}}, function(data, menu)
		
		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				OnDuty = false
			end)
		elseif data.current.value == 'coca_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms['coca'].male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms['coca'].female)
				end
				OnDuty = true
			end)
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

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


