--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- ORIGINAL SCRIPT BY Marcio FOR CFX-ESX
-- Script serveur No Brain 
-- www.nobrain.org
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)
--------------------------------------------------------------------------------
-- NE RIEN MODIFIER
--------------------------------------------------------------------------------
local namezone = "Delivery"
local namezonenum = 0
local namezoneregion = 0
local MissionRegion = 0
local viemaxvehicule = 1000
local argentretire = 0
local livraisonTotalPaye = 0
local livraisonnombre = 0
local MissionRetourCamion = false
local MissionNum = 0
local MissionLivraison = false
local isInService = false
local GUI                     = {}
GUI.Time                      = 0
local hasAlreadyEnteredMarker = false
local lastZone                = nil
local Blips                   = {}
local camionsito = {}

local plaquevehicule = ""
local plaquevehiculeactuel = ""
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local trailer_atado, camion_trailer
local timeLeft = 60
local camionConTrailer = false
local camion = false
--------------------------------------------------------------------------------
--[[
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)
]]
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do
	Wait(0)
		if not IsVehicleAttachedToTrailer(camion_trailer) and camionConTrailer then
			DrawAdvancedNativeText(1.010, 0.892, 0.005, 0.0028, 0.464, "TIEMPO: ~r~"..tostring(timeLeft), 255, 255, 255, 255, 0, 0)
			TriggerEvent("mt:missiontext", 'SINO VUELVES A ENGANCHAR EL TRAILER, ~r~PERDERAS $3.000!', 100)
			if timeLeft == 0 then
				camionConTrailer = false
				timeLeft = 60
				DeleteEntity(trailer_atado)
			end	
		end
		if IsVehicleAttachedToTrailer(camion_trailer) and camionConTrailer then
			timeLeft = 60
		end
	end
end)

RegisterNetEvent("mt:missiontext") -- credits: https://github.com/schneehaze/fivem_missiontext/blob/master/MissionText/missiontext.lua
AddEventHandler("mt:missiontext", function(text, time)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString(text)
		DrawSubtitleTimed(time, 1)
end)

function DrawAdvancedNativeText(x,y,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

--tiempo
Citizen.CreateThread(function()
    while true do
	Wait(0)
		if not IsVehicleAttachedToTrailer(camion_trailer) and timeLeft > 0 and camionConTrailer then
			timeLeft = timeLeft - 1
			Wait(1000)
		end	
	end	
end)

-- MENUS
function MenuCloakRoom()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title    = _U('cloakroom'),
			align    = 'bottom-right',
			elements = {
				{label = _U('job_wear'), value = 'job_wear'},
				{label = _U('citizen_wear'), value = 'citizen_wear'}
			}
		},
		function(data, menu)
			if data.current.value == 'citizen_wear' then
				isInService = false
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
	    			TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end
			if data.current.value == 'job_wear' then
				isInService = true
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
	    			if skin.sex == 0 then
	    				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
					else
	    				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
					end
				end)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function MenuVehicleSpawner()
	local elements = {}

	for i=1, #Config.Trucks, 1 do
		table.insert(elements, {label = GetLabelText(GetDisplayNameFromVehicleModel(Config.Trucks[i])), value = Config.Trucks[i]})
	end


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehiclespawner',
		{
			title    = _U('vehiclespawner'),
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
		--SpawnPoint = vector4(145.7359 ,-3204.5605, 5.0, 270.0)
		if ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 10.0) then
					local vehicle2 = GetHashKey(data.current.value)
					RequestModel(vehicle2)
					while not HasModelLoaded(vehicle2) do
						Wait(1)
					end
					local vehicle = CreateVehicle(vehicle2, Config.Zones.VehicleSpawnPoint.Pos.x,Config.Zones.VehicleSpawnPoint.Pos.y,Config.Zones.VehicleSpawnPoint.Pos.z, 270.0, true, false)
					camionsito = vehicle
					--ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
					platenum = math.random(10000, 99999)
					SetVehicleNumberPlateText(vehicle, "WAL"..platenum) 
					exports["LegacyFuel"]:SetFuel(vehicle, 100)
					exports["esx_carlock"]:SetCamion(vehicle)
					MissionLivraisonSelect()
					plaquevehicule = "WAL"..platenum
					if data.current.value == 'phantom' then					
						local trailerrnd = math.random(1, #Config.Trailers)
						local trailer2 = GetHashKey(Config.Trailers[trailerrnd])
						RequestModel(trailer2)
						while not HasModelLoaded(trailer2) do
							Wait(1)
						end
						local trailer = CreateVehicle(trailer2, Config.Zones.VehicleSpawnPoint.Pos.x,Config.Zones.VehicleSpawnPoint.Pos.y,Config.Zones.VehicleSpawnPoint.Pos.z, 270.0, true, false)
						--ESX.Game.SpawnVehicle("trailers2", Config.Zones.VehicleSpawnPoint.Pos, 270.0, function(trailer)
					    AttachVehicleToTrailer(vehicle, trailer, 1.1)
						trailer_atado = trailer
						camion_trailer = vehicle
						camionConTrailer = true
						camion = true
					--end)
					else
						camion = false
					end				
				TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)   
			--end)
			menu.close()
		else
			ESX.ShowNotification('~y~Espera a que se desocupe la zona!')
		end	
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function IsATruck()
	local isATruck = false
	local playerPed = GetPlayerPed(-1)
	for i=1, #Config.Trucks, 1 do
		if IsVehicleModel(GetVehiclePedIsUsing(playerPed), Config.Trucks[i]) then
			isATruck = true
			break
		end
	end
	return isATruck
end

function IsJobTrucker()
	if PlayerData ~= nil then
		local isJobTrucker = false
		if PlayerData.job ~= nil and PlayerData.job.name == 'trucker' then
			isJobTrucker = true
		end
		return isJobTrucker
	end
end

function IsJobBoss()
	if PlayerData ~= nil then
		local isJobBoss = false
		if PlayerData.job ~= nil and PlayerData.job.name == 'trucker' and PlayerData.grade_name == 'boss' then
			isJobBoss = true
		end
		return isJobBoss
	end
end

function IsGradeBoss()
    if PlayerData ~= nil then
        local IsGradeBoss = false
        if PlayerData.job.grade_name == 'boss' then
            IsGradeBoss = true
        end
        return IsGradeBoss
    end
end

AddEventHandler('esx_truckerjob:hasEnteredMarker', function(zone)

	local playerPed = GetPlayerPed(-1)

	if zone == 'CloakRoom' then
        CurrentActionMsg  = "Presiona ~INPUT_PICKUP~ para ~g~ABRIR MENU."
		CurrentAction = 'cloakroom'
	end
	
	if zone == 'Boss' then
        CurrentActionMsg  = "Presiona ~INPUT_PICKUP~ para ~g~ABRIR MENU JEFE."
		CurrentAction = 'boss'
	end
	
	if zone == 'VehicleSpawner' then
		if isInService and IsJobTrucker() then
			--TEXTO 3D
			--ESX.Game.Utils.DrawText3D(Config.Zones.VehicleSpawner.Pos, "Presiona ~g~[E]~w~ para sacar un CAMION!", 1.0)
			--CurrentAction = 'hint'
            CurrentActionMsg  = "Presiona ~INPUT_PICKUP~ para ~g~ABRIR MENU."
			CurrentAction = 'vehiclespawner'
		end
	end

	if zone == namezone then
		if isInService and MissionLivraison and MissionNum == namezonenum and MissionRegion == namezoneregion and IsJobTrucker() then
			if IsPedSittingInAnyVehicle(playerPed) and IsATruck() then
				VerifPlaqueVehiculeActuel()
				
				if plaquevehicule == plaquevehiculeactuel then
					if Blips['delivery'] ~= nil then
						RemoveBlip(Blips['delivery'])
						Blips['delivery'] = nil
					end

					CurrentAction     = 'delivery'
                    CurrentActionMsg  = _U('delivery')
				else
					CurrentAction = 'hint'
                    CurrentActionMsg  = _U('not_your_truck')
				end
			else
				CurrentAction = 'hint'
                CurrentActionMsg  = _U('not_your_truck2')
			end
		end
	end

	if zone == 'AnnulerMission' then
		if (MissionLivraison or MissionRetourCamion) and IsJobTrucker() and isInService then
			
			CurrentAction     = 'retourcamionannulermission'
            CurrentActionMsg  = _U('cancel_mission')
				--ESX.ShowNotification('EL VEHICULO NO EXISTE!')
			--[[
			if IsPedSittingInAnyVehicle(playerPed) and IsATruck() then
				VerifPlaqueVehiculeActuel()

                TriggerServerEvent('esx:clientLog', "3'" .. json.encode(plaquevehicule) .. "' '" .. json.encode(plaquevehiculeactuel) .. "'")
				
				if plaquevehicule == plaquevehiculeactuel then
                    CurrentAction     = 'retourcamionannulermission'
                    CurrentActionMsg  = _U('cancel_mission')
				else
					CurrentAction = 'hint'
                    CurrentActionMsg  = _U('not_your_truck')
				end
			else
                CurrentAction     = 'retourcamionperduannulermission'
			end
			]]
		end
	end

	if zone == 'RetourCamion' then
		if isInService and MissionRetourCamion and IsJobTrucker() then
			if IsPedSittingInAnyVehicle(playerPed) and IsATruck() then
				VerifPlaqueVehiculeActuel()

				if plaquevehicule == plaquevehiculeactuel then
                    CurrentAction     = 'retourcamion'
					CurrentActionMsg  = _U('devuelvo_camion')
				else
                    CurrentAction     = 'hint'
                    CurrentActionMsg  = _U('not_your_truck')
				end
			else
                CurrentAction = 'hint'
                CurrentActionMsg  = _U('not_your_truck2')
			end
		end
	end

end)

AddEventHandler('esx_truckerjob:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()    
    CurrentAction = nil
    CurrentActionMsg = ''
end)

function nouvelledestination()
	livraisonnombre = livraisonnombre+1
	--livraisonTotalPaye = livraisonTotalPaye+destination.Paye
	--print(destination.paye)
	if livraisonnombre >= Config.MaxDelivery then
		ESX.TriggerServerCallback('1974_drogas:check', function(serial)
			TriggerServerEvent('esx_truckerjob:drop_caja', destination.Paye, serial)
			print(destination.paye)
			MissionLivraisonStopRetourDepot()
		end)
	else

		livraisonsuite = math.random(0, 100)
		
		if livraisonsuite <= 10 then
			MissionLivraisonStopRetourDepot()
		elseif livraisonsuite <= 99 then
			MissionLivraisonSelect()
		elseif livraisonsuite <= 100 then
			if MissionRegion == 1 then
				MissionRegion = 2
			elseif MissionRegion == 2 then
				MissionRegion = 1
			end
			MissionLivraisonSelect()	
		end
	end
end

function retourcamion_oui()
	if Blips['delivery'] ~= nil then
		RemoveBlip(Blips['delivery'])
		Blips['delivery'] = nil
	end
	
	MissionRetourCamion = false
	livraisonnombre = 0
	MissionRegion = 0
	
	donnerlapaye()
end

function retourcamion_non()
	
	if livraisonnombre >= Config.MaxDelivery then
		ESX.ShowNotification(_U('need_it'))
	else
		ESX.ShowNotification(_U('ok_work'))
		nouvelledestination()
	end
end

function retourcamionperdu_oui()
	if Blips['delivery'] ~= nil then
		RemoveBlip(Blips['delivery'])
		Blips['delivery'] = nil
	end
	--[[
	if Blips['annulermission'] ~= nil then
		RemoveBlip(Blips['annulermission'])
		Blips['annulermission'] = nil
	end
	]]
	MissionRetourCamion = false
	livraisonnombre = 0
	MissionRegion = 0
	
	donnerlapayesanscamion()
end

function retourcamionperdu_non()
	ESX.ShowNotification(_U('scared_me'))
end

function retourcamionannulermission_oui()
	if DoesEntityExist(camionsito) then
		ESX.ShowNotification('~r~EL CAMION TODAVIA NO FUE INCAUTADO!')
	else
		if Blips['delivery'] ~= nil then
			RemoveBlip(Blips['delivery'])
			Blips['delivery'] = nil
		end
		
		MissionLivraison = false
		MissionRetourCamion = false
		livraisonnombre = 0
		MissionRegion = 0
	
		--donnerlapaye()
		ESX.ShowNotification("~r~Mision Anulada!")
	end

end

function retourcamionannulermission_non()	
	ESX.ShowNotification(_U('resume_delivery'))
end

function retourcamionperduannulermission_oui()
	if Blips['delivery'] ~= nil then
		RemoveBlip(Blips['delivery'])
		Blips['delivery'] = nil
	end
	--[[
	if Blips['annulermission'] ~= nil then
		RemoveBlip(Blips['annulermission'])
		Blips['annulermission'] = nil
	end
	]]
	MissionLivraison = false
	livraisonnombre = 0
	MissionRegion = 0
	
	donnerlapayesanscamion()
end

function retourcamionperduannulermission_non()	
	ESX.ShowNotification(_U('resume_delivery'))
end

function round(num, numDecimalPlaces)
    local mult = 5^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function donnerlapaye()
	ped = GetPlayerPed(-1)
	vehicle = GetVehiclePedIsIn(ped, false)
	--[[
	vievehicule = GetVehicleEngineHealth(vehicle)
	calculargentretire = round(viemaxvehicule-vievehicule)
	
	if calculargentretire <= 0 then
		argentretire = 0
	else
		argentretire = calculargentretire
	end
	]]
	if camion then
		if not IsVehicleAttachedToTrailer(camion_trailer) then
			ESX.ShowNotification('Perdiste el Trailer! Te descontamos ~r~$3.000.-')
			TriggerServerEvent("esx_truckerjob:perdioplata", 3000)
			if camionConTrailer then
				camionConTrailer = false
				timeLeft = 60
				DeleteEntity(trailer_atado)
			end
		else
			if camionConTrailer then
				camionConTrailer = false
				timeLeft = 60
			end	
		end
	end	
    DeleteEntity(vehicle)
	
	TriggerServerEvent("esx_truckerjob:pay_zs")
	
	--[[
	local amount = livraisonTotalPaye-argentretire
	
	if vievehicule >= 1 then
		if livraisonTotalPaye == 0 then
			ESX.ShowNotification(_U('not_delivery'))
			ESX.ShowNotification(_U('pay_repair'))
			ESX.ShowNotification(_U('repair_minus')..argentretire)
			TriggerServerEvent("esx_truckerjob:pay_zs", amount)
			livraisonTotalPaye = 0
		else
			if argentretire <= 0 then
				ESX.ShowNotification(_U('shipments_plus')..livraisonTotalPaye)
				TriggerServerEvent("esx_truckerjob:pay_zs", amount)
				livraisonTotalPaye = 0
			else
				ESX.ShowNotification(_U('shipments_plus')..livraisonTotalPaye)
				ESX.ShowNotification(_U('repair_minus')..argentretire)
					TriggerServerEvent("esx_truckerjob:pay_zs", amount)
				livraisonTotalPaye = 0
			end
		end
	else
		if livraisonTotalPaye ~= 0 and amount <= 0 then
			ESX.ShowNotification(_U('truck_state'))
			livraisonTotalPaye = 0
		else
			if argentretire <= 0 then
				ESX.ShowNotification(_U('shipments_plus')..livraisonTotalPaye)
					TriggerServerEvent("esx_truckerjob:pay_zs", amount)
				livraisonTotalPaye = 0
			else
				ESX.ShowNotification(_U('shipments_plus')..livraisonTotalPaye)
				ESX.ShowNotification(_U('repair_minus')..argentretire)
				TriggerServerEvent("esx_truckerjob:pay_zs", amount)
				livraisonTotalPaye = 0
			end
		end
	end
	]]
end

function donnerlapayesanscamion()
	ped = GetPlayerPed(-1)
	argentretire = Config.TruckPrice
	
	-- donne paye
	local amount = livraisonTotalPaye-argentretire
	
	if livraisonTotalPaye == 0 then
		ESX.ShowNotification(_U('no_delivery_no_truck'))
		ESX.ShowNotification(_U('truck_price')..argentretire)
					TriggerServerEvent("esx_truckerjob:pay_zs", amount)
		livraisonTotalPaye = 0
	else
		if amount >= 1 then
			ESX.ShowNotification(_U('shipments_plus')..livraisonTotalPaye)
			ESX.ShowNotification(_U('truck_price')..argentretire)
					TriggerServerEvent("esx_truckerjob:pay_zs", amount)
			livraisonTotalPaye = 0
		else
			ESX.ShowNotification(_U('truck_state'))
			livraisonTotalPaye = 0
		end
	end
end

-- Key Controls
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(0)

        if CurrentAction ~= nil then

        	SetTextComponentFormat('STRING')
        	AddTextComponentString(CurrentActionMsg)
       		DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustReleased(0, 38) and IsJobTrucker() then
				
				if CurrentAction == 'cloakroom' then
                    MenuCloakRoom()
                end	
				
				if CurrentAction == 'boss' and IsGradeBoss() then

					local options = {
						wash      = true,
						employees = false,
						grades = false,
					}

					ESX.UI.Menu.CloseAll()

					TriggerEvent('esx_society:openBossMenu_zs', 'trucker', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end,options)
				end
				
                if CurrentAction == 'delivery' then
                    nouvelledestination()
                end
				
				if CurrentAction == 'vehiclespawner' then
					if MissionRetourCamion or MissionLivraison then
						ESX.ShowNotification("~r~YA TE DIMOS UN CAMION! BUSCALO Y LLAMA UN MECANICO.")
					else
						if Config.Licencia then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriversLicense)
								if hasDriversLicense then
									MenuVehicleSpawner()
								else
									ESX.ShowNotification('~r~NO TIENES LICENCIA DE CAMION! ~W~Debes sacarte la Licencia de Camion!')
								end
							end, GetPlayerServerId(PlayerId()), 'drive_truck')
						else
							MenuVehicleSpawner()
						end
					end
                end

                if CurrentAction == 'retourcamion' then
                    retourcamion_oui()
                end

                if CurrentAction == 'retourcamionperdu' then
                    retourcamionperdu_oui()
                end

                if CurrentAction == 'retourcamionannulermission' then
                    retourcamionannulermission_oui()
                end

                if CurrentAction == 'retourcamionperduannulermission' then
                    retourcamionperduannulermission_oui()
                end

                CurrentAction = nil
            end

        end

    end
end)

-- DISPLAY MISSION MARKERS AND MARKERS
Citizen.CreateThread(function()
	while true do
		Wait(0)
		
		if IsJobTrucker() then
			local coords = GetEntityCoords(GetPlayerPed(-1))
			if MissionLivraison then
				DrawMarker(destination.Type, destination.Pos.x, destination.Pos.y, destination.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, destination.Size.x, destination.Size.y, destination.Size.z, destination.Color.r, destination.Color.g, destination.Color.b, 100, false, true, 2, false, false, false, false)
				DrawMarker(Config.Livraison.AnnulerMission.Type, Config.Livraison.AnnulerMission.Pos.x, Config.Livraison.AnnulerMission.Pos.y, Config.Livraison.AnnulerMission.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Livraison.AnnulerMission.Size.x, Config.Livraison.AnnulerMission.Size.y, Config.Livraison.AnnulerMission.Size.z, Config.Livraison.AnnulerMission.Color.r, Config.Livraison.AnnulerMission.Color.g, Config.Livraison.AnnulerMission.Color.b, 100, false, true, 2, false, false, false, false)
			elseif MissionRetourCamion then
				DrawMarker(destination.Type, destination.Pos.x, destination.Pos.y, destination.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, destination.Size.x, destination.Size.y, destination.Size.z, destination.Color.r, destination.Color.g, destination.Color.b, 100, false, true, 2, false, false, false, false)
				DrawMarker(Config.Livraison.AnnulerMission.Type, Config.Livraison.AnnulerMission.Pos.x, Config.Livraison.AnnulerMission.Pos.y, Config.Livraison.AnnulerMission.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Livraison.AnnulerMission.Size.x, Config.Livraison.AnnulerMission.Size.y, Config.Livraison.AnnulerMission.Size.z, Config.Livraison.AnnulerMission.Color.r, Config.Livraison.AnnulerMission.Color.g, Config.Livraison.AnnulerMission.Color.b, 100, false, true, 2, false, false, false, false)
			end

		
			for k,v in pairs(Config.Zones) do
				if isInService and v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, false, false, false)
				end
			end
			for k,v in pairs(Config.Boss) do
				if IsGradeBoss() and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, false, false, false)
				end
			end
			for k,v in pairs(Config.Cloakroom) do
				if v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end	
		end
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		
		Wait(0)
		
		if IsJobTrucker() then

			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end
			
			for k,v in pairs(Config.Cloakroom) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end
			
			if IsGradeBoss() then
				for k,v in pairs(Config.Boss) do
					if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
						isInMarker  = true
						currentZone = k
					end
				end
			end
			
			for k,v in pairs(Config.Livraison) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			if isInMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = true
				lastZone                = currentZone
				TriggerEvent('esx_truckerjob:hasEnteredMarker', currentZone)
			end

			if not isInMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
				TriggerEvent('esx_truckerjob:hasExitedMarker', lastZone)
			end

		end

	end
end)

-- CREATE BLIPS
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.Cloakroom.CloakRoom.Pos.x, Config.Cloakroom.CloakRoom.Pos.y, Config.Cloakroom.CloakRoom.Pos.z)
  
	SetBlipSprite (blip, 67)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.2)
	SetBlipColour (blip, 5)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('blip_job'))
	EndTextCommandSetBlipName(blip)
end)

-------------------------------------------------
-- Fonctions
-------------------------------------------------
-- Fonction selection nouvelle mission livraison
function MissionLivraisonSelect()
    --TriggerServerEvent('esx:clientLog', "MissionLivraisonSelect num")
    --TriggerServerEvent('esx:clientLog', MissionRegion)
	if MissionRegion == 0 then

            --TriggerServerEvent('esx:clientLog', "MissionLivraisonSelect 1")
		MissionRegion = math.random(1,2)
	end
	
	if MissionRegion == 1 then -- Los santos
            --TriggerServerEvent('esx:clientLog', "MissionLivraisonSelect 2")
		MissionNum = math.random(1, 17)
	
		if MissionNum == 1 then destination = Config.Livraison.Delivery1LS namezone = "Delivery1LS" namezonenum = 1 namezoneregion = 1
		elseif MissionNum == 2 then destination = Config.Livraison.Delivery2LS namezone = "Delivery2LS" namezonenum = 2 namezoneregion = 1
		elseif MissionNum == 3 then destination = Config.Livraison.Delivery3LS namezone = "Delivery3LS" namezonenum = 3 namezoneregion = 1
		elseif MissionNum == 4 then destination = Config.Livraison.Delivery4LS namezone = "Delivery4LS" namezonenum = 4 namezoneregion = 1
		elseif MissionNum == 5 then destination = Config.Livraison.Delivery5LS namezone = "Delivery5LS" namezonenum = 5 namezoneregion = 1
		elseif MissionNum == 6 then destination = Config.Livraison.Delivery6LS namezone = "Delivery6LS" namezonenum = 6 namezoneregion = 1
		elseif MissionNum == 7 then destination = Config.Livraison.Delivery7LS namezone = "Delivery7LS" namezonenum = 7 namezoneregion = 1
		elseif MissionNum == 8 then destination = Config.Livraison.Delivery8LS namezone = "Delivery8LS" namezonenum = 8 namezoneregion = 1
		elseif MissionNum == 9 then destination = Config.Livraison.Delivery9LS namezone = "Delivery9LS" namezonenum = 9 namezoneregion = 1
		elseif MissionNum == 10 then destination = Config.Livraison.Delivery10LS namezone = "Delivery10LS" namezonenum = 10 namezoneregion = 1
		elseif MissionNum == 11 then destination = Config.Livraison.Delivery11LS namezone = "Delivery11LS" namezonenum = 11 namezoneregion = 1
		elseif MissionNum == 12 then destination = Config.Livraison.Delivery12LS namezone = "Delivery12LS" namezonenum = 12 namezoneregion = 1
		elseif MissionNum == 13 then destination = Config.Livraison.Delivery13LS namezone = "Delivery13LS" namezonenum = 13 namezoneregion = 1
		elseif MissionNum == 14 then destination = Config.Livraison.Delivery14LS namezone = "Delivery14LS" namezonenum = 14 namezoneregion = 1
		elseif MissionNum == 15 then destination = Config.Livraison.Delivery15LS namezone = "Delivery15LS" namezonenum = 15 namezoneregion = 1
		elseif MissionNum == 16 then destination = Config.Livraison.Delivery16LS namezone = "Delivery16LS" namezonenum = 16 namezoneregion = 1
		elseif MissionNum == 17 then destination = Config.Livraison.Delivery17LS namezone = "Delivery17LS" namezonenum = 17 namezoneregion = 1
		--elseif MissionNum == 18 then destination = Config.Livraison.Delivery18LS namezone = "Delivery18LS" namezonenum = 18 namezoneregion = 1
		--elseif MissionNum == 19 then destination = Config.Livraison.Delivery19LS namezone = "Delivery19LS" namezonenum = 19 namezoneregion = 1
		end
		
	elseif MissionRegion == 2 then -- Blaine County

        --TriggerServerEvent('esx:clientLog', "MissionLivraisonSelect 3")
		MissionNum = math.random(1, 17)
	
		if MissionNum == 1 then destination = Config.Livraison.Delivery1BC namezone = "Delivery1BC" namezonenum = 1 namezoneregion = 2
		elseif MissionNum == 2 then destination = Config.Livraison.Delivery2BC namezone = "Delivery2BC" namezonenum = 2 namezoneregion = 2
		elseif MissionNum == 3 then destination = Config.Livraison.Delivery3BC namezone = "Delivery3BC" namezonenum = 3 namezoneregion = 2
		elseif MissionNum == 4 then destination = Config.Livraison.Delivery4BC namezone = "Delivery4BC" namezonenum = 4 namezoneregion = 2
		elseif MissionNum == 5 then destination = Config.Livraison.Delivery5BC namezone = "Delivery5BC" namezonenum = 5 namezoneregion = 2
		elseif MissionNum == 6 then destination = Config.Livraison.Delivery6BC namezone = "Delivery6BC" namezonenum = 6 namezoneregion = 2
		elseif MissionNum == 7 then destination = Config.Livraison.Delivery7BC namezone = "Delivery7BC" namezonenum = 7 namezoneregion = 2
		elseif MissionNum == 8 then destination = Config.Livraison.Delivery8BC namezone = "Delivery8BC" namezonenum = 8 namezoneregion = 2
		elseif MissionNum == 9 then destination = Config.Livraison.Delivery9BC namezone = "Delivery9BC" namezonenum = 9 namezoneregion = 2
		elseif MissionNum == 10 then destination = Config.Livraison.Delivery10BC namezone = "Delivery10BC" namezonenum = 10 namezoneregion = 2
		elseif MissionNum == 11 then destination = Config.Livraison.Delivery11BC namezone = "Delivery11BC" namezonenum = 11 namezoneregion = 2
		elseif MissionNum == 12 then destination = Config.Livraison.Delivery12BC namezone = "Delivery12BC" namezonenum = 12 namezoneregion = 2
		elseif MissionNum == 13 then destination = Config.Livraison.Delivery13BC namezone = "Delivery13BC" namezonenum = 13 namezoneregion = 2
		elseif MissionNum == 14 then destination = Config.Livraison.Delivery14BC namezone = "Delivery14BC" namezonenum = 14 namezoneregion = 2
		elseif MissionNum == 15 then destination = Config.Livraison.Delivery15BC namezone = "Delivery15BC" namezonenum = 15 namezoneregion = 2
		elseif MissionNum == 16 then destination = Config.Livraison.Delivery16BC namezone = "Delivery16BC" namezonenum = 16 namezoneregion = 2
		elseif MissionNum == 17 then destination = Config.Livraison.Delivery17BC namezone = "Delivery17BC" namezonenum = 17 namezoneregion = 2
		--elseif MissionNum == 18 then destination = Config.Livraison.Delivery18BC namezone = "Delivery18BC" namezonenum = 18 namezoneregion = 2
		--elseif MissionNum == 19 then destination = Config.Livraison.Delivery19BC namezone = "Delivery19BC" namezonenum = 19 namezoneregion = 2
		end
		
	end
	
	MissionLivraisonLetsGo()
end

-- Fonction active mission livraison
function MissionLivraisonLetsGo()
	if Blips['delivery'] ~= nil then
		RemoveBlip(Blips['delivery'])
		Blips['delivery'] = nil
	end
	--[[
	if Blips['annulermission'] ~= nil then
		RemoveBlip(Blips['annulermission'])
		Blips['annulermission'] = nil
	end
	]]
	Blips['delivery'] = AddBlipForCoord(destination.Pos.x,  destination.Pos.y,  destination.Pos.z)
	SetBlipRoute(Blips['delivery'], true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('blip_delivery'))
	EndTextCommandSetBlipName(Blips['delivery'])
	--[[
	Blips['annulermission'] = AddBlipForCoord(Config.Livraison.AnnulerMission.Pos.x,  Config.Livraison.AnnulerMission.Pos.y,  Config.Livraison.AnnulerMission.Pos.z)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('blip_goal'))
	EndTextCommandSetBlipName(Blips['annulermission'])
	]]
	if MissionRegion == 1 then -- Los santos
		ESX.ShowNotification(_U('meet_ls'))
	elseif MissionRegion == 2 then -- Blaine County
		ESX.ShowNotification(_U('meet_bc'))
	elseif MissionRegion == 0 then -- au cas ou
		ESX.ShowNotification(_U('meet_del'))
	end

	MissionLivraison = true
end

--Fonction retour au depot
function MissionLivraisonStopRetourDepot()
	destination = Config.Livraison.RetourCamion
	
	Blips['delivery'] = AddBlipForCoord(destination.Pos.x,  destination.Pos.y,  destination.Pos.z)
	SetBlipRoute(Blips['delivery'], true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('blip_depot'))
	EndTextCommandSetBlipName(Blips['delivery'])
	--[[
	if Blips['annulermission'] ~= nil then
		RemoveBlip(Blips['annulermission'])
		Blips['annulermission'] = nil
	end
	]]
	ESX.ShowNotification(_U('return_depot'))
	
	MissionRegion = 0
	MissionLivraison = false
	MissionNum = 0
	MissionRetourCamion = true
end

function SavePlaqueVehicule()
	plaquevehicule = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
end

function VerifPlaqueVehiculeActuel()
	plaquevehiculeactuel = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
end