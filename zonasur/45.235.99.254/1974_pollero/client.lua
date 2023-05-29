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
local camion = {}
local blips = true
local blipActive = false
local llegamos = false
local volvemos = false

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


function DrawText3D(x, y, z, text)
	SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 400
    DrawRect(0.0, 0.0+0.0110, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

------------------------------------------------------------------------ START --------------------------------------------------------------------------
------------------------------------------------------------------------ START --------------------------------------------------------------------------

function OpenCloakroomMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = 'Guardaropas',
		align    = 'bottom-right',
		elements = {
			{label = 'Ropa Civil', value = 'civil'},
			{label = 'Ropa de Trabajo', value = 'trabajo'},
	}}, function(data, menu)
		
		if data.current.value == 'civil' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				onDuty = false
				blips = false
				if BlipDelivery then
					RemoveBlip(BlipDelivery)
					BlipDelivery = nil
				end
			end)
		elseif data.current.value == 'trabajo' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Config.ropa.male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Config.ropa.female)
				end
				blipActive = true
				onDuty = true
			end)
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
      
	end
end)


Citizen.CreateThread(function()
    while true do 
	Citizen.Wait(5)
        local pedcoord = GetEntityCoords(PlayerPedId())
		local ped = PlayerPedId()
	if PlayerData.job ~= nil and PlayerData.job.name == 'pollero' then	
		if llegamos then
			--pollos vivos
			local dst = GetDistanceBetweenCoords(pedcoord, -62.28131, 6241.807, 30.14, true)
			if dst <= 4.5 then
				DrawText3D(-62.28131, 6241.807, 31.14, "[~g~E~w~] - para agarrar Pollos!")
			end
			if dst <= 1 and IsControlJustPressed(0, Keys["E"]) then
				alivechickenanim()
				TriggerServerEvent("Spike-alivechicken")
				ClearTask()
			end
			--pollos vivos 2
			local dst = GetDistanceBetweenCoords(pedcoord, -66.29, 6236.63, 30.14, true)
			if dst <= 4.5 then
				DrawText3D(-66.29, 6236.63, 31.14, "[~g~E~w~] - para agarrar Pollos!")
			end
			if dst <= 1 and IsControlJustPressed(0, Keys["E"]) then
				alivechickenanim()
				TriggerServerEvent("Spike-alivechicken")
				ClearTask()
			end
			--matamos
			local dst = GetDistanceBetweenCoords(pedcoord, -95.62312, 6207.062, 31.02504, true)
			if dst <= 5 then
				DrawText3D(-95.62312, 6207.062, 31.02504, "[~g~E~w~] - Para cortar los pollos!")
			end
			if dst <= 1 and IsControlJustPressed(0, Keys["E"]) then
				portionanim(1)
				Citizen.Wait(50)
				TriggerServerEvent("Spike-rawchicken")
				Citizen.Wait(1000)
			end
			local dst = GetDistanceBetweenCoords(pedcoord, -100.4728, 6202.435, 31.02504, true)
			if dst <= 5 then
				DrawText3D(-100.4728, 6202.435, 31.02504, "[~g~E~w~] - Para cortar los pollos!")
			end
			if dst <= 1 and IsControlJustPressed(0, Keys["E"]) then
				portionanim(2)
				Citizen.Wait(50)
				TriggerServerEvent("Spike-rawchicken")
				Citizen.Wait(1000)
			end
			--empaquetamos
			local dst = GetDistanceBetweenCoords(pedcoord, -106.3441, 6204.656, 31.02625, true)
            if dst <= 5 then
                DrawText3D(-106.3441, 6204.656, 31.02625, "[~g~E~w~] - para empaquetar Pollos!")
            end
            if dst <= 2 and IsControlJustPressed(0, Keys["E"]) then
                animpack()
                TriggerServerEvent("Spike-packchicken")
                Citizen.Wait(2000)
            end
			local dst = GetDistanceBetweenCoords(pedcoord, -104.0056, 6206.675, 31.02505, true)
            if dst <= 5 then
                DrawText3D(-104.0056, 6206.675, 31.02505, "[~g~E~w~] - para empaquetar Pollos!")
            end
            if dst <= 2 and IsControlJustPressed(0, Keys["E"]) then
                animpack()
                TriggerServerEvent("Spike-packchicken")
                Citizen.Wait(2000)
            end
		end
		if volvemos then
			local dst = GetDistanceBetweenCoords(pedcoord, Config.SellLocation.pos.x, Config.SellLocation.pos.y, Config.SellLocation.pos.z, true)
            if dst <= 5 then
                DrawText3D(Config.SellLocation.pos.x, Config.SellLocation.pos.y, Config.SellLocation.pos.z, "[~w~E~w~] - para vender los Pollos!")
            end
            if dst <= 2 and IsControlJustPressed(0, Keys["E"]) then
                giveAnim()
                TriggerServerEvent("Spike-sellchicken")
                Citizen.Wait(2000)
            end
		end
		--Vestuario
		local dst = GetDistanceBetweenCoords(pedcoord, -1070.54, -2003.15, 15.79, true)
        if dst <= 4.5 then
            DrawText3D(-1070.54, -2003.15, 15.79, "[~g~E~w~] - para abrir Guardaropas!")
        end
        if dst <= 1 and IsControlJustPressed(0, Keys["E"]) then
            OpenCloakroomMenu()
        end
		if onDuty then
		--Camion
		local dst = GetDistanceBetweenCoords(pedcoord, Config.Vehicle.pos.x, Config.Vehicle.pos.y, Config.Vehicle.pos.z, true)
        if dst <= 1.5 then
            DrawText3D(Config.Vehicle.pos.x, Config.Vehicle.pos.y, Config.Vehicle.pos.z+0.6, "[~g~E~w~] - para sacar un Camion!")
        end
        if dst <= 1.5 and IsControlJustPressed(0, Keys["E"]) then
			if ESX.Game.IsSpawnPointClear(Config.Vehicle.spawner, 10.0) then
				ESX.TriggerServerCallback('1974_pollero:getMoney', function(money)
					if money then
						ESX.Game.SpawnVehicle(Config.Vehiculo, Config.Vehicle.spawner, 134.99, function(vehicle)
							platenum = math.random(10000, 99999)
							SetVehicleNumberPlateText(vehicle, platenum) 
							exports["LegacyFuel"]:SetFuel(vehicle, 100)	
							TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
							camion = vehicle
							exports["esx_carlock"]:SetCamion(vehicle)
							TriggerEvent('1974_pollero:gps', Config.Estacionar, '~y~Ve a buscar los Pollos!')
							ESX.ShowNotification('~y~Pagaste un deposito de ~r~$'..Config.Deposito..' ~y~cuando devuelvas el camion, se te devuelve el dinero.')
						end)
					else
						ESX.ShowNotification('~r~No tienes suficiente dinero para pagar el deposito!')
					end
				end)
			else
				ESX.ShowNotification('~y~Espera a que se desocupe la zona!')
			end		
        end
		
		--Borrar Camion
		local dst = GetDistanceBetweenCoords(pedcoord, Config.Vehicle.delete.x, Config.Vehicle.delete.y, Config.Vehicle.delete.z, true)
        if dst <= 4.5 then
            DrawText3D(Config.Vehicle.delete.x, Config.Vehicle.delete.y, Config.Vehicle.delete.z+1, "[~g~E~w~] - para Guardar CAMION!")
        end
        if dst <= 4.0 and IsControlJustPressed(0, Keys["E"]) then
			if GetVehiclePedIsIn(ped, false) == camion and GetPedInVehicleSeat(camion, -1 ) == ped then
				if BlipDelivery then
					RemoveBlip(BlipDelivery)
					BlipDelivery = nil
				end
				DeleteVehicle(camion)
				ESX.TriggerServerCallback('1974_drogas:check', function(serial)
					if serial then
						TriggerServerEvent('1974_pollero:Money', serial)
					end
				end)
				
				ESX.ShowNotification('Te devolvimos el deposito: ~g~$'..Config.Deposito)
				llegamos = false
				volvemos = false
			else
				ESX.ShowNotification('~r~No es el camion que te dimos o no estas sentado asciento de Conductor!')
			end	
        end
		end
		--Estacionamiento
		if not llegamos then
			local x, y, z = table.unpack(Config.Estacionar)
			local dst = GetDistanceBetweenCoords(pedcoord, x, y, z, true)
			if dst <= 4.5 then
				DrawText3D(x, y, z+1, "[~g~E~w~] - para estacionar!!")
			end
			if dst <= 4.0 and IsControlJustPressed(0, Keys["E"]) then
				if GetVehiclePedIsIn(ped, false) == camion then
					if BlipDelivery then
						RemoveBlip(BlipDelivery)
						BlipDelivery = nil
					end
					ESX.ShowNotification('~g~Estaciona el camion y sigue el trabajo a PIE!')
					llegamos = true
				else
					ESX.ShowNotification('~r~No es el camion que te dimos!')
				end	
			end
		end
		
		--Volver
		if not volvemos then
			local x, y, z = table.unpack(Config.Volver)
			local dst = GetDistanceBetweenCoords(pedcoord, x, y, z, true)
			if dst <= 4.5 then
				DrawText3D(x, y, z+1, "[~g~E~w~] - para estacionar!!")
			end
			if dst <= 4.0 and IsControlJustPressed(0, Keys["E"]) then
				if GetVehiclePedIsIn(ped, false) == camion then
					if BlipDelivery then
						RemoveBlip(BlipDelivery)
						BlipDelivery = nil
					end
					ESX.ShowNotification('~g~Estaciona el camion y ponte a vender!')
					volvemos = true
				else
					ESX.ShowNotification('~r~No es el camion que te dimos!')
				end	
			end
		end
    end
	end
end)

RegisterNetEvent('1974_pollero:gps')
AddEventHandler('1974_pollero:gps', function(gps, msg)
	if BlipDelivery then
		RemoveBlip(BlipDelivery)
		BlipDelivery = nil
	end
	BlipDelivery = AddBlipForCoord(gps.x, gps.y, gps.z)
	SetBlipRoute(BlipDelivery, true)
	ESX.ShowNotification(msg)
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
	if PlayerData.job ~= nil and PlayerData.job.name == 'pollero' then
		DrawMarker(27, -1070.54, -2003.15, 15.79 - 0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 200, 200, 200, 150, false, false, 2, false, nil, nil, false)
		if llegamos then
			DrawMarker(27, -62.28131, 6241.807, 30.14, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 200, 200, 200, 150, false, false, 2, false, nil, nil, false)
			DrawMarker(27, -66.29, 6236.63, 30.14, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 200, 200, 200, 150, false, false, 2, false, nil, nil, false)
			DrawMarker(2, -95.62312, 6207.062, 31.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 233, 55, 22, 222, false, false, false, true, false, false, false) -- portion
			DrawMarker(2, -100.4728, 6202.435, 31.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 233, 55, 22, 222, false, false, false, true, false, false, false) -- portion2
			DrawMarker(2, -106.3441, 6204.656, 31.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 233, 55, 22, 222, false, false, false, true, false, false, false) -- pack
			DrawMarker(2, -104.0056, 6206.675, 31.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 233, 55, 22, 222, false, false, false, true, false, false, false) -- pack2
		end
		if not llegamos then
			local x, y, z = table.unpack(Config.Estacionar)
			DrawMarker(1, x, y, z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 222, false, false, false, true, false, false, false)
		end
		if not volvemos then
			local x, y, z = table.unpack(Config.Volver)
			DrawMarker(1, x, y, z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 222, false, false, false, true, false, false, false)
		end
		if volvemos then	
			DrawMarker(2, Config.SellLocation.pos.x, Config.SellLocation.pos.y, Config.SellLocation.pos.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 233, 55, 22, 222, false, false, false, true, false, false, false)
		end
		if onDuty then
			DrawMarker(39, Config.Vehicle.pos.x, Config.Vehicle.pos.y, Config.Vehicle.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 233, 55, 22, 222, false, false, false, true, false, false, false)
			DrawMarker(1, Config.Vehicle.delete.x, Config.Vehicle.delete.y, Config.Vehicle.delete.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 222, false, false, false, true, false, false, false)
		end
	end
	end
end)


Citizen.CreateThread(function()
	local blip = AddBlipForCoord(-1070.54, -2003.15)
	SetBlipSprite (blip, 463)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 47)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Polleria")
	EndTextCommandSetBlipName(blip)
end)



Citizen.CreateThread(function()
	while true do
	Wait(10)	
		if blips == true and blipActive == true then
			blipActive = false
			blip = AddBlipForCoord(Config.SellLocation.pos.x, Config.SellLocation.pos.y)
			SetBlipSprite (blip, 463)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.7)
			SetBlipAsShortRange(blip, true)
			SetBlipColour(blip, 47)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName("Venta de Pollos")
			EndTextCommandSetBlipName(blip)
			
			blip2 = AddBlipForCoord(-62.28131, 6241.807)
			SetBlipSprite (blip2, 463)
			SetBlipDisplay(blip2, 4)
			SetBlipScale  (blip2, 0.7)
			SetBlipAsShortRange(blip2, true)
			SetBlipColour(blip2, 47)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName("Polleria Matadero")
			EndTextCommandSetBlipName(blip2)
		 elseif blips == false and blipActive == false then
			if blip then
				RemoveBlip(blip)
				blip = nil
			end
			if blip2 then
				RemoveBlip(blip2)
				blip2 = nil
			end
			blips = true
		end	
	end	
end)



function ClearTask()
	playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
    ClearPedTasks(PlayerPedId())
end

function loadanim(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end


function portionanim(stanowisko)
    loadanim("anim@amb@business@coc@coc_unpack_cut_left@")
    FreezeEntityPosition(PlayerPedId(),true)
    TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut_left@", "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
    local PedCoords = GetEntityCoords(PlayerPedId())
    nozyk = CreateObject(GetHashKey('prop_knife'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
    AttachEntityToEntity(nozyk, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.13, 0.14, 0.09, 40.0, 0.0, 0.0, false, false, false, false, 2, true)
    if stanowisko == 1 then
    SetEntityHeading(PlayerPedId(), 311.0)
    kurczak = CreateObject(GetHashKey('prop_int_cf_chick_01'),-94.87, 6207.008, 30.08, true, true, true)
    SetEntityRotation(kurczak,90.0, 0.0, 45.0, 1,true)
    elseif stanowisko == 2 then
    SetEntityHeading(PlayerPedId(), 222.0)
    kurczak = CreateObject(GetHashKey('prop_int_cf_chick_01'),-100.39, 6201.56, 29.99, true, true, true)
    SetEntityRotation(kurczak,90.0, 0.0, -45.0, 1,true)
    end
    Citizen.Wait(6000)
    FreezeEntityPosition(PlayerPedId(),false)
    DeleteEntity(kurczak)
    DeleteEntity(nozyk)
    ClearPedTasks(PlayerPedId())
end



function animpack()
FreezeEntityPosition(PlayerPedId(), true)
SetEntityHeading(PlayerPedId(), 40.0)
	local PedCoords = GetEntityCoords(PlayerPedId())
	mieso = CreateObject(GetHashKey('prop_cs_steak'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
	AttachEntityToEntity(mieso, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0x49D9), 0.15, 0.0, 0.01, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
	karton = CreateObject(GetHashKey('prop_cs_clothes_box'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
	AttachEntityToEntity(karton, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.13, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
	pakuje = 1
	loadanim("anim@heists@ornate_bank@grab_cash_heels")
    TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
    Citizen.Wait(6000)
    FreezeEntityPosition(PlayerPedId(), true)
	ClearPedTasks(PlayerPedId())
	DeleteEntity(karton)
	DeleteEntity(mieso)
ClearPedTasksImmediately(PlayerPedId())
FreezeEntityPosition(PlayerPedId(), false)
end




function giveAnim()
local pid = PlayerPedId()
loadanim('amb@medic@standing@kneel@base')
loadanim('anim@gangops@facility@servers@bodysearch@')
FreezeEntityPosition(pid, true)

local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
prop1 = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z,  true,  true, true)

 TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
 TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )

 Citizen.Wait(6000)
DeleteObject(prop1)
ClearPedTasksImmediately(PlayerPedId())
FreezeEntityPosition(PlayerPedId(), false)
end


function alivechickenanim()
local player = PlayerPedId()
FreezeEntityPosition(player, true)
loadanim('amb@prop_human_bum_bin@base')
TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
Citizen.Wait(5000)
ClearPedTasksImmediately(PlayerPedId())
FreezeEntityPosition(PlayerPedId(), false)
end
