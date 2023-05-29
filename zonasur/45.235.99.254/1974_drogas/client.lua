ESX = nil
local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }
local lanchita = {}
local casita = {}
local camioneta = {}
local camioneta_venta = {}
local avion = {}
local PlayerData                = {}
local Blips = {}
local entrega = false
local entrega2 = false
local adrenalina1 = false
local adrenalina2 = false
local ProMeta = false
local procesando = false
local ventameta1 = false
local aeropuerto = false
local paradise = {}
local ventamari1 = false
local ventamari2 = false
local cajita = {}
local OnDuty = false
local isRecolting5, isRecolting7, isRecolting8 = false
local farmeando, empaquetando, vendiendo, procesando, coca_bolsa, coca_venta, meta, meta_paquet, meta_venta = false
local OnRobbery = false
local OnRobberyYate = false
local OnRobberyYate2 = false
local OnRobberyCasino = false
local OnRobberyPollos = false
local OnRobberyFran = false
local OnRobberyPA = false
local OnRobberySubte = false
local OnRobberyCarne = false

local timeLeft = 220

local ladron = false
local ladronYate = false
local ladronYate2 = false
local ladronCasino = false
local ladronPollos = false
local ladronFran = false
local ladronPA = false
local ladronSubte = false
local ladronCarne = false

local lanchamari = false
local lanchamarillego = false
local isProcessing = false
local LANCHAMARIOK = false
local bolsa1 = false
local garbagebag = nil
local camioneta_coords = nil
local bolsas_cargadas = 0
local camioneta_mari = {}

local bolsa_venta = false

local patente = nil
local event_time_passed = 0.0
local subi = false
local event_delivery_blip = nil

local armando_faso = false
local secando_faso = false
local modelSpawn = nil
local armando = false
local secando = false
local cam = nil

local juntando = false
local junquimico = false

local blip6 = AddBlipForCoord(Config.Gobernador.x, Config.Gobernador.y, Config.Gobernador.z) 
SetBlipSprite (blip6, 134)
SetBlipDisplay(blip6, 4)
SetBlipScale  (blip6, 0.7)
SetBlipColour (blip6, 17)
SetBlipAsShortRange(blip6, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Casa Gobernador")
EndTextCommandSetBlipName(blip6)
			
local blip7 = AddBlipForCoord(Config.Yate.x, Config.Yate.y, Config.Yate.z)	
SetBlipSprite (blip7, 455)
SetBlipDisplay(blip7, 4)
SetBlipScale  (blip7, 0.7)
SetBlipColour (blip7, 5)
SetBlipAsShortRange(blip7, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Yate")
EndTextCommandSetBlipName(blip7)

local blip8 = AddBlipForCoord(Config.Yate2.x, Config.Yate2.y, Config.Yate2.z)	
SetBlipSprite (blip8, 455)
SetBlipDisplay(blip8, 4)
SetBlipScale  (blip8, 0.7)
SetBlipColour (blip8, 5)
SetBlipAsShortRange(blip8, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Yate Paleto")
EndTextCommandSetBlipName(blip8)

local blipCasino = AddBlipForCoord(Config.RobaCasino.x, Config.RobaCasino.y, Config.RobaCasino.z)	
SetBlipSprite (blipCasino, 679)
SetBlipDisplay(blipCasino, 4)
SetBlipScale  (blipCasino, 0.7)
SetBlipColour (blipCasino, 5)
SetBlipAsShortRange(blipCasino, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Robo Casino")
EndTextCommandSetBlipName(blipCasino)

local blipPollos = AddBlipForCoord(Config.RobaPollos.x, Config.RobaPollos.y, Config.RobaPollos.z)	
SetBlipSprite (blipPollos, 463)
SetBlipDisplay(blipPollos, 4)
SetBlipScale  (blipPollos, 0.9)
SetBlipColour (blipPollos, 1)
SetBlipAsShortRange(blipPollos, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Robo Polleria")
EndTextCommandSetBlipName(blipPollos)

local blipFran = AddBlipForCoord(Config.RobaFran.x, Config.RobaFran.y, Config.RobaFran.z)	
SetBlipSprite (blipFran, 500)
SetBlipDisplay(blipFran, 4)
SetBlipScale  (blipFran, 0.9)
SetBlipColour (blipFran, 1)
SetBlipAsShortRange(blipFran, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Robo Casa Franklin")
EndTextCommandSetBlipName(blipFran)

local blipPA = AddBlipForCoord(Config.RobaPA.x, Config.RobaPA.y, Config.RobaPA.z)	
SetBlipSprite (blipPA, 16)
SetBlipDisplay(blipPA, 4)
SetBlipScale  (blipPA, 0.9)
SetBlipColour (blipPA, 1)
SetBlipAsShortRange(blipPA, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Robo Porta Aviones")
EndTextCommandSetBlipName(blipPA)

local blipSubte = AddBlipForCoord(Config.RobaSubte.x, Config.RobaSubte.y, Config.RobaSubte.z)	
SetBlipSprite (blipSubte, 795)
SetBlipDisplay(blipSubte, 4)
SetBlipScale  (blipSubte, 0.9)
SetBlipColour (blipSubte, 1)
SetBlipAsShortRange(blipSubte, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Robo Subte")
EndTextCommandSetBlipName(blipSubte)

local blipCarne = AddBlipForCoord(Config.RobaCarne.x, Config.RobaCarne.y, Config.RobaCarne.z)	
SetBlipSprite (blipCarne, 141)
SetBlipDisplay(blipCarne, 4)
SetBlipScale  (blipCarne, 0.9)
SetBlipColour (blipCarne, 0)
SetBlipAsShortRange(blipCarne, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Robo Carniceria")
EndTextCommandSetBlipName(blipCarne)

--[[
local blipMansion = AddBlipForCoord(Config.RobaMansion.x, Config.RobaMansion.y, Config.RobaMansion.z)	
SetBlipSprite (blipMansion, 310)
SetBlipDisplay(blipMansion, 4)
SetBlipScale  (blipMansion, 1.0)
SetBlipColour (blipMansion, 1)
SetBlipAsShortRange(blipMansion, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Mansion Grapeseed")
EndTextCommandSetBlipName(blipMansion)
]]--


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

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local HasAlreadyEnteredMarker = false
local LastZone
local CurrentAction
local CurrentActionMsg = ''

--[[
Citizen.CreateThread(function()
	while true do
		Wait(5)
		--Venta de Mari 
		local ped = PlayerPedId()
		local pedcoords = GetEntityCoords(ped, false)
		local isInMarker, letSleep, currentZone = false, true
		
		for k,v in pairs(Config.Zones) do

			local distance = #(pedcoords - v.Pos)
			if distance < 20 then
				letSleep = false
				if Config.Zones[k].bool then
					DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
					if distance < v.Size.x then
						isInMarker, currentZone = true, k
						--ESX.ShowNotification('Estas en la zona')	
						Drawing.draw3DText(v.Pos.x, v.Pos.y, v.Pos.z, v.Hint, 1, 0.1, 0.1, 255, 255, 255, 215)
						--Config.Zones['EntregaBolsa2'].bool = true
					end
				end
			end
			
		end
		
		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			LastZone = currentZone
			TriggerEvent('1974_drogas:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('1974_drogas:hasExitedMarker', LastZone)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)
]]--

AddEventHandler('1974_drogas:hasEnteredMarker', function(zone)
	if zone == 'Quimicos' then
		CurrentAction = zone
	end
end)

AddEventHandler('tm1_mafias:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if CurrentAction then
			--ESX.ShowHelpNotification(CurrentActionMsg)
			local playerPed = GetPlayerPed(-1)
			
			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'Quimicos' then
					quimi_1()
				end
				CurrentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)
]]--

Citizen.CreateThread(function()
	while true do
		Wait(5)
		--Venta de Mari 
		local ped = PlayerPedId()
		local pedcoords = GetEntityCoords(ped, false)
		
		for k,v in pairs(Config.FarmeoCoca) do
			local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.x, v.y, v.z, true)
			if distance < 20 then
				DrawMarker(3, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
				if distance < 0.5 and not isProcessing then
					Drawing.draw3DText(v.x, v.y, v.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Procesar~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
					if IsControlJustPressed(1, 38) and not isProcessing then
						isProcessing = true
						ESX.TriggerServerCallback('1974_drogas:ProcesoCoke', function(tengo)
							if tengo then
								ProcesoCoca(v)
							else
								ESX.ShowNotification("~r~No tienes Hojas de Coca!")
								isProcessing = false
							end
						end)
					end
				end
			end
		end
		
		local distance = #(pedcoords - Config.FarmeoEfedrina)
		if distance < 20 then
			DrawMarker(3, Config.FarmeoEfedrina.x, Config.FarmeoEfedrina.y, Config.FarmeoEfedrina.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
			if distance < 1.5 and not isProcessing then
				Drawing.draw3DText(Config.FarmeoEfedrina.x, Config.FarmeoEfedrina.y, Config.FarmeoEfedrina.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Procesar~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
				if IsControlJustPressed(1, 38) and not isProcessing then
					isProcessing = true
					ProcesoEfedrina()
				end
			end
		end
		
		--adrenalina -439.847,6338.926,12.730,214.67112731934
		local distance = #(pedcoords - Config.FarmeoAdrenalina)
		if distance < 20 then
			DrawMarker(3, Config.FarmeoAdrenalina.x, Config.FarmeoAdrenalina.y, Config.FarmeoAdrenalina.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
			if distance < 1.5 and not isProcessing then
				Drawing.draw3DText(Config.FarmeoAdrenalina.x, Config.FarmeoAdrenalina.y, Config.FarmeoAdrenalina.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Procesar~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
				if IsControlJustPressed(1, 38) and not isProcessing then
					isProcessing = true
					ProcesoAdrenalina()
				end
			end
		end	
		
		--venta de meta
		local distance = #(pedcoords - Config.VentaDeMeta)
		if distance < 20 then
			--DrawMarker(3, Config.VentaDeMeta.x, Config.FarmeoAdrenalina.y, Config.FarmeoAdrenalina.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
			if distance < 1.5 and not isProcessing then
				Drawing.draw3DText(Config.VentaDeMeta.x, Config.VentaDeMeta.y, Config.VentaDeMeta.z, 'Presiona ~g~[E]~w~ para ~g~Vender~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
				if IsControlJustPressed(1, 38) and not isProcessing then
					isProcessing = true
					ESX.TriggerServerCallback('esx_police2job:getCopsinServicio', function(cops)	
						if cops >= 2 then
							ESX.TriggerServerCallback('1974_drogas:getMetaVentas', function(data)
								if data then							
									VentaMeta()
								else
									isProcessing = false
									ESX.ShowNotification('~r~No tienes cantidad necesaria para vender!')
								end
							end)
						else
							ESX.ShowNotification("Deben haber almenos ~b~2 PFA~s~ para Vender.")
							Wait(5000)
							isProcessing = false
						end
					end)
				end
			end
		end	
		
		--VENTA DE COCA 2023
		local distance = #(pedcoords - Config.VentaDeCoca)
		if distance < 20 then
			--DrawMarker(3, Config.VentaDeMeta.x, Config.FarmeoAdrenalina.y, Config.FarmeoAdrenalina.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
			if distance < 1.5 and not isProcessing then
				Drawing.draw3DText(Config.VentaDeCoca.x, Config.VentaDeCoca.y, Config.VentaDeCoca.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Vender~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
				if IsControlJustPressed(1, 38) and not isProcessing then
					isProcessing = true
					ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
						if cops >= 2 then
							ESX.TriggerServerCallback('1974_drogas:getCoca2023Ventas', function(data)
								if data then							
									VentaCoca2023()
								else
									isProcessing = false
									ESX.ShowNotification('~r~No tienes cantidad necesaria para vender!')
								end
							end)
						else
							ESX.ShowNotification("Deben haber almenos ~b~2 PDLC~s~ para Vender.")
							Wait(5000)
							isProcessing = false
						end
					end)
				end
			end
		end	
		
		--venta de mari
		local distance = #(pedcoords - Config.MariVenta)
			--DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
		--Cambio de Ropa para Coca
		if distance < 1.5 then
			Drawing.draw3DText(Config.MariVenta.x, Config.MariVenta.y, Config.MariVenta.z - 1, 'Presiona ~g~[E]~w~ para ~g~Vender~w~', 1, 0.1, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) and not isProcessing then
				isProcessing = true
				ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
					if cops >= 2 then
						ESX.TriggerServerCallback('1974_drogas:getMariVentas', function(data)
							if data then
								VentaMari()
							else
								isProcessing = false
								ESX.ShowNotification('~r~No tienes suficientes Paquetes de Marihuana!')
							end
						end)
					else
						ESX.ShowNotification("Deben haber almenos ~b~2 Policia~s~ para sacar una camioneta.")
						Wait(5000)
						isProcessing = false
					end
				end)
			end
		end
		
		--LLGO AL PUERTO
		local distance = #(pedcoords - Config.MariLlegada)
		if distance < 20 and isRecolting5 then
			DrawMarker(1, Config.MariLlegada.x, Config.MariLlegada.y, Config.MariLlegada.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 255, 0, 0, 100, 0, 0, 0, 0)
			if distance < 1.5 then
				Drawing.draw3DText(Config.MariLlegada.x, Config.MariLlegada.y, Config.MariLlegada.z - 1, 'Presiona ~g~[E]~w~ para ~g~entregar camioneta~w~', 1, 0.1, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(1, 38) and isRecolting5 then
					Entrego_Mari()
				end
			end		
		end
		
		
		--[[
		--Devuelvo camion de venta de coca
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.DevolverCamion.x, Config.DevolverCamion.y, Config.DevolverCamion.z)
		if distance <= 2.0 and coke_fin then
			Drawing.draw3DText(Config.DevolverCamion.x, Config.DevolverCamion.y, Config.DevolverCamion.z, 'Presiona ~g~[E]~w~ para ~g~devolver Camioneta~w~', 1, 0.1, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) and coke_fin then
				Entrego_Camion()
			end
		end
		
		--NPC SACAR CAMIONETA VENTA DE COKE
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.VentaCoca.x, Config.VentaCoca.y, Config.VentaCoca.z)
		if distance <= 2.0 then
			Drawing.draw3DText(Config.VentaCoca.x, Config.VentaCoca.y, Config.VentaCoca.z, 'Presiona ~g~[E]~w~ para ~g~Pedir Camioneta~w~', 1, 0.1, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) then
				VentaCoca()
			end
		end
		
		--LLEGO A LA CASA DE VENTA DE COCA
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.LleadaVentaCoca.x, Config.LleadaVentaCoca.y, Config.LleadaVentaCoca.z)
		if distance <= 3.0 and isRecolting8 then
			Drawing.draw3DText(Config.LleadaVentaCoca.x, Config.LleadaVentaCoca.y, Config.LleadaVentaCoca.z, 'Presiona ~g~[E]~w~ para ~g~abrir el Baul~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) and isRecolting8 then
				Abrir_Baul()	
			end
		end
		
		--Sacamos bolsa de camioneta
		if bolsa_venta then
			local trunk = GetEntityBoneIndexByName(camioneta_venta, 'boot')
			local coords = GetWorldPositionOfEntityBone(camioneta_venta, trunk)
			--local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, camioneta_coords.x, camioneta_coords.y, camioneta_coords.z)
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords, true) <= 2.0 then
				--Drawing.draw3DText(camioneta_coords.x, camioneta_coords.y, camioneta_coords.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~guardar bolsa~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
				DrawText3D(coords, '~g~[G]~w~ para Sacar Bolsa')
				if IsControlJustPressed(1, 47) and not garbagebag then
					ESX.ShowNotification('~y~Lleva la bolsa adentro de la casa!!')
					Agarro_Bolsa()
				end
			end
		end
		
		--Entrego bolsa en sotano
		if garbagebag then
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.EntregoBolsa.x, Config.EntregoBolsa.y, Config.EntregoBolsa.z)
			if distance <= 1.5 then
				Drawing.draw3DText(Config.EntregoBolsa.x, Config.EntregoBolsa.y, Config.EntregoBolsa.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~dejar la Bolsa~w~', 1, 0.1, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(1, 38) and garbagebag then
					Dejo_Bolsa()
				end
			end
			DisableControlAction(0, 21, true)
			DisableControlAction(0, 22, true)
			DisablePlayerFiring(GetPlayerPed(-1),true)
		end
		
		if OnDuty then
			for k,v in pairs(Config.ProcesoCoca) do
				DrawMarker(3, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.x, v.y, v.z, true) <= 1.0 and not isProcessing then
					Drawing.draw3DText(v.x, v.y, v.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Procesar~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
					if IsControlJustPressed(1, 38) and not isProcessing then
						isProcessing = true
						ESX.TriggerServerCallback('1974_drogas:ProcesoCoke', function(tengo)
							if tengo == 0 then
								ProcesoCoca(v.h)
							elseif tengo == 2 then
								ESX.ShowNotification("~r~No tienes Quimicos!")
								isProcessing = false
							elseif tengo == 1 then
								ESX.ShowNotification("~r~No tienes Hojas de Coca!")
								isProcessing = false
							else
								ESX.ShowNotification("~r~No tienes Hojas de Coca ni Quimicos!")
								isProcessing = false
							end
						end)
					end
				end
			end
		end
		
		
		local distance = #(pedcoords - Config.RopaCoca)
		if distance < 20 then
			DrawMarker(3, Config.RopaCoca.x, Config.RopaCoca.y, Config.RopaCoca.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 100, false, true, 2, true, nil, nil, false)
			--DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, nil, nil, false)
		--Cambio de Ropa para Coca
			if distance < 1.0 then
				Drawing.draw3DText(Config.RopaCoca.x, Config.RopaCoca.y, Config.RopaCoca.z - 1, 'Presiona ~g~[E]~w~ para ~g~Cambiarte~w~', 1, 0.1, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(1, 38) then
					OpenCloakroomMenu()
				end
			end
		end
		
		
		--NPC SACAR CAMIONETA QUIMICOS SANDY
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Quimicos.x, Config.Quimicos.y, Config.Quimicos.z)
		if distance <= 2.0 then
			Drawing.draw3DText(Config.Quimicos.x, Config.Quimicos.y, Config.Quimicos.z, 'Presiona ~g~[E]~w~ para ~g~Pedir Camioneta~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) then
				quimi_1()
			end
		end
		
		--LLEGAMOS CON LA CAMIONETA AL HUMANE
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Quimicos2.x, Config.Quimicos2.y, Config.Quimicos2.z)
		if distance <= 3.0 and isRecolting7 then
			Drawing.draw3DText(Config.Quimicos2.x, Config.Quimicos2.y, Config.Quimicos2.z, 'Presiona ~g~[E]~w~ para ~g~abrir el baul~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) then
				quimi_2()
			end
		end
		
		--ABRIR BAUL PUNTO 2
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Quimicos3.x, Config.Quimicos3.y, Config.Quimicos3.z)
		if distance <= 2.0 and isRecolting7 then
			Drawing.draw3DText(Config.Quimicos3.x, Config.Quimicos3.y, Config.Quimicos3.z, 'Presiona ~g~[E]~w~ para ~g~abrir el baul~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) then
				quimi_2()
			end
		end
		
		--Agarramos la bolsa de quimicos
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.EntregaBolsa.x, Config.EntregaBolsa.y, Config.EntregaBolsa.z)
		if distance <= 1.5 and bolsa1 then
			Drawing.draw3DText(Config.EntregaBolsa.x, Config.EntregaBolsa.y, Config.EntregaBolsa.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Agarrar Bolsa~w~', 1, 0.1, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) and not garbagebag then
				Agarro_Bolsa()
			end
		end
		
		--Agarramos la bolsa de quimicos2
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.EntregaBolsa2.x, Config.EntregaBolsa2.y, Config.EntregaBolsa2.z)
		if distance <= 1.5 and bolsa1 then
			Drawing.draw3DText(Config.EntregaBolsa2.x, Config.EntregaBolsa2.y, Config.EntregaBolsa2.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Agarrar Bolsa~w~', 1, 0.1, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) and not garbagebag then
				Agarro_Bolsa()
			end
		end
		
		--ponemos la bolsa en la chata
		if garbagebag and bolsa1 then
			local trunk = GetEntityBoneIndexByName(camioneta, 'boot')
			local coords = GetWorldPositionOfEntityBone(camioneta, trunk)
			--local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, camioneta_coords.x, camioneta_coords.y, camioneta_coords.z)
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords, true) <= 1.5 then
				--Drawing.draw3DText(camioneta_coords.x, camioneta_coords.y, camioneta_coords.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~guardar bolsa~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
				DrawText3D(coords, '~g~[G]~w~ para cargar bolsa')
				if IsControlJustPressed(1, 47) then
					Cargo_Bolsa()
				end
			end
		end
		
		--Devolvemos la camioneta de quimicos
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Quimicos4.x, Config.Quimicos4.y, Config.Quimicos4.z)
		if distance <= 1.5 and bolsa2 then
			Drawing.draw3DText(Config.Quimicos4.x, Config.Quimicos4.y, Config.Quimicos4.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~devolver la camioneta~w~', 1, 0.1, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) and bolsa2 then
				Termino_Quimicos()
			end
		end
		]]--

		if armando_faso or secando_faso then
			DisableAllControlActions(0)
			EnableControlAction(0, 38, true)
			EnableControlAction(0, 1, true)
			EnableControlAction(0, 2, true)
		end
		
		--LLegamos A Empaquetar Mari
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.PaqueteMari3.x, Config.PaqueteMari3.y, Config.PaqueteMari3.z)	
		if distance <= 2.0 then
			if armando_faso then
				Drawing.draw3DText(Config.PaqueteMari3.x, Config.PaqueteMari3.y, Config.PaqueteMari3.z - 0.5, 'Presiona ~r~[E]~w~ para ~r~CANCELAR!', 1, 0.1, 0.1, 255, 255, 255, 215)
			elseif not armando_faso and not armando then
				Drawing.draw3DText(Config.PaqueteMari3.x, Config.PaqueteMari3.y, Config.PaqueteMari3.z - 0.5, 'Presiona ~g~[E]~w~ para armar faso!', 1, 0.1, 0.1, 255, 255, 255, 215)
			elseif not armando_faso and armando then
				Drawing.draw3DText(Config.PaqueteMari3.x, Config.PaqueteMari3.y, Config.PaqueteMari3.z - 0.5, '~r~Cancelando...', 1, 0.1, 0.1, 255, 255, 255, 215)
			end
			if IsControlJustPressed(1, 38) and not armando_faso and not IsEntityDead(ped) and not armando then
				armando_faso = true
				--ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
					--if cops >= 1 then
						--Mari_Paquet()
						ESX.TriggerServerCallback('1974_drogas:marijuana_count', function(xCannabis)
							if xCannabis then
								ESX.TriggerServerCallback('1974_drogas:check', function(can)
									if can then
										SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
										FreezeEntityPosition(ped, true)
										SetEntityHeading(ped, 200.0)
										
										local dict, anim = 'anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v5_coccutter'
										ESX.Streaming.RequestAnimDict(dict)
										TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 1, 0.0, false, false, false)

										local pCoords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0)
										modelSpawn = CreateObject(GetHashKey('prop_cs_credit_card'), pCoords.x, pCoords.y, pCoords.z, true, true, true)
		
										AttachEntityToEntity(modelSpawn, ped, GetPedBoneIndex(ped, 6286), 0.12, 0.0, -0.06, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)										
										
										armando = true
										
										TriggerEvent('dpemotes:broyale', true)
										TriggerEvent('CarryPeople:broyale', true)
										TriggerEvent('TakeHostage:broyale', true)
										
										Citizen.CreateThread(function()
											while armando_faso do		
												Citizen.Wait(5000)	
												if not armando_faso then
													armando = false
													TriggerEvent('dpemotes:broyale', false)
													TriggerEvent('CarryPeople:broyale', false)
													TriggerEvent('TakeHostage:broyale', false)
													
													ClearFocus()
													RenderScriptCams(false, false, 0, true, false)
													DestroyCam(cam, false)
													cam = nil
													break
												end			
												if not IsEntityDead(ped) and distance <= 2.0 then
													ESX.TriggerServerCallback('1974_drogas:paquet_drop', function(xCannabis)
														if not xCannabis then	
															ESX.ShowNotification('~r~No tienes mas Marihuana!')
															ClearPedTasksImmediately(ped)
															DeleteEntity(modelSpawn)
															armando_faso = false
															FreezeEntityPosition(ped, false)
														end
													end, can)
												else
													ClearPedTasksImmediately(ped)
													DeleteEntity(modelSpawn)
													armando_faso = false
													FreezeEntityPosition(ped, false)
												end
											end
										end)
									end
								end)
							else
								ClearPedTasksImmediately(ped)
								DeleteEntity(modelSpawn)
								armando_faso = false
								FreezeEntityPosition(ped, false)
								ESX.ShowNotification('~r~No tienes mas Marihuana!')
							end	
						end)
					--else
						--ClearPedTasksImmediately(ped)
						--DeleteEntity(modelSpawn)
						--armando_faso = false
						--FreezeEntityPosition(ped, false)
						--ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
					--end
				--end)
			elseif IsControlJustPressed(1, 38) and armando_faso and armando then	
				ClearPedTasksImmediately(ped)
				DeleteEntity(modelSpawn)
				armando_faso = false
				FreezeEntityPosition(ped, false)
			end
		elseif distance > 2.0 and armando_faso then
			ClearPedTasksImmediately(ped)
			DeleteEntity(modelSpawn)
			armando_faso = false
			FreezeEntityPosition(ped, false)
			ESX.ShowNotification('~r~Fuiste demasiado Lejos no puedes farmear desde aqui...')
		end
		
		--Quimicos Cocaina 2023
		--[[
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Quimicos2023.x, Config.Quimicos2023.y, Config.Quimicos2023.z)	
		if distance <= 2.0 then
			if junquimico then
				Drawing.draw3DText(Config.Quimicos2023.x, Config.Quimicos2023.y,Config.Quimicos2023.z, 'Presiona ~r~[E]~w~ para ~r~CANCELAR!', 1, 0.1, 0.1, 255, 255, 255, 215)
			elseif not junquimico and not juntando then
				Drawing.draw3DText(Config.Quimicos2023.x, Config.Quimicos2023.y, Config.Quimicos2023.z, 'Presiona ~g~[E]~w~ para preparar ~g~Quimico!', 1, 0.1, 0.1, 255, 255, 255, 215)
			elseif not junquimico and juntando then
				Drawing.draw3DText(Config.Quimicos2023.x, Config.Quimicos2023.y, Config.Quimicos2023.z, '~r~Cancelando...', 1, 0.1, 0.1, 255, 255, 255, 215)
			end
			
			if IsControlJustPressed(1, 38) and not junquimico and not IsEntityDead(ped) and not juntando then
				junquimico = true
				ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
					if cops >= 1 then
						ESX.TriggerServerCallback('1974_drogas:check', function(can)
							if can then
								SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
								FreezeEntityPosition(ped, true)
								SetEntityHeading(ped, 200.0)
										
								local dict, anim = 'anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v5_coccutter'
								ESX.Streaming.RequestAnimDict(dict)
								TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 1, 0.0, false, false, false)

								local pCoords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0)
								modelSpawn = CreateObject(GetHashKey('prop_cs_credit_card'), pCoords.x, pCoords.y, pCoords.z, true, true, true)
		
								AttachEntityToEntity(modelSpawn, ped, GetPedBoneIndex(ped, 6286), 0.12, 0.0, -0.06, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)										
										
								juntando = true
										
								TriggerEvent('dpemotes:broyale', true)
								TriggerEvent('CarryPeople:broyale', true)
								TriggerEvent('TakeHostage:broyale', true)
										
								Citizen.CreateThread(function()
									while junquimico do		
										Citizen.Wait(5000)	
										if not junquimico then
											juntando = false
											TriggerEvent('dpemotes:broyale', false)
											TriggerEvent('CarryPeople:broyale', false)
											TriggerEvent('TakeHostage:broyale', false)
													
											ClearFocus()
											RenderScriptCams(false, false, 0, true, false)
											DestroyCam(cam, false)
											cam = nil
											break
										end			
										if not IsEntityDead(ped) and distance <= 2.0 and junquimico then
											TriggerServerEvent('1974_drogas:drop_quimicos', can)		
										else
											ClearPedTasksImmediately(ped)
											DeleteEntity(modelSpawn)
											junquimico = false
											FreezeEntityPosition(ped, false)
										end
									end
								end)
							end
						end)
					else
						ClearPedTasksImmediately(ped)
						DeleteEntity(modelSpawn)
						junquimico = false
						FreezeEntityPosition(ped, false)
						ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
					end
				end)
			elseif IsControlJustPressed(1, 38) and junquimico and juntando then	
				ClearPedTasksImmediately(ped)
				DeleteEntity(modelSpawn)
				junquimico = false
				FreezeEntityPosition(ped, false)
			end
		elseif distance > 2.0 and junquimico then
			ClearPedTasksImmediately(ped)
			DeleteEntity(modelSpawn)
			junquimico = false
			FreezeEntityPosition(ped, false)
			ESX.ShowNotification('~r~Fuiste demasiado Lejos no puedes farmear desde aqui...')
		end
		]]--

		--Secado de Marihuana
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Mari_Secado.x, Config.Mari_Secado.y, Config.Mari_Secado.z)	
		if distance <= 2.0 then
			if secando_faso then
				Drawing.draw3DText(Config.Mari_Secado.x, Config.Mari_Secado.y, Config.Mari_Secado.z - 0.5, 'Presiona ~r~[E]~w~ para ~r~CANCELAR!', 1, 0.1, 0.1, 255, 255, 255, 215)
			elseif not secando_faso and not secando then
				Drawing.draw3DText(Config.Mari_Secado.x, Config.Mari_Secado.y, Config.Mari_Secado.z - 0.5, 'Presiona ~g~[E]~w~ para Secar Marihuana!', 1, 0.1, 0.1, 255, 255, 255, 215)
			elseif not secando_faso and secando then
				Drawing.draw3DText(Config.Mari_Secado.x, Config.Mari_Secado.y, Config.Mari_Secado.z - 0.5, '~r~Cancelando...', 1, 0.1, 0.1, 255, 255, 255, 215)
			end
			--Drawing.draw3DText(Config.Mari_Secado.x, Config.Mari_Secado.y, Config.Mari_Secado.z - 0.5, 'Presiona ~g~[E]~w~ para Secar!', 1, 0.1, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) and not secando_faso and not IsEntityDead(ped) and not secando then 
				secando_faso = true
				--ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
					--if cops >= 1 then
						ESX.TriggerServerCallback('1974_drogas:cannabis_count', function(xCannabis)
							if xCannabis then
								ESX.TriggerServerCallback('1974_drogas:check', function(can)
									if can then
										SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
										
										
										SetEntityCoords(ped, 1975.503,3818.608,32.436)
										SetEntityHeading(ped, 325.44509887695)
										FreezeEntityPosition(ped, true)
										
										local dict, anim = 'anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v5_coccutter'
										ESX.Streaming.RequestAnimDict(dict)
										TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 1, 0.0, false, false, false)										
										
										secando = true
										
										TriggerEvent('dpemotes:broyale', true)
										TriggerEvent('CarryPeople:broyale', true)
										TriggerEvent('TakeHostage:broyale', true)
										
										Citizen.CreateThread(function()
											while secando_faso do
												Citizen.Wait(5000)	
												if not secando_faso then
													secando = false
													TriggerEvent('dpemotes:broyale', false)
													TriggerEvent('CarryPeople:broyale', false)
													TriggerEvent('TakeHostage:broyale', false)
													break
												end	
												if not IsEntityDead(ped) and distance <= 2.0 and secando_faso then
													ESX.TriggerServerCallback('1974_drogas:secado_drop', function(xCannabis)
														if not xCannabis then	
															ESX.ShowNotification('~r~No tienes mas Cannabis!')
															ClearPedTasksImmediately(ped)
															secando_faso = false
															FreezeEntityPosition(ped, false)
														end
													end, can)
												else
													ClearPedTasksImmediately(ped)
													secando_faso = false
													FreezeEntityPosition(ped, false)
												end
											end
										end)
									end
								end)
							else
								ClearPedTasksImmediately(ped)
								secando_faso = false
								FreezeEntityPosition(ped, false)
								ESX.ShowNotification('~r~No tienes mas Cannabis!')
							end	
						end)
						--Mari_Secado()
					--else
						--ClearPedTasksImmediately(ped)
						--secando_faso = false
						--FreezeEntityPosition(ped, false)
						--ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
					--end
				--end)
			elseif IsControlJustPressed(1, 38) and secando_faso and secando then	
				ClearPedTasksImmediately(ped)
				secando_faso = false
				FreezeEntityPosition(ped, false)
			end
		elseif distance > 2.0 and secando_faso then
			ClearPedTasksImmediately(ped)
			secando_faso = false
			FreezeEntityPosition(ped, false)
			ESX.ShowNotification('~r~Fuiste demasiado Lejos no puedes secar desde aqui...')
		end

		--Casa Mucama Gobernador
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Mucama.x, Config.Mucama.y, Config.Mucama.z)	
		if distance <= 2.0 then
			Drawing.draw3DText(Config.Mucama.x, Config.Mucama.y, Config.Mucama.z, 'Presiona ~g~[E]~w~ para ~g~Negociar con la Mucama~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) then
				MucamaMenu()
			end
		end	
		
		if ladronCasino then
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaCasino.x, Config.RobaCasino.y, Config.RobaCasino.z)
			if distance <= 100 then
				if timeLeft > 0 then
					TriggerEvent("mt:missiontext", "DEBES PERMANECER EN EL CASINO:~r~ " .. timeLeft.. " ~w~SEGUNDOS.")
				else
					ladronCasino = false
					timeLeft = 220
					TriggerEvent("mt:missiontext", "~g~YA PUEDES ESCAPAR!!!", 8000)
					
					ESX.TriggerServerCallback('1974_drogas:check', function(can)
						if can then
							TriggerServerEvent("1974_drogas:RoboTerminadoCasino", can)
						end
					end)
				end
			elseif distance >= 100 then
				ladronCasino = false
				timeLeft = 220
				TriggerServerEvent('1974_drogas:CancelCasino')
				ESX.ShowNotification('~r~Te fuiste antes de tiempo!\nEl robo se CANCELO!')
			end	
		end
		
		if ladronPollos then
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaPollos.x, Config.RobaPollos.y, Config.RobaPollos.z)
			if distance <= 100 then
				if timeLeft > 0 then
					TriggerEvent("mt:missiontext", "DEBES PERMANECER EN LA POLLERIA:~r~ " .. timeLeft.. " ~w~SEGUNDOS.")
				else
					ladronPollos = false
					timeLeft = 220
					TriggerEvent("mt:missiontext", "~g~YA PUEDES ESCAPAR!!!", 8000)
					
					ESX.TriggerServerCallback('1974_drogas:check', function(can)
						if can then
							TriggerServerEvent("1974_drogas:RoboTerminadoPollos", can)
						end
					end)
				end
			elseif distance >= 100 then
				ladronPollos = false
				timeLeft = 220
				TriggerServerEvent('1974_drogas:CancelPollos')
				ESX.ShowNotification('~r~Te fuiste antes de tiempo!\nEl robo se CANCELO!')
			end	
		end
		
		if ladronFran then
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaFran.x, Config.RobaFran.y, Config.RobaFran.z)
			if distance <= 100 then
				if timeLeft > 0 then
					TriggerEvent("mt:missiontext", "DEBES PERMANECER EN LA CASA DE FRANKLIN:~r~ " .. timeLeft.. " ~w~SEGUNDOS.")
				else
					ladronFran = false
					timeLeft = 220
					TriggerEvent("mt:missiontext", "~g~YA PUEDES ESCAPAR!!!", 8000)
					
					ESX.TriggerServerCallback('1974_drogas:check', function(can)
						if can then
							TriggerServerEvent("1974_drogas:RoboTerminadoFran", can)
						end
					end)
				end
			elseif distance >= 100 then
				ladronFran = false
				timeLeft = 220
				TriggerServerEvent('1974_drogas:CancelFran')
				ESX.ShowNotification('~r~Te fuiste antes de tiempo!\nEl robo se CANCELO!')
			end	
		end
		
		if ladronPA then
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaPA.x, Config.RobaPA.y, Config.RobaPA.z)
			if distance <= 100 then
				if timeLeft > 0 then
					TriggerEvent("mt:missiontext", "DEBES PERMANECER EN EL PORTA AVIONES:~r~ " .. timeLeft.. " ~w~SEGUNDOS.")
				else
					ladronPA = false
					timeLeft = 220
					TriggerEvent("mt:missiontext", "~g~YA PUEDES ESCAPAR!!!", 8000)
					
					ESX.TriggerServerCallback('1974_drogas:check', function(can)
						if can then
							TriggerServerEvent("1974_drogas:RoboTerminadoPA", can)
						end
					end)
				end
			elseif distance >= 100 then
				ladronPA = false
				timeLeft = 220
				TriggerServerEvent('1974_drogas:CancelPA')
				ESX.ShowNotification('~r~Te fuiste antes de tiempo!\nEl robo se CANCELO!')
			end	
		end
		
		if ladronSubte then
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaSubte.x, Config.RobaSubte.y, Config.RobaSubte.z)
			if distance <= 100 then
				if timeLeft > 0 then
					TriggerEvent("mt:missiontext", "DEBES PERMANECER EN EL SUBTE:~r~ " .. timeLeft.. " ~w~SEGUNDOS.")
				else
					ladronSubte = false
					timeLeft = 220
					TriggerEvent("mt:missiontext", "~g~YA PUEDES ESCAPAR!!!", 8000)
					
					ESX.TriggerServerCallback('1974_drogas:check', function(can)
						if can then
							TriggerServerEvent("1974_drogas:RoboTerminadoSubte", can)
						end
					end)
				end
			elseif distance >= 100 then
				ladronSubte = false
				timeLeft = 220
				TriggerServerEvent('1974_drogas:CancelSubte')
				ESX.ShowNotification('~r~Te fuiste antes de tiempo!\nEl robo se CANCELO!')
			end	
		end
		
		if ladronCarne then
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaCarne.x, Config.RobaCarne.y, Config.RobaCarne.z)
			if distance <= 100 then
				if timeLeft > 0 then
					TriggerEvent("mt:missiontext", "DEBES PERMANECER EN EL FRIGORIFICO:~r~ " .. timeLeft.. " ~w~SEGUNDOS.")
				else
					ladronCarne = false
					timeLeft = 220
					TriggerEvent("mt:missiontext", "~g~YA PUEDES ESCAPAR!!!", 8000)
					
					ESX.TriggerServerCallback('1974_drogas:check', function(can)
						if can then
							TriggerServerEvent("1974_drogas:RoboTerminadoCarne", can)
						end
					end)
				end
			elseif distance >= 100 then
				ladronCarne = false
				timeLeft = 220
				TriggerServerEvent('1974_drogas:CancelCarne')
				ESX.ShowNotification('~r~Te fuiste antes de tiempo!\nEl robo se CANCELO!')
			end	
		end

		if ladronYate then
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Yate.x, Config.Yate.y, Config.Yate.z)
			if distance <= 75 then
				if timeLeft > 0 then
					TriggerEvent("mt:missiontext", "DEBES PERMANECER EN EL YATE:~r~ " .. timeLeft.. " ~w~SEGUNDOS.")
				else
					ladronYate = false
					timeLeft = 220
					TriggerEvent("mt:missiontext", "~g~YA PUEDES ESCAPAR!!!", 8000)
					
					ESX.TriggerServerCallback('1974_drogas:check', function(can)
						if can then
							TriggerServerEvent("1974_drogas:RoboTerminadoYate", can)
						end
					end)
					--TriggerServerEvent('1974_drogas:RoboTerminadoYate')
				end
			elseif distance >= 75 then
				ladronYate = false
				timeLeft = 220
				TriggerServerEvent('1974_drogas:CancelYate')
				ESX.ShowNotification('~r~Te fuiste antes de tiempo!\nEl robo se CANCELO!')
			end	
		end
		
		if ladronYate2 then
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Yate2.x, Config.Yate2.y, Config.Yate2.z)
			if distance <= 75 then
				if timeLeft > 0 then
					TriggerEvent("mt:missiontext", "DEBES PERMANECER EN EL YATE:~r~ " .. timeLeft.. " ~w~SEGUNDOS.")
				else
					ladronYate2 = false
					timeLeft = 220
					TriggerEvent("mt:missiontext", "~g~YA PUEDES ESCAPAR!!!", 8000)
					
					ESX.TriggerServerCallback('1974_drogas:check', function(can)
						if can then
							TriggerServerEvent("1974_drogas:RoboTerminadoYate2", can)
						end
					end)
					--TriggerServerEvent('1974_drogas:RoboTerminadoYate')
				end
			elseif distance >= 75 then
				ladronYate2 = false
				timeLeft = 220
				TriggerServerEvent('1974_drogas:CancelYate2')
				ESX.ShowNotification('~r~Te fuiste antes de tiempo!\nEl robo se CANCELO!')
			end	
		end
		
		if ladron then
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Gobernador.x, Config.Gobernador.y, Config.Gobernador.z)
			if distance <= 20 then
				if timeLeft > 0 then
					TriggerEvent("mt:missiontext", "DEBES PERMANECER EN LA CASA DURANTE:~r~ " .. timeLeft.. " ~w~SEGUNDOS.")
				else
					ladron = false
					timeLeft = 220
					TriggerEvent("mt:missiontext", "~g~YA PUEDES ESCAPAR!!!", 8000)
					ESX.TriggerServerCallback('1974_drogas:check', function(can)
						if can then
							TriggerServerEvent("1974_drogas:RoboTerminado", can)
						end
					end)
				end
			elseif distance >= 20 then
				ladron = false
				timeLeft = 220
				TriggerServerEvent('1974_drogas:Cancel') --here it works
				ESX.ShowNotification('~r~Te fuiste antes de tiempo!\nEl robo se CANCELO!')
			end	
		end
	end
end)

function Entrego_Mari()
	if GetVehiclePedIsIn(GetPlayerPed(-1), false) == camioneta_mari then
		if Blips.delivery then
			RemoveBlip(Blips.delivery)
			Blips.delivery = nil
		end	
		isRecolting5 = false
		DeleteEntity(camioneta_mari)
		ESX.TriggerServerCallback('1974_drogas:check', function(can)
			if can then
				TriggerServerEvent('1974_drogas:dropmariv', can)
			end
		end)
	else
		ESX.ShowNotification("~r~No es la camioneta que te dimos!")
	end
end

function Doy_Camioneta()
	if ESX.Game.IsSpawnPointClear(Config.MariSpawnC, 5.0) then
		
		ESX.Game.SpawnVehicle('pony2', Config.MariSpawnC, Config.MariSpawnC.w, function(callback_vehicle)
			SetVehicleNumberPlateText(callback_vehicle, 'ZONASUR')
			exports["LegacyFuel"]:SetFuel(callback_vehicle, 100)
			TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
			camioneta_mari = callback_vehicle
		end)
		
		isRecolting5 = true	
		
		Citizen.CreateThread(function()
			while isRecolting5 do
				Citizen.Wait(5)
				local player = PlayerPedId()
				if IsEntityDead(player) then	
					if Blips.delivery then
						RemoveBlip(Blips.delivery)
						Blips.delivery = nil
					end	
					TriggerServerEvent('1974_drogas:cancelo_mari_venta')
					isRecolting5 = false
					DeleteEntity(camioneta_mari)
					ESX.ShowNotification('~r~Perdiste la mision de entrega!')
				end
			end
		end)
		
		Blips.delivery = AddBlipForCoord(Config.MariLlegada.x, Config.MariLlegada.y, Config.MariLlegada.z)
		SetBlipRoute(Blips.delivery, true)
		ESX.ShowNotification('~w~Lleva la ~b~Marihuana~w~ al puerto!')			
						
		TriggerServerEvent("1974_drogas:aviso_mari")
		
	else
		ESX.ShowNotification("~r~Espera que se despeje la zona")
	end
end

function quimi_2()
	if GetVehiclePedIsIn(GetPlayerPed(-1), false) == camioneta then
		if Blips.delivery then
			RemoveBlip(Blips.delivery)
			Blips.delivery = nil
		end
		
		isRecolting7 = false
		bolsa1 = true
		SetVehicleDoorOpen(camioneta, 5, false, false)
		FreezeEntityPosition(camioneta, true)
		ESX.ShowNotification('~y~Carga la camioneta con los quimicos!')

	else
		ESX.ShowNotification('~r~No es la camioneta de la mision!')
	end
end

function Entrego_Camion()
	if GetVehiclePedIsIn(GetPlayerPed(-1), false) == camioneta_venta then
		if Blips.delivery then
			RemoveBlip(Blips.delivery)
			Blips.delivery = nil
		end	
		coke_fin = false
		DeleteEntity(camioneta_venta)
		ESX.TriggerServerCallback('1974_drogas:check', function(can)
			if can then
				TriggerServerEvent('1974_drogas:dropcrp_coke', can)
			end
		end)
	else
		ESX.ShowNotification("~r~No es la camioneta que te alquilamos!")
	end
end

function VentaCoca()
	ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
		if cops >= 2 then
			ESX.TriggerServerCallback('1974_drogas:check_coke', function(tengo)
				if tengo then
					if ESX.Game.IsSpawnPointClear(Config.CamionVentaCoca, 5.0) then
						isRecolting8 = true
						ESX.Game.SpawnVehicle('rumpo3', Config.CamionVentaCoca, Config.CamionVentaCoca.w, function(callback_vehicle)
							SetVehicleNumberPlateText(callback_vehicle, 'ZONASUR')
							exports["LegacyFuel"]:SetFuel(callback_vehicle, 100)
							TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
							camioneta_venta = callback_vehicle
						end)
						Blips.delivery = AddBlipForCoord(Config.LleadaVentaCoca.x, Config.LleadaVentaCoca.y, Config.LleadaVentaCoca.z)
						SetBlipRoute(Blips.delivery, true)
						ESX.ShowNotification('~g~Lleva la Coca a la Mansion de los Fernandez!')
						
						local tiempo = math.random(10000, 60000)
						Wait(tiempo)
						
						
						local playerPed = PlayerPedId()
						local PedPosition = GetEntityCoords(playerPed)
						local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }
						
						TriggerServerEvent("1974_drogas:aviso_venta_coca", PlayerCoords)
					else
						ESX.ShowNotification("~r~Espera que se despeje la zona")
					end
				else
					ESX.ShowNotification("~r~Debes tener 100 de Cocaina")
				end
			end)
		else
			ESX.ShowNotification("Deben haber almenos ~b~2 Policia~s~ en la ciudad para Vender.")
		end
	end)
end

function Termino_Quimicos()
	if GetVehiclePedIsIn(GetPlayerPed(-1), false) == camioneta then
		if Blips.delivery then
			RemoveBlip(Blips.delivery)
			Blips.delivery = nil
		end
		
		bolsa2 = false
		
		DeleteEntity(camioneta)
		
		ESX.TriggerServerCallback('1974_drogas:check', function(serial)
			if serial then
				TriggerServerEvent('1974_drogas:devuelvo_dinero', 10000, serial)
			end
		end)
	else
		ESX.ShowNotification("~r~No es la camioneta que te alquilamos!")
	end
end

function Dejo_Bolsa()
	if not HasAnimDictLoaded("anim@heists@narcotics@trash") then
		RequestAnimDict("anim@heists@narcotics@trash") 
		while not HasAnimDictLoaded("anim@heists@narcotics@trash") do 
			Citizen.Wait(0)
		end
	end
	
	ClearPedTasksImmediately(GetPlayerPed(-1))
	TaskPlayAnim(PlayerPedId(), 'anim@heists@narcotics@trash', 'throw_b', 1.0, -1.0,-1,2,0,0, 0,0)
	Citizen.Wait(800)
	DeleteEntity(garbagebag)
	garbagebag = nil
	Citizen.Wait(100)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	
	ESX.TriggerServerCallback('1974_drogas:check', function(can)
		if can then
			TriggerServerEvent("1974_drogas:drop_dinerococa", can)
		end
		bolsas_cargadas = bolsas_cargadas + 1
		if bolsas_cargadas == 10 then
			bolsas_cargadas = 0
			ESX.ShowNotification("~y~Ya bajaste todas las bolsas, devuelve el camion para recibir tu comprobante!")
			SetVehicleDoorShut(camioneta_venta, 5, false)
			FreezeEntityPosition(camioneta_venta, false)
			bolsa_venta = false
			
			Blips.delivery = AddBlipForCoord(Config.DevolverCamion.x, Config.DevolverCamion.y, Config.DevolverCamion.z)
			SetBlipRoute(Blips.delivery, true)
			coke_fin = true
		end
	end)
end

function Cargo_Bolsa()
	if not HasAnimDictLoaded("anim@heists@narcotics@trash") then
		RequestAnimDict("anim@heists@narcotics@trash") 
		while not HasAnimDictLoaded("anim@heists@narcotics@trash") do 
			Citizen.Wait(0)
		end
	end
	
	ClearPedTasksImmediately(GetPlayerPed(-1))
	TaskPlayAnim(PlayerPedId(), 'anim@heists@narcotics@trash', 'throw_b', 1.0, -1.0,-1,2,0,0, 0,0)
	Citizen.Wait(800)
	DeleteEntity(garbagebag)
	garbagebag = nil
	Citizen.Wait(100)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	
	ESX.TriggerServerCallback('1974_drogas:check', function(can)
		if can then
			TriggerServerEvent("1974_drogas:drop_quimicos", can)
		end
		bolsas_cargadas = bolsas_cargadas + 1
		
		if bolsas_cargadas == 10 then
			bolsa1 = false
			bolsas_cargadas = 0
			ESX.ShowNotification("~r~No puedes llevar mas bolsas, vuelve a entregar la Mercaderia!")
			
			SetVehicleDoorShut(camioneta, 5, false)
			FreezeEntityPosition(camioneta, false)
			
			Blips.delivery = AddBlipForCoord(Config.Quimicos4.x, Config.Quimicos4.y, Config.Quimicos4.z)
			SetBlipRoute(Blips.delivery, true)
			bolsa2 = true
		end
	end)
end

function Agarro_Bolsa()
	if not HasAnimDictLoaded("anim@heists@narcotics@trash") then
		RequestAnimDict("anim@heists@narcotics@trash") 
		while not HasAnimDictLoaded("anim@heists@narcotics@trash") do 
			Citizen.Wait(0)
		end
	end
	
	ClearPedTasks(PlayerPedId())
	
	garbagebag = CreateObject(GetHashKey("prop_cs_street_binbag_01"), 0, 0, 0, true, true, true) -- creates object
	AttachEntityToEntity(garbagebag, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
	
	TaskPlayAnim(PlayerPedId(), 'anim@heists@narcotics@trash', 'walk', 1.0, -1.0,-1,49,0,0, 0,0)
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

--[[
function ProcesoCoca(heading)
	local player = PlayerPedId()
    if (DoesEntityExist(player) and not IsEntityDead(player)) then	
		FreezeEntityPosition(player, true)
		SetEntityHeading(player, heading)
		loadAnimDict("anim@amb@business@coc@coc_unpack_cut_left@")
		TaskPlayAnim(player, 'anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v5_coccutter', 3.0, 1.0, -1, 49, 0, 0, 0, 0)

        local pCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, 0.0)
        modelSpawn = CreateObject(GetHashKey('prop_cs_credit_card'), pCoords.x, pCoords.y, pCoords.z, true, true, true)
		
		AttachEntityToEntity(modelSpawn, ped, GetPedBoneIndex(ped, 6286), 0.12, 0.0, -0.06, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
		
		Wait(5000)
		
		ClearPedTasksImmediately(ped)
		DeleteEntity(modelSpawn)
		
		ESX.TriggerServerCallback('1974_drogas:check', function(can)
			if can then
				TriggerServerEvent("1974_drogas:drop_coke", can)
			end
		end)
		Wait(1000)
		FreezeEntityPosition(player, false)
		isProcessing = false
	end
end
]]--


Citizen.CreateThread(function()
	while true do
		Wait(5)
				
		--DrawMarker(27, Config.SalidaGo.x, Config.SalidaGo.y, Config.SalidaGo.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 0, 0, 100, 0, 0, 0, 0)
		--DrawMarker(27, Config.Entrada.x, Config.Entrada.y, Config.Entrada.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 0, 0, 100, 0, 0, 0, 0)
		
		local player = GetPlayerPed(-1)
		
		if isProcessing then
			SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			DisablePlayerFiring(player,true)
			DisableControlAction(0, 106, true)
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
		end
		
		if coke_fin then
			DrawMarker(1, Config.DevolverCamion.x, Config.DevolverCamion.y, Config.DevolverCamion.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 255, 0, 0, 100, 0, 0, 0, 0)
		end
		
		if isRecolting8 then
			DrawMarker(1, Config.LleadaVentaCoca.x, Config.LleadaVentaCoca.y, Config.LleadaVentaCoca.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 255, 0, 0, 100, 0, 0, 0, 0)
		end
		
		if isRecolting7 then
			DrawMarker(1, Config.Quimicos2.x, Config.Quimicos2.y, Config.Quimicos2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 255, 0, 0, 100, 0, 0, 0, 0)
			DrawMarker(1, Config.Quimicos3.x, Config.Quimicos3.y, Config.Quimicos3.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 255, 0, 0, 100, 0, 0, 0, 0)
		end
		
		if bolsa1 then
			DrawMarker(3, Config.EntregaBolsa.x, Config.EntregaBolsa.y, Config.EntregaBolsa.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 100, 0, 0, 0, 0)
			DrawMarker(3, Config.EntregaBolsa2.x, Config.EntregaBolsa2.y, Config.EntregaBolsa2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 100, 0, 0, 0, 0)
		end
		
		
		if bolsa_venta then
			DrawMarker(3, Config.EntregaBolsa.x, Config.EntregaBolsa.y, Config.EntregaBolsa.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 100, 0, 0, 0, 0)
		end
		
		
		if bolsa2 then
			DrawMarker(1, Config.Quimicos4.x, Config.Quimicos4.y, Config.Quimicos4.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.5, 4.5, 1.5, 255, 0, 0, 100, 0, 0, 0, 0)
		end
		
		
		if not OnRobbery then
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)

			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Gobernador.x, Config.Gobernador.y, Config.Gobernador.z)
		
			DrawMarker(1, Config.Gobernador.x, Config.Gobernador.y, Config.Gobernador.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
		
			if distance <= 1.60 then
				Drawing.draw3DText(Config.Gobernador.x, Config.Gobernador.y, Config.Gobernador.z, 'Presiona ~g~[E]~w~ para robar las ~r~Divisas', 1, 0.2, 0.1, 255, 255, 255, 215)
				--DisplayHelpText('Presiona ~INPUT_CONTEXT~ para robar las ~r~Divisas.')
					if IsControlJustPressed(0, Keys['E']) then
						ESX.TriggerServerCallback('1974_drogas:getKeyGOB', function(results)
							if results then
								ESX.TriggerServerCallback('1974_drogas:getTime', function(results)
									if results ~= nil then
										if results then
											RobarCasa()
										end
									end
								end)							
							end
						end)
					end
			end
		end
		
		if not OnRobberyYate then
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)

			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Yate.x, Config.Yate.y, Config.Yate.z)
		
			DrawMarker(1, Config.Yate.x, Config.Yate.y, Config.Yate.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
		
			if distance <= 1.60 then
				Drawing.draw3DText(Config.Yate.x, Config.Yate.y, Config.Yate.z, 'Presiona ~g~[E]~w~ para robar el ~y~YATE', 1, 0.2, 0.1, 255, 255, 255, 215)
				--DisplayHelpText('Presiona ~INPUT_CONTEXT~ para robar el ~y~YATE.')
					if IsControlJustPressed(0, Keys['E']) then
						ESX.TriggerServerCallback('1974_drogas:getTimeYate', function(results)
							if results ~= nil then
								if results then
									RobarYate()
								end
							end
						end)
					end
			end
		end
		
		if not OnRobberyYate2 then
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)

			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Yate2.x, Config.Yate2.y, Config.Yate2.z)
		
			DrawMarker(1, Config.Yate2.x, Config.Yate2.y, Config.Yate2.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
		
			if distance <= 1.60 then
				Drawing.draw3DText(Config.Yate2.x, Config.Yate2.y, Config.Yate2.z, 'Presiona ~g~[E]~w~ para robar el ~y~YATE', 1, 0.2, 0.1, 255, 255, 255, 215)
				--DisplayHelpText('Presiona ~INPUT_CONTEXT~ para robar el ~y~YATE.')
					if IsControlJustPressed(0, Keys['E']) then
						ESX.TriggerServerCallback('1974_drogas:getTimeYate2', function(results)
							if results ~= nil then
								if results then
									RobarYate2()
								end
							end
						end)
					end
			end
		end
		
		--ROBO CASINO
		
		if not OnRobberyCasino then
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)

			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaCasino.x, Config.RobaCasino.y, Config.RobaCasino.z)
		
			DrawMarker(1, Config.RobaCasino.x, Config.RobaCasino.y, Config.RobaCasino.z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
		
			if distance <= 1.60 then
				Drawing.draw3DText(Config.RobaCasino.x, Config.RobaCasino.y, Config.RobaCasino.z - 1.5, 'Presiona ~g~[E]~w~ para robar el ~y~CASINO', 1, 0.1, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(0, Keys['E']) then
					ESX.TriggerServerCallback('1974_drogas:getTimeCasino', function(results)
						if results ~= nil then
							if results then
								RobarCasino()
							end
						end
					end)
				end
			end
		end
		
		--ROBO Polleria
		if not OnRobberyPollos then
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)

			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaPollos.x, Config.RobaPollos.y, Config.RobaPollos.z)
		
			DrawMarker(1, Config.RobaPollos.x, Config.RobaPollos.y, Config.RobaPollos.z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
		
			if distance <= 1.60 then
				Drawing.draw3DText(Config.RobaPollos.x, Config.RobaPollos.y, Config.RobaPollos.z - 1.5, 'Presiona ~g~[E]~w~ para robar la ~y~POLLERIA', 1, 0.1, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(0, Keys['E']) then
					ESX.TriggerServerCallback('1974_drogas:getTimePollos', function(results)
						if results ~= nil then
							if results then
								RobarPollos()
							end
						end
					end)
				end
			end
		end
		
		
		--ROBO Casa Fran
		if not OnRobberyFran then
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)

			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaFran.x, Config.RobaFran.y, Config.RobaFran.z)
		
			DrawMarker(1, Config.RobaFran.x, Config.RobaFran.y, Config.RobaFran.z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
		
			if distance <= 1.60 then
				Drawing.draw3DText(Config.RobaFran.x, Config.RobaFran.y, Config.RobaFran.z - 1.5, 'Presiona ~g~[E]~w~ para robar la ~y~CASA', 1, 0.1, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(0, Keys['E']) then
					ESX.TriggerServerCallback('1974_drogas:getTimeFran', function(results)
						if results ~= nil then
							if results then
								RobarFran()
							end
						end
					end)
				end
			end
		end
		
		--ROBO PORTA AVIONES
		if not OnRobberyPA then
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)

			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaPA.x, Config.RobaPA.y, Config.RobaPA.z)
		
			DrawMarker(1, Config.RobaPA.x, Config.RobaPA.y, Config.RobaPA.z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
		
			if distance <= 1.60 then
				Drawing.draw3DText(Config.RobaPA.x, Config.RobaPA.y, Config.RobaPA.z - 1.5, 'Presiona ~g~[E]~w~ para robar el ~y~PORTA AVIONES', 1, 0.1, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(0, Keys['E']) then
					ESX.TriggerServerCallback('1974_drogas:getTimePA', function(results)
						if results ~= nil then
							if results then
								RobarPA()
							end
						end
					end)
				end
			end
		end
		
		--ROBO SUBTE
		if not OnRobberySubte then
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)

			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaSubte.x, Config.RobaSubte.y, Config.RobaSubte.z)
		
			DrawMarker(1, Config.RobaSubte.x, Config.RobaSubte.y, Config.RobaSubte.z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
		
			if distance <= 1.60 then
				Drawing.draw3DText(Config.RobaSubte.x, Config.RobaSubte.y, Config.RobaSubte.z - 1.5, 'Presiona ~g~[E]~w~ para robar el ~y~SUBTE', 1, 0.1, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(0, Keys['E']) then
					ESX.TriggerServerCallback('1974_drogas:getTimeSubte', function(results)
						if results ~= nil then
							if results then
								RobarSubte()
							end
						end
					end)
				end
			end
		end
		
		--ROBO FRIGORIFICO
		if not OnRobberyCarne then
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)

			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.RobaCarne.x, Config.RobaCarne.y, Config.RobaCarne.z)
		
			DrawMarker(1, Config.RobaCarne.x, Config.RobaCarne.y, Config.RobaCarne.z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
		
			if distance <= 1.60 then
				Drawing.draw3DText(Config.RobaCarne.x, Config.RobaCarne.y, Config.RobaCarne.z - 1.5, 'Presiona ~g~[E]~w~ para robar el ~y~Frigorifico', 1, 0.1, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(0, Keys['E']) then
					ESX.TriggerServerCallback('1974_drogas:getTimeCarne', function(results)
						if results ~= nil then
							if results then
								RobarCarne()
							end
						end
					end)
				end
			end
		end
		
	end
end)


function Mari_Secado()
	ESX.TriggerServerCallback('1974_drogas:cannabis_count', function(xCannabis)
		if xCannabis == 3 then
			ProcesoSecado(xCannabis)
		else
			isProcessing = false
			ESX.ShowNotification('~r~No tienes mas Cannabis!')
		end	
	end)
end

function Mari_Paquet()
	ESX.TriggerServerCallback('1974_drogas:marijuana_count', function(xCannabis)
		if xCannabis == 1 then
			--ProcessPaquet(xCannabis)
			return true
		else
			return false
		end	
	end)
end

function Farm_Efedrina()
	local playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, true)
	SetEntityHeading(playerPed, 257.4)
	ExecuteCommand('e mechanic4')
	local timeLeft = 7000 / 1000
	while timeLeft > 0 do
		ESX.ShowNotification('Procesando...')
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1
	end
	Citizen.Wait(8000)
	--ExecuteCommand('cancel')
	TriggerEvent('dpemotes:cancel')
	
	ESX.TriggerServerCallback('1974_drogas:check', function(can)
		if can then
			TriggerServerEvent("1974_drogas:drop_efedrina2", can)
		end
	end)
	
	FreezeEntityPosition(playerPed, false)
	isProcessing = false
end

function ProcesoSecado(xCannabis)
	local playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, true)
	SetEntityHeading(playerPed, 48.71)
	ExecuteCommand('e mechanic4')
	
	if(xCannabis <= 1) then
		xCannabis = 0
	end
	
	local timeLeft2 = 7000 / 1000
	
	while timeLeft2 > 0 do
		ESX.ShowNotification('Procesando...')
		Citizen.Wait(1000)
		timeLeft2 = timeLeft2 - 1
	end
	
	Citizen.Wait(8000)
	--ExecuteCommand('cancel')
	TriggerEvent('dpemotes:cancel')
	
	ESX.TriggerServerCallback('1974_drogas:check', function(can)
		if can then
			TriggerServerEvent("1974_drogas:secado_drop", can)
		end
	end)
	
	FreezeEntityPosition(playerPed, false)
	isProcessing = false	
end

function ProcessPaquet(xCannabis)
	local playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, true)
	SetEntityHeading(playerPed, 200.0)
	ExecuteCommand('e mechanic4')
	if(xCannabis <= 1) then
		xCannabis = 0
	end
	local timeLeft2 = 7000 / 1000
	while timeLeft2 > 0 do
		ESX.ShowNotification('Procesando...')
		Citizen.Wait(1000)
		timeLeft2 = timeLeft2 - 1
	end
	Citizen.Wait(8000)
	--ExecuteCommand('cancel')
	TriggerEvent('dpemotes:cancel')
	
	ESX.TriggerServerCallback('1974_drogas:check', function(can)
		if can then
			TriggerServerEvent("1974_drogas:paquet_drop", can)
		end
	end)
	
	FreezeEntityPosition(playerPed, false)
	isProcessing = false
end

function quimi_1()
	ESX.TriggerServerCallback('esx_policejob:getCopsinServicio', function(cops)	
		if cops >= 1 then
			if ESX.Game.IsSpawnPointClear(Config.Camioneta, 5.0) then
				ESX.TriggerServerCallback('1974_drogas:getMoneyGlobal', function(money)
					if money then
						isRecolting7 = true
						ESX.Game.SpawnVehicle('Surfer2', Config.Camioneta, Config.Camioneta.w, function(callback_vehicle)
							SetVehicleNumberPlateText(callback_vehicle, 'ZONASUR')
							exports["LegacyFuel"]:SetFuel(callback_vehicle, 100)
							TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
							camioneta = callback_vehicle
						end)
						Blips.delivery = AddBlipForCoord(Config.QuimicosCargaMarca.x, Config.QuimicosCargaMarca.y, Config.QuimicosCargaMarca.z)
						SetBlipRoute(Blips.delivery, true)
						ESX.ShowNotification('~y~Cuando devuelvas la camioneta, te devolvemos el dinero de Alquiler!')
						Wait(5000)
						ESX.ShowNotification('~g~Busca los quimicos~y~ al siguiente punto!')
					else
						ESX.ShowNotification('~r~No tienes dinero suficiente para pagar el Alquiler!')
					end
				end, Config.PrecioCamioneta)
			else
				ESX.ShowNotification("~r~Espera que se despeje la zona")
			end
		else
			ESX.ShowNotification("Deben haber almenos ~b~1 Policia~s~ en la ciudad para procesar.")
		end
	end)
end

function Abrir_Baul()
	if GetVehiclePedIsIn(GetPlayerPed(-1), false) == camioneta_venta then
		if Blips.delivery then
			RemoveBlip(Blips.delivery)
			Blips.delivery = nil
		end	
		isRecolting8 = false
		bolsa_venta = true
		SetVehicleDoorOpen(camioneta_venta, 5, false, false)
		FreezeEntityPosition(camioneta_venta, true)
		ESX.ShowNotification('~y~Descarga la Camioneta!')
		TriggerServerEvent('1974_drogas:aviso_casa')
	else
		ESX.ShowNotification('~r~No es la camioneta de la mision!')
	end
end

function MucamaMenu()
	local elements = {}
	elements = {
		{label = "SI" ,value = "yes"},
		{label = "NO" ,value = "no"}
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = 'Quiere Comprar Copia de Llaves?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "yes" then
				ESX.TriggerServerCallback('1974_drogas:check', function(can)
					if can then
						TriggerServerEvent("1974_drogas:dropkeygob", can)
					end
				end)
				--TriggerServerEvent("1974_drogas:dropkeygob")
			elseif data.current.value == "no" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent("mt:missiontext") -- credits: https://github.com/schneehaze/fivem_missiontext/blob/master/MissionText/missiontext.lua
AddEventHandler("mt:missiontext", function(text, time)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(text)
	DrawSubtitleTimed(time, 1)
end)

function RobarCasino()
	ESX.TriggerServerCallback('esx_policejob:getCops', function(results)
		if results ~= nil then
			if results >= Config.RequiredPolicesCasino then
				if not OnRobberyCasino then
					ladronCasino = true
					TriggerServerEvent('1974_drogas:StartCasinoRob')
				else
					ESX.ShowNotification("~r~Ya iniciaron un Robo")
				end	
            else
				ESX.ShowNotification("~r~No hay suficientes policias disponibles. " .. results .. '/' .. Config.RequiredPolicesCasino)
			end
		end
	end)
end

function RobarPollos()
	ESX.TriggerServerCallback('esx_police2job:getCops', function(results)
		if results ~= nil then
			if results >= Config.RequiredPolicesPollos then
				if not OnRobberyPollos then
					ladronPollos = true
					TriggerServerEvent('1974_drogas:StartPollosRob')
				else
					ESX.ShowNotification("~r~Ya iniciaron un Robo")
				end	
            else
				ESX.ShowNotification("~r~No hay suficientes PFA disponibles. " .. results .. '/' .. Config.RequiredPolicesPollos)
			end
		end
	end)
end

function RobarFran()
	ESX.TriggerServerCallback('esx_policejob:getCops', function(results)
		if results ~= nil then
			if results >= Config.RequiredPolicesFran then
				if not OnRobberyFran then
					ladronFran = true
					TriggerServerEvent('1974_drogas:StartFranRob')
				else
					ESX.ShowNotification("~r~Ya iniciaron un Robo")
				end	
            else
				ESX.ShowNotification("~r~No hay suficientes policias disponibles. " .. results .. '/' .. Config.RequiredPolicesFran)
			end
		end
	end)
end

function RobarPA()
	ESX.TriggerServerCallback('esx_fbi:getCopsinServicio', function(results)
		if results ~= nil then
			if results >= Config.RequiredPolicesPA then
				if not OnRobberyPA then
					ladronPA = true
					TriggerServerEvent('1974_drogas:StartPARob')
				else
					ESX.ShowNotification("~r~Ya iniciaron un Robo")
				end	
            else
				ESX.ShowNotification("~r~No hay suficientes FBI disponibles. " .. results .. '/' .. Config.RequiredPolicesPA)
			end
		end
	end)
end

function RobarSubte()
	ESX.TriggerServerCallback('esx_seguridad:getSeguridad', function(results)
		if results ~= nil then
			if results >= Config.RequiredPolicesSubte then
				if not OnRobberySubte then
					ladronSubte = true
					TriggerServerEvent('1974_drogas:StartSubteRob')
				else
					ESX.ShowNotification("~r~Ya iniciaron un Robo")
				end	
            else
				ESX.ShowNotification("~r~No hay suficientes PROSEGUR disponibles. " .. results .. '/' .. Config.RequiredPolicesSubte)
			end
		end
	end)
end

function RobarCarne()
	ESX.TriggerServerCallback('esx_policejob:getCops', function(results)
		if results ~= nil then
			if results >= Config.RequiredPolicesCarne then
				if not OnRobberyCarne then
					ladronCarne = true
					TriggerServerEvent('1974_drogas:StartCarneRob')
				else
					ESX.ShowNotification("~r~Ya iniciaron un Robo")
				end	
            else
				ESX.ShowNotification("~r~No hay suficientes PDLC disponibles. " .. results .. '/' .. Config.RequiredPolicesSubte)
			end
		end
	end)
end

function RobarYate()
	ESX.TriggerServerCallback('esx_policejob:getCops', function(results)
		if results ~= nil then
			if results >= Config.RequiredPolicesYate then
				if not OnRobberyYate then
					ladronYate = true
					TriggerServerEvent('1974_drogas:StartYateRob')
				else
					ESX.ShowNotification("~r~Ya iniciaron un Robo")
				end	
            else
				ESX.ShowNotification("~r~No hay suficientes policias disponibles. " .. results .. '/' .. Config.RequiredPolicesYate)
			end
		end
	end)
end

function RobarYate2()
	ESX.TriggerServerCallback('esx_police2job:getCops', function(results)
		if results ~= nil then
			if results >= Config.RequiredPolicesYate2 then
				if not OnRobberyYate2 then
					ladronYate2 = true
					TriggerServerEvent('1974_drogas:StartYateRob2')
				else
					ESX.ShowNotification("~r~Ya iniciaron un Robo")
				end	
            else
				ESX.ShowNotification("~r~No hay suficientes PFA. " .. results .. '/' .. Config.RequiredPolicesYate2)
			end
		end
	end)
end

function RobarCasa()
	ESX.TriggerServerCallback('esx_policejob:getCops', function(results)
		if results ~= nil then
			if results >= Config.RequiredPolices then
				if not OnRobbery then
					ladron = true
					TriggerServerEvent('1974_drogas:StartCasaGob')
				else
					ESX.ShowNotification("~r~Ya iniciaron un Robo")
				end	
            else
				ESX.ShowNotification("~r~No hay suficientes policias disponibles. " .. results .. '/' .. Config.RequiredPolices)
			end
		end
	end)
end

RegisterNetEvent('1974_drogas:status')
AddEventHandler('1974_drogas:status', function(bool)
    OnRobbery = bool
end)

RegisterNetEvent('1974_drogas:statusYate')
AddEventHandler('1974_drogas:statusYate', function(bool)
    OnRobberyYate = bool
end)

RegisterNetEvent('1974_drogas:statusYate2')
AddEventHandler('1974_drogas:statusYate2', function(bool)
    OnRobberyYate2 = bool
end)

RegisterNetEvent('1974_drogas:statusCasino')
AddEventHandler('1974_drogas:statusCasino', function(bool)
    OnRobberyCasino = bool
end)

RegisterNetEvent('1974_drogas:statusPollos')
AddEventHandler('1974_drogas:statusPollos', function(bool)
    OnRobberyPollos = bool
end)

RegisterNetEvent('1974_drogas:statusFran')
AddEventHandler('1974_drogas:statusFran', function(bool)
    OnRobberyFran = bool
end)

RegisterNetEvent('1974_drogas:statusPA')
AddEventHandler('1974_drogas:statusPA', function(bool)
    OnRobberyPA = bool
end)

RegisterNetEvent('1974_drogas:statusSubte')
AddEventHandler('1974_drogas:statusSubte', function(bool)
    OnRobberySubte = bool
end)

RegisterNetEvent('1974_drogas:statusCarne')
AddEventHandler('1974_drogas:statusCarne', function(bool)
    OnRobberyCarne = bool
end)

RegisterNetEvent('1974_drogas:setblip')
AddEventHandler('1974_drogas:setblip', function(id)
	blip6 = AddBlipForCoord(Config.Gobernador.x, Config.Gobernador.y, Config.Gobernador.z)
	SetBlipSprite(blip6, 161)
	SetBlipScale(blip6, 1.5)
	SetBlipColour(blip6, 75)
	PulseBlip(blip6)
end)

RegisterNetEvent('1974_drogas:setblipYate')
AddEventHandler('1974_drogas:setblipYate', function(id)
	blip7 = AddBlipForCoord(Config.Yate.x, Config.Yate.y, Config.Yate.z)
	SetBlipSprite(blip7, 161)
	SetBlipScale(blip7, 1.5)
	SetBlipColour(blip7, 75)
	PulseBlip(blip7)
end)

RegisterNetEvent('1974_drogas:setblipYate2')
AddEventHandler('1974_drogas:setblipYate2', function(id)
	blip8 = AddBlipForCoord(Config.Yate2.x, Config.Yate2.y, Config.Yate2.z)
	SetBlipSprite(blip8, 161)
	SetBlipScale(blip8, 1.5)
	SetBlipColour(blip8, 75)
	PulseBlip(blip8)
end)

RegisterNetEvent('1974_drogas:setblipCasino')
AddEventHandler('1974_drogas:setblipCasino', function(id)
	blipCasino = AddBlipForCoord(Config.RobaCasino.x, Config.RobaCasino.y, Config.RobaCasino.z)
	SetBlipSprite(blipCasino, 161)
	SetBlipScale(blipCasino, 1.5)
	SetBlipColour(blipCasino, 75)
	PulseBlip(blipCasino)
end)

RegisterNetEvent('1974_drogas:setblipPollos')
AddEventHandler('1974_drogas:setblipPollos', function(id)
	blipPollos1 = AddBlipForCoord(Config.RobaPollos.x, Config.RobaPollos.y, Config.RobaPollos.z)
	SetBlipSprite(blipPollos1, 161)
	SetBlipScale(blipPollos1, 1.5)
	SetBlipColour(blipPollos1, 75)
	PulseBlip(blipPollos1)
end)

RegisterNetEvent('1974_drogas:setblipFran')
AddEventHandler('1974_drogas:setblipFran', function(id)
	blipFran1 = AddBlipForCoord(Config.RobaFran.x, Config.RobaFran.y, Config.RobaFran.z)
	SetBlipSprite(blipFran1, 161)
	SetBlipScale(blipFran1, 1.5)
	SetBlipColour(blipFran1, 75)
	PulseBlip(blipFran1)
end)

RegisterNetEvent('1974_drogas:setblipPA')
AddEventHandler('1974_drogas:setblipPA', function(id)
	blipPA1 = AddBlipForCoord(Config.RobaPA.x, Config.RobaPA.y, Config.RobaPA.z)
	SetBlipSprite(blipPA1, 161)
	SetBlipScale(blipPA1, 1.5)
	SetBlipColour(blipPA1, 75)
	PulseBlip(blipPA1)
end)

RegisterNetEvent('1974_drogas:setblipSubte')
AddEventHandler('1974_drogas:setblipSubte', function(id)
	blipSubte1 = AddBlipForCoord(Config.RobaSubte.x, Config.RobaSubte.y, Config.RobaSubte.z)
	SetBlipSprite(blipSubte1, 161)
	SetBlipScale(blipSubte1, 1.5)
	SetBlipColour(blipSubte1, 75)
	PulseBlip(blipSubte1)
end)

RegisterNetEvent('1974_drogas:setblipCarne')
AddEventHandler('1974_drogas:setblipCarne', function(id)
	blipCarne1 = AddBlipForCoord(Config.RobaCarne.x, Config.RobaCarne.y, Config.RobaCarne.z)
	SetBlipSprite(blipCarne1, 161)
	SetBlipScale(blipCarne1, 1.5)
	SetBlipColour(blipCarne1, 75)
	PulseBlip(blipCarne1)
end)

Citizen.CreateThread(function() --timer
    while true do
	Wait(5)
		if ladron or ladronYate or ladronYate2 or ladronCasino or ladronPollos or ladronFran or ladronPA or ladronSubte or ladronCarne and timeLeft > 0 then
			timeLeft = timeLeft - 1
			Wait(1000)
		end	
	end	
end)

RegisterNetEvent('1974_drogas:killblip')
AddEventHandler('1974_drogas:killblip', function()
    RemoveBlip(blip6) 
end)

RegisterNetEvent('1974_drogas:killblipYate')
AddEventHandler('1974_drogas:killblipYate', function()
    RemoveBlip(blip7) 
end)

RegisterNetEvent('1974_drogas:killblipYate2')
AddEventHandler('1974_drogas:killblipYate2', function()
    RemoveBlip(blip8) 
end)

RegisterNetEvent('1974_drogas:killblipCasino')
AddEventHandler('1974_drogas:killblipCasino', function()
    RemoveBlip(blipCasino) 
end)

RegisterNetEvent('1974_drogas:killblipPollos')
AddEventHandler('1974_drogas:killblipPollos', function()
    RemoveBlip(blipPollos1) 
end)

RegisterNetEvent('1974_drogas:killblipFran')
AddEventHandler('1974_drogas:killblipFran', function()
    RemoveBlip(blipFran1) 
end)

RegisterNetEvent('1974_drogas:killblipPA')
AddEventHandler('1974_drogas:killblipPA', function()
    RemoveBlip(blipPA1) 
end)

RegisterNetEvent('1974_drogas:killblipSubte')
AddEventHandler('1974_drogas:killblipSubte', function()
    RemoveBlip(blipSubte1) 
end)

RegisterNetEvent('1974_drogas:killblipCarne')
AddEventHandler('1974_drogas:killblipCarne', function()
    RemoveBlip(blipCarne1) 
end)

RegisterNetEvent('1974_drogas:aviso')
AddEventHandler('1974_drogas:aviso', function(coords)
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	
	if coords then
		local blipAlerta = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipSprite(blipAlerta, 161)
		SetBlipScale(blipAlerta, 1.5)
		SetBlipColour(blipAlerta, 75)
		PulseBlip(blipAlerta)
		SetTimeout(20000 , function()
			RemoveBlip(blipAlerta)
		end)
	end
end)


function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z + 0.3)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
  
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
  
    AddTextComponentString(text)
    DrawText(_x, _y)
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


--FARMEO DE META

function ProcesoEfedrina() --1443.259,6331.779,23.981,183.22956848145
	local ped = PlayerPedId()
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then	
		SetEntityCoords(ped, 1443.259,6331.779,22.981)
		SetEntityHeading(ped, 183.22955322266)
		FreezeEntityPosition(ped, true)
		
		loadAnimDict("anim@amb@business@coc@coc_unpack_cut_left@")
		TaskPlayAnim(ped, 'anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v5_coccutter', 3.0, 1.0, -1, 49, 0, 0, 0, 0)

        local pCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, 0.0)
        modelSpawn = CreateObject(GetHashKey('bkr_prop_meth_scoop_01a'), pCoords.x, pCoords.y, pCoords.z, true, true, true)
		
		AttachEntityToEntity(modelSpawn, ped, GetPedBoneIndex(ped, 6286), 0.12, 0.0, -0.06, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
		
		Wait(5000)
		
		ClearPedTasksImmediately(ped)
		DeleteEntity(modelSpawn)
		
		ESX.TriggerServerCallback('1974_drogas:check', function(can)
			if can then
				TriggerServerEvent("1974_drogas:drop_efedrina", can)
			end
		end)
		Wait(1000)
		FreezeEntityPosition(ped, false)
		isProcessing = false
	end
end

function ProcesoAdrenalina() ---439.847,6338.926,12.730,214.67112731934
	local ped = PlayerPedId()
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then	
		SetEntityCoords(ped, -439.847,6338.926,11.730)
		SetEntityHeading(ped, 214.67112731934)
		FreezeEntityPosition(ped, true)
		
		loadAnimDict("anim@amb@business@coc@coc_unpack_cut_left@")
		TaskPlayAnim(ped, 'anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v5_coccutter', 3.0, 1.0, -1, 49, 0, 0, 0, 0)

        local pCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, 0.0)
        modelSpawn = CreateObject(GetHashKey('prop_cs_credit_card'), pCoords.x, pCoords.y, pCoords.z, true, true, true)
		
		AttachEntityToEntity(modelSpawn, ped, GetPedBoneIndex(ped, 6286), 0.12, 0.0, -0.06, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
		
		Wait(5000)
		
		ClearPedTasksImmediately(ped)
		DeleteEntity(modelSpawn)
		
		ESX.TriggerServerCallback('1974_drogas:check', function(can)
			if can then
				TriggerServerEvent("1974_drogas:drop_adrenalina", can)
			end
		end)
		Wait(1000)
		FreezeEntityPosition(ped, false)
		isProcessing = false
	end
end

function VentaMeta()  --venta de meta
	local ped = PlayerPedId()
	
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then	
		SetEntityCoords(ped, -2174.83,4294.559,48.052)
		SetEntityHeading(ped, 57.757373809814)
		FreezeEntityPosition(ped, true)
		
		--TriggerEvent('esx:daritem', 'bkr_prop_meth_openbag_01a')
		
		Wait(3000)
		
		ClearPedTasksImmediately(ped)
		--DeleteEntity(modelSpawn)
		
		ESX.TriggerServerCallback('1974_drogas:check', function(can)
			if can then
				TriggerServerEvent("1974_drogas:drop_dinerometa", can)
			end
		end)
		Wait(1000)
		FreezeEntityPosition(ped, false)
		isProcessing = false
	end
end

function VentaCoca2023()  --venta de coca 2023
	local ped = PlayerPedId()
	
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then	
		SetEntityCoords(ped, 104.5861,-1975.15,19.946)
		SetEntityHeading(ped, 204.78215026855)
		FreezeEntityPosition(ped, true)
		
		--TriggerEvent('esx:daritem', 'bkr_prop_meth_openbag_01a')
		
		Wait(3000)
		
		ClearPedTasksImmediately(ped)
		--DeleteEntity(modelSpawn)
		
		ESX.TriggerServerCallback('1974_drogas:check', function(can)
			if can then
				TriggerServerEvent("1974_drogas:drop_dinerococa2023", can)
			end
		end)
		Wait(1000)
		FreezeEntityPosition(ped, false)
		isProcessing = false
	end
end

function VentaMari()  --venta de meta
	local ped = PlayerPedId()
	
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then	
		SetEntityCoords(ped, -287.046,2535.645,74.254)
		SetEntityHeading(ped, 96.783416748047)
		FreezeEntityPosition(ped, true)
		
		Wait(3000)
		
		ClearPedTasksImmediately(ped)
		--DeleteEntity(modelSpawn)
		
		ESX.TriggerServerCallback('1974_drogas:check', function(can)
			if can then
				TriggerServerEvent("1974_drogas:drop_dineromari", can)
			end
		end)
		Wait(1000)
		FreezeEntityPosition(ped, false)
		isProcessing = false
	end
end

function ProcesoCoca(coords) --1443.259,6331.779,23.981,183.22956848145
	local ped = PlayerPedId()
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then	
		SetEntityCoords(ped, coords.x,coords.y,coords.z - 1.0)
		SetEntityHeading(ped, coords.w)
		FreezeEntityPosition(ped, true)
		
		loadAnimDict("anim@amb@business@coc@coc_unpack_cut_left@")
		TaskPlayAnim(ped, 'anim@amb@business@coc@coc_unpack_cut_left@', 'coke_cut_v5_coccutter', 3.0, 1.0, -1, 49, 0, 0, 0, 0)

        local pCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, 0.0)
        modelSpawn = CreateObject(GetHashKey('p_ld_id_card_01'), pCoords.x, pCoords.y, pCoords.z, true, true, true)
		
		AttachEntityToEntity(modelSpawn, ped, GetPedBoneIndex(ped, 6286), 0.12, 0.0, -0.06, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
		
		Wait(5000)
		
		ClearPedTasksImmediately(ped)
		DeleteEntity(modelSpawn)
		
		ESX.TriggerServerCallback('1974_drogas:check', function(can)
			if can then
				TriggerServerEvent("1974_drogas:drop_coca", can)
			end
		end)
		Wait(1000)
		FreezeEntityPosition(ped, false)
		isProcessing = false
	end
end

