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

ESX          = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local havebike = false
local alquilado = nil
local Blips = {}

Citizen.CreateThread(function()

	if not Config.EnableBlips then return end
	
	for _, info in pairs(Config.BlipZones) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.7)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
		
		local ped = PlayerPedId()
		local playerloc = GetEntityCoords(ped, 0)
		
        for k,v in pairs(Config.MarkerZones) do
			--local distance = #(playerloc - search)
			local distance = GetDistanceBetweenCoords(Config.MarkerZones[k].Spawn.Marker.x, Config.MarkerZones[k].Spawn.Marker.y,  Config.MarkerZones[k].Spawn.Marker.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
			
			if distance < 20 then
				DrawMarker(Config.MarkerZones[k].Blip.TypeMarker, Config.MarkerZones[k].Spawn.Marker.x, Config.MarkerZones[k].Spawn.Marker.y, Config.MarkerZones[k].Spawn.Marker.z, 0, 0, 0, 0, 0, 0, Config.MarkerScale.x, Config.MarkerScale.y, Config.MarkerScale.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, false, 2, true, nil, nil, false)	
				if alquilado then
					DrawMarker(Config.MarkerZones[k].Blip.DrawMarker, Config.MarkerZones[k].Spawn.Delete.x, Config.MarkerZones[k].Spawn.Delete.y, Config.MarkerZones[k].Spawn.Delete.z - 1.0, 0, 0, 0, 0, 0, 0, Config.MarkerZones[k].Blip.MarkerScale.x, Config.MarkerZones[k].Blip.MarkerScale.y, Config.MarkerZones[k].Blip.MarkerScale.z, 255, 0, 0, 100, false, false, 2, false, nil, nil, false)
				end
			end
			--[[
			if k ~= 'Sandy_Botes' and  k ~= 'Playa_Ciudad' then
				DrawMarker(Config.MarkerZones[k].Blip.TypeMarker, Config.MarkerZones[k].Spawn.Marker.x, Config.MarkerZones[k].Spawn.Marker.y, Config.MarkerZones[k].Spawn.Marker.z, 0, 0, 0, 0, 0, 0, Config.MarkerScale.x, Config.MarkerScale.y, Config.MarkerScale.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, false, 2, true, nil, nil, false)	
				if alquilado then
					DrawMarker(Config.MarkerZones[k].Blip.DrawMarker, Config.MarkerZones[k].Spawn.Delete.x, Config.MarkerZones[k].Spawn.Delete.y, Config.MarkerZones[k].Spawn.Delete.z, 0, 0, 0, 0, 0, 0, Config.MarkerZones[k].Blip.MarkerScale.x, Config.MarkerZones[k].Blip.MarkerScale.y, Config.MarkerZones[k].Blip.MarkerScale.z, 255, 0, 0, 100, false, false, 2, false, nil, nil, false)
				end	
			else
				DrawMarker(35, Config.MarkerZones[k].Spawn.Marker.x, Config.MarkerZones[k].Spawn.Marker.y, Config.MarkerZones[k].Spawn.Marker.z + 1.0, 0, 0, 0, 0, 0, 0, Config.MarkerScale.x, Config.MarkerScale.y, Config.MarkerScale.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, false, 2, true, nil, nil, false)
				if alquilado then
					DrawMarker(1, Config.MarkerZones[k].Spawn.Delete.x, Config.MarkerZones[k].Spawn.Delete.y, Config.MarkerZones[k].Spawn.Delete.z, 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.5, 255, 0, 0, 100, false, false, 2, false, nil, nil, false)
				end
			end
			]]
		end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        for k in pairs(Config.MarkerZones) do
        	local ped = PlayerPedId()
            local pedcoords = GetEntityCoords(ped, false)
            local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.MarkerZones[k].Spawn.Marker.x, Config.MarkerZones[k].Spawn.Marker.y, Config.MarkerZones[k].Spawn.Marker.z)
			local z = Config.MarkerZones[k].Spawn.Marker.z + 0.5

            if distance <= 1.5 then
				local deleter = vector3(Config.MarkerZones[k].Spawn.Marker.x,Config.MarkerZones[k].Spawn.Marker.y,z)
				ESX.Game.Utils.DrawText3D(deleter, "Presiona ~g~[E]~w~ para alquilar", 1.0)
				if IsControlJustPressed(0, Keys['E']) and IsPedOnFoot(ped) then
					OpenBikesMenu(k)
				end
			elseif distance < 1.45 then
				ESX.UI.Menu.CloseAll()
            end
			
			if k ~= 'Sandy_Botes' and k ~= 'Playa_Ciudad' then
				local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.MarkerZones[k].Spawn.Delete.x, Config.MarkerZones[k].Spawn.Delete.y, Config.MarkerZones[k].Spawn.Delete.z)
				if distance <= 1.40 and alquilado then
					local deleter = vector3(Config.MarkerZones[k].Spawn.Delete.x,Config.MarkerZones[k].Spawn.Delete.y,Config.MarkerZones[k].Spawn.Delete.z+1)
					ESX.Game.Utils.DrawText3D(deleter, "Presiona ~g~[E]~w~ para devolver!", 1.0)
					if IsControlJustPressed(0, Keys['E']) then
						if IsPedInAnyVehicle(ped, false) then
							if GetVehiclePedIsIn(GetPlayerPed(-1), false) == alquilado then
								DeleteEntity(alquilado)
								alquilado = nil
								if Blips.delivery then
									RemoveBlip(Blips.delivery)
									Blips.delivery = nil
								end
							else
								ESX.ShowNotification('~r~No es el vehiculo que Alquilaste!')
							end
						else
							ESX.ShowNotification('~r~No hay ningun Vehiculo para Devolver!')
						end
					end
				elseif distance < 1.45 then
					ESX.UI.Menu.CloseAll()
				end
			else
				local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.MarkerZones[k].Spawn.Delete.x, Config.MarkerZones[k].Spawn.Delete.y, Config.MarkerZones[k].Spawn.Delete.z)
				if distance <= 2.50 and alquilado then
					local deleter = vector3(Config.MarkerZones[k].Spawn.Delete.x,Config.MarkerZones[k].Spawn.Delete.y,Config.MarkerZones[k].Spawn.Delete.z+2)
					local TP = vector3(Config.MarkerZones[k].Spawn.TP.x,Config.MarkerZones[k].Spawn.TP.y,Config.MarkerZones[k].Spawn.TP.z)
					ESX.Game.Utils.DrawText3D(deleter, "Presiona ~g~[E]~w~ para devolver el Bote!", 3.0)
					if IsControlJustPressed(0, Keys['E']) then
						if IsPedInAnyBoat(ped) then
							if GetVehiclePedIsIn(GetPlayerPed(-1), false) == alquilado then
								DeleteEntity(alquilado)
								alquilado = nil
								if Blips.delivery then
									RemoveBlip(Blips.delivery)
									Blips.delivery = nil
								end
								ESX.Game.Teleport(ped, TP, function()
									SetEntityHeading(ped, Config.MarkerZones[k].Spawn.TP.h)
								end)
							else
								ESX.ShowNotification('~r~No es el vehiculo que Alquilaste!')
							end
						else
							ESX.ShowNotification('~r~No hay ningun Bote para Devolver!')
						end	
					end
				elseif distance < 2.55 then
					ESX.UI.Menu.CloseAll()
				end
			end
        end
    end
end)


function OpenBikesMenu(k)
	
	local elements = {}
	
	local lista = Config.MarkerZones[k].Bikes


	for i=1, #lista, 1 do
		table.insert(elements, { label = '<span style="color:green;">'..lista[i].label..'</span> <span style="color:red;">$'..lista[i].price..'</span>', value = lista[i].value, price = lista[i].price})
	end
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client',
    {
		title    = _U('biketitle'),
		align    = 'bottom-right',
		elements = elements,
    },
	
	
	function(data, menu)

	local bike = data.current.value
	local label = data.current.label
	local price = data.current.price
	local spawn = vector3(Config.MarkerZones[k].Spawn.Spawner.x,Config.MarkerZones[k].Spawn.Spawner.y,Config.MarkerZones[k].Spawn.Spawner.z)
	
	if data.current.value ~= nil then
		if Config.EnablePrice then
			if bike == 'GADGET_PARACHUTE' then
				TriggerServerEvent('1974_bike:addParachute', price, bike)
			else
				ESX.TriggerServerCallback('1974_bike:getMoney', function(money)
					if money then
						--[[
						ESX.Game.SpawnVehicle(bike, spawn, Config.MarkerZones[k].Spawn.Spawner.h, function(vehicle)
							TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
							ESX.Game.SetVehicleProperties(vehicle, { plate = 'ZONASUR'})
							exports["LegacyFuel"]:SetFuel(vehicle, 100)
							alquilado = vehicle
						end)
						]]
						--Blips.delivery = AddBlipForCoord(Config.MarkerZones[k].Spawn.Delete.x, Config.MarkerZones[k].Spawn.Delete.y, Config.MarkerZones[k].Spawn.Delete.z)
						--SetBlipRoute(Blips.delivery, true)
						if ESX.Game.IsSpawnPointClear(spawn, 5.0) then
							--TriggerServerEvent('1974_bike:CrearAuto', bike, spawn, Config.MarkerZones[k].Spawn.Spawner.h)
							ESX.Game.SpawnVehicle(bike, spawn, Config.MarkerZones[k].Spawn.Spawner.h, function(vehicle)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
								ESX.Game.SetVehicleProperties(vehicle, { plate = 'ZONASUR'})
								exports["LegacyFuel"]:SetFuel(vehicle, 100)
								alquilado = vehicle
							end)
							ESX.ShowNotification('Alquilaste una: ~b~'..label)
						else
							ESX.ShowNotification('~r~Espera que se despeje la zona!')
						end
					else
						ESX.ShowNotification('~r~No tienes suficiente dinero.')
					end
				end, price)	
			end
		end

	end

	ESX.UI.Menu.CloseAll()

    end,
	function(data, menu)
		menu.close()
		end
	)
end

local timer = 600
local comienzo = false

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2)
end

function Comienzo()
	Citizen.CreateThread(function()
		while timer > 0 and comienzo do
			Citizen.Wait(1000)
			if timer > 0 then
				timer = timer - 1
			end
			
			if timer == 0 then
				comienzo = false
				timer = 600
			end
		end
	end)	
	
	Citizen.CreateThread(function()
		while comienzo do
			Citizen.Wait(0)
			drawTxt(0.9, 1.45, 1.0, 1.0, 0.4, 'Su alquiler finalizara en: ~r~'..timer..' ~w~segundos!', 255, 255, 255, 255)
		end
	end)
end

RegisterNetEvent('1974_bike:start')
AddEventHandler('1974_bike:start', function(net)
	while not NetworkDoesEntityExistWithNetworkId(net) do
        Wait(0)
    end

	local callback_vehicle = NetworkGetEntityFromNetworkId(net)

    while not DoesEntityExist(callback_vehicle) do
        Wait(0)
    end
	
	TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	exports["LegacyFuel"]:SetFuel(callback_vehicle, 100)
	
    comienzo = true
	Comienzo()
end)