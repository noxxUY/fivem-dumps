 local PlayerData                = {}

 ESX                             = nil

 

 local blip1 = {}

 local blips = true

 local blipActive = true

 local mineActive = false

 local washingActive = false

 local remeltingActive = false

 local firstspawn = true

 local impacts = 0

 local timer = 0

 local Estacionamiento = false

 local farmear = false

 local cortar = false

 local onduty = false

 local Empaquetar = false

 local guardarcamion = false

 local camion = {}

 local venta = false

 

 function GetCamion()

 	return camion

 end

 

 ---### PUNTOS MARCADORES RECOLECCION O FARMEO  DE MATERIAL          ###---

 local locations = {

 { ['x'] =-553.19,  ['y'] = 5372.66 , ['z'] = 70.35, tengo = false},

 { ['x'] =-554.17,  ['y'] = 5369.96 , ['z'] = 70.36, tengo = false},

 { ['x'] =-555.03,  ['y'] = 5367.3 , ['z'] = 70.34, tengo = false},

 

 { ['x'] =-545.36,  ['y'] = 5385.99 , ['z'] = 70.37, tengo = false},

 { ['x'] =-543.63,  ['y'] = 5388.6 , ['z'] =70.29, tengo = false},

 { ['x'] =-541.2,  ['y'] =5393.23 , ['z'] =70.11, tengo = false},

 

 { ['x'] =-537.83,  ['y'] = 5372.75 , ['z'] = 70.61, tengo = false},

 { ['x'] =-538.77,  ['y'] = 5370.04 , ['z'] =70.48, tengo = false},

 

 }

 ---### FIN ###  PUNTOS MARCADORES RECOLECCION O FARMEO  DE MATERIAL  ###---

 

 ---### PUNTOS MARCADORES Y LETRAS FLOTANTES DE PROCESAMIENTO ###---

 local procesamiento2X = -524.86

 local procesamiento2Y = 5285.99

 local procesamiento2Z = 74.17

 

 local procesamiento3X = -523.98

 local procesamiento3Y = 5288.93

 local procesamiento3Z = 74.17

 

 local procesamiento4X = -524.15

 local procesamiento4Y = 5293.98

 local procesamiento4Z = 74.2

 

 local procesamiento5X = -526.86

 local procesamiento5Y = 5294.92

 local procesamiento5Z = 74.17

 

 ---###      PUNTOS MARCADORES Y LETRAS FLOTANTES DE REFINERIA    ###---

 

 local Refinado2X = -515.09

 local Refinado2Y = 5263.56

 local Refinado2Z = 80.65

 

 local Refinado3X = -517.26

 local Refinado3Y = 5257.43

 local Refinado3Z = 80.65

 

 local Refinado4X = -506.09

 local Refinado4Y = 5262.96

 local Refinado4Z = 80.62

 

 

 ---### FIN ### PUNTOS MARCADORES Y LETRAS FLOTANTES DE REFINERIA ###---

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

 --[[

 RegisterNetEvent('esx:playerLoaded')

 AddEventHandler('esx:playerLoaded', function(xPlayer)

     PlayerData = xPlayer

 end)

 

 RegisterNetEvent('esx:setJob')

 AddEventHandler('esx:setJob', function(job)

   PlayerData.job = job

 end)

 ]]

 RegisterNetEvent('esx:setJob')

 AddEventHandler('esx:setJob', function(job)

 	PlayerData.job = job

 end)

 

 RegisterNetEvent("esxLRP:Procesamientomadera")

 AddEventHandler("esxLRP:Procesamientomadera", function()

     Procesamientomadera()

 end)

 

 RegisterNetEvent("esxLRP:refinadomadera")

 AddEventHandler("esxLRP:refinadomadera", function()

     Refinadomadera()

 end)

 

 RegisterNetEvent('esxLRP:Temporizadormadera')

 AddEventHandler('esxLRP:Temporizadormadera', function()

     local timer = 0

     local ped = PlayerPedId()

     

     Citizen.CreateThread(function()

 		while timer > -1 do

 			Citizen.Wait(150)

 

 			if timer > -1 then

 				timer = timer + 1

             end

             if timer == 100 then

                 break

             end

 		end

     end) 

 

 

     Citizen.CreateThread(function()

         while true do

 

     local ped = PlayerPedId()

 

     Citizen.Wait(10)

 

             if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.ProcesamientoX, Config.ProcesamientoY, Config.ProcesamientoZ, true) < 1.5 then

                 Draw3DText(Config.ProcesamientoX, Config.ProcesamientoY, Config.ProcesamientoZ-2.0, ( Config.ProcesamientoLetra .. timer .. '%'), 4, 0.1, 0.1)

             --Draw3DText 

             end

 

 

 ---### PROCESAMIENTO SIN BLIPS ###---

             if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento2X, procesamiento2Y, procesamiento2Z, true) < 1.5 then

                 Draw3DText(procesamiento2X, procesamiento2Y, procesamiento2Z-2.0, ( Config.ProcesamientoLetra .. timer .. '%'), 4, 0.1, 0.1)

             end

 

             if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento3X, procesamiento3Y, procesamiento3Z, true) < 1.5 then

                 Draw3DText(procesamiento3X, procesamiento3Y, procesamiento3Z-2.0, ( Config.ProcesamientoLetra .. timer .. '%'), 4, 0.1, 0.1)

             end

 

             if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento4X, procesamiento4Y, procesamiento4Z, true) < 1.5 then

                 Draw3DText(procesamiento4X, procesamiento4Y, procesamiento4Z-2.0, ( Config.ProcesamientoLetra .. timer .. '%'), 4, 0.1, 0.1)

             end

 

             if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento5X, procesamiento5Y, procesamiento5Z, true) < 1.5 then

                 Draw3DText(procesamiento5X, procesamiento5Y, procesamiento5Z-2.0, ( Config.ProcesamientoLetra .. timer .. '%'), 4, 0.1, 0.1)

             end

 

             if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.RefinadoX, Config.RefinadoY, Config.RefinadoZ, true) < 1.5 then

                 Draw3DText(Config.RefinadoX, Config.RefinadoY, Config.RefinadoZ-2.0, ( Config.RefinadoLetra .. timer .. '%'), 4, 0.1, 0.1)

             end

 

             if GetDistanceBetweenCoords(GetEntityCoords(ped), Refinado2X, Refinado2Y, Refinado2Z, true) < 1.5 then

                 Draw3DText(Refinado2X, Refinado2Y, Refinado2Z-2.0, ( Config.RefinadoLetra .. timer .. '%'), 4, 0.1, 0.1)

             end

 

             if GetDistanceBetweenCoords(GetEntityCoords(ped), Refinado3X, Refinado3Y, Refinado3Z, true) < 1.5 then

                 Draw3DText(Refinado3X, Refinado3Y, Refinado3Z-2.0, ( Config.RefinadoLetra .. timer .. '%'), 4, 0.1, 0.1)

             end

 

              if GetDistanceBetweenCoords(GetEntityCoords(ped), Refinado4X, Refinado4Y, Refinado4Z, true) < 1.5 then

                 Draw3DText(Refinado4X, Refinado4Y, Refinado4Z-2.0, ( Config.RefinadoLetra .. timer .. '%'), 4, 0.1, 0.1)

             end

 ---### FIN ### PROCESAMIENTO SIN BLIPS ###---

 

             if timer == 100 then

                 timer = 0

                 break

             end

         end

     end)

 end)

 

 

 RegisterNetEvent('esxLRP:creadorblipmadera')

 AddEventHandler('esxLRP:creadorblipmadera', function()

     Citizen.CreateThread(function()

         while true do 

             Citizen.Wait(1)

                 if blips == true and blipActive == false then

                    

                     blip1 = AddBlipForCoord(Config.BlipmaderaX, Config.BlipmaderaY, Config.BlipmaderaZ)

                     blip2 = AddBlipForCoord(Config.ProcesamientoX, Config.ProcesamientoY, Config.ProcesamientoZ)

                     blip3 = AddBlipForCoord(Config.RefinadoX, Config.RefinadoY, Config.RefinadoZ)

                     blip4 = AddBlipForCoord(Config.VentaX, Config.VentaY, Config.VentaZ)

                   

                     SetBlipSprite(blip1, 238)

                     SetBlipColour(blip1, 5)

                     SetBlipScale(blip1,1.7)

                     SetBlipAsShortRange(blip1, true)

                     BeginTextCommandSetBlipName("STRING")

                     AddTextComponentString(Config.blipdemandera)

                     EndTextCommandSetBlipName(blip1)  

                   

 

                     SetBlipSprite(blip2, 238)

                     SetBlipColour(blip2, 5)

                     SetBlipScale(blip2,1.7)

                     SetBlipAsShortRange(blip2, true)

                     BeginTextCommandSetBlipName("STRING")

                     AddTextComponentString(Config.BlipProcesomiento)

                     EndTextCommandSetBlipName(blip2)  

 

                     SetBlipSprite(blip3, 238)

                     SetBlipColour(blip3, 5)

                     SetBlipScale(blip3,1.7)

                     SetBlipAsShortRange(blip3, true)

                     BeginTextCommandSetBlipName("STRING")

                     AddTextComponentString(Config.BlipRefinado) 

                     EndTextCommandSetBlipName(blip3)

                     

                     SetBlipSprite(blip4, 238)

                     SetBlipColour(blip4, 41)

                     SetBlipAsShortRange(blip4, true)

                     BeginTextCommandSetBlipName("STRING")

                     AddTextComponentString(Config.BlipVenta)

                     EndTextCommandSetBlipName(blip4)    

                     blipActive = true

 

                 elseif blips == false and blipActive == false then

                     RemoveBlip(blip1)

                     RemoveBlip(blip4)

                     RemoveBlip(blip2)

                     RemoveBlip(blip3)

 

                 end

         end

     end)

 end)

 

 Citizen.CreateThread(function()

 

     blip1ve = AddBlipForCoord(Config.InicioTrabajoX, Config.InicioTrabajoY, Config.InicioTrabajoZ)

     SetBlipSprite(blip1ve, 238)

     SetBlipColour(blip1ve, 5)

     SetBlipScale(blip1ve,1.0)

     SetBlipAsShortRange(blip1ve, true)

     BeginTextCommandSetBlipName("STRING")

     AddTextComponentString(Config.BlipInicioTrabajo)

     EndTextCommandSetBlipName(blip1ve)

 	

 end)

 

 Citizen.CreateThread(function()

     while true do

 	local ped = PlayerPedId()

     local coords = GetEntityCoords(PlayerPedId()) 

         Citizen.Wait(1)

 		if PlayerData.job ~= nil and PlayerData.job.name == 'lumberjack' and not IsEntityDead( ped ) then

             if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.InicioTrabajoX, Config.InicioTrabajoY, Config.InicioTrabajoZ, true) < 25 then

                 DrawMarker(25, Config.InicioTrabajoX, Config.InicioTrabajoY, Config.InicioTrabajoZ-0.95, 0, 0, 0, 0, 0, 90.0, 2.0, 2.0, 1.0, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)

                 if GetDistanceBetweenCoords(coords,  Config.InicioTrabajoX,Config.InicioTrabajoY,Config.InicioTrabajoZ, true) < 4.0 then

                     DrawText3Ds(vector3(Config.InicioTrabajoX,Config.InicioTrabajoY,Config.InicioTrabajoZ), "Presiona [E] enrtar al menu", 0.35)    

                 end    

    

                 if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.InicioTrabajoX, Config.InicioTrabajoY, Config.InicioTrabajoZ, true) < 1 then

                     --ESX.ShowHelpNotification(Config.BotonInicioTrabajo)

                     if IsControlJustReleased(1, 51) then

                         VestuarioMadera() 

                     end

                 end     

             end 

 			if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.EstacionarCamion.x, Config.EstacionarCamion.y,Config.EstacionarCamion.z, true) < 100 and Estacionamiento then

             DrawMarker(1, Config.EstacionarCamion.x, Config.EstacionarCamion.y, Config.EstacionarCamion.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)

 			if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.EstacionarCamion.x, Config.EstacionarCamion.y, Config.EstacionarCamion.z, true) < 2.5 and Estacionamiento then

 				ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ para estacionar.")

                 if IsControlJustReleased(1, 51) then

 					if GetVehiclePedIsIn(ped, false) == camion then

 						Estacionamiento = false

 						if BlipDelivery then

 							RemoveBlip(BlipDelivery)

 							BlipDelivery = nil

 						end

 						blips = true

 						farmear = true

 						ESX.ShowNotification("~y~Estaciona el camion y empieza a Trabajar!")

 					else

 						ESX.ShowNotification("~r~No es el camion que Alquilaste!")

 					end

 				end

 			end

 			end

 			for i=1, #locations, 1 do

 			if locations[i].tengo == false then

 				if GetDistanceBetweenCoords(GetEntityCoords(ped), locations[i].x, locations[i].y, locations[i].z, true) < 25 and mineActive == false and farmear then

 					DrawMarker(20, locations[i].x, locations[i].y, locations[i].z, 0, 0, 0, 0, 0, 100.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)

 					--  DrawMarker(20, locations[i].x, locations[i].y, locations[i].z, 0, 0, 0, 0, 0, 100.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)

                     if GetDistanceBetweenCoords(GetEntityCoords(ped), locations[i].x, locations[i].y, locations[i].z, true) < 1 then

                         ESX.ShowHelpNotification(Config.BotonRecoleccion)

                         if IsControlJustReleased(1, 51) and mineActive == false then

 							mineActive = true

 							ESX.TriggerServerCallback('esxLRP:checkhacha', function(pico)

 								if pico >= 1 then

 									locations[i].tengo = true

 									Animacionmadera()

 								else

 									mineActive = false

 									ESX.ShowNotification("~r~NO TIENES HACHA!")

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

 

 function Menuventas()

 	local elements = {}

 	elements = {

 		{label = "SI" ,value = "yes"},

 		{label = "NO" ,value = "no"}

 	}

 	ESX.UI.Menu.CloseAll()

 

 	ESX.UI.Menu.Open(

 		'default', GetCurrentResourceName(), 'principalAdministratorGroup',

 		{

 			title  = 'Quiere Comprar Hacha $'..Config.PrecioHacha..'?',

 			align  = 'bottom-right',

 			elements = elements

 		},

 		function(data, menu)

 			if data.current.value == "yes" then

 				TriggerServerEvent("esxLRP:comprar")

 				menu.close()

 			elseif data.current.value == "no" then

 				menu.close()

 			end

 		end,

 		function(data, menu)

 			menu.close()

 		end

 	)

 end

 

 Citizen.CreateThread(function()

     while true do

 

     local ped = PlayerPedId()

 

         Citizen.Wait(5)

 		--NPC VENTA HACHA 

 		--[[

 		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.NpcVentaHacha.x, Config.NpcVentaHacha.y, Config.NpcVentaHacha.z, true) <= 2.0 then

 			--Drawing.draw3DText(venta.x, venta.y, venta.z, 'Presiona ~g~[E]~w~ para comprar!', 1, 0.2, 0.1, 255, 255, 255, 215)

 			Draw3DText(Config.NpcVenta4X, Config.NpcVenta4Y, Config.NpcVenta4Z-1.0, ('Presiona ~g~[E]~w~ Para comprar!'), 4, 0.1, 0.1)

 			if IsControlJustPressed(1, 38) then -- When they press INPUT_PICKUP (default e)

 				Menuventas()

 			end

 		end

 		]]

 		---### PUNTO DE PROCESAMIENTO CON BLIP 

         if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.ProcesamientoX, Config.ProcesamientoY, Config.ProcesamientoZ, true) < 25 and washingActive == false and cortar then

             DrawMarker(20, Config.ProcesamientoX, Config.ProcesamientoY, Config.ProcesamientoZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)

                 if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.ProcesamientoX, Config.ProcesamientoY, Config.ProcesamientoZ, true) < 1 then

                     ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ Para procesar madera ")

                         if IsControlJustReleased(1, 51) and washingActive == false then

 							washingActive = true

                             TriggerServerEvent("esxLRP:Procesamientomadera")

 						end

 				end

         end

        --- FIN ### PUNTO DE PROCESAMIENTO CON BLIP 

 

         if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento2X, procesamiento2Y, procesamiento2Z, true) < 25 and washingActive == false and cortar then

             DrawMarker(20, procesamiento2X, procesamiento2Y, procesamiento2Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)

                 if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento2X, procesamiento2Y, procesamiento2Z, true) < 1 then

                     ESX.ShowHelpNotification(Config.BotonProcesamiento)

                         if IsControlJustReleased(1, 51) and washingActive == false then

 							washingActive = true

                             TriggerServerEvent("esxLRP:Procesamientomadera")

 						end

             end

         end

         if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento3X, procesamiento3Y, procesamiento3Z, true) < 25 and washingActive == false and cortar then

             DrawMarker(20, procesamiento3X, procesamiento3Y, procesamiento3Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)

                 if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento3X, procesamiento3Y, procesamiento3Z, true) < 1 then

                     ESX.ShowHelpNotification(Config.BotonProcesamiento)

                         if IsControlJustReleased(1, 51) and washingActive == false then

 							washingActive = true

                             TriggerServerEvent("esxLRP:Procesamientomadera")

 						end

 				end

         end

         if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento4X, procesamiento4Y, procesamiento4Z, true) < 25 and washingActive == false and cortar then

             DrawMarker(20, procesamiento4X, procesamiento4Y, procesamiento4Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)

                 if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento4X, procesamiento4Y, procesamiento4Z, true) < 1 then

                     ESX.ShowHelpNotification(Config.BotonProcesamiento)

                         if IsControlJustReleased(1, 51) and washingActive == false then

 							washingActive = true

                             TriggerServerEvent("esxLRP:Procesamientomadera")

 						end

 				end

         end

 

         if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento5X, procesamiento5Y, procesamiento5Z, true) < 25 and washingActive == false and cortar then

             DrawMarker(20, procesamiento5X, procesamiento5Y, procesamiento5Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)

                 if GetDistanceBetweenCoords(GetEntityCoords(ped), procesamiento5X, procesamiento5Y, procesamiento5Z, true) < 1 then

                     ESX.ShowHelpNotification(Config.BotonProcesamiento)

                         if IsControlJustReleased(1, 51) and washingActive == false then

 							washingActive = true

                             TriggerServerEvent("esxLRP:Procesamientomadera")

 						end

 				end

         end

 		

 	--Borrar Camion

 	if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.VehicleDelete.x,  Config.VehicleDelete.y, Config.VehicleDelete.z, true) < 25 and guardarcamion then

 		DrawMarker(1, Config.VehicleDelete.x, Config.VehicleDelete.y, Config.VehicleDelete.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)

           --DrawMarker(1,Config.VehicleDelete, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)

 

             if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.VehicleDelete.x, Config.VehicleDelete.y, Config.VehicleDelete.z, true) < 5.0 and guardarcamion then

                 ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ Para guardar camion!")

                     if IsControlJustReleased(1, 51) then

 						if GetVehiclePedIsIn(ped, false) == camion and GetPedInVehicleSeat(camion, -1 ) == ped then

 							if BlipDelivery then

 								RemoveBlip(BlipDelivery)

 								BlipDelivery = nil

 							end

 							DeleteVehicle(camion)

 							TriggerServerEvent('esxLRP:Money')

 							ESX.ShowNotification('Te devolvimos el deposito: ~g~$'..Config.Deposito)

 							for i=1, #locations, 1 do

 								locations[i].tengo = false

 							end

 							guardarcamion = false

 							venta = true

 						else

 							ESX.ShowNotification('~r~No es el camion que te dimos! o no estas sentado en el asiento del Conductor!')

 						end		

 					end

 			end

     end

     end

 end)

 

 Citizen.CreateThread(function()

     while true do

 	local ped = PlayerPedId()

      Citizen.Wait(1)

 

         if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.RefinadoX, Config.RefinadoY, Config.RefinadoZ, true) < 25 and remeltingActive == false and Empaquetar then

             DrawMarker(20, Config.RefinadoX, Config.RefinadoY, Config.RefinadoZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)

                 if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.RefinadoX, Config.RefinadoY, Config.RefinadoZ, true) < 1 then

                     ESX.ShowHelpNotification(Config.BotonRefinado)

                         if IsControlJustReleased(1, 51) and remeltingActive == false then

 							remeltingActive = true

 							TriggerServerEvent("esxLRP:refinadomadera")  

 						end

                 end

             end

 

 

                if GetDistanceBetweenCoords(GetEntityCoords(ped), Refinado2X, Refinado2Y ,Refinado2Z, true) < 25 and remeltingActive == false and Empaquetar then

             DrawMarker(20, Refinado2X, Refinado2Y, Refinado2Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)

                 if GetDistanceBetweenCoords(GetEntityCoords(ped), Refinado2X, Refinado2Y, Refinado2Z, true) < 1 then

                     ESX.ShowHelpNotification(Config.BotonRefinado)

                         if IsControlJustReleased(1, 51) and remeltingActive == false then

 							remeltingActive = true

 							TriggerServerEvent("esxLRP:refinadomadera")  

 						end

                 end

             end

 

 

         if GetDistanceBetweenCoords(GetEntityCoords(ped), Refinado3X, Refinado3Y, Refinado3Z, true) < 25 and remeltingActive == false and Empaquetar then

             DrawMarker(20, Refinado3X, Refinado3Y, Refinado3Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)

                 if GetDistanceBetweenCoords(GetEntityCoords(ped), Refinado3X, Refinado3Y, Refinado3Z, true) < 1 then

                     ESX.ShowHelpNotification(Config.BotonRefinado)

                         if IsControlJustReleased(1, 51) and remeltingActive == false then

 							remeltingActive = true

 							TriggerServerEvent("esxLRP:refinadomadera")  

 						end

                 end

             end

 

         if GetDistanceBetweenCoords(GetEntityCoords(ped), Refinado4X, Refinado4Y, Refinado4Z, true) < 25 and remeltingActive == false and Empaquetar then

             DrawMarker(20, Refinado4X, Refinado4Y, Refinado4Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)

                 if GetDistanceBetweenCoords(GetEntityCoords(ped), Refinado4X, Refinado4Y, Refinado4Z, true) < 1 then

                     ESX.ShowHelpNotification(Config.BotonRefinado)

                         if IsControlJustReleased(1, 51) and remeltingActive == false then

 							remeltingActive = true

 							TriggerServerEvent("esxLRP:refinadomadera")  

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

         Citizen.Wait(1)

 

      

 		if GetDistanceBetweenCoords(coords,Config.VentaX,Config.VentaY,Config.VentaZ, true) < 2.0 and venta then

 			DrawText3Ds(vector3(Config.VentaX,Config.VentaY,Config.VentaZ+0.90), Config.VentaLetraEnCirculo, 0.35)

 		end     

 		if GetDistanceBetweenCoords(coords, Config.Venta2X,Config.Venta2Y,Config.Venta2Z, true) < 2.0 and venta then

 			DrawText3Ds(vector3(Config.Venta2X,Config.Venta2Y,Config.Venta2Z+0.90), Config.VentaLetraEnCirculo, 0.35)

 		end          

 

 		if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.VentaX,  Config.VentaY, Config.VentaZ, true) < 25 and venta then

 			DrawMarker(25,Config.VentaX,Config.VentaY, Config.VentaZ, 0, 0, 0, 0, 0, 55.0, 1.5, 1.5, 1.0, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)

             if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.VentaX, Config.VentaY, Config.VentaZ, true) < 2 then

                 if IsControlJustReleased(1, 51) then

                     ventamadera()                          

 				end

 			end

 		end

     ---###VENTA DE JOYAS SIN BLIP

 		if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.Venta2X,  Config.Venta2Y, Config.Venta2Z, true) < 25 and venta then

 			DrawMarker(25,Config.Venta2X,Config.Venta2Y, Config.Venta2Z, 0, 0, 0, 0, 0, 55.0, 1.5, 1.5, 1.0, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)

             if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.Venta2X, Config.Venta2Y, Config.Venta2Z, true) < 2 then

                 if IsControlJustReleased(1, 51) then

 					ventamadera()                          

 				end

 			end

 		end

     end

 end)

     

--[[

 Citizen.CreateThread(function()

   local hash = GetHashKey(Config.ModeloNpc1)

     if not HasModelLoaded(hash) then

        RequestModel(hash)

       Citizen.Wait(100)

     end

     while not HasModelLoaded(hash) do

        Citizen.Wait(0)

     end

	if firstspawn == true then

        local npc = CreatePed(6, hash, Config.NpcVenta1X, Config.NpcVenta1Y, Config.NpcVenta1Z,Config.NpcVenta1H, false, false)

        FreezeEntityPosition(npc, true) 

        SetEntityInvincible(npc, true)

        SetBlockingOfNonTemporaryEvents(npc, true)

        while not  TaskStartScenarioInPlace(npc, "WORLD_HUMAN_CLIPBOARD", 0, false) do -- TaskStartScenarioInPlace(npc, "WORLD_HUMAN_CLIPBOARD", 1, true) do

			Citizen.Wait(200)

        end             

        Citizen.Wait(200)   

	end

   end)

 ---#### FIN ### NPC 2 INMORTAL ADORNO 2 ###---

 

 ---#### NPC INMORTAL ADORNO 2 ###---

 

 Citizen.CreateThread(function()

   local hash = GetHashKey(Config.ModeloNpc2)

     if not HasModelLoaded(hash) then

        RequestModel(hash)

       Citizen.Wait(100)

     end

     while not HasModelLoaded(hash) do

        Citizen.Wait(0)

     end

 if firstspawn == true then

        local npc = CreatePed(6, hash, Config.NpcVenta2X, Config.NpcVenta2Y, Config.NpcVenta2Z, Config.NpcVenta2H, false, false)

              FreezeEntityPosition(npc, true) 

             SetEntityInvincible(npc, true)

             SetBlockingOfNonTemporaryEvents(npc, true)

             while not  TaskStartScenarioInPlace(npc, "WORLD_HUMAN_HAMMERING", 1, true) do -- TaskStartScenarioInPlace(npc, "WORLD_HUMAN_CLIPBOARD", 1, true) do

             Citizen.Wait(1000)

             end             

             Citizen.Wait(200)   

 

             --RequestAnimDict("anim@amb@nightclub@peds@")

            -- while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do

            -- Citizen.Wait(1000)

            -- end

                 

            -- Citizen.Wait(200)   

            -- TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_stand_guard_male_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)

   end

 end)

 

 ---#### FIN ### NPC 2 INMORTAL ADORNO 2 ###---

 

 ---#### NPC INMORTAL ADORNO 3 ###---

 

 Citizen.CreateThread(function()

 	local hash = GetHashKey(Config.ModeloNpc3)

     if not HasModelLoaded(hash) then

        RequestModel(hash)

       Citizen.Wait(100)

     end

     while not HasModelLoaded(hash) do

        Citizen.Wait(0)

     end

 if firstspawn == true then

        local npc = CreatePed(6, hash, Config.NpcVenta3X, Config.NpcVenta3Y, Config.NpcVenta3Z, Config.NpcVenta3H, false, false)

              FreezeEntityPosition(npc, true) 

             SetEntityInvincible(npc, true)

             SetBlockingOfNonTemporaryEvents(npc, true)

             while not  TaskStartScenarioInPlace(npc,"WORLD_HUMAN_HAMMERING" , 1, true) do -- TaskStartScenarioInPlace(npc, "WORLD_HUMAN_CLIPBOARD", 1, true) do

             Citizen.Wait(1000)

             end             

             Citizen.Wait(200)   

 

             --RequestAnimDict("anim@amb@nightclub@peds@")

            -- while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do

            -- Citizen.Wait(1000)

            -- end

                 

            -- Citizen.Wait(200)   

            -- TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_stand_guard_male_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)

   end

 end)

 

 ---#### NPC venta de hacha ###---


 Citizen.CreateThread(function()

 	local hash = GetHashKey(Config.ModeloNpc4)

     if not HasModelLoaded(hash) then

        RequestModel(hash)

       Citizen.Wait(100)

     end

     while not HasModelLoaded(hash) do

        Citizen.Wait(0)

     end

 	if firstspawn == true then

 		local npc = CreatePed(6, hash, Config.NpcVenta4X, Config.NpcVenta4Y, Config.NpcVenta4Z, Config.NpcVenta4H, false, false)

         FreezeEntityPosition(npc, true) 

         SetEntityInvincible(npc, true)

         SetBlockingOfNonTemporaryEvents(npc, true)

         while not  TaskStartScenarioInPlace(npc,"WORLD_HUMAN_CLIPBOARD" , 1, true) do -- TaskStartScenarioInPlace(npc, "WORLD_HUMAN_CLIPBOARD", 1, true) do

 			Citizen.Wait(1000)

         end             

         Citizen.Wait(200)   

 	end

 end)

 ]]--

 RegisterNetEvent('esxLRP:gps')

 AddEventHandler('esxLRP:gps', function(gps, msg)

 	if BlipDelivery then

 		RemoveBlip(BlipDelivery)

 		BlipDelivery = nil

 	end

 	BlipDelivery = AddBlipForCoord(gps.x, gps.y, gps.z)

 	SetBlipRoute(BlipDelivery, true)

 	ESX.ShowNotification(msg)

 end)

 

 RegisterNetEvent('esxLRP:FinCortado')

 AddEventHandler('esxLRP:FinCortado', function()

 	cortar = false

 	Empaquetar = true

 	TriggerEvent('esxLRP:gps', Config.Refinado, '~r~Ve a empaquetar las Tablas!!!')

 end)

 

 RegisterNetEvent('esxLRP:FinPaquete')

 AddEventHandler('esxLRP:FinPaquete', function()

 	Empaquetar = false

 	guardarcamion = true

 	TriggerEvent('esxLRP:gps', Config.VehicleDelete, '~r~Ve a vender tus tablas!!!')

 end)

 

 function VestuarioMadera()

     local elements = {

 		{label = 'Ropa de Civil',       value = 'cloakroom1'},

 		{label = 'Ropa de Trabajo',       value = 'cloakroom2'},

         {label = 'Vehiculo de Trabajo',       value = 'vehicle'},

         {label = 'Salir &nbsp;&nbsp;<span style="color:#EA1313;"> Cerrar Ventana</span>',         value = 'Salir'},

     }

 

     ESX.UI.Menu.CloseAll()

 

     ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'miner_actions', {

         title    = ' Menu Inicio leñador ',

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

 			onduty = false

 			venta = false

         elseif data.current.value == 'cloakroom2' then

             menu.close()

             ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

                 if skin.sex == 0 then

                     TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)

                 else

                     TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)

                 end

 				onduty = true

             end)

 		elseif data.current.value == 'Salir' then

 			menu.close()

         elseif data.current.value == 'vehicle' then

 			menu.close()

 			if onduty then

 				if ESX.Game.IsSpawnPointClear(Config.SpawnCar, 10.0) then

 					ESX.TriggerServerCallback('esxLRP:getMoney', function(money)

 						if money then

 							ESX.Game.SpawnVehicle(Config.Vehiculo, Config.SpawnCar, Config.VehiclespawnH, function(vehicle)

 								platenum = math.random(10000, 99999)

 								SetVehicleNumberPlateText(vehicle, platenum) 

 								exports["LegacyFuel"]:SetFuel(vehicle, 100)	

 								TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)

 								camion = vehicle

 								exports["esx_carlock"]:SetCamion(vehicle)

 								TriggerEvent('esxLRP:gps', Config.EstacionarCamion, '~y~Ve al Cerradero!!')

 								ESX.ShowNotification('~y~Pagaste un deposito de ~r~$'..Config.Deposito..' ~y~cuando devuelvas el camion, se te devuelve el dinero.')

 								SetEntityAsMissionEntity(vehicle,1,1)

 								Estacionamiento = true

 								venta = false

 								remeltingActive = false

 								washingActive = false

 								

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

 			--[[

             menu.close()

             RequestModel(Config.Vehiculo)

 

             Citizen.Wait(100)

             CreateVehicle(Config.Vehiculo, Config.VehiclespawnX, Config.VehiclespawnY, Config.VehiclespawnZ, Config.VehiclespawnH, true, true)

             --TriggerServerEvent("esxLRP:gasolinamadera")

 

            --ESX.ShowNotification("The vehicle was pulled out of the garage.")

             exports['mythic_notify']:DoCustomHudText('cajanegra', ' Un vehiculo de trabajo se te fue dado. ',3500)

 			]]

         end

     end, function(data, menu)

 		menu.close()

 	end)

 end

 

 function ventamadera()

     local elements = {

         {label = 'Venta Tablas de Roble &nbsp;<span style="color:#06E931;"> $' ..Config.MaterialNivel4..'</span>'  ,   value = 'Nivel4'},

         {label = 'Venta Tablas de Nogal      &nbsp;&nbsp;&nbsp;<span style="color:#06E931;"> $' ..Config.MaterialNivel3..'</span>' ,      value = 'Nivel3'},

         {label = 'Venta Tablas de Caoba     &nbsp; &nbsp;&nbsp;<span style="color:#06E931;"> $' ..Config.MaterialNivel2..'</span>' ,       value = 'Nivel2'},

         {label = 'Venta Tablas de Madera    &nbsp;&nbsp;&nbsp;<span style="color:#06E931;"> $' ..Config.MaterialNivel1..'</span>' ,       value = 'Nivel1'},

         {label = 'Salir   &nbsp;&nbsp;<span style="color:#EA1313;"> Cerrar Ventana</span>' ,       value = 'Salir'},

 

     }

 

     ESX.UI.Menu.CloseAll()

 

     ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'jeweler_actions', {

         title    = ' Venta de Madera ',

         align    = 'bottom-right',

         elements = elements

     }, function(data, menu)

         if data.current.value == 'Nivel4' then

             --menu.close()

             TriggerServerEvent("esxLRP:VentamaderaNivel4")

 

         elseif data.current.value == 'Nivel3' then

             --menu.close()

             TriggerServerEvent("esxLRP:VentamaderaNivel3")

         elseif data.current.value == 'Nivel2' then

            -- menu.close()

             TriggerServerEvent("esxLRP:VentamaderaNivel2") 

         elseif data.current.value == 'Nivel1' then

            -- menu.close()

             TriggerServerEvent("esxLRP:VentamaderaNivel1")

 

         elseif data.current.value == 'Salir' then

          menu.close()

         end

     end, function(data, menu)

 		menu.close()

 	end)

 end

 

 function Animacionmadera()

     Citizen.CreateThread(function()

         while impacts < 3 do

             Citizen.Wait(1)

 		local ped = PlayerPedId()	

              exports['progressBars']:startUI(2500, "Recolectando")

                 RequestAnimDict("amb@world_human_hammering@male@base") --melee@large_wpn@streamed_core

                 Citizen.Wait(100)

                 TaskPlayAnim((ped), 'amb@world_human_hammering@male@base', 'base', 8.0, 8.0, -1, 80, 0, 0, 0, 0)

                 TriggerServerEvent('InteractSound_SV:PlayOnSource', 'cortemadera', 4.0)

                 SetEntityHeading(ped, 270.0)

 

                 if impacts == 0 then

                     pickaxe = CreateObject(GetHashKey('prop_w_me_hatchet'), 0, 0, 0, true, true, true) 

                     AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.15, -0.02, -0.02, 350.0, 100.00, 280.0, true, true, false, true, 1, true)

                 end  

                 Citizen.Wait(2500)

                 ClearPedTasks(ped)

                 impacts = impacts+1

                 if impacts == 3 then

                     DetachEntity(pickaxe, 1, true)

                     DeleteEntity(pickaxe)

                     DeleteObject(pickaxe)

                     mineActive = false

                     impacts = 0

                     TriggerServerEvent("esxLRP:darmadera")

 					local allTrue = true

 				

 				for i=1, #locations, 1 do

 					if locations[i].tengo == false then

 						allTrue = false  

 					end

 				end

 

 				if allTrue then

 					TriggerEvent('esxLRP:gps', Config.Procesamiento, '~y~Ve a cortar la madera!!!')

 					cortar = true

 					blips = false

 				end

                     break

                 end        

         end

     end)

 end

 

 function Procesamientomadera()

     local ped = PlayerPedId()

 RequestAnimDict("mp_am_hold_up")

 --RequestAnimDict("amb@prop_human_bum_bin@idle_a")

     Citizen.Wait(100)

     FreezeEntityPosition(ped, true)

   --TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)

     TaskPlayAnim((ped), 'mp_am_hold_up', 'purchase_beerbox_shopkeeper', 8.0, 8.0, -1, 81, 0, 0, 0, 0)

          TriggerServerEvent('InteractSound_SV:PlayOnSource', 'procemadera', 4.0)

 

 

 

     

     TriggerEvent("esxLRP:Temporizadormadera")

     Citizen.Wait(15900)

     ClearPedTasks(ped)

     FreezeEntityPosition(ped, false)

     washingActive = false

 

 end

 

 function Refinadomadera()

     local ped = PlayerPedId()

   --RequestAnimDict("amb@prop_human_bum_bin@idle_a")

     Citizen.Wait(100)

     FreezeEntityPosition(ped, true)

 

 TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, false)

 

  --TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)

  TriggerEvent("esxLRP:Temporizadormadera")

 

 

 

     Citizen.Wait(15900)

     ClearPedTasks(ped)

     FreezeEntityPosition(ped, false)

     remeltingActive = false

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