ESX = nil
local PlayerData = {}

local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

event_is_running = false
event_time_passed = 0.0
event_destination = nil
event_vehicle = nil
event_scenario = nil
police_alerted = false
event_alarm_time = 0.0
event_delivery_blip = nil
local talktodealer = true
local tiempo = 30
local tengodinero = false
local divisas = 0



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


local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "NPC",
    menu_subtitle = "Lavado de Dinero",
    color_r = 0,
    color_g = 128,
    color_b = 255,
}




Citizen.CreateThread(function()
	
	RequestModel(Config.NPCHash)
	while not HasModelLoaded(Config.NPCHash) do
		Wait(1)
	end
	
	for k, v in pairs(Config.CargoProviderLocation) do
		meth_dealer_seller = CreatePed(1, Config.NPCHash, v.Npc.x, v.Npc.y, v.Npc.z, v.Npc.h, false, true)
		SetBlockingOfNonTemporaryEvents(meth_dealer_seller, true)
		SetPedDiesWhenInjured(meth_dealer_seller, false)
		SetPedCanPlayAmbientAnims(meth_dealer_seller, true)
		SetPedCanRagdollFromPlayerImpact(meth_dealer_seller, false)
		SetEntityInvincible(meth_dealer_seller, true)
		FreezeEntityPosition(meth_dealer_seller, true)
		TaskStartScenarioInPlace(meth_dealer_seller, "WORLD_HUMAN_SMOKING", 0, true);
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if event_is_running then
			if IsPedInVehicle(GetPlayerPed(-1), event_vehicle, false) then
				ESX.TriggerServerCallback('esx_cargodelivery:checkMoney', function(sold)
					if sold == 1 then
						FreezeEntityPosition(event_vehicle, true)
						DrawMissionText('~r~¡Sin el Dinero no puedes Continuar la Mision!', 1000)
					elseif sold == 2 then
						FreezeEntityPosition(event_vehicle, true)
						DrawMissionText('~r~¡Sin la Divisa VIP no puedes Continuar la Mision!', 1000)
					elseif sold == 3 then
						FreezeEntityPosition(event_vehicle, true)
						DrawMissionText('~r~¡Sin la Divisa al %50 no puedes Continuar la Mision!', 1000)
					else
						FreezeEntityPosition(event_vehicle, false)
					end
				end, Config.Scenarios[event_scenario].CargoReward, divisas)
			else	
				FreezeEntityPosition(event_vehicle, true)
				DrawMissionText('¡Debes volver al Camion!', 1000)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)	
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		local pVehicle = GetVehiclePedIsUsing(GetPlayerPed(-1))
		local v = Config.CargoProviderLocation
		
		for k, v in pairs(Config.CargoProviderLocation) do
		
			if(Vdist(v.Npc.x, v.Npc.y, v.Npc.z, pos.x, pos.y, pos.z) < 2.0)then
				--DisplayHelpText("Presiona ~INPUT_CONTEXT~ para entrar al menu ~y~Lavado de Dinero")
				Drawing.draw3DText(v.Npc.x, v.Npc.y, v.Npc.z, 'Presiona ~r~[E]~w~ para ~r~LAVAR DINERO~w~', 1, 0.1, 0.1, 255, 255, 255, 215)
				if(IsControlJustReleased(1, 38))then
					CargoMenu(k)
				end
			end
		
		end
		--[[
		if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0)then
			DrawMarker(29, v.x, v.y, v.z+1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)
		end
		]]--
		
		

		if event_is_running then
			if pVehicle == event_vehicle then

				local dpos = event_destination
				local delivery_point_distance = Vdist(dpos.x, dpos.y, dpos.z, pos.x, pos.y, pos.z)
				if delivery_point_distance < 50.0 then
					DrawMarker(1, dpos.x, dpos.y, dpos.z,0, 0, 0, 0, 0, 0, 3.5, 3.5, 3.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
				end
				if delivery_point_distance < 3.0 then
					--DisplayHelpText("Presiona ~INPUT_CONTEXT~ para ~y~ENTREGAR CAUDAL")
					Drawing.draw3DText(dpos.x, dpos.y, dpos.z, 'Presiona ~g~[E]~w~ para ~g~ENTREGAR CAUDAL~w~', 1, 0.2, 0.2, 255, 255, 255, 215)
					if IsControlJustReleased(1, 38) and event_is_running then
						event_is_running = false
						DeliverCargo()
					end
				end
			end
		end
	end
end)



-- CANCEL CHECK IN CASE PLAYER DIED OR VEHICLE DESTROYED.

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if event_is_running then
			--[[
			if IsPedDeadOrDying(GetPlayerPed(-1)) then
				ResetCargo()
				DisplayMissionFailed('Te moriste, Perdiste la Mision!')
				TriggerServerEvent('esx_cargodelivery:Cancelado')
			elseif GetVehicleEngineHealth(event_vehicle) < 20 and event_vehicle ~= nil then
				ResetCargo()
				DisplayMissionFailed('La carga resultó seriamente dañada.')
				TriggerServerEvent('esx_cargodelivery:Cancelado')
			]]
			if not DoesEntityExist(event_vehicle) then
				ResetCargo()
				DisplayMissionFailed('Perdiste el Camion!')
				TriggerServerEvent('esx_cargodelivery:Cancelado')						
			elseif event_time_passed > 900 then --15 minutos
				ResetCargo()
				DisplayMissionFailed('Entrega de carga vencida.')
				TriggerServerEvent('esx_cargodelivery:Cancelado')
			end
			event_time_passed = event_time_passed + 1
		end
	end
end)


function DrawProviderBlip()

	local blip = AddBlipForCoord(Config.CargoProviderLocation.x, Config.CargoProviderLocation.y, Config.CargoProviderLocation.z)
	SetBlipSprite(blip,94)
	SetBlipColour(blip,1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Carga Prohibida')
	EndTextCommandSetBlipName(blip)
	
end

function DrawMissionText(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end


function CargoMenu(lugar)
	local elements = {
		{label = 'Lavado al %50', value = '50'},
		{label = 'Lavado VIP', value = 'vip'}
	}

	local elements2 = {}
	
	for i=1, #Config.Scenarios, 1 do
		table.insert(elements2, {
			label = '$'..Config.Scenarios[i].CargoCost,
			value = i
		})
	end
	
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lavado',
		{
			title    = 'Lavado de Dinero',
			align    = 'bottom-right',
			elements = elements
		}, 	function(data, menu)
		
			if data.current.value == '50' then
				--ESX.ShowNotification('Lavado al %50')
				ESX.TriggerServerCallback('esx_cargodelivery:checkdiv50', function(div)
					if div then
						divisas = 2
						ESX.UI.Menu.Open(
									'default', GetCurrentResourceName(), '50',
								{
									title    = 'Lavar al %50',
									align    = 'bottom-right',
									elements = elements2,
								},
								function(data2, menu2)
									--ESX.ShowNotification(tostring(data2.current.value))
									ESX.UI.Menu.CloseAll()
									PurchaseCargo(data2.current.value, lugar)
								end,
								function(data2, menu2)
									menu2.close()
								end
								)
						--PurchaseCargo(scenario)
					else
						ESX.ShowNotification("~y~¡No tienes Divisa al %50 para lavar dinero!")
					end
				end)
			elseif data.current.value == 'vip' then
				--ESX.ShowNotification('Lavado VIP')
				ESX.TriggerServerCallback('esx_cargodelivery:checkdivVIP', function(div)
					if div then
						divisas = 1
						ESX.UI.Menu.Open(
									'default', GetCurrentResourceName(), 'VIP',
								{
									title    = 'Lavar VIP',
									align    = 'bottom-right',
									elements = elements2,
								},
								function(data2, menu2)
									--ESX.ShowNotification(tostring(data2.current.value))
									ESX.UI.Menu.CloseAll()
									PurchaseCargo(data2.current.value, lugar)
								end,
								function(data2, menu2)
									menu2.close()
								end
								)
					else
						ESX.ShowNotification("~y~¡No tienes Divisa VIP para lavar dinero!")
					end
				end)
			end
		end,
		function(data, menu)
			menu.close()
		end)
end



function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end


function AlertThePolice()
	ESX.ShowNotification('~r~Alerta Enviada a la Policia!')
	if event_is_running then
		TriggerServerEvent('esx_cargodelivery:Alerta')
	end
end

function AlertThePolice2(para)
--[[
	local playerPed = PlayerPedId()
	PedPosition = GetEntityCoords(playerPed)
	local ped = GetPlayerPed(playerPed)
	local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
	local location = GetStreetNameFromHashKey(street)
	]]
	local location = nil
	local player = PlayerPedId()
	local position = GetEntityCoords(player)
	local zoneNameFull = zones[GetNameOfZone(position.x, position.y, position.z)]
	local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(position.x, position.y, position.z))

	if zoneNameFull then 
		location = streetName .. ', ' .. zoneNameFull
	else
		location = streetName
	end
	
	ESX.ShowNotification('~r~Los vecinos te vieron y llamaron a la Policia!')
	
	if event_is_running then
		--local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }
		TriggerServerEvent('1974_lavado:entorno', position, location, para)
	end	
	--[[
	local tiempo = math.random(60000, 120000)
	Wait(tiempo)
	AlertThePolice3()
	]]
end

function AlertThePolice3()
	local playerPed = PlayerPedId()
	PedPosition = GetEntityCoords(playerPed)
	local ped = GetPlayerPed(playerPed)
	local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
	local location = GetStreetNameFromHashKey(street)
	ESX.ShowNotification('~r~Los vecinos te vieron y llamaron a la Policia!')
	if event_is_running then
		local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }
		TriggerServerEvent('1974_lavado:entorno', PlayerCoords, location)
	end	
end

RegisterNetEvent('esx_cargodelivery:setblip')
AddEventHandler('esx_cargodelivery:setblip', function(coords)
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	blipAlerta = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipSprite(blipAlerta, 161)
	SetBlipScale(blipAlerta, 1.5)
	SetBlipColour(blipAlerta, 75)
	PulseBlip(blipAlerta)
	
	SetTimeout(20000 , function()
    	RemoveBlip(blipAlerta)
	end)
end)

RegisterNetEvent('esx_cargodelivery:cancelar')
AddEventHandler('esx_cargodelivery:cancelar', function()
	DisplayMissionFailed('Mision Cancelada!')
	ResetCargo()
end)

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function CloseMenu()
	Menu.hidden = true
end



function ResetCargo()
	TriggerServerEvent('esx_cargodelivery:resetEvent')
	RemoveBlip(event_delivery_blip)
	event_delivery_blip	= nil
	event_time_passed = 0.0
	event_is_running = false
	event_destination = nil	
	event_scenario = nil

	if DoesEntityExist(event_vehicle) then
		DeleteEntity(event_vehicle)
		event_vehicle = nil
	end	
end

function DeliverCargo()
	local dinero_pago = Config.Scenarios[event_scenario].CargoReward
	ESX.TriggerServerCallback('1974_drogas:check', function(serial)
		if serial then
			TriggerServerEvent('esx_cargodelivery:sellCargo', dinero_pago, divisas, event_destination.name, serial)
			ExecuteCommand('entorno Se veria un camion de Caudales en ^2'..event_destination.name)
			ResetCargo()
		end		
	end)
end

function SpawnCargoVehicle(scenario, lugar)

	Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey(Config.Scenarios[scenario].VehicleName)

    RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end
	
	colors = table.pack(GetVehicleColours(veh)) 
	extra_colors = table.pack(GetVehicleExtraColours(veh))
	--plate = math.random(100, 900)
	local spawned_car = CreateVehicle(vehicle, Config.CargoProviderLocation[lugar].SpawnPoint.x, Config.CargoProviderLocation[lugar].SpawnPoint.y, Config.CargoProviderLocation[lugar].SpawnPoint.z, false, true)

	SetEntityHeading(spawned_car, Config.CargoProviderLocation[lugar].SpawnPoint.h)
	SetVehicleOnGroundProperly(spawned_car)
	SetPedIntoVehicle(myPed, spawned_car, - 1)
	ESX.Game.SetVehicleProperties(spawned_car, { plate = 'ZONASUR'})
	exports["LegacyFuel"]:SetFuel(spawned_car, 100)
	
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
	CruiseControl = 0
	DTutOpen = false
	SetEntityVisible(myPed, true)
	FreezeEntityPosition(myPed, false)
	event_vehicle = spawned_car

end

function PurchaseCargo(scenario, lugar)
	local cops_online = 0
	event_scenario = scenario

	if event_is_running == true then	
		drawNotification("Ya estás en una misión de entrega de carga.")
		goto done
	end
	
	ESX.TriggerServerCallback('esx_gendarmeria:getCops', function(police)
		if police >= Config.Scenarios[scenario].MinCopsOnline then
			ESX.TriggerServerCallback('esx_cargodelivery:buyCargo', function(bought)
				if bought then
					drawNotification("Carga exitosamente comprada.")
					SpawnCargoVehicle(scenario, lugar)
					event_is_running = true
					--random_destination = math.random(1, #Config.CargoDeliveryLocations)
					--event_destination = Config.CargoDeliveryLocations[random_destination]
					--event_destination = Config.CargoProviderLocation[lugar].CargoDeliveryLocations
					
					random_destination = math.random(1, #Config.CargoProviderLocation[lugar].CargoDeliveryLocations)
					event_destination = Config.CargoProviderLocation[lugar].CargoDeliveryLocations[random_destination]
					--AlertThePolice()		
					event_delivery_blip	 = AddBlipForCoord(event_destination.x,event_destination.y,event_destination.z)
					SetBlipSprite(event_delivery_blip,94)
					SetBlipColour(event_delivery_blip,1)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString('Cargo Delivery')
					EndTextCommandSetBlipName(event_delivery_blip)
					SetBlipAsShortRange(event_delivery_blip,true)
					SetBlipAsMissionCreatorBlip(event_delivery_blip,true)
					SetBlipRoute(event_delivery_blip, 1)		
					local tiempo = math.random(80000, 150000)
					Wait(tiempo)
					if event_is_running then
						AlertThePolice2('gna')
					end	
				end
			end, Config.Scenarios[scenario].CargoCost)
		else
			ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(police)
				if police >= Config.Scenarios[scenario].MinCopsOnline then
					ESX.TriggerServerCallback('esx_cargodelivery:buyCargo', function(bought)
						if bought then
							drawNotification("Carga exitosamente comprada.")
							SpawnCargoVehicle(scenario, lugar)
							event_is_running = true
							--random_destination = math.random(1, #Config.CargoDeliveryLocations)
							--event_destination = Config.CargoDeliveryLocations[random_destination]							
							--event_destination = Config.CargoProviderLocation[lugar].CargoDeliveryLocations
							
							random_destination = math.random(1, #Config.CargoProviderLocation[lugar].CargoDeliveryLocations)
							event_destination = Config.CargoProviderLocation[lugar].CargoDeliveryLocations[random_destination]	
							
							--AlertThePolice()		
							event_delivery_blip	 = AddBlipForCoord(event_destination.x,event_destination.y,event_destination.z)
							SetBlipSprite(event_delivery_blip,94)
							SetBlipColour(event_delivery_blip,1)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Cargo Delivery')
							EndTextCommandSetBlipName(event_delivery_blip)
							SetBlipAsShortRange(event_delivery_blip,true)
							SetBlipAsMissionCreatorBlip(event_delivery_blip,true)
							SetBlipRoute(event_delivery_blip, 1)		
							local tiempo = math.random(80000, 150000)
							Wait(tiempo)
							if event_is_running then
								AlertThePolice2('pdlc')
							end	
						end
					end, Config.Scenarios[scenario].CargoCost)
				else
					--esx_police2job:getCopsinServicio
					ESX.TriggerServerCallback('esx_police2job:getCopsinServicio', function(police)
						if police >= Config.Scenarios[scenario].MinCopsOnline then
							ESX.TriggerServerCallback('esx_cargodelivery:buyCargo', function(bought)
								if bought then
									drawNotification("Carga exitosamente comprada.")
									SpawnCargoVehicle(scenario, lugar)
									event_is_running = true
									--random_destination = math.random(1, #Config.CargoDeliveryLocations)
									--event_destination = Config.CargoDeliveryLocations[random_destination]
									--event_destination = Config.CargoProviderLocation[lugar].CargoDeliveryLocations
									
									random_destination = math.random(1, #Config.CargoProviderLocation[lugar].CargoDeliveryLocations)
									event_destination = Config.CargoProviderLocation[lugar].CargoDeliveryLocations[random_destination]
									--AlertThePolice()		
									event_delivery_blip	 = AddBlipForCoord(event_destination.x,event_destination.y,event_destination.z)
									SetBlipSprite(event_delivery_blip,94)
									SetBlipColour(event_delivery_blip,1)
									BeginTextCommandSetBlipName("STRING")
									AddTextComponentString('Cargo Delivery')
									EndTextCommandSetBlipName(event_delivery_blip)
									SetBlipAsShortRange(event_delivery_blip,true)
									SetBlipAsMissionCreatorBlip(event_delivery_blip,true)
									SetBlipRoute(event_delivery_blip, 1)		
									local tiempo = math.random(80000, 150000)
									Wait(tiempo)
									if event_is_running then
										AlertThePolice2('pfa')
									end	
								end
							end, Config.Scenarios[scenario].CargoCost)
						else
							--esx_police2job:getCopsinServicio
							drawNotification("Necesitas al menos ~b~" .. Config.Scenarios[scenario].MinCopsOnline .. " GENDARMES/PDLC/PFA ~w~en la Ciudad!")
						end
					end)
				end
			end)
		end	
	end)
	::done::
end



function DisplayMissionFailed(label)
	TriggerEvent('esx:showNotification', '~r~Mision Fallida: ~w~' .. label)
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
end

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing

local TeleportFromTo = {	
	["Lavanderia"] = {
		positionFrom = { ['x'] = 1308.87, ['y'] = 4362.14, ['z'] = 40.55, nom = "~g~Entrar"},
		positionTo = { ['x'] = 1138.05, ['y'] = -3199.1, ['z'] = -40.67 , nom = "~r~Salir"},
	},	
}
--para usar tp
--[[
Citizen.CreateThread(function()			
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k, j in pairs(TeleportFromTo) do

			--msginf(k .. " " .. tostring(j.positionFrom.x), 15000)
			if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 50.0)then
				DrawMarker(1, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, .801, 255, 255, 255,255, 0, 0, 0,0)
				if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 1.5)then
					--Drawing.draw3DText(j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1.100, j.positionFrom.nom, 1, 0.2, 0.1, 255, 255, 255, 215)
					DisplayHelpText("Pulsa ~INPUT_CONTEXT~ Para "..j.positionFrom.nom)
					if IsControlJustPressed(1, 38) then
						DoScreenFadeOut(500)
						Citizen.Wait(1000)
						SetEntityCoords(GetPlayerPed(-1), j.positionTo.x, j.positionTo.y, j.positionTo.z - 1)
						DoScreenFadeIn(500)
					end
				end
			end
			if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 50.0)then
				DrawMarker(1, j.positionTo.x, j.positionTo.y, j.positionTo.z, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, .801, 255, 255, 255,255, 0, 0, 0,0)
				if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 1.5)then
					--Drawing.draw3DText(j.positionTo.x, j.positionTo.y, j.positionTo.z - 1.100, j.positionTo.nom, 1, 0.2, 0.1, 255, 255, 255, 215)
					DisplayHelpText("Pulsa ~INPUT_CONTEXT~ Para "..j.positionTo.nom)
					if IsControlJustPressed(1, 38) then
						DoScreenFadeOut(500)
						Citizen.Wait(1000)
						SetEntityCoords(GetPlayerPed(-1), j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1)
						DoScreenFadeIn(500)
					end
				end
			end
		end
	end
end)
]]
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