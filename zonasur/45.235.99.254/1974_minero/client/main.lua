local PlayerData                = {}
ESX                             = nil
local onduty = false
local blips = false
local blipsLavado = false
local blipsFundir = false
local PuntoMineria = false
local PuntoLavado = false
local PuntoFundir = false
local blipActive = false
local mineActive = false
local washingActive = false
local remeltingActive = false
local firstspawn = false
local impacts = 0
local timer = 0
local camion = {}
local guardarcamion = false

--PUNTOS DE PICADO DE PIEDRAS
local puntos = {
	{x = 2033.23, y=3890.64, z = 30.93, tengo=false},
	{x = 1359.48, y=3599.98, z = 33.99,tengo=false},
	{x = 2003.11, y=3777.23, z = 31.28,tengo=false},
	{x = 2052.99, y=3677.95, z = 33.69,tengo=false},
	{x=1984.14, y=3705.01, z=31.57,tengo=false},
	{x=1692.28, y=3590.31, z=34.62,tengo=false},
	{x=1501.13, y=3588.52, z=34.49,tengo=false},
	{x=1475.34, y=3417.33, z=45.39,tengo=false},
	{x=1451.79, y=3754.88, z=31.03,tengo=false},
	{x=1530.56, y=3777.42, z=33.61,tengo=false},
	{x=1523.53, y=3916.98, z=30.87,tengo=false},
	{x=1967.24, y=3820.9, z=31.5,tengo=false},
	{x=2051.8, y=3932.63, z=32.21,tengo=false},
	{x=1921.08, y=3744.57, z=31.44,tengo=false},
	{x=1777.75, y=3804.49, z=37.46,tengo=false},
	{x=1601.87, y=3673.74, z=33.61,tengo=false},
	{x=1782.01, y=3328.68, z=40.35,tengo=false},
	{x=1861.94, y=3388.0, z=46.77,tengo=false},
	{x=2036.15, y=3454.46, z=42.94,tengo=false}
}

local locations = {
	{ ['x'] =2955.14,  ['y'] = 2819.51 , ['z'] = 42.46, minado=false},
	{ ['x'] =2946.94,  ['y'] = 2820.4 , ['z'] = 42.86, minado=false},
	{ ['x'] =2943.53,  ['y'] = 2819.70 , ['z'] = 43.16, minado=false},
	{ ['x'] = 2925.66,  ['y'] = 2812.85,  ['z'] = 44.58, minado=false},
	{ ['x'] = 2952.57,  ['y'] = 2769.48,  ['z'] = 39.04, minado=false},
	{ ['x'] = 2947.37,  ['y'] = 2766.84,  ['z'] = 39.04, minado=false},
	{ ['x'] = 2971.29,  ['y'] = 2776.11,  ['z'] = 38.31, minado=false},
	{ ['x'] =2967.93,  ['y'] = 2774.54,  ['z'] = 38.31, minado=false},
	{ ['x'] =2977.62,  ['y'] = 2791.22,  ['z'] = 40.64, minado=false},
	{ ['x'] =2971.05,  ['y'] = 2799.05,  ['z'] = 41.43, minado=false},
	{ ['x'] =2937.0,  ['y'] = 2773.62,  ['z'] = 39.21, minado=false},
	{ ['x'] =2926.92,  ['y'] = 2790.57,  ['z'] = 40.27, minado=false},
	{ ['x'] =2929.76,  ['y'] = 2787.01,  ['z'] = 39.57, minado=false},
	{ ['x'] =2920.2,  ['y'] = 2799.06,  ['z'] = 41.18, minado=false},
}

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

RegisterNetEvent("esxLRP:lavarpiedra")
AddEventHandler("esxLRP:lavarpiedra", function()
    Washing()
end)

RegisterNetEvent("esxLRP:fundirpiedra")
AddEventHandler("esxLRP:fundirpiedra", function()
    Remelting()
end)

RegisterNetEvent('esxLRP:Temporizador')
AddEventHandler('esxLRP:Temporizador', function(accion)
    local timer = 0
    local ped = PlayerPedId()
	local tiempo = Config.Time / 100
	--local tiempo2 = tiempo / 100
    
    Citizen.CreateThread(function()
		while timer > -1 do
			Citizen.Wait(tiempo)

			if timer > -1 then
				timer = timer + 1
            end
            if timer == 100 then
				if accion == 'lavar' then
					TriggerServerEvent("esxLRP:lavarpiedra")
					washingActive = false
				else
					TriggerServerEvent("esxLRP:fundirpiedra") 
					remeltingActive = false
				end	
				ClearPedTasks(ped)
				FreezeEntityPosition(ped, false)
                break
            end
		end
    end) 
end)



--[[
Citizen.CreateThread(function()
    while true do

    local ped = PlayerPedId()
    
    local lavado2X = 1921.23
    local lavado2Y = 308.44
    local lavado2Z = 161.64

    local lavado3X = 1918.34
    local lavado3Y = 315.78
    local lavado3Z = 161.38

    local lavado4X = 1916.56
    local lavado4Y = 321.45
    local lavado4Z = 161.50

    local FundirRoca2X = 1109.76
    local FundirRoca2Y = -2009.81
    local FundirRoca2Z = 30.98

    local FundirRoca3X = 1085.3
    local FundirRoca3Y = -2001.87
    local FundirRoca3Z = 31.43

    Citizen.Wait(5)
		if PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.WashingX, Config.WashingY, Config.WashingZ, true) < 1.5 and blipsLavado then
                Draw3DText(Config.WashingX, Config.WashingY, Config.WashingZ-2.0, (' Lavado de roca en progreso ~g~ ' .. timer .. '%'), 4, 0.1, 0.1)
            end

            if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado2X, lavado2Y, lavado2Z, true) < 1.5 and blipsLavado then
                Draw3DText(lavado2X, lavado2Y, lavado2Z-2.0, (' Lavado de roca en progreso ~g~ '.. timer .. '%'), 4, 0.1, 0.1)
            end

            if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado3X, lavado3Y, lavado3Z, true) < 1.5 and blipsLavado then
                Draw3DText(lavado3X, lavado3Y, lavado3Z-2.0, (' Lavado de roca en progreso ~g~'.. timer .. '%'), 4, 0.1, 0.1)
            end

            if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado4X, lavado4Y, lavado4Z, true) < 1.5 and blipsLavado then
                Draw3DText(lavado4X, lavado4Y, lavado4Z-2.0, (' Lavado de roca en progreso ~g~'.. timer .. '%'), 4, 0.1, 0.1)
            end

            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ, true) < 1.5 and blipsFundir then
                Draw3DText(Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ-2.0, (' Extrayendo Minerales de la roca lavada ~g~ ' .. timer .. '%'), 4, 0.1, 0.1)
            end

            if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca2X, FundirRoca2Y, FundirRoca2Z, true) < 1.5 and blipsFundir then
                Draw3DText(FundirRoca2X, FundirRoca2Y, FundirRoca2Z-2.0, (' Extrayendo Minerales de la roca lavada ~g~ ' .. timer .. '%'), 4, 0.1, 0.1)
            end

            if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca3X, FundirRoca3Y, FundirRoca3Z, true) < 1.5 and blipsFundir then
                Draw3DText(FundirRoca3X, FundirRoca3Y, FundirRoca3Z-2.0, (' Extrayendo Minerales de la roca lavada ~g~ ' .. timer .. '%'), 4, 0.1, 0.1)
            end

            if timer == 100 then
                timer = 0
                break
            end
		end	
    end
end)
]]--

Citizen.CreateThread(function()
    local hash = GetHashKey("ig_natalia")

    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Citizen.Wait(100)
    end

    while not HasModelLoaded(hash) do
        Citizen.Wait(0)
    end

    if firstspawn == false then
        local npc = CreatePed(6, hash, Config.SellX, Config.SellY, Config.SellZ, 129.0, false, false)
        SetEntityInvincible(npc, true)
        FreezeEntityPosition(npc, true)
        SetPedDiesWhenInjured(npc, false)
        SetPedCanRagdollFromPlayerImpact(npc, false)
        SetPedCanRagdoll(npc, false)
        SetEntityAsMissionEntity(npc, true, true)
        SetEntityDynamic(npc, true)
		SetBlockingOfNonTemporaryEvents(npc, true)
    end
end)

RegisterNetEvent('esx_miner:createblips')
AddEventHandler('esx_miner:createblips', function()
    Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(5)
                if blips == true and blipActive == false then
                    blip1 = AddBlipForCoord(Config.MinerX, Config.MinerY, Config.MinerZ)
                    blip2 = AddBlipForCoord(Config.WashingX, Config.WashingY, Config.WashingZ)
                    blip3 = AddBlipForCoord(Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ)
                    blip4 = AddBlipForCoord(Config.SellX, Config.SellY, Config.SellZ)
                    SetBlipSprite(blip1, 365)
                    SetBlipColour(blip1, 5)
                    SetBlipAsShortRange(blip1, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Mine")
                    EndTextCommandSetBlipName(blip1)   
                    SetBlipSprite(blip2, 365)
                    SetBlipColour(blip2, 5)
                    SetBlipAsShortRange(blip2, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Washing stones")
                    EndTextCommandSetBlipName(blip2)   
                    SetBlipSprite(blip3, 365)
                    SetBlipColour(blip3, 5)
                    SetBlipAsShortRange(blip3, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Remelting stones")
                    EndTextCommandSetBlipName(blip3)
                    SetBlipSprite(blip4, 272)
                    SetBlipColour(blip4, 5)
                    SetBlipAsShortRange(blip4, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Selling items")
                    EndTextCommandSetBlipName(blip4)    
                    blipActive = true
                elseif blips == false and blipActive == false then
					if blip1 then
						RemoveBlip(blip1)
						blip1 = nil
					end
					if blip2 then
						RemoveBlip(blip2)
						blip2 = nil
					end
					if blip3 then
						RemoveBlip(blip3)
						blip3 = nil
					end
                end
        end
    end)
end)


Citizen.CreateThread(function()
    blip = AddBlipForCoord(Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ)
    SetBlipSprite(blip, 124)
    SetBlipColour(blip, 5)
	SetBlipScale(blip, 1.1)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Minero")
    EndTextCommandSetBlipName(blip)   
end) 


Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
    local coords = GetEntityCoords(PlayerPedId()) 
        Citizen.Wait(5)
			if PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
                if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ, true) < 25 then
                    DrawMarker(25, Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ-0.95, 0, 0, 0, 0, 0, 90.0, 2.0, 2.0, 1.0, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(coords,  Config.CloakroomX,Config.CloakroomY,Config.CloakroomZ, true) < 4.0 then
                        DrawText3Ds(vector3(Config.CloakroomX,Config.CloakroomY,Config.CloakroomZ), "Presiona [E] entrar al vestuario", 0.35)    
                    end    
   
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ, true) < 1 then
                        ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ para abrir el menu.')
                            if IsControlJustReleased(1, 51) then
                                Cloakroom() 
                            end
                    end
                end
				
				if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.Boss, true) < 25 and PlayerData.job.grade_name == 'boss' then
                    DrawMarker(3, Config.Boss.x, Config.Boss.y, Config.Boss.z, 0, 0, 0, 0, 0, 90.0, 0.5, 0.5, 0.5, 0, 155, 253, 100, 0, 0, 2, true, 0, 0, 0)
                    if GetDistanceBetweenCoords(coords, Config.Boss, true) < 4.0 then
                        DrawText3Ds(Config.Boss, "Presiona [E] entrar menu de Dueño", 0.35)    
                    end    
   
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.Boss, true) < 1 then
                        if IsControlJustReleased(1, 51) then
                            local options = {
								wash      = true,
								employees = false,
								grades = false,
							}

							ESX.UI.Menu.CloseAll()

							TriggerEvent('esx_society:openBossMenu_zs', 'miner', function(data, menu)
								menu.close()
								CurrentAction     = 'menu_boss_actions'
								CurrentActionMsg  = 'Presione ~INPUT_CONTEXT~ para abrir el menu JEFE.'
								CurrentActionData = {}
							end,options)
                        end
                    end
                end  
			end 
    end
end)

Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
    Citizen.Wait(5)
	if PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		for i=1, #locations, 1 do
			if locations[i].minado == false then
				if GetDistanceBetweenCoords(GetEntityCoords(ped), locations[i].x, locations[i].y, locations[i].z, true) < 25 and mineActive == false and blips then
					DrawMarker(20, locations[i].x, locations[i].y, locations[i].z, 0, 0, 0, 0, 0, 100.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(GetEntityCoords(ped), locations[i].x, locations[i].y, locations[i].z, true) < 1 and blips then
						ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ para minar.")
						if IsControlJustReleased(1, 51) and mineActive == false then
							mineActive = true
							ESX.TriggerServerCallback('esxLRP:checkpico', function(pico)
								if pico >= 1 then
									locations[i].minado = true
									Animation()
								else
									mineActive = false
									ESX.ShowNotification("~r~NO TIENES PICO PARA MINAR!")
								end
							end)	
						end
					end
				end
			end
        end
	end	
    end
end)



Citizen.CreateThread(function()
    while true do

    local ped = PlayerPedId()

    local lavado2X = 1921.23
    local lavado2Y = 308.44
    local lavado2Z = 161.64

    local lavado3X = 1918.34
    local lavado3Y = 315.78
    local lavado3Z = 161.38

    local lavado4X = 1916.56
    local lavado4Y = 321.45
    local lavado4Z = 161.50

    Citizen.Wait(5)
	if PlayerData.job ~= nil and PlayerData.job.name == 'miner' then	
		if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.PuntoMineria.x, Config.PuntoMineria.y, Config.PuntoMineria.z, true) < 100 and not PuntoMineria  and onduty then
            DrawMarker(1, Config.PuntoMineria.x, Config.PuntoMineria.y, Config.PuntoMineria.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.PuntoMineria.x, Config.PuntoMineria.y, Config.PuntoMineria.z, true) < 2.5 and not PuntoMineria and onduty then
				ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ para estacionar.")
                if IsControlJustReleased(1, 51) then
					if GetVehiclePedIsIn(ped, false) == camion then
						PuntoMineria = true
						if BlipDelivery then
							RemoveBlip(BlipDelivery)
							BlipDelivery = nil
						end
						blips = true
						ESX.ShowNotification("~y~Estaciona el camion y ponte a minar!\nCuando termines ve al siguiente punto!")
						Wait(5000)
						TriggerEvent('esx_miner:gps', Config.PuntoLavado, '~y~Cuando termines de minar Llevas las piedras al siguiente punto!')
					else
						ESX.ShowNotification("~r~No es el camion que Alquilaste!")
					end
				end
			end
        end
		
		if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.PuntoLavado.x, Config.PuntoLavado.y, Config.PuntoLavado.z, true) < 100 and not PuntoLavado and onduty then
            DrawMarker(1, Config.PuntoLavado.x, Config.PuntoLavado.y, Config.PuntoLavado.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.PuntoLavado.x, Config.PuntoLavado.y, Config.PuntoLavado.z, true) < 2.5 and not PuntoLavado and onduty then
				ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ para estacionar.")
                if IsControlJustReleased(1, 51) then
					if GetVehiclePedIsIn(ped, false) == camion then
						PuntoLavado = true
						if BlipDelivery then
							RemoveBlip(BlipDelivery)
							BlipDelivery = nil
						end
						blipsLavado = true
						ESX.ShowNotification("~y~Estaciona el camion y ponte a lavar!")
					else
						ESX.ShowNotification("~r~No es el camion que Alquilaste!")
					end
				end
			end
        end
	   
        if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.WashingX, Config.WashingY, Config.WashingZ, true) < 25 and washingActive == false and blipsLavado then
            DrawMarker(20, Config.WashingX, Config.WashingY, Config.WashingZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.WashingX, Config.WashingY, Config.WashingZ, true) < 1 and blipsLavado then
                    ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ para lavar roca!")
                        if IsControlJustReleased(1, 51) and washingActive == false then
							washingActive = true
							ESX.TriggerServerCallback("esxLRP:checkPiedras", function(cantidad)
								if cantidad > 0 then
									TriggerEvent('esx_miner:gps', Config.PuntoFundir, '~y~Cuando termines de Lavar lleva las piedras a fundir!')
									Washing()
								else
									ESX.ShowNotification('No tienes mas ~b~Piedras~w~ para lavar.')
									blipsLavado = false
									--TriggerEvent('esx_miner:FinLavado')
								end
							end)
						end
				end
        end
---## SEGUNDO PUNTO DE LAVADO SIN BLIP ##---
        if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado2X, lavado2Y, lavado2Z, true) < 25 and washingActive == false and blipsLavado then
            DrawMarker(20, lavado2X, lavado2Y, lavado2Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado2X, lavado2Y, lavado2Z, true) < 1 and blipsLavado then
                    ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ para lavar roca!")
                        if IsControlJustReleased(1, 51) and washingActive == false then
							washingActive = true
							ESX.TriggerServerCallback("esxLRP:checkPiedras", function(cantidad)
								if cantidad > 0 then
									TriggerEvent('esx_miner:gps', Config.PuntoFundir, '~y~Cuando termines de Lavar lleva las piedras a fundir!')
									Washing()
								else
									ESX.ShowNotification('No tienes mas ~b~Piedras~w~ para lavar.')
									blipsLavado = false
									--TriggerEvent('esx_miner:FinLavado')
								end
							end)
						end
				end
        end
---## FIN SEGUNDO PUNTO DE LAVADO SIN BLIP ##---

---## TERCER PUNTO DE LAVADO SIN BLIP ##---
        if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado3X, lavado3Y, lavado3Z, true) < 25 and washingActive == false and blipsLavado then
            DrawMarker(20, lavado3X, lavado3Y, lavado3Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado3X, lavado3Y, lavado3Z, true) < 1 and blipsLavado then
                    ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ para lavar roca!")
                        if IsControlJustReleased(1, 51) and washingActive == false then
                            washingActive = true
							ESX.TriggerServerCallback("esxLRP:checkPiedras", function(cantidad)
								if cantidad > 0 then
									TriggerEvent('esx_miner:gps', Config.PuntoFundir, '~y~Cuando termines de Lavar lleva las piedras a fundir!')
									Washing()
								else
									ESX.ShowNotification('No tienes mas ~b~Piedras~w~ para lavar.')
									blipsLavado = false
									--TriggerEvent('esx_miner:FinLavado')
								end
							end)
						end
				end
        end
---## FIN TERCER PUNTO DE LAVADO SIN BLIP ##---

---## CUARTO PUNTO DE LAVADO SIN BLIP ##---
        if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado4X, lavado4Y, lavado4Z, true) < 25 and washingActive == false and blipsLavado then
            DrawMarker(20, lavado4X, lavado4Y, lavado4Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado4X, lavado4Y, lavado4Z, true) < 1 and blipsLavado then
                    ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ para lavar roca!")
                        if IsControlJustReleased(1, 51) and washingActive == false then
                            washingActive = true
							ESX.TriggerServerCallback("esxLRP:checkPiedras", function(cantidad)
								if cantidad > 0 then
									TriggerEvent('esx_miner:gps', Config.PuntoFundir, '~y~Cuando termines de Lavar lleva las piedras a fundir!')
									Washing()
								else
									ESX.ShowNotification('No tienes mas ~b~Piedras~w~ para lavar.')
									blipsLavado = false
									--TriggerEvent('esx_miner:FinLavado')
								end
							end)
						end
				end
        end
---## CUARTO PUNTO  DE LAVADO SIN BLIP ##---
	end
    end
end)

Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
     Citizen.Wait(5)

    local FundirRoca2X = 1109.76
    local FundirRoca2Y = -2009.81
    local FundirRoca2Z = 30.98

    local FundirRoca3X = 1085.3
    local FundirRoca3Y = -2001.87
    local FundirRoca3Z = 31.43
	if PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
	
		if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.PuntoFundir.x, Config.PuntoFundir.y, Config.PuntoFundir.z, true) < 100 and not PuntoFundir and onduty then
            DrawMarker(1, Config.PuntoFundir.x, Config.PuntoFundir.y, Config.PuntoFundir.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.PuntoFundir.x, Config.PuntoFundir.y, Config.PuntoFundir.z, true) < 2.5 and not PuntoFundir and onduty then
				ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ para estacionar.")
                if IsControlJustReleased(1, 51) then
					if GetVehiclePedIsIn(ped, false) == camion then
						PuntoFundir = true
						if BlipDelivery then
							RemoveBlip(BlipDelivery)
							BlipDelivery = nil
						end
						blipsFundir = true
						ESX.ShowNotification("~y~Estaciona el camion y ponte a FUNDIR!")
					else
						ESX.ShowNotification("~r~No es el camion que Alquilaste!")
					end
				end
			end
        end
		
        if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ, true) < 25 and remeltingActive == false and blipsFundir then
            DrawMarker(20, Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ, true) < 1 and blipsFundir then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para fundir rocas")
                        if IsControlJustReleased(1, 51) and remeltingActive == false then
							remeltingActive = true
							ESX.TriggerServerCallback("esxLRP:checkPiedrasLavadas", function(cantidad)
								if cantidad > 0 then
									TriggerEvent('esx_miner:gps', Config.GPStoVender, '~y~Cuando termines de fundir llevas las joyas a vender!!')
									Remelting()
								else
									ESX.ShowNotification('No tienes mas ~b~Piedras Lavadas~w~ para Fundir.')
									blipsFundir = false
									--TriggerEvent('esx_miner:FinFundir')
								end
							end)
						end
                end
            end


        if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca2X, Config.RemeltingY, FundirRoca2Z, true) < 25 and remeltingActive == false and blipsFundir then
            DrawMarker(20, FundirRoca2X, FundirRoca2Y, FundirRoca2Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca2X, FundirRoca2Y, FundirRoca2Z, true) < 1 and blipsFundir then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para fundir rocas")
                        if IsControlJustReleased(1, 51) and remeltingActive == false then
							remeltingActive = true
							ESX.TriggerServerCallback("esxLRP:checkPiedrasLavadas", function(cantidad)
								if cantidad > 0 then
									TriggerEvent('esx_miner:gps', Config.GPStoVender, '~y~Cuando termines de fundir llevas las joyas a vender!!')
									Remelting()
								else
									ESX.ShowNotification('No tienes mas ~b~Piedras Lavadas~w~ para Fundir.')
									blipsFundir = false
									--TriggerEvent('esx_miner:FinFundir')
								end
							end)
						end
				end
        end


        if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca3X, Config.RemeltingY, FundirRoca3Z, true) < 25 and remeltingActive == false and blipsFundir then
            DrawMarker(20, FundirRoca3X, FundirRoca3Y, Config.RemeltingZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca3X, FundirRoca3Y, FundirRoca3Z, true) < 1 and blipsFundir then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para fundir rocas")
                        if IsControlJustReleased(1, 51) and remeltingActive == false then
							remeltingActive = true
							ESX.TriggerServerCallback("esxLRP:checkPiedrasLavadas", function(cantidad)
								if cantidad > 0 then
									TriggerEvent('esx_miner:gps', Config.GPStoVender, '~y~Cuando termines de fundir llevas las joyas a vender!!')
									Remelting()
								else
									ESX.ShowNotification('No tienes mas ~b~Piedras Lavadas~w~ para Fundir.')
									blipsFundir = false
									--TriggerEvent('esx_miner:FinFundir')
								end
							end)
						end
				end
        end
	end
    end
end)



DrawText3Ds = function(coords, text, scale)
    local x,y,z = coords.x, coords.y, coords.z
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)

    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 420

    DrawRect(_x, _y + 0.0115, 0.032 + factor, 0.033, 41, 11, 41, 100)
end


Citizen.CreateThread(function()
	while true do
	local ped = PlayerPedId()
    local coords = GetEntityCoords(PlayerPedId()) 
    Citizen.Wait(5)
	if PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		if GetDistanceBetweenCoords(coords,Config.SellX,Config.SellY,Config.SellZ, true) < 2.0 and onduty then
			DrawText3Ds(vector3(Config.SellX,Config.SellY,Config.SellZ+0.90), "Presiona [E] Vender tus joyas", 0.35)
        
		end     
		if GetDistanceBetweenCoords(coords, Config.Sell2X,Config.Sell2Y,Config.Sell2Z, true) < 2.0 and onduty then
			DrawText3Ds(vector3(Config.Sell2X,Config.Sell2Y,Config.Sell2Z+0.90), "Presiona [E] Vender tus joyas", 0.35)
		end          

		if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.SellX,  Config.SellY, Config.SellZ, true) < 25 and onduty then
			DrawMarker(25,Config.SellX,Config.SellY, Config.SellZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.SellX, Config.SellY, Config.SellZ, true) < 2 and onduty then
                ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ Para vender joyas")
                if IsControlJustReleased(1, 51) then
                    Jeweler()
					TriggerEvent('esx_miner:gps', Config.VehicleDelete, '~g~Vuelve a la mineria!')
					--guardarcamion = true
				end
			end
		end
		--Borrar Camion
		if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.VehicleDelete.x,  Config.VehicleDelete.y, Config.VehicleDelete.z, true) < 25 and onduty then--and guardarcamion then
			DrawMarker(1, Config.VehicleDelete.x, Config.VehicleDelete.y, Config.VehicleDelete.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.VehicleDelete.x, Config.VehicleDelete.y, Config.VehicleDelete.z, true) < 5.0 and onduty then--and guardarcamion then
                ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ Para guardar camion!")
                    if IsControlJustReleased(1, 51) then
						if BlipDelivery then
							RemoveBlip(BlipDelivery)
							BlipDelivery = nil
						end
						for i=1, #locations, 1 do
							locations[i].minado = false
						end
						
						if GetVehiclePedIsIn(ped, false) == camion and GetPedInVehicleSeat(camion, -1 ) == ped then
							DeleteVehicle(camion)
							TriggerServerEvent('esx_miner:Money')
							ESX.ShowNotification('Te devolvimos el deposito: ~g~$'..Config.Deposito)
						else
							ESX.ShowNotification('~r~No es el camion que te dimos! No hay devolucion de Deposito!')
						end		
					end
			end
		end
		---###VENTA DE JOYAS SIN BLIP
		if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.Sell2X,  Config.Sell2Y, Config.Sell2Z, true) < 25 and onduty then
			DrawMarker(25,Config.Sell2X,Config.Sell2Y, Config.Sell2Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)

            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.Sell2X, Config.Sell2Y, Config.Sell2Z, true) < 2 and onduty then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ Para vender joyas")
                if IsControlJustReleased(1, 51) then
                    Jeweler()
					TriggerEvent('esx_miner:gps', Config.VehicleDelete, '~y~Vuelve a la mineria!')
					--guardarcamion = true
				end
			end
		end
	end
    end
end)


function Cloakroom()
    local elements = {
        {label = 'Ropa Civil',   value = 'cloakroom1'},
        {label = 'Ropa de Trabajo',      value = 'cloakroom2'},
        {label = 'Camion de Trabajo <span style="color:green;">$'..Config.Deposito..'</span>',       value = 'vehicle'},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'miner_actions', {
        title    = 'Minero',
        align    = 'bottom-right',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'cloakroom1' then
            menu.close()
			if BlipDelivery then
				RemoveBlip(BlipDelivery)
				BlipDelivery = nil
			end
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)  
            blips = false
            blipActive = false
            --TriggerEvent("esx_miner:createblips")
			--guardarcamion = false
			onduty = false
        elseif data.current.value == 'cloakroom2' then
            menu.close()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                if skin.sex == 0 then
                    TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
                else
                    TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
                end
				--PuntoMineria = true
				onduty = true
                --TriggerEvent("esx_miner:createblips")
            end)
        elseif data.current.value == 'vehicle' then
            menu.close()
			if onduty then
				if ESX.Game.IsSpawnPointClear(Config.SpawnCar, 10.0) then
					ESX.TriggerServerCallback('esx_miner:getMoney', function(money)
						if money then
							ESX.Game.SpawnVehicle(Config.Vehiculo, Config.SpawnCar, Config.VehiclespawnH, function(vehicle)
								SetVehicleNumberPlateText(vehicle, 'ZONASUR') 
								exports["LegacyFuel"]:SetFuel(vehicle, 100)	
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
								camion = vehicle
								exports["esx_carlock"]:SetCamion(vehicle)
								TriggerEvent('esx_miner:gps', Config.PuntoMineria, '~y~Ve a Minar!')
								ESX.ShowNotification('~y~Pagaste un deposito de ~r~$'..Config.Deposito..' ~y~cuando devuelvas el camion, se te devuelve el dinero.')
								PuntoMineria = false
								PuntoFundir = false
								PuntoLavado = false
							end)
							menu.close()
						else
							ESX.ShowNotification('~r~No tienes suficiente dinero para pagar el deposito!')
						end
					end)
				else
					ESX.ShowNotification('~y~Espera a que se desocupe la zona!')
				end		
			else
				ESX.ShowNotification('~r~Primero debes ponerte la ropa de trabajo!')
			end
        end
    end, function(data, menu)
		menu.close()
	end)
end
--RemoveBlip(BlipDelivery)

RegisterNetEvent('esx_miner:gps')
AddEventHandler('esx_miner:gps', function(gps, msg)
	if BlipDelivery then
		RemoveBlip(BlipDelivery)
		BlipDelivery = nil
	end
	BlipDelivery = AddBlipForCoord(gps.x, gps.y, gps.z)
	SetBlipRoute(BlipDelivery, true)
	ESX.ShowNotification(msg)
end)

RegisterNetEvent('esx_miner:FinLavado')
AddEventHandler('esx_miner:FinLavado', function()
	blipsLavado = false
	--PuntoFundir = true
	--TriggerEvent('esx_miner:gps', Config.PuntoFundir, '~y~Ve a fundir las piedras lavadas!')
end)

RegisterNetEvent('esx_miner:FinFundir')
AddEventHandler('esx_miner:FinFundir', function()
	blipsFundir = false
	TriggerEvent('esx_miner:gps', Config.GPStoVender, '~y~Ve a vender todas las joyas!')
end)

function Jeweler()
    local elements = {
        {label = 'Venta Diamante &nbsp;&nbsp;<span style="color:#06E931;"> $' ..Config.DiamondPrice ..'</span>'  ,   value = 'diamonds'},
        {label = 'Venta Oro     &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<span style="color:#06E931;"> $' ..Config.GoldPrice ..'</span>' ,      value = 'gold'},
        {label = 'Venta Hierro     &nbsp;&nbsp; &nbsp;&nbsp;<span style="color:#06E931;"> $' ..Config.IronPrice ..'</span>' ,       value = 'iron'},
        {label = 'Venta Cobre    &nbsp; &nbsp;&nbsp;&nbsp;<span style="color:#06E931;"> $' ..Config.CopperPrice ..'</span>' ,       value = 'copper'},
        {label = 'Salir   &nbsp;&nbsp;<span style="color:#EA1313;"> Cerrar Ventana</span>' ,       value = 'Salir'},

    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'jeweler_actions', {
        title    = ' Venta de Joyas ',
        align    = 'bottom-right',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'diamonds' then
            --menu.close()
            TriggerServerEvent("esxLRP:VentaDiamante")
        elseif data.current.value == 'gold' then
            --menu.close()
            TriggerServerEvent("esxLRP:VentaOro")
        elseif data.current.value == 'iron' then
           -- menu.close()
            TriggerServerEvent("esxLRP:VentaHierro")
        elseif data.current.value == 'copper' then
           -- menu.close()
            TriggerServerEvent("esxLRP:VentaCobre")

        elseif data.current.value == 'Salir' then
         menu.close()
        end
    end)
end

function Animation()
    Citizen.CreateThread(function()
		local ped = PlayerPedId()
		while impacts < 5 do
			Citizen.Wait(1)
			RequestAnimDict("melee@large_wpn@streamed_core")
			Citizen.Wait(100)
			TaskPlayAnim((ped), 'melee@large_wpn@streamed_core', 'ground_attack_on_spot', 8.0, 8.0, -1, 80, 0, 0, 0, 0)
			SetEntityHeading(ped, 270.0)
			TriggerServerEvent('InteractSound_SV:PlayOnSource', 'pickaxe', 4.0)
					
			if impacts == 0 then
				pickaxe = CreateObject(GetHashKey("prop_tool_pickaxe"), 0, 0, 0, true, true, true) 
				AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.18, -0.02, -0.02, 350.0, 100.00, 140.0, true, true, false, true, 1, true)
			end
					
			Citizen.Wait(2500)
			ClearPedTasks(ped)
			impacts = impacts+1
					
			if impacts == 5 then
				DetachEntity(pickaxe, 1, true)
				DeleteEntity(pickaxe)
				DeleteObject(pickaxe)
				impacts = 0
				TriggerServerEvent("esxLRP:darpiedra")
				mineActive = false
				local allTrue = true
				
				for i=1, #locations, 1 do
					if locations[i].minado == false then
						allTrue = false  
					end
				end

				if allTrue then
					--TriggerEvent('esx_miner:gps', Config.PuntoLavado, '~y~Lleva las piedras al siguiente punto para lavar!')
					--PuntoLavado = false
					blips = false
				end
				break
			end
		end	
	end)
end

function Washing()
    local ped = PlayerPedId()
    --RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    RequestAnimDict("amb@world_human_gardener_plant@male@idle_a")
    washingActive = true
    Citizen.Wait(0)
    FreezeEntityPosition(ped, true)
	--TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
	TaskPlayAnim((ped), 'amb@world_human_gardener_plant@male@idle_a', 'idle_b', 8.0, 8.0, -1, 0, 0, 0, 0, 0)
    TriggerEvent("esxLRP:Temporizador", 'lavar')
    --Citizen.Wait(Config.Time)
	--TriggerServerEvent("esxLRP:lavarpiedra")
    --ClearPedTasks(ped)
    --FreezeEntityPosition(ped, false)
    --washingActive = false
end

function Remelting()
    local ped = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    remeltingActive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
	TriggerEvent("esxLRP:Temporizador", 'fundir')
	TriggerServerEvent('InteractSound_SV:PlayOnSource', 'rocafundida', 4.0)

    --Citizen.Wait(15900)
    --ClearPedTasks(ped)
    --FreezeEntityPosition(ped, false)
    --remeltingActive = false
end

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100 


    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextColour(255, 255, 255, 215)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()   

end

DrawText3Ds = function(coords, text, scale)
    local x,y,z = coords.x, coords.y, coords.z
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)

    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 420

    DrawRect(_x, _y + 0.0115, 0.032 + factor, 0.033, 41, 11, 41, 100)
end
