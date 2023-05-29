ESX                           = nil

local dooropen = false
local bovedaopen = false
local roboON = false
local CAJAFUERTEOK = false
local comienzo = false
local timeLeft = 220
local PlayerData = {}
local comienzo = false

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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
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

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.Alarma.x, Config.Alarma.y, Config.Alarma.z)
	SetBlipSprite(blip, 106)
	SetBlipScale(blip, 1.0)
	SetBlipColour(blip, 3)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Banco Central')
	EndTextCommandSetBlipName(blip)
	
	while true do
	Wait(5)
		local ped = PlayerPedId()
		local pedcoords = GetEntityCoords(ped, false)
		
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.PuertaReja.x, Config.PuertaReja.y, Config.PuertaReja.z)
		if distance <= 1.0 and not dooropen then
			Drawing.draw3DText(Config.PuertaReja.x, Config.PuertaReja.y, Config.PuertaReja.z-1, 'Presiona ~g~[E]~w~ para ~g~Hackear~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) and not dooropen then
				dooropen = true
				RobarCentral()
			end
		end
		local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.PuertaBoveda.x, Config.PuertaBoveda.y, Config.PuertaBoveda.z)
		if distance <= 1.0 and not bovedaopen then
			Drawing.draw3DText(Config.PuertaBoveda.x, Config.PuertaBoveda.y, Config.PuertaBoveda.z-1, 'Presiona ~g~[E]~w~ para ~g~Hackear~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
			if IsControlJustPressed(1, 38) and not bovedaopen then
				bovedaopen = true
				RobarCentralBoveda()
			end
		end
		
		if roboON then
			DrawMarker(27, Config.Alarma.x, Config.Alarma.y, Config.Alarma.z-0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Alarma.x, Config.Alarma.y, Config.Alarma.z)
			if distance <= 1.0 then
				Drawing.draw3DText(Config.Alarma.x, Config.Alarma.y, Config.Alarma.z-1, 'Presiona ~g~[E]~w~ para ~r~CANCELAR ROBO~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(1, 38) and roboON then
					roboON = false
					TriggerServerEvent('1974_bancocentral:cerrar')
				end
			end
		end	
		
		if CAJAFUERTEOK then
			DrawMarker(29, Config.Robando.x, Config.Robando.y, Config.Robando.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, false, false, false)
			local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.Robando.x, Config.Robando.y, Config.Robando.z)
			if distance <= 1.0 then
				Drawing.draw3DText(Config.Robando.x, Config.Robando.y, Config.Robando.z-1, 'Presiona ~g~[E]~w~ para abrir la caja fuerte!~w~', 1, 0.2, 0.1, 255, 255, 255, 215)
				if IsControlJustPressed(1, 38) and CAJAFUERTEOK then
					CAJAFUERTEOK = false
					ESX.TriggerServerCallback('1974_bancocentral:soplete', function(results)
						if results then
							Comienzo()
						else
							CAJAFUERTEOK = true
							ESX.ShowNotification("~r~No tienes Soplete!")
						end
					end)	
				end
			end
		end
	end
end)

RegisterNetEvent('1974_bancocentral:abrir')
AddEventHandler('1974_bancocentral:abrir', function(x,y,z,doortype)
	local coords = vector3(x,y,z)
	if doortype == 'hei_v_ilev_bk_gate2_pris' then
		obs, distance = GetClosestObjectOfType(coords, 1.0, GetHashKey(doortype), false, false, false)
		SetEntityHeading(obs, 0.0)
	elseif doortype == 'v_ilev_bk_vaultdoor' then
		obs2, distance = GetClosestObjectOfType(coords, 1.0, GetHashKey(doortype), false, false, false)
		SetEntityHeading(obs2, 0.0)
	end
end)

RegisterNetEvent('1974_bancocentral:cerrar')
AddEventHandler('1974_bancocentral:cerrar', function()
	local coords = vector3(Config.PuertaCoord.x,Config.PuertaCoord.y,Config.PuertaCoord.z)
	obs, distance = GetClosestObjectOfType(coords, 1.0, GetHashKey(Config.PuertaTipo), false, false, false)
	SetEntityHeading(obs, 250.0)	
	dooropen = false
	local coords = vector3(Config.BovedaCoord.x,Config.BovedaCoord.y,Config.BovedaCoord.z)
	obs2, distance = GetClosestObjectOfType(coords, 1.0, GetHashKey(Config.BovedaTipo), false, false, false)
	SetEntityHeading(obs2, 160.00001525879)
	bovedaopen = false
	CAJAFUERTEOK = false
	comienzo = false
end)

RegisterNetEvent('1974_bancocentral:setblip')
AddEventHandler('1974_bancocentral:setblip', function()
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    blipRobbery = AddBlipForCoord(Config.Alarma.x, Config.Alarma.y, Config.Alarma.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

RegisterNetEvent('1974_bancocentral:killblip')
AddEventHandler('1974_bancocentral:killblip', function()
    RemoveBlip(blipRobbery)
end)

function RobarCentral()
	ESX.TriggerServerCallback('esx_policejob:getCops', function(results)
		if results ~= nil then
			if results >= Config.RequiredPolices then
				ESX.TriggerServerCallback('1974_bancocentral:getTime', function(results)
					if results ~= nil then
						if results then
							ESX.TriggerServerCallback('1974_bancocentral:raspberry', function(results)
								if results then
									roboON = true
									TriggerServerEvent('1974_bancocentral:abrir', Config.PuertaCoord.x, Config.PuertaCoord.y, Config.PuertaCoord.z, Config.PuertaTipo)
								else
									dooropen = false
									ESX.ShowNotification('~r~NO TIENES TABLET PARA HACKEAR!')
								end
							end)	
						else
							dooropen = false	
						end
					end
				end)
            else
				dooropen = false
				ESX.ShowNotification("~r~No hay suficientes policias disponibles. " .. results .. '/' .. Config.RequiredPolices)
			end
		end
	end)
end

function RobarCentralBoveda()
	ESX.TriggerServerCallback('1974_bancocentral:notebook', function(results)
		if results then
			CAJAFUERTEOK = true
			TriggerServerEvent('1974_bancocentral:abrir', Config.BovedaCoord.x, Config.BovedaCoord.y, Config.BovedaCoord.z, Config.BovedaTipo)
		else
			bovedaopen = false
			ESX.ShowNotification('~r~NO TIENES NOTEBOOK PARA HACKEAR!')
		end
	end)
end

function Comienzo()
	comienzo = true
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
	FreezeEntityPosition(playerPed, true)
	SetEntityHeading(playerPed, 248.47)
	ESX.ShowNotification("Aguanta ~b~3 Minutos~w~ hasta abrir la ~g~Caja Fuerte!")
	
	local timer = 180

	Citizen.CreateThread(function()
		while timer > 0 and comienzo do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
			
			if timer == 0 then
				comienzo = false
				ClearPedTasksImmediately(playerPed)
				FreezeEntityPosition(playerPed, false)
				
				ESX.TriggerServerCallback('1974_bancocentral:check', function(can)
					TriggerServerEvent('1974_bancocentral:RoboTerminado', can)
				end)
				--TriggerServerEvent('1974_bancocentral:RoboTerminado')
			end	
		end
	end)

	Citizen.CreateThread(function()
		while comienzo do
			Citizen.Wait(0)
			drawTxt(0.9, 1.45, 1.0, 1.0, 0.4, 'Debes aguantar: ~r~'..timer..' ~w~segundos hasta que se abra la caja!', 255, 255, 255, 255)
		end
	end)
end
