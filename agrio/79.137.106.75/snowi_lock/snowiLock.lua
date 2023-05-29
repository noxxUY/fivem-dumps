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
  --================ begin variables
  local VehicleList = {}
  Config = {}
  --================ end variables
  --================ begin config
  Config.disableNPC = true
  local debugMode= true
  vehiclesInfoSnowi = {}
  matriculasPosesion = {}
  function SnowiGetMatr(matri)
	  for i,k in pairs(matriculasPosesion) do
		  if i == matri then
			  return true
		  end
	  end
  return false
  end
  --================ end config
  local dict = "anim@mp_player_intmenu@key_fob@"
  Citizen.CreateThread(function()
  
	  
	  RequestAnimDict(dict)
	  while not HasAnimDictLoaded(dict) do
		  Citizen.Wait(100)
	  end
  end)
  ESX = nil
  
  Citizen.CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  Citizen.Wait(1000)
	  end
  end)
  RegisterKeyMapping('abrirvehii', 'Abrir vehiculo con las llaves', 'keyboard', 'U' )
  RegisterCommand('abrirvehii', function() 
	  if not lock then
		  TaskPlayAnim(GetPlayerPed(-1), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
		  StopAnimTask = true
  
	  end
	  lock()
   end)
  function lock()
	  local player = GetPlayerPed(-1)
	  local vehicle = GetVehiclePedIsIn(player,true)
	  
	  local vehicleplate = GetVehicleNumberPlateText(vehicle)
	  local lastvehicle= GetVehiclePedIsIn (player, true)
	  local islocked = GetVehicleDoorLockStatus(vehicle)
	  
	  
	  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
	  local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
	  local clostestvehicle = GetClosestVehicle(x, y, z, 7.000, 0, 127)
	  local clostestvehicleplate = GetVehicleNumberPlateText(clostestvehicle)
	  local islockedclostestvehicle = GetVehicleDoorLockStatus(clostestvehicle)
	  local isvehiclefound = false
  
	  
	  local pos = GetEntityCoords(player)
	  local entityWorld = GetOffsetFromEntityInWorldCoords(player, 0.0, 20.0, 0.0)
	  local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 7, player, 0)
	  local a, b, c, d, vehicleHandle = GetRaycastResult(rayHandle)
	  local vehicleHandleplate = GetVehicleNumberPlateText(vehicleHandle)
	  local islockedHandle = GetVehicleDoorLockStatus(vehicleHandle)
	  
	  local foundclostestvehicle = false
	  local vehicleplateCallBack = vehiclePlate
	  if vehicleplateCallBack == nil then
		  vehicleplateCallBack =  GetVehicleNumberPlateText(lastvehicle)
		  if vehicleplateCallBack == nil then
			  vehicleplateCallBack =	vehicleHandleplate
		  end
	  end
	  local vehiclecallback = vehicle
	  if vehiclecallback == nil then
		  vehiclecallback = lastvehicle
		  if vehiclecallback == nil then
			  vehiclecallback = vehicleHandle
		  end
	  end
	  
	  if DoesEntityExist(vehicle) then
		  print('Existe vehiculo')
		  if IsPedInAnyVehicle(player) or IsPedInAnyHeli(player) then
			  if IsPedInAnyHeli(player) then
				  print(GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1))))
				  --local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
    --local matricula = GetVehicleNumberPlateText(vehicle)
	clostestvehicleplate = 			GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1)))  
end
			  if vehicleplate ~= nil and clostestvehicleplate ~= nil then
				  if not table.empty(VehicleList) then
					  for k,v in pairs(VehicleList) do
						  if v.plate == vehicleplate then
							  isvehiclefound = true
							  break
						  end
					  end
					  if isvehiclefound then
						  if (islocked == 1)then
							  
							  SetVehicleDoorsLocked(vehicle, 2)
							  Notify("El vehiculo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~ está ~r~CERRADO.~w~")
							  ExecuteCommand('me Cierra el vehiculo ('..vehicleplateCallBack..') con sus llaves')
							  --TriggerServerEvent("InteractSound_SV:PlafsdfsdyWithinDistance", 10, "alarm", 1.0)
							  local lock = false
								  
							  
						  else
							  SetVehicleDoorsLocked(vehicle,1)
							  Notify("El vehiculo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~ está ~g~ABIERTO.~w~")
							  ExecuteCommand('me Abre el vehiculo ('..vehicleplateCallBack..') con sus llaves')
							  --TriggerServerEvent("InteractSound_SV:PlafsdfsdyWithinDistance", 10, "alarm", 1.0)
							  
							  local lock = false
							  
						  end
					  else
						  if (islocked == 1)then
							  ESX.TriggerServerCallback('snowiLockVehicle', function(retorna)
								  print(retorna)
								  if retorna == 'siowner' or retorna == 'notieneowner' then
							  SetVehicleDoorsLocked(vehicle, 2)
							  Notify("Eres el dueño del vehiculo y cogiste las llaves de ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
							  ExecuteCommand('me Coge las llaves  del vehiculo ('..vehicleplateCallBack..')')
							  table.insert(VehicleList, {plate = vehicleplate})
								  elseif retorna == 'tienellaves' then
									  SetVehicleDoorsLocked(vehicle, 2)
							  Notify("No eres el dueño del vehiculo, pero tienes el dueño te dijo donde están las llaves y  las cogiste->~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
							  ExecuteCommand('me Coge las llaves  del vehiculo ('..vehicleplateCallBack..')')
							  table.insert(VehicleList, {plate = vehicleplate})
								  else
									  Notify("No encontraste las llaves, ya que las tiene el dueño del vehículo")
								  end
							  end, {matricula = vehicleplate, coche = vehiclecallback})
						  else
							  SetVehicleDoorsLocked(vehicle,1)
							  Notify("El vehiculo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~ está ~g~ABIERTO.~w~")
							  ExecuteCommand('me Abre el vehiculo ('..vehicleplateCallBack..') con sus llaves')
						  end
					  end
				  else
					  ESX.TriggerServerCallback('snowiLockVehicle', function(retorna)
						  print(retorna)
						  if retorna == 'siowner' or retorna == 'notieneowner' then
					  SetVehicleDoorsLocked(vehicle, 2)
					  Notify("Eres el dueño del vehiculo y cogiste las llaves de ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
					  ExecuteCommand('me Coge las llaves  del vehiculo ('..vehicleplateCallBack..')')
					  table.insert(VehicleList, {plate = vehicleplate})
				  elseif retorna == 'tienellaves' then
					  SetVehicleDoorsLocked(vehicle, 2)
			  Notify("No eres el dueño del vehiculo, pero tienes el dueño te dijo donde están las llaves y  las cogiste->~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
			  ExecuteCommand('me Coge las llaves  del vehiculo ('..vehicleplateCallBack..')')
			  table.insert(VehicleList, {plate = vehicleplate})
						  else
							  Notify("No encontraste las llaves, ya que las tiene el dueño del vehículo")
						  
				  end
			  end, {matricula = vehicleplate, coche = vehiclecallback})
				  end
			  else
				  Notify('Para cerrar el vehiculo, debe estar vacío , o solo tú dentro de él!')
				  if debugMode == true then
				  Notify("~r~No hay vehículos cerca de usted.! 1 vehicleplate:"..tostring(vehicleplate)..' clostestvehicleplate:'..tostring(clostestvehicleplate))
				  end
			  end
		  else --Si no esta dentro de vehiculo
			  if not table.empty(VehicleList) then --Si no esta vacia la tabla de vehiculos
				  if vehicleHandleplate ~= nil or clostestvehicleplate ~= nil then
					  for k,v in pairs(VehicleList) do
						  if v.plate == clostestvehicleplate then
							  isvehiclefound = true
							  foundclostestvehicle = true
							  break
						  end
					  end
					  if not foundclostestvehicle then
						  for k,v in pairs(VehicleList) do
							  if v.plate == vehicleHandleplate then
								  isvehiclefound = true
								  break
							  end
						  end
					  end
					  if isvehiclefound then
						  if not foundclostestvehicle then 
							  if (islockedHandle == 1)then
								  SetVehicleDoorsLocked(vehicleHandle, 2)
								  Notify("El vehiculo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicleHandle))) .. "~w~ está ~r~CERRADO.~w~")
								  ExecuteCommand('me Cierra el vehiculo ('..vehicleplateCallBack..') con sus llaves')
							  else
								  SetVehicleDoorsLocked(vehicleHandle,1)
								  Notify("El vehiculo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicleHandle))) .. "~w~ está ~g~ABIERTO.~w~")
								  ExecuteCommand('me Abre el vehiculo ('..vehicleplateCallBack..') con sus llaves')
							  end
						  else
							  if (islockedclostestvehicle == 1)then
								  SetVehicleDoorsLocked(clostestvehicle, 2)
								  Notify("El vehiculo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(clostestvehicle))) .. "~w~ está ~r~CERRADO.~w~")
								  ExecuteCommand('me Cierra el vehiculo ('..vehicleplateCallBack..') con sus llaves')
								  --TriggerServerEvent("InteractSound_SV:PlafsdfsdyWithinDistance", 10, "alarm", 1.0)
								  SetVehicleLights(vehicle, 2) Wait (400)
								  SetVehicleLights(vehicle, 0) Wait (400)
								  SetVehicleLights(vehicle, 2) Wait (400)
								  SetVehicleLights(vehicle, 0) Wait (50)
  --								StartVehicleHorn(vehicle, 100, 1, false)
								  foundclostestvehicle = false
							  else
								  SetVehicleDoorsLocked(clostestvehicle,1)
								  Notify("El vehiculo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(clostestvehicle))) .. "~w~ está ~g~ABIERTO.~w~")
								  ExecuteCommand('me Abre el vehiculo ('..vehicleplateCallBack..') con sus llaves')
								  --TriggerServerEvent("InteractSound_SV:PlafsdfsdyWithinDistance", 10, "alarm", 1.0)
								  SetVehicleLights(vehicle, 2) Wait (400)
								  SetVehicleLights(vehicle, 0) Wait (400)
								  SetVehicleLights(vehicle, 2) Wait (400)
								  SetVehicleLights(vehicle, 0) Wait (50)
  --								StartVehicleHorn(vehicle, 100, 1, false)
								  foundclostestvehicle = false
							  end
  
						  end
					  else
						  ESX.TriggerServerCallback('snowiLockVehicle', function(retorna)
							  print(retorna)
							  if retorna == 'siowner' or retorna == 'notieneowner' then
						  SetVehicleDoorsLocked(vehicle, 2)
						  Notify("Eres el dueño del vehiculo y cogiste las llaves de ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
						  ExecuteCommand('me Coge las llaves  del vehiculo ('..vehicleplateCallBack..')')
						  table.insert(VehicleList, {plate = vehicleplateCallBack})
					  elseif retorna == 'tienellaves' then
						  SetVehicleDoorsLocked(vehicle, 2)
				  Notify("No eres el dueño del vehiculo, pero tienes el dueño te dijo donde están las llaves y  las cogiste->~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
				  ExecuteCommand('me Coge las llaves  del vehiculo ('..vehicleplateCallBack..')')
				  table.insert(VehicleList, {plate = vehicleplateCallBack})
							  else
								  Notify("El vehículo que desea abrir no esta ~r~ disponible para usted~w~.")
						  Citizen.Wait(1000)
						  ExecuteCommand('me Intenta abrir el vehiculo ('..vehicleplateCallBack..')')
					  Citizen.Wait(1000)
					  ExecuteCommand('do No se abriría ya que no tendría las llaves')
							  
					  end
				  end, {matricula = vehicleplateCallBack, coche = vehiclecallback})
  
						  
					  end
				  else
					  Notify('Para cerrar el vehiculo, debe estar vacío , o solo tú dentro de él!')
					  if debugMode == true then
					  Notify("~r~No hay vehículos cerca de usted.! 2 vehicleHandleplate:"..tostring(vehicleHandleplate)..' clostestvehicleplate:'..tostring(clostestvehicleplate))
					  end
				  end
			  else
				  ESX.TriggerServerCallback('snowiLockVehicle', function(retorna)
					  print(retorna)
					  if retorna == 'siowner' or retorna == 'notieneowner' then
				  SetVehicleDoorsLocked(vehicle, 2)
				  Notify("Eres el dueño del vehiculo y cogiste las llaves de ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
				  ExecuteCommand('me Coge las llaves  del vehiculo ('..vehicleplateCallBack..')')
				  table.insert(VehicleList, {plate = vehicleplate})
			  elseif retorna == 'tienellaves' then
				  SetVehicleDoorsLocked(vehicle, 2)
		  Notify("No eres el dueño del vehiculo, pero tienes el dueño te dijo donde están las llaves y  las cogiste->~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
		  ExecuteCommand('me Coge las llaves  del vehiculo ('..vehicleplateCallBack..')')
		  table.insert(VehicleList, {plate = vehicleplate})
					  else
						  Notify("~r~Ningún vehículo para cerrar o el vehículo esta CERRADO.")
					  
			  end
		  end, {matricula = vehicleplate, coche = vehiclecallback})
				  
			  end
		  end
	  else
		  if DoesEntityExist(vehicleHandle) then
			  if vehicleHandleplate ~= nil then
				  for k,v in pairs(VehicleList) do
					  if v.plate == vehicleHandleplate then
						  isvehiclefound = true
						  break
					  end
				  end
				  if isvehiclefound then
					  if (islockedHandle == 1)then
						  SetVehicleDoorsLocked(vehicleHandle, 2)
						  Notify("El vehiculo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicleHandle))) .. "~w~ está ~r~CERRADO.~w~")
						  ExecuteCommand('me Cierra el vehiculo ('..vehicleplateCallBack..') con sus llaves')
					  else
						  SetVehicleDoorsLocked(vehicleHandle,1)
						  Notify("El vehiculo ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicleHandle))) .. "~w~ está ~g~ABIERTO.~w~")
						  ExecuteCommand('me Abre el vehiculo ('..vehicleplateCallBack..') con sus llaves')
					  end
				  else
					  Notify("El vehiculo que usted desea abrir esta ~r~CERRADO~w~.")
					  ExecuteCommand('me Intenta abrir el vehiculo ('..vehicleplateCallBack..')')
					  print('snowi U2222 ')
					  Citizen.Wait(1000)
					  ExecuteCommand('do No se abriría ya que no tendría las llaves')
				  end
			  end
		  else
			  Citizen.Wait(2000)
		  end
	  end
  end
  local templock= 2500
  Citizen.CreateThread(function()
	  while true do
		  local vehicleChec = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.0, 0, 70)
		  Wait(templock)
		  local ped = GetPlayerPed(-1)
		  --[[if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
			  local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
			  local lock = GetVehicleDoorLockStatus(veh)
			  if lock == 4 then
				  ClearPedTasks(ped)
			  end
		  else
			  templock = 1500
		  end--]]
		  local puerta = GetEntityBoneIndexByName(vehicleChec, 'door_dside_f')
		  if DoesEntityExist(vehicleChec) then
			  --print('existe vehiculo 2')
			  templock = 1000
			  if puerta ~= -1 then
			  --	print('Existe puerta')
				  local coords = GetWorldPositionOfEntityBone(vehicleChec, puerta)
				  if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords, true) <= 1.5 then
					  if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
						  templock = 1
						  local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
						  local lock = GetVehicleDoorLockStatus(veh)
							  if lock == 4 then
								  ClearPedTasks(ped)
							  end
					  else
						  templock = 100
					  end
				  else
					  templock = 250
				  end
			  else
				  templock = 500
			  end
		  else
			  --print('no esciste 2')
			  templock = 2500
		  end
	  end
  end)
  
  
  function table.empty (self)
	  for _, _ in pairs(self) do
		  return false
	  end
	  return true
  end
  
  function Notify(text)
	 -- SetNotificationTextEntry('STRING')
   --   AddTextComponentString(text)
	--  DrawNotification(false, true)
	TriggerEvent('esx:showNotification', text)
  end
  
  RegisterCommand('darllaves', function(source, args)
	  local id = args[1]
	  if id == nil then
		  Notify('No has puesto ningún ID')
		  return
	  end
	  local player = GetPlayerPed(-1)
	  local vehicle = GetVehiclePedIsIn(player,true)
	  
	  local vehicleplate = GetVehicleNumberPlateText(vehicle)
	  if vehicle == nil then
		  Notify('Debes estar dentro de tu vehículo!')
	  return
	  end
  if vehicleplate == nil then
	  Notify('No se puede encontrar la matricula de tu vehículo, asegurate que estás dentro de el!')
	  return
  end
	  local tableInfo = {coche=vehicle, matricula=vehicleplate}
	  ESX.TriggerServerCallback('snowiLockVehicle', function(retorna)
		  print(retorna)
		  if retorna == 'siowner' or retorna == 'tienellaves' then
	  Notify("Le has dado las llaves a: Desconocido-"..id.." -> ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
	  ExecuteCommand('me Le da las llaves de su vehiculo a desconocido-'..id)
	  ExecuteCommand('do Podría cogerlas?')
	  TriggerServerEvent('snowiDarLlavesVeh', tableInfo, id) 
		  else
			  TriggerServerEvent('snowiDarLlavesVeh', 'nosuyo', id) 
			  Notify("No puedes darle las llaves de un vehículo que no te pertenece a nadie!")
		  end
	  end, tableInfo)
	  
  
  end)
  RegisterNetEvent('recibirllaves', function(a,j, k)
	  if a == 'si' then
		  vehicleHandle = k
		  ExecuteCommand('do Sí, podría coger las llaves')
			  ExecuteCommand('me Coge las llaves del vehículo ('..j..')')
			  matriculasPosesion[j] = {}
			  table.insert(VehicleList, {plate = j})
		  else
  ExecuteCommand('do '..a)
  end
  end
  )
  
  
  RegisterCommand('quitarllaves', function(source, args)
	  local id = args[1]
	  if id == nil then
		  Notify('No has puesto ningún ID')
		  return
	  end
	  local player = GetPlayerPed(-1)
	  local vehicle = GetVehiclePedIsIn(player,true)
	  
	  local vehicleplate = GetVehicleNumberPlateText(vehicle)
	  if vehicle == nil then
		  Notify('Debes estar dentro de tu vehículo!')
	  return
	  end
  if vehicleplate == nil then
	  Notify('No se puede encontrar la matricula de tu vehículo, asegurate que estás dentro de el!')
	  return
  end
	  local tableInfo = {coche=vehicle, matricula=vehicleplate}
	  ESX.TriggerServerCallback('snowiLockVehicle', function(retorna)
		  print(retorna)
		  if retorna == 'siowner' or retorna == 'tienellaves' then
	  Notify("Le has quitado las llaves a: Desconocido-"..id.." -> ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
	  ExecuteCommand('me Le quita las llaves de su vehiculo a desconocido-'..id)
	  ExecuteCommand('do Podría?')
	  TriggerServerEvent('snowiRemoveLLaves', tableInfo, id) 
		  else
			  TriggerServerEvent('snowiRemoveLLaves', 'nosuyo', id) 
			  Notify("No puedes quitarle las llaves de un vehículo que no te pertenece!")
		  end
	  end, tableInfo)
	  
  
  end)
  
  RegisterNetEvent('quitollave', function(a,r)
	  if a == 'si' then
		  vehicleHandle = nil
		  ExecuteCommand('do Sí, podría quitarle las llaves ('..r..')')
			  
			  if matriculasPosesion[r] then
				  matriculasPosesion[r] = nil
			  end
			  for j,k in pairs(VehicleList) do
				  print(json.encode(k))
				  if k.plate == r then
					  k.plate = nil
					  print(json.encode(VehicleList))
					  print(tostring(VehicleList[k].plate))
					  VehicleList[k].plate = nil
					  print('To ->'..tostring(VehicleList[k].plate))
					  print(json.encode(VehicleList))
					  print('Retirado de handlers')
				  end
			  end
		  else
  ExecuteCommand('do '..a)
  end
  end
  )