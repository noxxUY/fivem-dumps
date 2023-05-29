
ESX = nil
local BypassSnowi = false
local esmicoche = nil
local hecho = false
local oferta = nil
local modelosbanned = {
	'500gtrlam',
	'610lb',
	'675lt',
	'911turbos',
	'911ublu', 
	'amggt',
	'amv19',
	'apollos',
	'aventadors',
	'bati',
	'bdivo',
	'bertone',
	'brabus700',
	'bug09',
	'bugatti',
	'c63',
	'c7',
	'cadicts',
	'f360',
	'furaiub',
	'gallardo',
	'gclas9',
	'italia458',
	'lykan',
	'marr',
	'mc12',
	'p1gtr',
	'r8v10',
	'raptor2017',
	'regera',
	'rmodm4',
	'rmodm4gts',
	'ROADSTER 20',
	'caliburn',
	'urus',
	'rmodx6',
	'FENYR', --TWITC
	'sf90', --BOOST
	'2013LP560', --TWITCH
	'P1',
	'rmodmustang',
	'terzo',
	'JESKO2020',
	'fordh',
	'AVJ',
	'DIVO 2019',
	'CHIRON17',
	'BBENTAYGA',
	'contgt13','Trackhawk','09tahoe','amdbx','GT2RS','A8FSI','BERLINETTA','TEMPESTAX','AMGGT','pista','toysupmk4','DemonHawk','razor','g63mg','GTR','Rs5','r820','A3','gronos6x6',
	'corvettec5z','MSX','370Z','ursa','q820','RTRUCK','HURACAN','s1000','SIAN ROADST','918SPYDER','MUSTANG','bmwm8','m4','DUNE','Raptor','KEYRUS','PandeMrapto','720stc',
	'GTR ROAD LE','MF1','bolide','BUGVR','RANCHERX','sc18','tuatara','DEVESTE','AgeraR','LAFERRARI17','S63C','nissantitan','rmodlp770','rmodrs7','rmodsian','rmodx6',
	'X6M','RS72020','hevo','M2','CAN','rs6','R6','BMW I8','gsxr','rmodmi8lb','gle21','MQGTS','675lt','SkylineGTR','z4alchemist','beetle74','G65','CHALLENGER',
	'h2carb', --moto
	'rmodm4',
	'urus2018'
}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(599)
  end
end)

function notificacion(texto)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(texto)
    DrawNotification(false, true)
end


AddEventHandler('playerSpawned',function()
end)


RegisterNetEvent('vender:compruebocoche') --El que lo vende
AddEventHandler('vender:compruebocoche',function(id,precio)

	local coords1 = GetEntityCoords(GetPlayerPed(PlayerId()))

	local coords2 = GetEntityCoords(GetPlayerPed(GetPlayerServerId(id)))

	--	if GetDistanceBetweenCoords(coords1,coords2) < 1.5 then
			if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 	
				ESX.TriggerServerCallback("snowiByCar", function(puede)
		
					if puede == true then 
						BypassSnowi = true
					else
						BypassSnowi=false
					end
					hecho = true
				end)
				while not hecho do
				Citizen.Wait(1500)
				end
				local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				local matr =  GetVehicleNumberPlateText(vehicle)
				local isbanned = false
				print(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
				for i = 1, #modelosbanned,1 do
					--Citizen.Trace(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
					--Citizen.Trace(modelosbanned[i])
					if GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)) == modelosbanned[i] then 
						isbanned = true
						break
					end
				end
				if isbanned == true and BypassSnowi ==false then
					TriggerServerEvent('snowiSyncLogs','intentovenderdo', 'LOGS INTENTO VENDER COCHE DONADOR', '\nName: '..GetPlayerName(PlayerId())..'\nVehículo: '..GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))..'\nMatricula: '..matr..'\nID Comprador: '..id..'\nName Comprador:'..GetPlayerName(GetPlayerFromServerId(id))..'\nPrecio: '..precio)
					TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "No tienes permiso para vender coches DONADOR. Hemos enviado un aviso al STAFF de esta acción!.")
					isbanned = false
				else

					TriggerServerEvent('vender:esmicoche',matr,id,precio,vehicle,GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))	
				end
			else
				TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Debes estar subido al coche que quieres vender")
			end
	--	else
	--		notificacion("Demasiado lejos del jugador")
	--	end
end)

RegisterNetEvent('vender:esmicochecallback')
AddEventHandler('vender:esmicochecallback',function(var,id,precio,matr,car,name)

	if var == true then
		TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Esperando a la respuesta del comprador...")
		TriggerServerEvent('vender:vendococheser',id,precio,matr,car,name)
	else
		TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Este coche no es tuyo")

	end

end)

RegisterNetEvent('vender:vendocoche') --El que recibe la oferta
AddEventHandler('vender:vendocoche',function(price,jugador,matr,vehicle,name)
	TriggerEvent('chatMessage',"Vendedor", {255, 0, 0},"La ID("..jugador..") te quiere vender su ^2 "..name.."^0 por ^2 "..price.." $")
	TriggerEvent('chatMessage',"Vendedor", {255, 0, 0},"^2 TECLA 1 ^0 para ACEPTAR o ^2 TECLA 2 ^0 para rechazar la oferta")
	oferta = true
	Citizen.CreateThread(function()
		while oferta do
				if IsControlJustPressed(1, 157) then -- 1 = YES
					TriggerServerEvent('vender:handleroferta',true,jugador,matr,price,name)
					oferta = false
				end
				if IsControlJustPressed(1, 158) then -- 2 = NO
					TriggerServerEvent('vender:handleroferta',false,jugador,matr,price,name)
					oferta = false
				end
			Citizen.Wait(0)
		end
	end)


end)


