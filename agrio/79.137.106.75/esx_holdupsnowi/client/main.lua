local holdingUp = false
local store = ""
local blipRobbery = nil
ESX = nil

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

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(599)
	end
	
end)
local policia = false
local sinpu = true
Citizen.CreateThread(function()
    while sinpu do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 32) then
            sinpu = false
            espoli = ESX.GetPlayerData()
            if espoli.job.name == 'police' or espoli.job.name == 'sheriff' then
                --espo = true
                --Citizen.Wait(200)
                policia = true
            else
                policia = false
            end
        end
    end
end)
--[[AddEventHandler('esx:setJob', function(job)
	if job ~= 'police' and job ~= 'sheriff' then
		policia = false
	else
		policia = true
	end
end)]]
RegisterNetEvent('disablePo', function(a)
	job = a
	if job ~= 'police' and job ~= 'sheriff' then
		policia = false
	else
		policia = true
	end
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	if job == 'police' or job == 'sheriff' then
		policia = true 
	else
		policia = false
	end
end)
RegisterNetEvent('cambioaserv')
AddEventHandler('cambioaserv', function(sale)
	if sale == 'sali' then
policia = false elseif sale == 'entra' then policia = true end end)
function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('snowiOnlysource')
AddEventHandler('snowiOnlysource', function(currentStore)
	espoli = ESX.GetPlayerData()
	--print(espoli.job.name..'robo en curso')
	--if espoli.job.name == 'police' then
	holdingUp, store = true, currentStore
	--else print('No eres poli y no te sale') end
end)

RegisterNetEvent('snowiKillBlip')
AddEventHandler('snowiKillBlip', function()
	espoli = ESX.GetPlayerData()
	print(espoli.job.name..'kill blip')
	if espoli.job.name == 'police' or espoli.job.name == 'sheriff' then
	holdingUp, store = false, ''
	RemoveBlip(blipRobbery)
	print('Kill Blip') else print('no es poliaiia y blip no') end
end)

RegisterNetEvent('snowiPongoBLIP')
AddEventHandler('snowiPongoBLIP', function(position)
	espoli = ESX.GetPlayerData()
	print(espoli.job.name..'set blip')
	if espoli.job.name == 'police' or espoli.job.name == 'sheriff' then
	blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 3)

	PulseBlip(blipRobbery)
	else print('no es policia y no le sale') end
end)
RegisterNetEvent('shownotipol')
AddEventHandler('shownotipol', function(msg) if policia==true then TriggerEvent('esx:showNotification', msg) else print('noes policia notifica no ') end end)
RegisterNetEvent('snowiTooFar')
AddEventHandler('snowiTooFar', function()
	print(espoli.job.name..' tofar')

	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_cancelled'))
	print('Lejos del sitio, cancelar C')
end)

RegisterNetEvent('snowiCompleto')
AddEventHandler('snowiCompleto', function(award)
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_complete', award))
end)

RegisterNetEvent('snowiTiempoHold')
AddEventHandler('snowiTiempoHold', function(store)
	print('Start time', store)
	local timer = Stores[store].secondsRemaining

	Citizen.CreateThread(function()
		while timer > 0 and holdingUp do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(0)
			drawTxt(0.66, 1.44, 1.0, 1.0, 0.4,'~b~[~y~'..Stores[store].nameOfStore..'~b~] ~h~Tiempo restante:~r~'..timer, 255, 255, 255, 255)
		end
	end)
end)

Citizen.CreateThread(function()
	for k,v in pairs(Stores) do
		local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
		local numblp = 110
		local colorblip= 1
		local scaleblip= 0.7
		local nameBlip = 'Robo a tienda'
		if v.blip ~= nil then
			numblp = v.blip
		end
		if v.color ~= nil then
			colorblip = v.color
		end
		if v.scale ~= nil then
			scaleblip = v.scale
		end
		if v.nameBlip ~= nil then
			nameBlip = v.nameBlip
		end

		SetBlipSprite(blip,numblp )
		SetBlipColour(blip, colorblip)
		SetBlipScale(blip,scaleblip)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(nameBlip)
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerPos = GetEntityCoords(PlayerPedId(), true)
		local dormir = true 


		for k,v in pairs(Stores) do
			storePos = v.position
			maxDistance = v.distMAX
			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z)

			if distance < Config.Marker.DrawDistance then
				dormir = false
				if not holdingUp then
					DrawMarker(21, storePos.x, storePos.y, storePos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)

					if distance < 0.5 then
						ESX.ShowFloatingHelpNotification(_U('press_to_rob', v.nameOfStore))

						if IsControlJustReleased(0, Keys['E']) then
							if IsPedArmed(PlayerPedId(), 7) then
								ESX.TriggerServerCallback('SnowiGetPoli', function(a)
									tableIndx = v.para
									print(json.encode(a))
									if tableIndx == 'police' then
										tablacompa = a.police
										dice = 'policias'
									elseif tableIndx == 'sheriff' then
										tablacompa = a.sheriff
										dice = 'sheriffs'
									end
									print(tablacompa, dice, tableIndx)
									if tablacompa >= v.necesita then 
										print(tablacompa) 
										holdingUp = true
										if IsPedArmed(PlayerPedId(), 1) then
										TriggerServerEvent('snowiStarted', k, 'blanca', a)
										else
											TriggerServerEvent('snowiStarted', k, 'fuego', a)
										end
									store = k
									else
										ESX.ShowNotification('No hay '..dice..' suficiente para empezar el atraco. Disponible:'..tablacompa)
									end 
				end)
							else
								ESX.ShowNotification(_U('no_threat'))
							end
						end
					end
				end
			end
		end
		
		if holdingUp then
			Citizen.Wait(1000)
			if holdingUp then

			--[[while store == '' do
				print('espero por store')
				Citizen.Wait(100)
			end--]]
			
			--print(json.encode(Stores))
			--print(store)
			--print(Stores[store].position)
			local storePos = Stores[store].position
			if Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z) > maxDistance then
				TriggerServerEvent('snowiTooFar2', store)
				holdingUp = false
				print('HoldingUp false')
			end
		else

			print('Se acabo rob')
		end
		end
		if dormir == true then
			Citizen.Wait(2500)
		end
	end
end)
--[[RegisterCommand('cancelaratraco', function(holdingUp))
	local playerPos = GetEntityCoords(PlayerPedId(), true)
if holdingUp then
	local storePos = Stores[store].position
	if Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z) > Config.MaxDistance then
		TriggerServerEvent('snowiTooFar2', store)
	end
end
print('Terminado')
end)--]]
RegisterNetEvent('sendWarnPolice El puto snowi ', function(txt, id, coords, mugshot,mugshotStr )
	print('receive')
	if ESX.GetPlayerData().job.name == 'police' or ESX.GetPlayerData().job.name == 'sheriff' then
	--local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(id)))
	SetNewWaypoint(coords.x, coords.y)
	UnregisterPedheadshot(mugshot)
	ESX.ShowAdvancedNotification('AVISO EMERGENTE', 'POSIBLE MIMEBRO DE ORGANIZACIÓN YIHADISTA!!', txt, mugshotStr, 4)
	end
end)

RegisterNetEvent(' regsiter mug shot . ', function(id) 
	local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(id)))
TriggerServerEvent(' ashjd snowi jjhhh 14.as d', mugshot, mugshotStr, id)
end)

RegisterCommand('sound1', function() PlaySound(-1, 'Virus_Eradicated', 'LESTER1A_SOUNDS', false, 0 , false) end)