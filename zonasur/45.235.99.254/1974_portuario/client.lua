local Keys = {

["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,

["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,

["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,

["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,

["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,

["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,

["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,

["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,

}

ESX = nil

local PlayerData = {}
local onDuty = false
local barco = {}
local llego_isla = false
local tengo_barco = false
local Blips = {}
local vuelvo = false
local volver_barco = false
local llegoPuerto = false
local cajas = 0
local venta = false

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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

--[[
function Menu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = 'Ropa',
		align    = 'bottom-right',
		elements = {
			{label = 'Ropa de Trabajo', value = 'vender'},
			{label = 'Ropa de Civil', value = 'comprar'},
	}}, function(data, menu)
		if data.current.value == 'vender' then
			OpenPutStocksMenu()
		else
			local elements = {}
			for i=1, #Config.Items, 1 do
				table.insert(elements, {
					label = Config.Items[i].label .. ' [<span style="color:red;">$' .. Config.Items[i].price .. '</span>]',
					value = Config.Items[i].value,
					price = Config.Items[i].price
				})
			end
			
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'compra_menu',
			{
				title    = 'Compra de Objetos',
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				TriggerServerEvent('1974_venta_ilegal:comprar_item', data2.current.value, data2.current.price)	
				menu2.close()
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end
]]

function OpenCloakroomMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = 'Vestuario Portuario',
		align    = 'bottom-right',
		elements = {
			{label = 'Ropa Civil', value = 'citizen_wear'},
			{label = 'Ropa Portuario', value = 'coca_wear'},
	}}, function(data, menu)		
		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				onDuty = false
			end)
		elseif data.current.value == 'coca_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms['puerto'].male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms['puerto'].female)
				end
				onDuty = true
			end)
		end
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end


Citizen.CreateThread(function()
    while true do 
	Citizen.Wait(5)
		if PlayerData.job ~= nil and PlayerData.job.name == 'portuario' then
			local pedcoord = GetEntityCoords(PlayerPedId())
			local ped = PlayerPedId()
			--local x, y, z = table.unpack(Config.Venta)
			local dst = Vdist(pedcoord.x, pedcoord.y, pedcoord.z, Config.Ropa.x, Config.Ropa.y, Config.Ropa.z)		
			if dst < 50.0 then
				DrawMarker(20, Config.Ropa.x, Config.Ropa.y, Config.Ropa.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)	
			end
			if dst <= 4.5 then
				local ropa = vector3(Config.Ropa.x, Config.Ropa.y, Config.Ropa.z)
				ESX.Game.Utils.DrawText3D(ropa, "Presiona ~g~[E]~w~ para abrir el guardaropas!", 1.0)
			end
			if dst <= 1 and IsControlJustPressed(0, Keys["E"]) then
				OpenCloakroomMenu()
			end
			--Saco Barco
			local dst = Vdist(pedcoord.x, pedcoord.y, pedcoord.z, Config.Bote.x, Config.Bote.y, Config.Bote.z)			
			if dst < 50.0 and onDuty then
				DrawMarker(35, Config.Bote.x, Config.Bote.y, Config.Bote.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)	
			end	
			if dst <= 4.5 and onDuty then
				local barco = vector3(Config.Bote.x, Config.Bote.y, Config.Bote.z)
				ESX.Game.Utils.DrawText3D(barco, "Presiona ~g~[E]~w~ para subir al Barco!", 1.0)
			end
			if dst <= 1 and IsControlJustPressed(0, Keys["E"]) and onDuty then
				SpawnBarco()
			end
			--Llego con el Barco
			local dst = Vdist(pedcoord.x, pedcoord.y, pedcoord.z, Config.BoteLlegada.x, Config.BoteLlegada.y, Config.BoteLlegada.z)			
			if dst < 50.0 and tengo_barco then
				DrawMarker(1, Config.BoteLlegada.x, Config.BoteLlegada.y, Config.BoteLlegada.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 8.0, 8.0, 3.0, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)	
			end	
			if dst <= 4.5 and tengo_barco then
				local barco = vector3(Config.BoteLlegada.x, Config.BoteLlegada.y, Config.BoteLlegada.z+1.0)
				ESX.Game.Utils.DrawText3D(barco, "Presiona ~g~[E]~w~ para guardar el Barco!", 2.0)
			end
			if dst <= 5 and IsControlJustPressed(0, Keys["E"]) and tengo_barco then
				EntregoBarco()
			end
			--SACO JEEP
			local dst = Vdist(pedcoord.x, pedcoord.y, pedcoord.z, Config.Jeep.x, Config.Jeep.y, Config.Jeep.z)			
			if dst < 50.0 and llego_isla then
				DrawMarker(36, Config.Jeep.x, Config.Jeep.y, Config.Jeep.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)	
			end	
			if dst <= 4.5 and llego_isla then
				local barco = vector3(Config.Jeep.x, Config.Jeep.y, Config.Jeep.z+1.0)
				ESX.Game.Utils.DrawText3D(barco, "Presiona ~g~[E]~w~ para sacar un Jeep!", 1.0)
			end
			if dst <= 2 and IsControlJustPressed(0, Keys["E"]) and llego_isla then
				Jeep()
			end
			--farmeo cajas
			local dst = Vdist(pedcoord.x, pedcoord.y, pedcoord.z, Config.Cajas.x, Config.Cajas.y, Config.Cajas.z)			
			if dst < 50.0 and llego_isla then
				DrawMarker(3, Config.Cajas.x, Config.Cajas.y, Config.Cajas.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)	
			end	
			if dst <= 4.5 and llego_isla then
				local barco = vector3(Config.Cajas.x, Config.Cajas.y, Config.Cajas.z+1.0)
				ESX.Game.Utils.DrawText3D(barco, "Presiona ~g~[E]~w~ para cargar las cajas!", 1.0)
			end
			if dst <= 2 and IsControlJustPressed(0, Keys["E"]) and llego_isla then				
				if cajas < 30 then
					farmeo()
					ESX.TriggerServerCallback('1974_drogas:check', function(serial)
						TriggerServerEvent("1974_portuario:doycajas", serial)
					end)	
					cajas = cajas + 1
				else
					llego_isla = false
					TriggerEvent('1974_portuario:vuelvo')
				end
				ClearTask()
			end
			--Vuelvo a devolver jeep
			local dst = Vdist(pedcoord.x, pedcoord.y, pedcoord.z, Config.JeepSpawn.x, Config.JeepSpawn.y, Config.JeepSpawn.z)			
			if dst < 50.0 and vuelvo then
				DrawMarker(1, Config.JeepSpawn.x, Config.JeepSpawn.y, Config.JeepSpawn.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)	
			end	
			if dst <= 4.5 and vuelvo then
				local barco = vector3(Config.JeepSpawn.x, Config.JeepSpawn.y, Config.JeepSpawn.z+1.0)
				ESX.Game.Utils.DrawText3D(barco, "Presiona ~g~[E]~w~ para guardar JEEP!", 1.0)
			end
			if dst <= 5 and IsControlJustPressed(0, Keys["E"]) and vuelvo then
				local auto = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				DeleteEntity(auto)
				if Blips.delivery then
					RemoveBlip(Blips.delivery)
					Blips.delivery = nil
				end
				vuelvo = false
				Blips.delivery = AddBlipForCoord(Config.TpIsla.x, Config.TpIsla.y, Config.TpIsla.z)
				SetBlipRoute(Blips.delivery, true)
				volver_barco = true
				ESX.ShowNotification("~g~Sube las cajas al Barco y vuelve a Ciudad!")
			end
			--Muelle saco bote para volver
			local dst = Vdist(pedcoord.x, pedcoord.y, pedcoord.z, Config.TpIsla.x, Config.TpIsla.y, Config.TpIsla.z)			
			if dst < 50.0 and volver_barco then
				DrawMarker(35, Config.TpIsla.x, Config.TpIsla.y, Config.TpIsla.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)	
			end	
			if dst <= 4.5 and volver_barco then
				--local barco = vector3(Config.JeepSpawn.x, Config.JeepSpawn.y, Config.JeepSpawn.z+1.0)
				ESX.Game.Utils.DrawText3D(Config.TpIsla, "Presiona ~g~[E]~w~ para pedir tu Barco!", 1.0)
			end
			if dst <= 2 and IsControlJustPressed(0, Keys["E"]) and volver_barco then								
				BarcoRegreso()
			end
			--LLEGO PUERTO CIUDAD
			local dst = Vdist(pedcoord.x, pedcoord.y, pedcoord.z, Config.BoteSpawn.x, Config.BoteSpawn.y, Config.BoteSpawn.z)			
			if dst < 50.0 and llegoPuerto then
				DrawMarker(1, Config.BoteSpawn.x, Config.BoteSpawn.y, Config.BoteSpawn.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 10.0, 10.0, 2.0, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)	
			end
			if dst <= 4.5 and llegoPuerto then
				local bote = vector3(Config.BoteSpawn.x, Config.BoteSpawn.y, Config.BoteSpawn.z+1.0)
				ESX.Game.Utils.DrawText3D(bote, "Presiona ~g~[E]~w~ para devolver el Barco!", 2.0)
			end
			if dst <= 5 and IsControlJustPressed(0, Keys["E"]) and llegoPuerto then								
				EntregoBarco2()
			end
			--VENTA DE CAJAS
			local dst = Vdist(pedcoord.x, pedcoord.y, pedcoord.z, Config.Venta.x, Config.Venta.y, Config.Venta.z)			
			if dst < 50.0 and venta then
				DrawMarker(29, Config.Venta.x, Config.Venta.y, Config.Venta.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 255, 0, 0, 150, false, false, 2, true, nil, nil, false)	
			end	
			if dst <= 4.5 and venta then
				local ventas = vector3(Config.Venta.x, Config.Venta.y, Config.Venta.z+1.0)
				ESX.Game.Utils.DrawText3D(ventas, "Presiona ~g~[E]~w~ para entregar las cajas!", 1.0)
			end
			if dst <= 2 and IsControlJustPressed(0, Keys["E"]) and venta then								
				ventas()
			end
		end	
	end	
end)

function ventas()
	if Blips.delivery then
		RemoveBlip(Blips.delivery)
		Blips.delivery = nil
	end
	venta = false
	cajas = 0
	ESX.TriggerServerCallback('1974_drogas:check', function(serial)
		TriggerServerEvent('1974_portuario:venta', serial)
	end)
end

function EntregoBarco2()
	local ped = PlayerPedId()
	if GetVehiclePedIsIn(ped, false) == barco and GetPedInVehicleSeat(barco, -1 ) == ped then
		DeleteEntity(barco)
		if Blips.delivery then
			RemoveBlip(Blips.delivery)
			Blips.delivery = nil
		end
		local tp = vector3(Config.Bote.x,Config.Bote.y,Config.Bote.z)
		ESX.Game.Teleport(GetPlayerPed(-1), tp, function()
			SetEntityHeading(GetPlayerPed(-1), 358.0)
		end)
		Blips.delivery = AddBlipForCoord(Config.Venta.x, Config.Venta.y, Config.Venta.z)
		SetBlipRoute(Blips.delivery, true)
		llegoPuerto = false
		venta = true
		ESX.TriggerServerCallback('1974_drogas:check', function(serial)
			TriggerServerEvent('1974_portuario:devolverdeposito', serial)
		end)
		ESX.ShowNotification("~g~Busca las recompensas!")
	else
		ESX.ShowNotification("~r~No es el Barco que pagaste! o no estas en el Timon!")
	end
end

function loadanim(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function farmeo()
	local player = PlayerPedId()
	FreezeEntityPosition(player, true)
	loadanim('amb@prop_human_bum_bin@base')
	TaskPlayAnim(player, "amb@prop_human_bum_bin@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
	Citizen.Wait(8000)
	ClearPedTasksImmediately(player)
	FreezeEntityPosition(player, false)
end

function ClearTask()
	playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
    ClearPedTasks(PlayerPedId())
end

function BarcoRegreso()
	local ped = PlayerPedId()
	local SpawnPoint = vector3(Config.BoteLlegada.x, Config.BoteLlegada.y, Config.BoteLlegada.z)
	if ESX.Game.IsSpawnPointClear(SpawnPoint, 10.0) then
		ESX.Game.SpawnVehicle('tug', SpawnPoint, 66.80, function(vehicle)
			TaskWarpPedIntoVehicle(ped, vehicle, -1)
			ESX.Game.SetVehicleProperties(vehicle, { plate = 'ZONASUR'})
			exports["LegacyFuel"]:SetFuel(vehicle, 100)
			volver_barco = false
			barco = vehicle
		end)
		if Blips.delivery then
			RemoveBlip(Blips.delivery)
			Blips.delivery = nil
		end
		llegoPuerto = true
		Blips.delivery = AddBlipForCoord(Config.BoteSpawn.x, Config.BoteSpawn.y, Config.BoteSpawn.z)
		SetBlipRoute(Blips.delivery, true)
		ESX.ShowNotification('~g~Vuelve al puerto de ciudad!')
	else
		ESX.ShowNotification('Espera que despejen la zona!')
	end
end

function Jeep()
	local ped = PlayerPedId()
	local SpawnPoint = vector3(Config.JeepSpawn.x, Config.JeepSpawn.y, Config.JeepSpawn.z)
	if ESX.Game.IsSpawnPointClear(SpawnPoint, 10.0) then
		ESX.Game.SpawnVehicle('winky', SpawnPoint, 207.58, function(vehicle)
			TaskWarpPedIntoVehicle(ped, vehicle, -1)
			ESX.Game.SetVehicleProperties(vehicle, { plate = 'ZONASUR'})
			exports["esx_carlock"]:SetCamion(vehicle)
			exports["LegacyFuel"]:SetFuel(vehicle, 100)
		end)
		if Blips.delivery then
			RemoveBlip(Blips.delivery)
			Blips.delivery = nil
		end
		Blips.delivery = AddBlipForCoord(Config.Cajas.x, Config.Cajas.y, Config.Cajas.z)
		SetBlipRoute(Blips.delivery, true)
		ESX.ShowNotification('~g~Busca las cajas y traelas al Barco!')
	else
		ESX.ShowNotification('Espera que despejen la zona!')
	end
end

function SpawnBarco()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'barcos', {
		title    = 'Deposito de Barcos',
		align    = 'bottom-right',
		elements = {
			{label = 'Barco Deposito - $'..Config.Deposito, value = 'si'},
			{label = 'Salir', value = 'no'},
	}}, function(data, menu)		
		if data.current.value == 'si' then
			local ped = PlayerPedId()
			local SpawnPoint = vector3(Config.BoteSpawn.x, Config.BoteSpawn.y, Config.BoteSpawn.z)
			ESX.TriggerServerCallback('1974_portuario:getmoney' , function(money)
				if money then
					if ESX.Game.IsSpawnPointClear(SpawnPoint, 35.0) then
						ESX.Game.SpawnVehicle('tug', SpawnPoint, 177.72, function(vehicle)
							TaskWarpPedIntoVehicle(ped, vehicle, -1)
							ESX.Game.SetVehicleProperties(vehicle, { plate = 'ESX'})
							exports["LegacyFuel"]:SetFuel(vehicle, 100)
							barco = vehicle
						end)			
						--TriggerServerEvent("fishing:lowmoney", 1500) 
						ESX.ShowNotification('Pagaste: ~g~$'..Config.Deposito.. '~w~ de deposito por el Barco!')
						Blips.delivery = AddBlipForCoord(Config.BoteLlegada.x, Config.BoteLlegada.y, Config.BoteLlegada.z)
						SetBlipRoute(Blips.delivery, true)
						tengo_barco =  true
						ESX.ShowNotification('~g~Ve a la Isla a buscar las cajas!')
					else
						ESX.ShowNotification('Espera que despejen la zona!')
					end
				else
					ESX.ShowNotification('~r~No tienes suficiente dinero.')
				end	
			end)
			menu.close()
		elseif data.current.value == 'no' then
			menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end

function EntregoBarco()
	if GetVehiclePedIsIn(GetPlayerPed(-1), false) == barco then
		DeleteEntity(barco)
		if Blips.delivery then
			RemoveBlip(Blips.delivery)
			Blips.delivery = nil
		end
		ESX.Game.Teleport(GetPlayerPed(-1), Config.TpIsla, function()
			SetEntityHeading(GetPlayerPed(-1), 243.8)
		end)
		tengo_barco = false
		barco = nil
		llego_isla = true
		ESX.ShowNotification('~g~Agarra un Jeep y ve por las cajas!')
		Blips.delivery = AddBlipForCoord(Config.Jeep.x, Config.Jeep.y, Config.Jeep.z)
		SetBlipRoute(Blips.delivery, true)
	else
		ESX.ShowNotification("~r~No es el Barco que pagaste!")
	end
end

RegisterNetEvent('1974_portuario:vuelvo')
AddEventHandler('1974_portuario:vuelvo', function()
	if Blips.delivery then
		RemoveBlip(Blips.delivery)
		Blips.delivery = nil
	end
	ESX.ShowNotification("Devuelve el Jeep y vuelva a Puerto!")
    vuelvo = true
	Blips.delivery = AddBlipForCoord(Config.JeepSpawn.x, Config.JeepSpawn.y, Config.JeepSpawn.z)
	SetBlipRoute(Blips.delivery, true)
end)

Citizen.CreateThread(function()
	--local x, y, z = table.unpack(Config.Venta)
	local blip = AddBlipForCoord(Config.Ropa.x, Config.Ropa.y)
	SetBlipSprite (blip, 356)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.8)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 46)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Puerto")
	EndTextCommandSetBlipName(blip)
end)