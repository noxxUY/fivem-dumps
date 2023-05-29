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

ESX = nil
local PlayerData = {}
local duty = false
local Blips                   = {}
local avion = nil
local destino = nil
local regreso = false
local cargado = false

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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
	local StartBlip = AddBlipForCoord(Config.Blip)
	SetBlipSprite(StartBlip, 251)
	SetBlipColour(StartBlip, 5)
	SetBlipScale(StartBlip, 0.9)
	SetBlipAsShortRange(StartBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Piloto')
	EndTextCommandSetBlipName(StartBlip)
end)

function IsPiloto()
	if PlayerData ~= nil then
		local isJobTrucker = false
		if PlayerData.job ~= nil and PlayerData.job.name == 'piloto' then
			isJobTrucker = true
		end
		return isJobTrucker
	end
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local pedcoords = GetEntityCoords(ped, false)
		
		if IsPiloto() then		
			local distance = #(pedcoords - Config.Blip)
			if distance < 50 then
				DrawMarker(3, Config.Blip.x, Config.Blip.y, Config.Blip.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
				if distance < 1.5 then
					Drawing.draw3DText(Config.Blip.x, Config.Blip.y, Config.Blip.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Cambiarte~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
					if IsControlJustPressed(1, 38) then
						OpenMenuRopa()
					end
				end
			end
			
			if duty then
				local distance = #(pedcoords - Config.SacarAvion)
				if distance < 50 then
					DrawMarker(3, Config.SacarAvion.x, Config.SacarAvion.y, Config.SacarAvion.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
					if distance < 1.5 then
						Drawing.draw3DText(Config.SacarAvion.x, Config.SacarAvion.y, Config.SacarAvion.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Sacar Avioneta~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
						if IsControlJustPressed(1, 38) then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriversLicense)
								if hasDriversLicense then
									SacarAvion()
								else
									ESX.ShowNotification('~r~NO TIENES LICENCIA DE AVION! ~W~Debes sacarte la Licencia!')
								end
							end, GetPlayerServerId(PlayerId()), 'aircraft')							
						end
					end
				end				
				
				if avion and avion == GetVehiclePedIsIn(ped,false) then
					local dist = #(pedcoords - Config.Destino[destino])
					local dist2 = #(pedcoords - Config.Devolver)
					
					local zona = false
					
					if dist < 1000 or dist2 < 1000 then
						zona = true
					end
					
					local altura = GetEntityHeightAboveGround(avion)
					
					if altura < 150 and not zona then
						--DeleteEntity(avion)
						ESX.ShowNotification("No puedes volar tan bajo por esta zona, si bajas un poco mas perderas el avion!")	
						if altura < 75 then							
							DeleteEntity(avion)	
							SetEntityCoords(ped, Config.SacarAvion.x,Config.SacarAvion.y,Config.SacarAvion.z)
							avion = nil
							destino = nil
							if Blips['delivery'] ~= nil then
								RemoveBlip(Blips['delivery'])
								Blips['delivery'] = nil
							end
						end			
					end		
					
					if destino and not cargado then
						local distance = #(pedcoords - Config.Destino[destino])
						if distance < 50 then
							DrawMarker(3, Config.Destino[destino].x, Config.Destino[destino].y, Config.Destino[destino].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
							if distance < 1.5 then
								Drawing.draw3DText(Config.Destino[destino].x, Config.Destino[destino].y, Config.Destino[destino].z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Entregar la Carga!~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
								if IsControlJustPressed(1, 38) and destino then
									if avion == GetVehiclePedIsIn(ped,false) then
										--destino = nil										
										cargado = true
										EntregarCargar()
									else
										ESX.ShowNotification("~r~No es el Avion que sacaste de Aeropuerto!")
									end
								end
							end
						end
					end
					
					if regreso then
						local distance = #(pedcoords - Config.Devolver)
						if distance < 50 then
							DrawMarker(3, Config.Devolver.x, Config.Devolver.y, Config.Devolver.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 200, false, false, 2, true, nil, nil, false)
							if distance < 7.0 then
								Drawing.draw3DText(Config.Devolver.x, Config.Devolver.y, Config.Devolver.z - 1.0, 'Presiona ~g~[E]~w~ para ~g~Terminar el trabajo!~w~', 1, 0.05, 0.05, 255, 255, 255, 215)
								if IsControlJustPressed(1, 38) and regreso then
									if avion == GetVehiclePedIsIn(ped,false) then
										regreso = false
										Finalizar()
									else
										ESX.ShowNotification("~r~No es el Avion que sacaste de Aeropuerto!")
									end
								end
							end
						end					
					end
				end
			end
		end
	end
end)

function Finalizar()
	DeleteEntity(avion)
	destino = nil
	avion = nil
	cargado = false
	if Blips['delivery'] ~= nil then
		RemoveBlip(Blips['delivery'])
		Blips['delivery'] = nil
	end
	TriggerServerEvent('1974_piloto:finish')
end

function EntregarCargar()
	if avion then
		FreezeEntityPosition(avion, true)
		if Blips['delivery'] ~= nil then
			RemoveBlip(Blips['delivery'])
			Blips['delivery'] = nil
		end
		ESX.ShowNotification("~y~Espere mientras el Avion se descarga!")
		Wait(60000)
		if avion then
			FreezeEntityPosition(avion, false)
			Regreso()
		end
	end	
end

function Regreso()
	regreso = true
	Blips['delivery'] = AddBlipForCoord(Config.Devolver)
	SetBlipRoute(Blips['delivery'], true)
	ESX.ShowNotification("~y~Regresa al Aeropuerto!")
	
end

function SacarAvion()
	local elements = {}
	
	for i=1, #Config.Aviones, 1 do
		table.insert(elements, {label = GetLabelText(GetDisplayNameFromVehicleModel(Config.Aviones[i])), value = Config.Aviones[i]})
	end
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehiclespawner',
		{
			title    = 'Sacar Avion',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
		if ESX.Game.IsSpawnPointClear(Config.Spawn.xyz, 10.0) then			
			--camionsito = vehicle
			ESX.Game.SpawnVehicle(data.current.value, Config.Spawn.xyz, Config.Spawn.w, function(vehicle)
				--platenum = math.random(10000, 99999)
				--SetVehicleNumberPlateText(vehicle, "WAL"..platenum) 
				exports["LegacyFuel"]:SetFuel(vehicle, 100)
				exports["esx_carlock"]:SetCamion(vehicle)
				TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1) 
				destino = math.random(1, #Config.Destino)
				
				Blips['delivery'] = AddBlipForCoord(Config.Destino[destino])
				SetBlipRoute(Blips['delivery'], true)
				--SetBlipRoute(Config.Destino[destino], true)		
				avion = vehicle
			end)
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

function DrawM(hint, type, x, y, z)
	ESX.Game.Utils.DrawText3D({x = x, y = y, z = z + 1.0}, hint, 0.4)
	DrawMarker(type, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
end

function OpenMenuRopa()
	local playerPed = PlayerPedId()
	local elements = {}	

	table.insert(elements, {label = 'Ropa Civil', value = 'civil'})
	table.insert(elements, {label = 'Ropa Trabajo', value = 'trabajo'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = 'Armario Piloto',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'civil' then
			ESX.UI.Menu.CloseAll()
			duty = false
			if Blips['delivery'] ~= nil then
				RemoveBlip(Blips['delivery'])
				Blips['delivery'] = nil
			end
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		else
			ESX.UI.Menu.CloseAll()
			TriggerEvent('skinchanger:getSkin', function(skin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Config.Ropa.male)
					duty = true
				else
					TriggerEvent('skinchanger:loadClothes', skin, Config.Ropa.female)
					duty = true
				end
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end