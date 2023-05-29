--Copyright ZAUB1
--N'hesitez pas a rejoindre mon discord : https://discord.gg/yFuSEGj
--Et a me contacter directement pour tout bug ou suggestions

--ESX INIT--

ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)



local PlayerData                = {}
local nbPizza = 0
local moto

--CONFIGURATION--
local ropa = {x=-109.5,y=6396.51,z=30.56} --Ropa
local pizzeria = {x=-112.74,y=6396.86,z=31.23} --Configuration marker prise de service
local pizzeriafin = {x=-107.35,y=6398.62,z=30.48} --Configuration marker fin de service
local spawnfaggio2 = {x=-107.35,y=6398.62,z=30.95} --Configuration du point de spawn du faggio2

local livpt = { --Configuration des points de livraisons (repris ceux de Maykellll1 / NetOut)
[1] = {name = "Ve al Mercadito!",x = -381.96, y = 6034.7 , z = 30.5, price = 100}, --2970
[2] = {name = "Vete al Motel",x = -106.9, y = 6313.04 , z = 30.49, price = 100},
[3] = {name = "Vete a la financiera!",x = -270.46, y = 6183.95 , z = 30.4, price = 100},
[4] = {name = "Vete al Motel",x = -106.9, y = 6313.04 , z = 30.49, price = 100},
[5] = {name = "Vete al Mercado",x = -380.89, y = 6063.08 , z = 30.5, price = 100},
[6] = {name = "Vete al Cuartel de Bomberos",x = -382.88, y = 6121.32 , z = 30.48, price = 100},
[7] = {name = "Vete al Motel Habitacion Nºº10!",x = -99.57, y = 6342.93 , z = 30.49, price = 100},
[8] = {name = "Vete al SuperMercado",x = 161.93, y = 6631.71 , z = 30.86, price = 100},
[9] = {name = "Vete a la casa frente al cuartel!",x = -403.05, y = 6148.56 , z = 30.48, price = 100},
[10] = {name = "Vete a la casa de Carlitos!",x = 54.03, y = 6641.67 , z = 30.86, price = 100},
[11] = {name = "Vente a la casa de Miguel!",x =-440.63, y = 6198.31 , z = 28.55, price = 100},
[12] = {name = "Vete a la casa de Nanu!",x = 26.26, y = 6653.54 , z = 30.86, price = 100},
[13] = {name = "Vete a la casa de Luci!",x = -432.34, y = 6263.87 , z = 29.3, price = 100},
[14] = {name = "Vete a la casa de Ramon Riquelme",x = -4.58, y = 6616.67 , z = 30.86, price = 100},
[15] = {name = "Vete a la casa de Lucio Pezzuto!",x = -38.07, y = 6623.51 , z = 30.86, price = 100},
[16] = {name = "Vete a la casa del Rana!",x = -122.5, y = 6553.54 , z = 30.86, price = 100},
[17] = {name = "Vete a la casa de Totitopesca!",x = -107.49, y = 6536.75 , z = 28.81, price = 100},
[18] = {name = "Vete a la casa del Jeringa!",x = 105.67, y = 6610.84 , z = 31.32, price = 100},
[19] = {name = "Vete a la casa de Rinka!",x = -401.29, y = 6315.83 , z = 27.95, price = 100},
[20] = {name = "Vete a la casa de Fresco!",x = 35.82, y = 6606.65 , z = 31.32, price = 100},
[21] = {name = "Vete a la casa de Chancho!",x = -358.1, y = 6332.9 , z = 28.84, price = 100},
[22] = {name = "Vete a la casa de Diosito Borges",x = 7.63, y = 6525.99 , z = 31.32, price = 100},
[23] = {name = "Vete a la casa de KeiVanger!",x = -55.07, y = 6523.94 , z = 30.4, price = 100},
[24] = {name = "Vete a la casa de CharlyJr!",x = -292.99, y = 6338.04 , z = 31.4, price = 100},
[25] = {name = "Vete a la casa de Laucha!",x = -265.7, y = 6308.3 , z = 31.78, price = 100},
[26] = {name = "Vete a la casa de Maurito!",x = -269.09, y = 6356.07 , z = 31.49, price = 100},
[27] = {name = "Vete a la casa de Chiris!",x = -282.22, y = 6234.24 , z = 30.34, price = 100},
[28] = {name = "Vete a la casa de Marc Black",x = -295.88, y = 6209.74 , z = 30.34, price = 100},
[29] = {name = "Vete a la casa de Picha!",x = -283.7, y = 6197.55 , z = 30.34, price = 100},
[30] = {name = "Vete a la casa de Richard!",x = -270.49, y = 6397.16 , z = 29.94, price = 100},
[31] = {name = "Vete a la casa de Marcelo Tinelli",x = -251.12, y = 6371.06 , z = 30.48, price = 100},
[32] = {name = "Vete a la casa de Marcelo Polino",x = 413.35, y = 6540.39 , z = 26.9, price = 100},
[33] = {name = "Vete a la casa de Porcel",x = -224.51, y = 6386.7 , z = 30.57, price = 100},
[34] = {name = "Vete a la casa de Pico!",x = -250.46, y = 6408.42 , z = 30.16, price = 100},
[35] = {name = "Vete a la casa del Actor Porno!",x = -218.88, y = 6400.19 , z = 30.6, price = 100},
[36] = {name = "Vete a la casa del Toro!",x = -48.97, y = 6584.71 , z = 30.17, price = 100},
[37] = {name = "Vete a la casa de Cosme Fulanito",x = -145.97, y = 6436.3 , z = 30.44, price = 100},
[38] = {name = "Vete a la casa de Rinka!",x = -401.29, y = 6315.83 , z = 27.95, price = 100}
}

local blips = {
  {title="Pedidos YA", colour=1, id=267, x=-109.5,y=6396.51,z=30.56}, --Configuration du point sur la carte
}

local coefflouze = 0.5 --Coeficiente multiplicador que según la distancia define la paga

--INIT--

local isInJobPizz = false
local livr = 0
local plateab = "PIZZA"
local isToHouse = false
local isToPizzaria = false
local paie = 0

local pourboire = 0
local posibilidad = 0
local px = 0
local py = 0
local pz = 0
local onduty = false
local entrego = false

--THREADS--

Citizen.CreateThread(function() --Thread d'ajout du point de la pizzeria sur la carte

  for _, info in pairs(blips) do

    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.9)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end

end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

function OpenCloakroom()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'taxi_cloakroom', {
		title    = 'Ropa',
		align    = 'bottom-right',
		elements = {
			{label = 'Ropa Civil', value = 'wear_citizen'},
			{label = 'Ropa Trabajo',    value = 'wear_work'}
	}}, function(data, menu)
		if data.current.value == 'wear_citizen' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
			onduty = false
			ESX.UI.Menu.CloseAll()
		elseif data.current.value == 'wear_work' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)
			onduty = true
			ESX.UI.Menu.CloseAll()
			ESX.ShowNotification('~g~Ve adentro de la tienda a buscar el pedido!')
		end
	end, function(data, menu)
		menu.close()
	end)
end

Citizen.CreateThread(function() --Thread lancement + livraison depuis le marker vert
	while true do
	local playerPed = PlayerPedId()
    Citizen.Wait(0)
    if isInJobPizz == false then
		--PlayerData = ESX.GetPlayerData()
		if PlayerData.job ~= nil and PlayerData.job.name == 'pizzero' then
			
			DrawMarker(27,ropa.x,ropa.y,ropa.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)
			
			if #(GetEntityCoords(PlayerPedId(), false) - vector3(ropa.x, ropa.y, ropa.z)) < 1.5 then
			DisplayHelpText("Pulsa ~INPUT_CONTEXT~ para abrir guardarropas")
			
			if IsControlJustPressed(1,38) then
				OpenCloakroom()
			end
			
			end
			
			if onduty then
			DrawMarker(27,pizzeria.x,pizzeria.y,pizzeria.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)
		
			if #(GetEntityCoords(PlayerPedId(), false) - vector3(pizzeria.x, pizzeria.y, pizzeria.z)) < 1.5 then
			---1285.73, y = -1387.15, z = 3.44
			DisplayHelpText("Pulsa ~INPUT_CONTEXT~ para iniciar!")
			--HelpText("Pulsa ~INPUT_CONTEXT~ para iniciar el reparto",0,1,0.5,0.8,0.6,255,255,255,255)
			
			if IsControlJustPressed(1,38) then
				notif = true
				isInJobPizz = true
				isToHouse = true
				livr = math.random(1, 38)

				px = livpt[livr].x
				py = livpt[livr].y
				pz = livpt[livr].z
				distance = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
				paie = distance * coefflouze

				spawn_faggio2()
				goliv(livpt,livr)
				nbPizza = math.random(1, 2)

				TriggerServerEvent("pizza:itemadd", nbPizza)
			end
			
			end
			end
		end
	end
	
    if isToHouse == true then

		destinol = livpt[livr].name

		while notif == true do
			ESX.ShowNotification('~y~Proximo Destino: ~b~' ..destinol)
			notif = false

			i = 1
		end

		DrawMarker(1,livpt[livr].x,livpt[livr].y,livpt[livr].z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(px,py,pz, GetEntityCoords(GetPlayerPed(-1), false), true) < 3 then	  
			DisplayHelpText("Pulsa ~INPUT_CONTEXT~ Para entregar la pizza")
			--HelpText("Pulsa ~INPUT_CONTEXT~ Para entregar la pizza",0,1,0.5,0.8,0.6,255,255,255,255)

			if IsControlJustPressed(1,38) and not entrego then
				entrego = true
				if GetVehiclePedIsIn(playerPed, false) == moto then
					notif2 = true
					afaitunepizzamin = true

					TriggerServerEvent("pizza:itemrm")
					nbPizza = nbPizza - 1

					pourboire = livpt[livr].price * 7 --math.random(500, 1000)
					ESX.ShowNotification("Gracias por llegar a tiempo! \n~g~$" .. pourboire)
			
					TriggerServerEvent("pizza:pourboire", pourboire)
			
					RemoveBlip(liv)
					Wait(250)
					if nbPizza == 0 then
						isToHouse = false
						isToPizzaria = true
					else
						notif = true
						isToHouse = true
						isToPizzaria = false
						livr = math.random(1, 38)

						px = livpt[livr].x
						py = livpt[livr].y
						pz = livpt[livr].z

						distance = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
						paie = distance * coefflouze

						goliv(livpt,livr)
					end
					entrego = false
				else
					entrego = false
					ESX.ShowNotification('~r~No es la moto de trabajo!')
				end
			end
		end
    end
	
    if isToPizzaria == true then

      while notif2 == true do
        SetNewWaypoint(pizzeria.x,pizzeria.y)
		ESX.ShowNotification("Vuelve al Mojito!")
		--[[
        TriggerEvent("pNotify:SendNotification", {
          text = "Vete al telepizza !",
          type = "info",
          queue = "global",
          timeout = 4000,
          layout = "bottomRight"
        })
		]]
        notif2 = false

      end
      DrawMarker(1,pizzeria.x,pizzeria.y,pizzeria.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(pizzeria.x,pizzeria.y,pizzeria.z, GetEntityCoords(GetPlayerPed(-1), false), true) < 3 and afaitunepizzamin == true then
        --HelpText("Pulsa ~INPUT_CONTEXT~ Para recuperar la pizzas",0,1,0.5,0.8,0.6,255,255,255,255)
		DisplayHelpText("Pulsa ~INPUT_CONTEXT~ Para recuperar la pizzas")

        if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("faggio2"))  then

          if IsControlJustPressed(1,38) then

            if IsInVehicle() then

              afaitunepizzamin = false
			  ESX.ShowNotification('Gracias por el trabajo!')
			  --[[
              TriggerEvent("pNotify:SendNotification", {
                text = "Gracias por el trabajo!",
                type = "success",
                queue = "global",
                timeout = 4000,
                layout = "bottomRight"
              })
				]]
              --TriggerServerEvent("pizza:pourboire", paie)

              isInJobPizz = true
              isToHouse = true
              livr = math.random(1, 38)

              px = livpt[livr].x
              py = livpt[livr].y
              pz = livpt[livr].z

              distance = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
              paie = distance * coefflouze

              goliv(livpt,livr)
              nbPizza = math.random(1, 3)

              TriggerServerEvent("pizza:itemadd", nbPizza)

            else

              notifmoto1 = true

              while notifmoto1 == true do
				ESX.ShowNotification('Y la Moto?, ¿lo olvidaste?')
				--[[
                TriggerEvent("pNotify:SendNotification", {
                  text = "Y la bicicleta, ¿lo olvidaste?",
                  type = "error",
                  queue = "global",
                  timeout = 4000,
                  layout = "bottomRight"
                })
				]]
                notifmoto1 = false

              end
            end
          end
        else

          notifmoto2 = true

          while notifmoto2 == true do
			ESX.ShowNotification('¿Donde esta la moto?')
			--[[
            TriggerEvent("pNotify:SendNotification", {
              text = "¿Donde esta la moto?",
              type = "error",
              queue = "global",
              timeout = 4000,
              layout = "bottomRight"
            })
			]]
            notifmoto2 = false

          end
        end
      end
    end
    if IsEntityDead(GetPlayerPed(-1)) then

      isInJobPizz = false
      livr = 0
      isToHouse = false
      isToPizzaria = false

      paie = 0
      px = 0
      py = 0
      pz = 0
      RemoveBlip(liv)

    end
  end
end)



Citizen.CreateThread(function() -- Thread de "fin de service" depuis le point rouge
  while true do

    Citizen.Wait(0)
	--local coords = GetEntityCoords(GetPlayerPed(-1),true)
    if isInJobPizz == true then

      DrawMarker(1,pizzeriafin.x,pizzeriafin.y,pizzeriafin.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(pizzeriafin.x, pizzeriafin.y, pizzeriafin.z, GetEntityCoords(GetPlayerPed(-1),false), true) < 1.5 then
        --HelpText("Pulsa ~INPUT_CONTEXT~ para detener la entrega de ~r~pizza",0,1,0.5,0.8,0.6,255,255,255,255)
		DisplayHelpText("Pulsa ~INPUT_CONTEXT~ para detener la entrega de ~r~pizza")
        if IsControlJustPressed(1,38) then
          TriggerServerEvent('pizza:deleteAllPizz')
          isInJobPizz = false
          livr = 0
          isToHouse = false
          isToPizzaria = false

          paie = 0
          px = 0
          py = 0
          pz = 0

          if afaitunepizzamin == true then

            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

            SetEntityAsMissionEntity( vehicleu, true, true )
            deleteCar( vehicleu )
			ESX.ShowNotification('Gracias por el reparto de hoy, que tengas un buen dia!')
			--[[
            TriggerEvent("pNotify:SendNotification", {
              text = "Gracias por el reparto de hoy, que tengas un buen dia!",
              type = "success",
              queue = "global",
              timeout = 4000,
              layout = "bottomRight"
            })
			]]
            --TriggerServerEvent("pizza:paiefinale")
			--ESX.ShowNotification('~r~No hay mas Bonus GATO!')

            SetWaypointOff()

            afaitunepizzamin = false

          else

            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

            SetEntityAsMissionEntity( vehicleu, true, true )
            deleteCar( vehicleu )
			ESX.ShowNotification('Gordo no has repartido las pizzas te las has comido por el camino')
			--[[
            TriggerEvent("pNotify:SendNotification", {
              text = "Gordo no has repartido las pizzas te las has comido por el camino",
              type = "error",
              queue = "global",
              timeout = 4000,
              layout = "bottomRight"
            })
			]]
			--ESX.ShowNotification('~r~No hay mas Bonus GATO!')

          end
        end
      end
    end
  end
end)

--FONCTIONS--

function goliv(livpt,livr) -- Fonction d'ajout du point en fonction de la destination de livraison chosie
  liv = AddBlipForCoord(livpt[livr].x,livpt[livr].y, livpt[livr].z)
  SetBlipSprite(liv, 1)
  SetNewWaypoint(livpt[livr].x,livpt[livr].y)
end

function spawn_faggio2() -- Thread spawn faggio2

  Citizen.Wait(0)

  local myPed = GetPlayerPed(-1)
  local player = PlayerId()
  local vehicle = GetHashKey('faggio2')

  RequestModel(vehicle)

  while not HasModelLoaded(vehicle) do
    Wait(1)
  end

  local plateJob = math.random(1000, 9999)
  local spawned_car = CreateVehicle(vehicle, spawnfaggio2.x,spawnfaggio2.y,spawnfaggio2.z, 44.61, - 996.786, 25.1887, true, false)
	exports["LegacyFuel"]:SetFuel(spawned_car, 100)
  local plate = "TelePizza"..plateJob
	moto = spawned_car
  SetVehicleNumberPlateText(spawned_car, plate)
  SetVehicleOnGroundProperly(spawned_car)
  SetVehicleLivery(spawned_car, 2)
  SetPedIntoVehicle(myPed, spawned_car, - 1)
  SetModelAsNoLongerNeeded(vehicle)
  SetEntityAsMissionEntity(spawned_car,1,1)

  Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
end

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function deleteCar( entity )
  Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) ) --Native qui del le vehicule
end

function IsInVehicle() --Fonction de verification de la presence ou non en vehicule du joueur
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

function HelpText(text, state) --Fonction qui permet de creer les "Help Text" (Type "Pulsa ...")
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end
