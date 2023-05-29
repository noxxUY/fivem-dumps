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
  
  INPUT_CONTEXT = 51
  
  local isSentenced = false
  local communityServiceFinished = false
  local actionsRemaining = 0
  local availableActions = {}
  local disable_actions = false
  local PlayerLoaded = false
  
  local vassoumodel = "prop_tool_broom"
  local vassour_net = nil
  
  --local spatulamodel = "bkr_prop_coke_spatula_04"
  --[[local spatula_net = nil
  AddEventHandler('esx:onPlayerSpawn', function()
	  Citizen.Wait(10000)
	  TriggerServerEvent('esx_communityservice:checkIfSentenced')
  end)]]
  
  -- # EL CHEQUEO DE SI TIENE BARRIDAS SE PUSO AL DARLE JUGAR EN LA INTERFAZ.
  
  AddEventHandler('onClientResourceStart', function (resourceName)
	  if (GetCurrentResourceName() == resourceName) then
		  TriggerEvent('chat:addSuggestion', '/barridas', 'Enviar barridas a un jugador', {
			  { name="ID", help="ID del jugador" },
			  { name="Cantidad", help="Cantidad de acciones" },
			  { name="Razón", help="Razón de las barridas." }
		  })
		  TriggerEvent('chat:addSuggestion', '/barridasoffline', 'Enviar barridas a un jugador desconectado', {
			  { name="Licencia", help="Licencia del usuario." },
			  { name="Cantidad", help="Cantidad de acciones." },
			  { name="Razón", help="Razón de las barridas." }
		  })
		  TriggerEvent('chat:addSuggestion', '/finbarridas', 'Remueve las barridas de un jugador.', {
			  { name="ID", help="ID del jugador." },
			  { name="Razón", help="Razón de la finalización de barridas." },
		  })
	  end
  end)
  
  AddEventHandler('onClientResourceStop', function(resourceName)
	  if (GetCurrentResourceName() == resourceName) then
		  TriggerEvent('chat:removeSuggestion', '/barridas')
		  TriggerEvent('chat:removeSuggestion', '/barridasoffline')
		  TriggerEvent('chat:removeSuggestion', '/finbarridas')
	  end
  end)
  
  function FillActionTable(last_action)
  
	  while #availableActions < 5 do
  
		  local service_does_not_exist = true
  
		  local random_selection = Config.ServiceLocations[math.random(1,#Config.ServiceLocations)]
  
		  for i = 1, #availableActions do
			  if random_selection.coords.x == availableActions[i].coords.x and random_selection.coords.y == availableActions[i].coords.y and random_selection.coords.z == availableActions[i].coords.z then
  
				  service_does_not_exist = false
  
			  end
		  end
  
		  if last_action ~= nil and random_selection.coords.x == last_action.coords.x and random_selection.coords.y == last_action.coords.y and random_selection.coords.z == last_action.coords.z then
			  service_does_not_exist = false
		  end
  
		  if service_does_not_exist then
			  table.insert(availableActions, random_selection)
		  end
  
	  end
  
  end
  
  
  RegisterNetEvent('esx_communityservice:inCommunityService')
  AddEventHandler('esx_communityservice:inCommunityService', function(actions_remaining, motivo)
	  local playerPed = PlayerPedId()
	  local coords = GetEntityCoords(playerPed)
  
	  if isSentenced then
		  return
	  end
  
	  actionsRemaining = actions_remaining
  
	  motivo = motivo
  
	  FillActionTable()
	  -- print(":: Available Actions: " .. #availableActions)
  
  
  
	  ApplyPrisonerSkin()
	  ESX.Game.Teleport(playerPed, Config.ServiceLocation)
	  isSentenced = true
	  communityServiceFinished = false
  
	  while actionsRemaining > 0 and communityServiceFinished ~= true do
  
		  if IsPedInAnyVehicle(playerPed, false) then
			  ClearPedTasksImmediately(playerPed)
		  end
  
		  Citizen.Wait(20000)
		  coords = GetEntityCoords(playerPed)
		  local dx = coords.x - Config.ServiceLocation.x
		  local dy = coords.y - Config.ServiceLocation.y
		  local dz = coords.z - Config.ServiceLocation.z
		  local distancia = math.sqrt(dx*dx + dy*dy + dz*dz)
  
		  if distancia > 100 then
			  ESX.Game.Teleport(playerPed, Config.ServiceLocation)
			  TriggerEvent('chat:addMessage', { args = { _U('judge'), _U('escape_attempt') }, color = { 147, 196, 109 } })
			  TriggerServerEvent('esx_communityservice:extendService')
			  actionsRemaining = actionsRemaining + Config.ServiceExtensionOnEscape
		  end
  
	  end
  
	  TriggerServerEvent('esx_communityservice:finishCommunityService', -1)
	  -- exports['mythic_notify']:DoHudText('success', 'Has adquirido un '..vehicleData.name..' con la matrícula '..generatedPlate..'', { ['background-color'] = '#ffffff', ['color'] = '#000000', layout = 'centerRight'})
	  ESX.Game.Teleport(playerPed, Config.ReleaseLocation)
	  isSentenced = false
  
  
	  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		  TriggerEvent('skinchanger:loadSkin', skin)
		  TriggerServerEvent('esx:onPlayerSpawn')
		  TriggerEvent('esx:onPlayerSpawn')
	  end)
  end)
  
  
  RegisterNetEvent('esx_communityservice:finishCommunityService')
  AddEventHandler('esx_communityservice:finishCommunityService', function(source)
	  communityServiceFinished = true
	  isSentenced = false
	  actionsRemaining = 0
  end)
  
  
  Citizen.CreateThread(function(motivo)
	  while true do
		  :: start_over ::
  
		  sleep = 1000
  
		  if actionsRemaining > 0 and isSentenced then
			  sleep = 1
			  draw2dText( _U('remaining_msg', ESX.Math.Round(actionsRemaining)), { 0.4, 0.95 } )
			  --draw2dText( _U('condenado_por', motivo), { 0.39, 0.92 } )
			  DrawAvailableActions()
			  DisableViolentActions()
  
			  local pCoords    = GetEntityCoords(PlayerPedId())
  
			  for i = 1, #availableActions do
				  local distance = #(pCoords - availableActions[i].coords.xyz)
				  -- local distance = GetDistanceBetweenCoords(pCoords, availableActions[i].coords, true)
  
				  if distance < 1.5 then
					  DisplayHelpText(_U('press_to_start'))
  
  
					  if(IsControlJustReleased(1, 38))then
						  tmp_action = availableActions[i]
						  RemoveAction(tmp_action)
						  FillActionTable(tmp_action)
						  disable_actions = true
  
						  if (tmp_action.type == "cleaning") then
							  local cSCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
							  local vassouspawn = CreateObject(GetHashKey(vassoumodel), cSCoords.x, cSCoords.y, cSCoords.z, 1, 1, 1)
							  local netid = ObjToNet(vassouspawn)
  
  
							  lib.hideTextUI()
							  if lib.progressCircle({
								  duration = Config.ActionTime,
								  label = 'Barriendo la mugre',
								  useWhileDead = false,
								  allowRagdoll = false,
								  allowCuffed = false,
								  allowFalling = false,
								  canCancel = false,
								      disable = {
										move = true,
										combat = true,
									},
								  anim = { dict = 'amb@world_human_janitor@male@idle_a', clip = 'idle_a' },
								  prop = { model = `prop_tool_broom`, bone = 28422, pos = { x = -0.005, y = 0.0, z = 0.0 }, rot = { x = 360.0, y = 360.0, z = 0.0 } },
								  vassour_net = netid
							  }) then
								  disable_actions = false
								  DetachEntity(NetToObj(vassour_net), 1, 1)
								  DeleteEntity(NetToObj(vassour_net))
								  vassour_net = nil
								  ClearPedTasks(PlayerPedId())
  
								  
								  TriggerServerEvent('esx_communityservice:serviceCompleted')
								  actionsRemaining = actionsRemaining - 1
							  end
							  
  
						  end
  
						  goto start_over
					  end
				  end
			  end
		  end
		  Citizen.Wait(sleep)
	  end
  end)
  
  
  function RemoveAction(action)
  
	  local action_pos = -1
  
	  for i=1, #availableActions do
		  if action.coords.x == availableActions[i].coords.x and action.coords.y == availableActions[i].coords.y and action.coords.z == availableActions[i].coords.z then
			  action_pos = i
		  end
	  end
  
	  if action_pos ~= -1 then
		  table.remove(availableActions, action_pos)
	  else
		  print("User tried to remove an unavailable action")
	  end
  
  end
  
  
  function DisplayHelpText(str)
	  SetTextComponentFormat("STRING")
	  AddTextComponentString(str)
	  DisplayHelpTextFromStringLabel(0, 0, 1, -1)
  end
  
  
  function DrawAvailableActions()
  
	  for i = 1, #availableActions do
		  DrawMarker(21, availableActions[i].coords.x, availableActions[i].coords.y, availableActions[i].coords.z + 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 50, 50, 204, 100, false, true, 2, true, false, false, false)
	  end
  
	  --[[local indexNumber = math.random(1, #Config.ServiceLocations)
  
	  drawMarker = true
	  markerData = Config.ServiceLocations[indexNumber].coords.xyz
	  if Config.InteractionType == 'ox_target' then
		  local target = exports.ox_target:addSphereZone({
			  coords = Config.ServiceLocations[indexNumber].coords.xyz,
			  radius = 1,
			  options = {
				  {
					  name = 'sweep',
					  onSelect = targetInteract,
					  icon = 'fa-solid fa-location-crosshairs',
					  label = 'Barrer',
					  canInteract = function(entity, distance, coords, name)
						  return not lib.progressActive()
					  end
				  }
			  }
		  })
		  table.insert(targetList, target)
	  elseif Config.InteractionType == 'points' then
		  local point = lib.points.new(Config.ServiceLocations[indexNumber].coords.xyz, 2, {})
		  function point:onExit()
			  lib.hideTextUI()
		  end
  
		  function point:nearby()
			  lib.showTextUI('[E] - Barrer')
			  if IsControlJustReleased(0, 38) then
				  startSweep(point)
			  end
		  end
	  end
  
	  local modelHash = `v_ind_rc_rubbishppr` -- The ` return the jenkins hash of a string. see more at: https://cookbook.fivem.net/2019/06/23/lua-support-for-compile-time-jenkins-hashes/
  
	  if not HasModelLoaded(modelHash) then
		  -- If the model isnt loaded we request the loading of the model and wait that the model is loaded
		  RequestModel(modelHash)
  
		  while not HasModelLoaded(modelHash) do
			  Wait(1)
		  end
	  end
  
	  -- At this moment the model its loaded, so now we can create the object
	  obj = CreateObject(modelHash, Config.ServiceLocations[indexNumber].coords.xyz, true)]]
  
  end
  
  
  function DisableViolentActions()
  
	  local playerPed = PlayerPedId()
  
	  if disable_actions == true then
		  DisableAllControlActions(0)
	  end
  
	  RemoveAllPedWeapons(playerPed, true)
  
	  DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
	  DisablePlayerFiring(playerPed,true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
	  DisableControlAction(0, 106, true) -- Disable in-game mouse controls
	  DisableControlAction(0, 140, true)
	  DisableControlAction(0, 141, true)
	  DisableControlAction(0, 142, true)
  
	  if IsDisabledControlJustPressed(2, 37) then --if Tab is pressed, send error message
		  SetCurrentPedWeapon(playerPed,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
	  end
  
	  if IsDisabledControlJustPressed(0, 106) then --if LeftClick is pressed, send error message
		  SetCurrentPedWeapon(playerPed,GetHashKey("WEAPON_UNARMED"),true) -- If they click it will set them to unarmed
	  end
  
  end
  
  
  function ApplyPrisonerSkin()
  
	  local playerPed = PlayerPedId()
  
	  if DoesEntityExist(playerPed) then
  
		  Citizen.CreateThread(function()
  
			  TriggerEvent('skinchanger:getSkin', function(skin)
				  if skin.sex == 0 then
					  TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms['prison_wear'].male)
				  else
					  TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms['prison_wear'].female)
				  end
			  end)
  
		  SetPedArmour(playerPed, 0)
		  ClearPedBloodDamage(playerPed)
		  ResetPedVisibleDamage(playerPed)
		  ClearPedLastWeaponDamage(playerPed)
		  ResetPedMovementClipset(playerPed, 0)
  
		  end)
	  end
  end
  
  
  function draw2dText(text, pos)
	  SetTextFont(4)
	  SetTextProportional(1)
	  SetTextScale(0.45, 0.45)
	  SetTextColour(255, 255, 255, 255)
	  SetTextDropShadow(0, 0, 0, 0, 255)
	  SetTextEdge(1, 0, 0, 0, 255)
	  SetTextDropShadow()
	  SetTextOutline()
  
	  BeginTextCommandDisplayText('STRING')
	  AddTextComponentSubstringPlayerName(text)
	  EndTextCommandDisplayText(table.unpack(pos))
  end
  