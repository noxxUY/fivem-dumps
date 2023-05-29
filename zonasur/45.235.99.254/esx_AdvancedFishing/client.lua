ESX = nil

local Blips = {}
local PlayerData = {}
local OnRobbery = false
local OnRobberyYate = false
local timeLeft = 220
local ladron = false
local ladronYate = false
local botepescador = nil
local zonaok = false
local zonamar = false
local zonacosta = false


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

RegisterNetEvent("fishing:start")
AddEventHandler("fishing:start", function(cord)
	coordbox = cord
    boxend = true
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

local fishing = false
local lastInput = 0
local pause = false
local pausetimer = 0
local correct = 0
local bait = "none"

Citizen.CreateThread(function()
	Citizen.Wait(500)
	
	for k,v in pairs(Config.Ventas) do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		if k ~= 'turtle' and k ~= 'shark' and k ~= 'orca' then
			SetBlipSprite (blip, 356)
		else
			SetBlipSprite (blip, 68)
		end
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 17)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Venta de Pescado")
		EndTextCommandSetBlipName(blip)	
	end

--[[		
local blip2 = AddBlipForCoord(Config.SellTurtle.x, Config.SellTurtle.y, Config.SellTurtle.z)
SetBlipSprite (blip2, 68)
SetBlipDisplay(blip2, 4)
SetBlipScale  (blip2, 0.7)
SetBlipColour (blip2, 49)
SetBlipAsShortRange(blip2, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Venta de Tortugas")
EndTextCommandSetBlipName(blip2)
			
local blip3 = AddBlipForCoord(Config.SellShark.x, Config.SellShark.y, Config.SellShark.z)
SetBlipSprite (blip3, 68)
SetBlipDisplay(blip3, 4)
SetBlipScale  (blip3, 0.7)
SetBlipColour (blip3, 49)
SetBlipAsShortRange(blip3, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Venta de Tiburones")
EndTextCommandSetBlipName(blip3)

local blip4 = AddBlipForCoord(Config.SellFish2.x, Config.SellFish2.y, Config.SellFish2.z)
SetBlipSprite (blip4, 356)
SetBlipDisplay(blip4, 4)
SetBlipScale  (blip4, 0.7)
SetBlipColour (blip4, 17)
SetBlipAsShortRange(blip4, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Venta de Pescado")
EndTextCommandSetBlipName(blip4)
]]--		
local blip8 = AddBlipForCoord(1992.803, 3047.312, 46.22865)
SetBlipSprite (blip8, 509)
SetBlipDisplay(blip8, 4)
SetBlipScale  (blip8, 0.7)
SetBlipColour (blip8, 0)
SetBlipAsShortRange(blip8, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Pool - Bar")
EndTextCommandSetBlipName(blip8)

for _, info in pairs(Config.MarkerZonesFish) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, 455)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.7)
		SetBlipColour(info.blip, 20)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Alquiler de Botes")
		EndTextCommandSetBlipName(info.blip)
	end
end)



Citizen.CreateThread(function()
	while true do
	Wait(1000)
		if pause and fishing then
			pausetimer = pausetimer + 1
		end
	end
end)

Citizen.CreateThread(function()
		
	while true do
		Wait(5)
		local playerPed = PlayerPedId()
		
		if fishing then
			if IsControlJustReleased(0, Keys['1']) then
				 input = 1
			end
			if IsControlJustReleased(0, Keys['2']) then
				input = 2
			end
			if IsControlJustReleased(0, Keys['3']) then
				input = 3
			end
			if IsControlJustReleased(0, Keys['4']) then
				input = 4
			end
			if IsControlJustReleased(0, Keys['5']) then
				input = 5
			end
			if IsControlJustReleased(0, Keys['6']) then
				input = 6
			end
			if IsControlJustReleased(0, Keys['7']) then
				input = 7
			end
			if IsControlJustReleased(0, Keys['8']) then
				input = 8
			end
			
			
			if IsControlJustReleased(0, Keys['X']) then
				fishing = false
				ESX.ShowNotification("~r~Dejó de pescar.")
				ClearPedTasksImmediately(playerPed)
				FreezeEntityPosition(playerPed, false)
			end
			if fishing then
				HideHudComponentThisFrame(19)
				DisableControlAction(1, 37)
				--[[
				local pos = GetEntityCoords(GetPlayerPed(-1))
				if pos.y >= 7700 or pos.y <= -4000 or pos.x <= -3700 or pos.x >= 4300 or IsPedInAnyVehicle(GetPlayerPed(-1)) then
					
				else
					fishing = false
					ESX.ShowNotification("~r~Dejó de pescar.")
				end
				]]--
				
				FreezeEntityPosition(playerPed, true)
				
				if IsEntityDead(playerPed) or IsEntityInWater(playerPed) then
					fishing = false
					ESX.ShowNotification("~r~Dejó de pescar.")
					ClearPedTasksImmediately(playerPed)
					FreezeEntityPosition(playerPed, false)
				end
			end
			
			
			
			if pausetimer > 3 then
				input = 99
			end
			
			if pause and input ~= 0 then
				pause = false
				if input == correct then
					TriggerServerEvent('fishing:catch', bait, zonacosta)
				else
					ESX.ShowNotification("~r~El pescado se escapo.")
				end
			end
		end
		
		
		local ped = PlayerPedId()
		local pedcoords = GetEntityCoords(ped, false)
			
			--DrawMarker(1, Config.SellFish.x, Config.SellFish.y, Config.SellFish.z , 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 2.0, 0, 70, 250, 30, false, true, 2, false, false, false, false)
			--DrawMarker(1, Config.SellFish2.x, Config.SellFish2.y, Config.SellFish2.z , 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 2.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
			--DrawMarker(1, Config.SellTurtle.x, Config.SellTurtle.y, Config.SellTurtle.z , 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 2.0, 0, 70, 250, 30, false, true, 2, false, false, false, false)
			--DrawMarker(1, Config.SellShark.x, Config.SellShark.y, Config.SellShark.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
			
		for k,v in pairs(Config.Ventas) do
			local distance = #(pedcoords - v)
			if distance < 20 then
				DrawMarker(29, v.x, v.y, v.z +1 , 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 0.8, 255, 255, 0, 100, false, true, 2, true, false, false, false)
				if distance < 1.5 then
					if k == 'fish2' then
						TriggerServerEvent('fishing:startSelling', "fish")
						Citizen.Wait(4000)
					else
						TriggerServerEvent('fishing:startSelling', k)
						Citizen.Wait(4000)
					end
				end
			end
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
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


Citizen.CreateThread(function()
	while true do
		Wait(0)	
		--if PlayerData.job.name == 'fisherman' then		
			local ped = PlayerPedId()
			local pedcoords = GetEntityCoords(ped, false)
			
			for k in pairs(Config.MarkerZonesFish) do
				
				local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.MarkerZonesFish[k].x, Config.MarkerZonesFish[k].y, Config.MarkerZonesFish[k].z)
					
				if distance < 100 then
					DrawMarker(35, Config.MarkerZonesFish[k].x, Config.MarkerZonesFish[k].y, Config.MarkerZonesFish[k].z +1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 0, 100, false, true, 2, true, nil, nil, false)					
					if distance <= 1.60 then
						Drawing.draw3DText(Config.MarkerZonesFish[k].x, Config.MarkerZonesFish[k].y, Config.MarkerZonesFish[k].z, 'Presiona ~g~[E]~w~ para alquilar un barco.', 1, 0.1, 0.1, 255, 255, 255, 215)
						if IsControlJustPressed(0, Keys['E']) and IsPedOnFoot(ped) then
							print(k)
							OpenBoatsMenuPescador(k)
						end
					end
				end
				
				if botepescador then
					local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.BoatDelete[k].x, Config.BoatDelete[k].y, Config.BoatDelete[k].z)
					local StoreTP = vector4(Config.BoatDelete[k].xs, Config.BoatDelete[k].ys, Config.BoatDelete[k].zs, Config.BoatDelete[k].h)
				
					if distance < 100 then
						DrawMarker(1, Config.BoatDelete[k].x, Config.BoatDelete[k].y, Config.BoatDelete[k].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 15.0, 15.0, 3.0, 255, 0, 0, 30, false, true, 2, false, false, false, false)
						if distance <= 10.0 then
							Drawing.draw3DText(Config.BoatDelete[k].x, Config.BoatDelete[k].y, Config.BoatDelete[k].z + 1.5, 'Presiona ~g~E ~w~para devolver el barco.', 1, 0.4, 0.4, 255, 255, 255, 215)
							if IsControlJustPressed(0, Keys['E']) then						
								if botepescador == GetVehiclePedIsIn(GetPlayerPed(-1), false) then
									ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
									ESX.Game.Teleport(ped, StoreTP, function()
										SetEntityHeading(ped, StoreTP.w)
									end)
									ESX.TriggerServerCallback('1974_drogas:check', function(pescado)
										TriggerServerEvent("fishing:money", 1000, pescado) 
									end)
									ESX.ShowNotification('Devolviste el Barco! , te devolvemos la plata del seguro : ~g~$1000')
									botepescador = nil
								else
									ESX.ShowNotification('No es el barco que alquilaste!')
								end
							end
						end				
					end
				end
			end
		
		if IsPedInAnyBoat(ped) then
			local nafta = exports["LegacyFuel"]:GetFuel(GetVehiclePedIsIn(ped, false))
			if  nafta < 1 then
				SetVehicleEngineOn(GetVehiclePedIsIn(ped, false),false,true,true)
				SetVehicleUndriveable(GetVehiclePedIsIn(ped, false),false)
				ESX.ShowNotification('~r~No tienes mas Nafta!')
			end
		end	
	end
end)

function DrawMissionText(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end


Citizen.CreateThread(function()
	while true do
		local wait = math.random(Config.FishTime.a , Config.FishTime.b)
		Wait(wait)
			if fishing then
				pause = true
				correct = math.random(1,8)
				ESX.ShowNotification("~g~El pescado está mordiendo el anzuelo \n ~h~Presiona ~y~"  .. correct .. "~g~ para atraparlo.")
				input = 0
				pausetimer = 0
			end
	end
end)

RegisterNetEvent('fishing:message')
AddEventHandler('fishing:message', function(message)
	ESX.ShowNotification(message)
end)

RegisterNetEvent('fishing:break')
AddEventHandler('fishing:break', function()
	local playerPed = PlayerPedId()
	fishing = false
	ClearPedTasks(playerPed)
	FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent('fishing:spawnPed')
AddEventHandler('fishing:spawnPed', function(ped)
	
	RequestModel( GetHashKey(ped) )
		while ( not HasModelLoaded( GetHashKey(ped) ) ) do
			Citizen.Wait( 1 )
		end
	local pos = GetEntityCoords(GetPlayerPed(-1))
	
	local ped = CreatePed(29, GetHashKey(ped), pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
end)

RegisterNetEvent('fishing:setbait')
AddEventHandler('fishing:setbait', function(carnada, borrar)
	if fishing then
		if carnada ~= 'fish' then
			if zonaok or zonamar then
				TriggerServerEvent('fishing:borrarCarnada', borrar)
				bait = carnada
			else
				ESX.ShowNotification('~r~Desde aqui no puedes Pescar algo grande!')
			end
		else
			TriggerServerEvent('fishing:borrarCarnada', borrar)
			bait = carnada
		end
	else
		ESX.ShowNotification('~r~Usa la caña primero!')
	end
end)

RegisterNetEvent('fishing:fishstart')
AddEventHandler('fishing:fishstart', function()	
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed)

	if IsPedInAnyVehicle(playerPed) then
		ESX.ShowNotification("~y~No puedes pescar desde un vehículo")
	else
		--[[
		local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 3.0, 0, 12294)
		local class = GetVehicleClass(vehicle)
		
		if class == 14 then 
			ESX.ShowNotification("~g~Empezo la pesca, Buena Suerte!")
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_STAND_FISHING", 0, true)
			fishing = true	
		else
		
		end
		]]--
		zonacosta = false
		
		for k,v in pairs(Config.Muelles) do
			local distance = #(pos - v)
			if distance < 10 then
				zonacosta = true	
			end
		end
		if zonaok then
			ESX.ShowNotification("~g~Empezo la pesca, Buena Suerte!")
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_FISHING", 0, true)
			fishing = true
		elseif zonacosta then
			ESX.ShowNotification("~g~Empezo la pesca, Buena Suerte!")
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_FISHING", 0, true)
			fishing = true
		--[[
		elseif IsEntityInWater(playerPed) then
			ESX.ShowNotification("~g~Empezo la pesca, Buena Suerte!")
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_FISHING", 0, true)
			zonacosta = true
			fishing = true
		]]--
		else
			if pos.y >= 7700 or pos.y <= -4000 or pos.x <= -3700 or pos.x >= 4300 then
				ESX.ShowNotification("~g~Empezo la pesca, Buena Suerte!")
				TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_FISHING", 0, true)
				zonamar = true
				fishing = true
			else
				ESX.ShowNotification("~y~Necesitas ir más lejos de la orilla.")
			end
		end
	end
	
end, false)

exports["bt-polyzone"]:AddPolyzone("LAGUNA", {
		vector2(2149.0336914063, 4469.642578125),
		vector2(900.97314453125, 4052.9851074219),
		vector2(23.349548339844, 4122.1259765625),
		vector2(9.6206111907959, 3868.4291992188),
		vector2(596.40942382813, 3704.599609375),
		vector2(1206.1959228516, 3849.099609375),
		vector2(1684.4306640625, 4053.9580078125),
		vector2(2197.3015136719, 4038.8264160156),
		vector2(2292.4079589844, 4251.3276367188)
	}, {
	name="LAGUNA",
	debugPoly=false,
	minZ = 27.404418945313,
	maxZ = 60.624435424805
})

RegisterNetEvent('bt-polyzone:enter')
AddEventHandler('bt-polyzone:enter', function(name)
	if name == "LAGUNA" then
		zonaok = true
	end
end)

RegisterNetEvent('bt-polyzone:exit')
AddEventHandler('bt-polyzone:exit', function(name)
	if name == "LAGUNA" then
		zonaok = false
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

function OpenBoatsMenuPescador(k)
	--print('OpenBoatsMenuPescador ABIERTO')
	local ped = PlayerPedId()
	local SpawnPoint = vector3(Config.MarkerZonesFish[k].xs ,Config.MarkerZonesFish[k].ys, Config.MarkerZonesFish[k].zs)
	
	local elements = {}
	
	table.insert(elements, {label = '<span style="color:green;">Barco Pesquero</span> <span style="color:red;">$500 + $1000 Deposito</span>', value = 'boat4'})
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' or PlayerData.job.name == 'police2' then
		table.insert(elements, {label = '<span style="color:green;">BOTE POLICIA</span>', value = 'police'})
	elseif PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
		table.insert(elements, {label = '<span style="color:green;">BOTE SAME</span>', value = 'dinghy'})
	elseif PlayerData.job ~= nil and PlayerData.job.name == 'seguridad' then
		table.insert(elements, {label = '<span style="color:green;">BOTE SEGURIDAD</span>', value = 'seguridad'})
	end
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client_pescador',
    {
		title    = 'Alquiler de Botes',
		align    = 'bottom-right',
		elements = elements
    },
	
	
	function(data, menu)

	if data.current.value == 'boat4' then
	
		ESX.UI.Menu.CloseAll()	

		ESX.TriggerServerCallback('fishing:getMoney', function(money) 
            if money >= 1500 then
				if ESX.Game.IsSpawnPointClear(SpawnPoint, 35.0) then
					ESX.Game.SpawnVehicle('tug', SpawnPoint, Config.MarkerZonesFish[k].h, function(vehicle)
						TaskWarpPedIntoVehicle(ped, vehicle, -1)
						exports["LegacyFuel"]:SetFuel(vehicle, 100)
						botepescador = vehicle
					end)	
					TriggerServerEvent("fishing:lowmoney", 1500) 
					ESX.ShowNotification('Alquilaste un bote por: ~g~$500 ~w~y ~r~$1000~w~ de deposito!')
				else
					ESX.ShowNotification('Espera que despejen la zona!')
				end
			else
				ESX.ShowNotification('No tienes suficiente dinero para pagar el alquiler!')
			end				
        end)		
	end	
    end, function(data, menu)
		menu.close()
	end)
end


