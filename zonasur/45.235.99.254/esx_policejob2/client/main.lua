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

local armas_blacklist = {
	'WEAPON_SPECIALCARBINE',
	'WEAPON_CARBINE',
	'WEAPON_CARBINERIFLE',
}

local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastStation             = nil
local LastPart                = nil
local LastPartNum             = nil
local LastEntity              = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local IsHandcuffed            = false
local HandcuffTimer           = {}
local DragStatus              = {}
DragStatus.IsDragged          = false
DragStatus.draganim = false
local hasAlreadyJoined        = false
local blipsCops               = {}
local isDead                  = false
local CurrentTask             = {}
local playerInService         = true
local freeSeat = nil
local nivel = 0
local firstSpawn = true
local EnServicio = false
local hud = false
local PoliciasDispo = 0
local patente = nil
local hudNivel = true

ESX                           = nil


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

RegisterNetEvent('esx_police2job:alerta')
AddEventHandler('esx_police2job:alerta', function(niv)
	nivel = niv
end)

RegisterNetEvent('esx_police2job:dispo')
AddEventHandler('esx_police2job:dispo', function(Cantidad)
	PoliciasDispo = Cantidad
end)

RegisterNetEvent('esx_police2job:Servicio')
AddEventHandler('esx_police2job:Servicio', function(bool)
	EnServicio = bool
end)

function GetNivel()
	return nivel
end

RegisterNetEvent('esx_police2job:hud')
AddEventHandler('esx_police2job:hud', function(bool)
	hudNivel = bool
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if hudNivel then
			if nivel == 1 then
				drawTxt('NIVEL DE ALERTA 1',2, 1, 0.500, 0.000, 0.50, 0, 255, 0,255)
			elseif nivel == 2 then
				drawTxt('NIVEL DE ALERTA 2',2, 1, 0.500, 0.000, 0.50, 255, 255, 0,255)
			elseif 	nivel == 3 then
				drawTxt('NIVEL DE ALERTA 3',2, 1, 0.500, 0.000, 0.50, 255, 0, 0,255)
			end
		end
		
		if hud then
			if EnServicio then
				drawTxt('DISPONIBLE: '..PoliciasDispo,2, 1, 0.940, 0.925, 0.50, 0, 255, 0,255)
				if IsPedDeadOrDying(PlayerPedId(), true) then
					TriggerServerEvent('esx_police2job:nodispo')
				end
			else
				drawTxt('NO DISPONIBLE',2, 1, 0.940, 0.925, 0.50, 255, 0, 0,255)
			end
		end	
	end
end)


function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

function SetVehicleMaxMods(vehicle)
	local props = {
		modEngine       = 2,
		modBrakes       = 2,
		modTransmission = 2,
		modSuspension   = 3,
		modTurbo        = true
	}
	ESX.Game.SetVehicleProperties(vehicle, props)
end

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(job, playerPed, station)
	--ESX.ShowNotification(station)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.PoliceStations[station].Uniforms[job].male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.PoliceStations[station].Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet' then
				SetPedArmour(playerPed, 75)
			end
		else
			if Config.PoliceStations[station].Uniforms[job].female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.PoliceStations[station].Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet' then
				SetPedArmour(playerPed, 75)
			end
		end
	end)
end

RegisterCommand('pfa', function()
	PlayerData = ESX.GetPlayerData()
	local playerPed = PlayerPedId()
	local grade = PlayerData.job.grade_name
	if PlayerData.job.name == "police2" then
		setUniform(grade, playerPed, 'Paleto')
	end
end, false)


function OpenCloakroomMenu(station)
	--ESX.ShowNotification(station)
	local playerPed = PlayerPedId()
	local grade = PlayerData.job.grade_name
	local elements = {}
	if station == 'Sandy' then
		table.insert(elements, {label = _U('citizen_wear'), value = 'citizen_wear'})
		table.insert(elements, {label = _U('bullet_wear'), value = 'bullet'})
	else
		table.insert(elements, {label = _U('citizen_wear'), value = 'citizen_wear'})
		table.insert(elements, {label = _U('bullet_wear'), value = 'bullet'})
		table.insert(elements, {label = _U('gilet_wear'), value = 'gilet'})
		table.insert(elements, {label = 'Ropa SWAT', value = 'swat'})
	end
	
	if station == 'Sandy' then
		if grade == 'recruit' then
			table.insert(elements, {label = 'Ropa Gendarmeria', value = 'recruit'})
		elseif grade == 'officer' then
			table.insert(elements, {label = 'Ropa Gendarmeria', value = 'officer'})
		elseif grade == 'sergeant' then
			table.insert(elements, {label = 'Ropa Gendarmeria', value = 'sergeant'})
		elseif grade == 'lieutenant' then
			table.insert(elements, {label = 'Ropa Gendarmeria', value = 'lieutenant'})
		elseif grade == 'inspect' then
			table.insert(elements, {label = 'Ropa Gendarmeria', value = 'inspect'})
		elseif grade == 'subcomi' then
			table.insert(elements, {label = 'Ropa Gendarmeria', value = 'subcomi'})
		elseif grade == 'comi' then
			table.insert(elements, {label = 'Ropa Gendarmeria', value = 'comi'})	
		elseif grade == 'boss' then
			table.insert(elements, {label = 'Ropa Gendarmeria', value = 'boss'})
		end
	else
		if grade == 'recruit' then
			table.insert(elements, {label = _U('police2_wear'), value = 'recruit'})
		elseif grade == 'officer' then
			table.insert(elements, {label = _U('police2_wear'), value = 'officer'})
		elseif grade == 'sergeant' then
			table.insert(elements, {label = _U('police2_wear'), value = 'sergeant'})
		elseif grade == 'lieutenant' then
			table.insert(elements, {label = _U('police2_wear'), value = 'lieutenant'})
		elseif grade == 'inspect' then
			table.insert(elements, {label = _U('police2_wear'), value = 'inspect'})
		elseif grade == 'subcomi' then
			table.insert(elements, {label = _U('police2_wear'), value = 'subcomi'})
		elseif grade == 'comi' then
			table.insert(elements, {label = _U('police2_wear'), value = 'comi'})	
		elseif grade == 'boss' then
			table.insert(elements, {label = _U('police2_wear'), value = 'boss'})
		end
	end	

	if Config.EnableNonFreemodePeds then
		--table.insert(elements, {label = 'Sheriff wear', value = 'freemode_ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'})
		--table.insert(elements, {label = 'police2 wear', value = 'freemode_ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'})
		table.insert(elements, {label = 'Swat', value = 'freemode_ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = _U('cloakroom'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			
			if Config.EnableNonFreemodePeds then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0

					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if Config.MaxInService ~= -1 then

				ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
					if isInService then

						playerInService = false
						exports["rp-radio"]:RemovePlayerAccessToFrequencies(1,2,3,4,5,6,7,8,9,10,11,12)
						local notification = {
							title    = _U('service_anonunce'),
							subject  = '',
							msg      = _U('service_out_announce', GetPlayerName(PlayerId())),
							iconType = 1
						}

						TriggerServerEvent('esx_service:notifyAllInService', notification, 'police2')

						TriggerServerEvent('esx_service:disableService', 'police2')
						--TriggerEvent('esx_police2job:updateBlip')
						ESX.ShowNotification(_U('service_out'))
					end
				end, 'police2')
			end

		end

		if Config.MaxInService ~= -1 and data.current.value ~= 'citizen_wear' then
			local serviceOk = 'waiting'

			ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
				if not isInService then

					ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
						if not canTakeService then
							ESX.ShowNotification(_U('service_max', inServiceCount, maxInService))
						else

							serviceOk = true
							playerInService = true
							exports["rp-radio"]:GivePlayerAccessToFrequencies(1,2,3,4,5,6,7,8,9,10,11,12)
							local notification = {
								title    = _U('service_anonunce'),
								subject  = '',
								msg      = _U('service_in_announce', GetPlayerName(PlayerId())),
								iconType = 1
							}
	
							TriggerServerEvent('esx_service:notifyAllInService', notification, 'police2')
							--TriggerEvent('esx_police2job:updateBlip')
							ESX.ShowNotification(_U('service_in'))
						end
					end, 'police2')

				else
					serviceOk = true
				end
			end, 'police2')

			while type(serviceOk) == 'string' do
				Citizen.Wait(5)
			end

			-- if we couldn't enter service don't let the player get changed
			if not serviceOk then
				return
			end
		end		
		
		if
			data.current.value == 'recruit' or
			data.current.value == 'officer' or
			data.current.value == 'sergeant' or
			data.current.value == 'lieutenant' or
			data.current.value == 'inspect' or
			data.current.value == 'subcomi' or
			data.current.value == 'comi' or
			data.current.value == 'boss' or
			data.current.value == 'bullet' or
			data.current.value == 'police2' or
			data.current.value == 'gilet'
		then
			setUniform(data.current.value, playerPed, station)
		elseif data.current.value == 'swat' then
			setUniform(data.current.value, playerPed, station)			
		end

		if data.current.value == 'freemode_ped' then
			local modelHash = ''

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					modelHash = GetHashKey(data.current.maleModel)
				else
					modelHash = GetHashKey(data.current.femaleModel)
				end

				ESX.Streaming.RequestModel(modelHash, function()
					SetPlayerModel(PlayerId(), modelHash)
					SetModelAsNoLongerNeeded(modelHash)

					TriggerEvent('esx:restoreLoadout')
				end)
			end)

		end



	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)
end

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end    
end

function OpenArmoryMenu(station)

	if Config.EnableArmoryManagement then

		local elements = {
			{label = _U('get_weapon'),     value = 'get_weapon'},
			{label = _U('put_weapon'),     value = 'put_weapon'},
			{label = _U('remove_object'),  value = 'get_stock'},
			{label = _U('deposit_object'), value = 'put_stock'}
		}

		if PlayerData.job.grade_name == 'boss' then
			table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})
		end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = _U('armory'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'get_weapon' then
				OpenGetWeaponMenu()
			elseif data.current.value == 'put_weapon' then
				OpenPutWeaponMenu()
			elseif data.current.value == 'buy_weapons' then
				OpenBuyWeaponsMenu(station)
			elseif data.current.value == 'put_stock' then
				OpenPutStocksMenu()
			elseif data.current.value == 'get_stock' then
				OpenGetStocksMenu()
			end

		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_armory'
			CurrentActionMsg  = _U('open_armory')
			CurrentActionData = {station = station}
		end)

	else

		local elements2 = {}
		local elements = {}
		table.insert(elements, {label = 'Pedir Armas', value = 'open_weapons'})
		table.insert(elements, {label = 'Guardar Armas', value = 'drop_weapons'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
		table.insert(elements, {label = _U('deposit_object'), value = 'put_stock'})
		
		local grade = PlayerData.job.grade_name
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = _U('armory'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'drop_weapons' then
				DropWeaponMenu()
			elseif data.current.value == 'put_stock' then
				OpenPutStocksMenu()
			elseif data.current.value == 'get_stock' then
				OpenGetStocksMenu()	
			elseif data.current.value == 'open_weapons' then
				for i=1, #Config.PoliceStations[station].AuthorizedWeapons[grade], 1 do
					local weapon = Config.PoliceStations[station].AuthorizedWeapons[grade][i]
					local label2 = ''
					if weapon.name == 'binoculars' then
						label2 = 'Binoculares'
					elseif weapon.name == 'flashlight' then
						label2 = 'Linterna de Arma'
					elseif weapon.name == 'silenciador' then
						label2 = 'Silenciador'
					else
						label2 = ESX.GetWeaponLabel(weapon.name)
					end
					table.insert(elements2, {label = label2, value = weapon.name})
				end
				
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory2',
				{
					title    = _U('armory'),
					align    = 'bottom-right',
					elements = elements2
					
				}, function(data2, menu2)
					local weapon = data2.current.value
					ESX.TriggerServerCallback('1974_drogas:check', function(serial)
						if serial then
							TriggerServerEvent('esx_police2job:giveWeapon', weapon, 250, serial)
						end
					end)
				end,
				function(data2, menu2)
					menu2.close()
				end)	
				
			end
			
		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_armory'
			CurrentActionMsg  = _U('open_armory')
			CurrentActionData = {station = station}
		end)

	end

end

function DropWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon',
	{
		title    = 'Guardar Arma',
		align    = 'bottom-right',
		elements = elements
		
	}, function(data, menu)

		menu.close()
		
		TriggerServerEvent('esx_police2job:removeWeapon', data.current.value)

	end, function(data, menu)
		menu.close()
	end)
end

function OpenVehicleSpawnerMenu(station, partNum)

	ESX.UI.Menu.CloseAll()

	if Config.EnableSocietyOwnedVehicles then

		local elements = {}

		ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(garageVehicles)

			for i=1, #garageVehicles, 1 do
				table.insert(elements, {
					label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. ' [' .. garageVehicles[i].plate .. ']',
					value = garageVehicles[i]
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
			{
				title    = _U('vehicle_menu'),
				align    = 'bottom-right',
				elements = elements
			}, function(data, menu)
				menu.close()

				local vehicleProps = data.current.value
				local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(station, partNum)

				if foundSpawnPoint then
					ESX.Game.SpawnVehicle(vehicleProps.model, spawnPoint, spawnPoint.heading, function(vehicle)
						--TriggerEvent('persistent-vehicles/register-vehicle', vehicle)
						ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
						TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
						exports["LegacyFuel"]:SetFuel(vehicle, 100)
						SetVehicleDirtLevel(vehicle, 0)
						SetVehicleLivery(vehicle, 1)
						ESX.Game.SetVehicleProperties(vehicle, { plate = 'POLICIA'})
						exports["esx_carlock"]:SetCamion(vehicle)
					end)

					TriggerServerEvent('esx_society:removeVehicleFromGarage', 'police2', vehicleProps)
				end
			end, function(data, menu)
				menu.close()

				CurrentAction     = 'menu_vehicle_spawner'
				CurrentActionMsg  = _U('vehicle_spawner')
				CurrentActionData = {station = station, partNum = partNum}
			end)

		end, 'police2')

	else

		local elements = {}

		local sharedVehicles = Config.PoliceStations[station].AuthorizedVehicles.Shared
		for i=1, #sharedVehicles, 1 do
			table.insert(elements, { label = sharedVehicles[i].label, model = sharedVehicles[i].model})
		end
		
		local job_grade = PlayerData.job.grade_name
		
		local authorizedVehicles = Config.PoliceStations[station].AuthorizedVehicles[job_grade]
		
		for i=1, #authorizedVehicles, 1 do
			table.insert(elements, { label = authorizedVehicles[i].label, model = authorizedVehicles[i].model})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title    = _U('vehicle_menu'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(station, partNum)

			if foundSpawnPoint then
				if Config.MaxInService == -1 then
					
					ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
						TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
						SetVehicleMaxMods(vehicle)
						exports["LegacyFuel"]:SetFuel(vehicle, 100)
						SetVehicleDirtLevel(vehicle, 0)
						SetVehicleLivery(vehicle, 1)
						ESX.Game.SetVehicleProperties(vehicle, { plate = 'POLICIA'})
						exports["esx_carlock"]:SetCamion(vehicle)
					end)
					
				else
					ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
						
						if isInService then	
							ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
								TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
								SetVehicleMaxMods(vehicle)
								exports["LegacyFuel"]:SetFuel(vehicle, 100)
								SetVehicleExtra(vehicle, 10, 0)
								SetVehicleExtra(vehicle, 1, 1)
								SetVehicleExtra(vehicle, 2, 1)
								SetVehicleDirtLevel(vehicle, 0)
								SetVehicleLivery(vehicle, 1)
								ESX.Game.SetVehicleProperties(vehicle, { plate = 'POLICIA'})
								exports["esx_carlock"]:SetCamion(vehicle)
							end)	
						else
							ESX.ShowNotification(_U('service_not'))
						end

					end, 'police2')
				end
			end

		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_vehicle_spawner'
			CurrentActionMsg  = _U('vehicle_spawner')
			CurrentActionData = {station = station, partNum = partNum}
		end)

	end
end

function OpenHelicopterSpawnerMenu(station, partNum)

	ESX.UI.Menu.CloseAll()

	local elements = {}

		local Helicopteros = Config.AuthorizedHelicoptero
		for i=1, #Helicopteros, 1 do
			table.insert(elements, { label = Helicopteros[i].label, model = Helicopteros[i].model})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title    = _U('vehicle_menu'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			local foundSpawnPoint, spawnPoint = GetAvailableHelicopterSpawnPoint(station, partNum)

			if foundSpawnPoint then
				if Config.MaxInService == -1 then
					if not IsAnyVehicleNearPoint(spawnPoint.x, spawnPoint.y, spawnPoint.z,  3.0) then
						ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
							SetVehicleModKit(vehicle, 0)
							SetVehicleLivery(vehicle, 5)
							TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
							SetVehicleDirtLevel(vehicle, 0)
							exports["LegacyFuel"]:SetFuel(vehicle, 100)
							ESX.Game.SetVehicleProperties(vehicle, { plate = 'POLICIA'})
							exports["esx_carlock"]:SetCamion(vehicle)
						end)
					end
				else
					ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
						if isInService then
							if not IsAnyVehicleNearPoint(spawnPoint.x, spawnPoint.y, spawnPoint.z,  3.0) then
								ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
									SetVehicleModKit(vehicle, 0)
									SetVehicleLivery(vehicle, 5)
									TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
									SetVehicleExtra(vehicle, 10, 0)
									SetVehicleDirtLevel(vehicle, 0)
									exports["LegacyFuel"]:SetFuel(vehicle, 100)
									ESX.Game.SetVehicleProperties(vehicle, { plate = 'POLICIA'})
									exports["esx_carlock"]:SetCamion(vehicle)
								end)
							end
						else
							ESX.ShowNotification(_U('service_not'))
						end
					end, 'police2')
				end
			end

		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_helicopter_spawner'
			CurrentActionMsg  = 'Presionar ~INPUT_CONTEXT~ para sacar el HELICOPTERO'
			CurrentActionData = {station = station, partNum = partNum}
		end)
		
end

function GetAvailableVehicleSpawnPoint(station, partNum)
	local spawnPoints = Config.PoliceStations[station].Vehicles[partNum].SpawnPoints
	local found, foundSpawnPoint = false, nil

	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i], spawnPoints[i].radius) then
			found, foundSpawnPoint = true, spawnPoints[i]
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		ESX.ShowNotification(_U('vehicle_blocked'))
		return false
	end
end

function GetAvailableHelicopterSpawnPoint(station, partNum)
	local spawnPoints = Config.PoliceStations[station].Helicopters[partNum].SpawnPoint
	local found, foundSpawnPoint = false, nil

	if ESX.Game.IsSpawnPointClear(spawnPoints, spawnPoints.radius) then
		found, foundSpawnPoint = true, spawnPoints
	end

	if found then
		return true, foundSpawnPoint
	else
		ESX.ShowNotification(_U('vehicle_blocked'))
		return false
	end
end

RegisterNetEvent('esx_police2job:refuerzo')
AddEventHandler('esx_police2job:refuerzo', function(coords)
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	local blips = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipSprite(blips, 161)
	SetBlipScale(blips, 1.5)
	SetBlipColour(blips, 3)
	PulseBlip(blips)
	Wait(10000)
	RemoveBlip(blips)
end)

function Openpolice2ActionsMenu()
	ESX.UI.Menu.CloseAll()
	
	local elements = {}
	
	table.insert(elements, {label = _U('citizen_interaction'), value = 'citizen_interaction'})
	table.insert(elements, {label = _U('vehicle_interaction'), value = 'vehicle_interaction'})
	table.insert(elements, {label = _U('object_spawner'), value = 'object_spawner'})
	table.insert(elements, {label = "📡 Pedir refuerzo 📡", value = 'refuerzo'})
	
	--[[
	if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'comi' then
		table.insert(elements, {label = "DAR CARNET HELICOPTERO", value = 'dar_carnet'})
	end
	]]--
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police2_actions',
	{
		title    = 'Policia',
		align    = 'bottom-right',
		elements = elements

	}, function(data, menu)
		if data.current.value == 'dar_carnet' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if closestPlayer ~= -1 and closestDistance <= 3.0 then
				local elements = {}
					elements = {
						{label = "SI" ,value = "yes"},
						{label = "NO" ,value = "no"}
					}
				ESX.UI.Menu.CloseAll()
				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'principalAdministratorGroup',
				{
					title  = 'Entregarle Permiso a '..GetPlayerName(closestPlayer),
					align    = 'bottom-right',
					elements = elements
				},
				function(data, menu)
					if data.current.value == "yes" then
						TriggerServerEvent('esx_license:addLicensePolice', GetPlayerServerId(closestPlayer), 'drive_heli')
						menu.close()
					elseif data.current.value == "no" then
						menu.close()
					end
				end,
				function(data, menu)
					menu.close()
				end
				)
			else
				ESX.ShowNotification("NINGUN POLICIA CERCA!")
			end	
		elseif data.current.value == 'citizen_interaction' then
			local elements = {
				{label = _U('id_card'),			value = 'identity_card'},
				{label = _U('search'),			value = 'body_search'},
				{label = '🔐 Esposar 🔐', value = 'hardcuff'},
				{label = '🔑 Desesposar 🔑', value = 'uncuff'},
				{label = 'Tckle',		value = 'tackle'},
				{label = _U('drag'),			value = 'drag'},
				{label = _U('put_in_vehicle'),	value = 'put_in_vehicle'},
				{label = _U('out_the_vehicle'),	value = 'out_the_vehicle'},
				{label = _U('fine'),			value = 'fine'},
				{label = _U('jail2'),			value = 'jail2'},
				{label = _U('jail'),			value = 'jail'},
				{label = 'Servicio Comunitario',	value = 'communityservice'},
				{label = _U('unpaid_bills'),	value = 'unpaid_bills'}
				--{label = _U('unpaid_bills'),	value = 'unpaid_bills2'}
			}
		
			if Config.EnableLicenses then
				table.insert(elements, { label = _U('license_check'), value = 'license' })
			end
		
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'citizen_interaction',
			{
				title    = _U('citizen_interaction'),
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value

					if action == 'identity_card' then
						menu.close()
						Cerrar()
						SacarDni(closestPlayer)
						--OpenIdentityCardMenu(closestPlayer)
					elseif action == 'body_search' then
						TriggerServerEvent('esx_police2job:message', GetPlayerServerId(closestPlayer), _U('being_searched'))
						OpenBodySearchMenu(closestPlayer)
					elseif data2.current.value == 'hardcuff' then
						--local target, distance = ESX.Game.GetClosestPlayer()
						if not IsEntityDead(GetPlayerPed(closestPlayer)) then	
							playerheading = GetEntityHeading(GetPlayerPed(-1))
							playerlocation = GetEntityForwardVector(PlayerPedId())
							playerCoords = GetEntityCoords(GetPlayerPed(-1))
							local target_id = GetPlayerServerId(closestPlayer)
							TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'cuff', 1.0)
							TriggerServerEvent('esx_policejob:requesthard', target_id, playerheading, playerCoords, playerlocation)
						else
							ESX.ShowNotification('La persona esta inconsciente!')
						end
					elseif data2.current.value == 'uncuff' then
						local target, distance = ESX.Game.GetClosestPlayer()
						playerheading = GetEntityHeading(GetPlayerPed(-1))
						playerlocation = GetEntityForwardVector(PlayerPedId())
						playerCoords = GetEntityCoords(GetPlayerPed(-1))
						local target_id = GetPlayerServerId(target)
						TriggerServerEvent('esx_policejob:requestrelease', target_id, playerheading, playerCoords, playerlocation)
						Citizen.Wait(1200)
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'uncuff', 0.5)
					elseif action == 'tackle' then
						TriggerServerEvent('esx_kekke_tackle:tryTackle', GetPlayerServerId(closestPlayer))
					elseif action == 'drag' then
						if not IsEntityDead(GetPlayerPed(closestPlayer)) then
							TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
							Citizen.Wait(800)
							if DragStatus.draganim then
								StopAnimTask(GetPlayerPed(-1), 'switch@trevor@escorted_out', '001215_02_trvs_12_escorted_out_idle_guard2', 1.0)
								DragStatus.draganim = false
							else
								LoadAnimDict('switch@trevor@escorted_out')
								TaskPlayAnim(GetPlayerPed(-1), 'switch@trevor@escorted_out', '001215_02_trvs_12_escorted_out_idle_guard2', 8.0, 1.0, -1, 49, 0, 0, 0, 0)
								DragStatus.draganim = true
							end
						else
							ESX.ShowNotification('La persona esta inconsciente!')
						end
					elseif action == 'put_in_vehicle' then
						TriggerServerEvent('esx_policejob:putInVehicle_zs', GetPlayerServerId(closestPlayer))
					elseif action == 'out_the_vehicle' then
						TriggerServerEvent('esx_policejob:OutVehicle_zs', GetPlayerServerId(closestPlayer))
					elseif action == 'fine' then
						OpenFineMenu(closestPlayer)
					elseif action == 'jail' then
						JailPlayer(GetPlayerServerId(closestPlayer))
					elseif action == 'jail2' then
						JailPlayer2(GetPlayerServerId(closestPlayer))
					elseif action == 'communityservice' then
						SendToCommunityService(GetPlayerServerId(closestPlayer))
					elseif action == 'license' then
						ShowPlayerLicense(closestPlayer)
					elseif action == 'unpaid_bills' then
						OpenUnpaidBillsMenu(closestPlayer)
					elseif action == 'unpaid_bills2' then
						CrearCamion()
					end

				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'car_spawn' then
			SpawnCar()
		elseif data.current.value == 'vehicle_interaction' then
			local elements  = {}
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			local vehicle   = ESX.Game.GetVehicleInDirection()
			
			if DoesEntityExist(vehicle) then
				table.insert(elements, {label = _U('vehicle_info'),	value = 'vehicle_infos'})
				table.insert(elements, {label = _U('pick_lock'),	value = 'hijack_vehicle'})
				table.insert(elements, {label = _U('impound'),		value = 'impound'})
			end
			
			table.insert(elements, {label = _U('search_database'), value = 'search_database'})

			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'vehicle_interaction',
			{
				title    = _U('vehicle_interaction'),
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				coords  = GetEntityCoords(playerPed)
				vehicle = ESX.Game.GetVehicleInDirection()
				action  = data2.current.value
				
				if action == 'search_database' then
					LookupVehicle()
				elseif DoesEntityExist(vehicle) then
					local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
					if action == 'vehicle_infos' then
						OpenVehicleInfosMenu(vehicleData)
						
					elseif action == 'hijack_vehicle' then
						if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
							TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
							Citizen.Wait(20000)
							ClearPedTasksImmediately(playerPed)

							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ESX.ShowNotification(_U('vehicle_unlocked'))
						end
					elseif action == 'impound' then
						local playerPed = PlayerPedId()

						if IsPedSittingInAnyVehicle(playerPed) then
							local vehicle = GetVehiclePedIsIn(playerPed, false)

							if GetPedInVehicleSeat(vehicle, -1) == playerPed then
								ESX.ShowNotification('Vehiculo Confiscado!')
								--TriggerEvent('persistent-vehicles/forget-vehicle', vehicle)
								ESX.Game.DeleteVehicle(vehicle)
							else
								ESX.ShowNotification('debe sentarse conductor')
							end
						else
							local vehicle = ESX.Game.GetVehicleInDirection()

							if DoesEntityExist(vehicle) then
								ESX.ShowNotification('Vehiculo Confiscado!')
								--TriggerEvent('persistent-vehicles/forget-vehicle', vehicle)
								ESX.Game.DeleteVehicle(vehicle)
							else
								ESX.ShowNotification('debe acercarse')
							end
						end
					end	
				end		

			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'refuerzo' then
			TriggerServerEvent('esx_police2job:refuerzo', GetEntityCoords(GetPlayerPed(PlayerId()), true))
		elseif data.current.value == 'object_spawner' then
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'citizen_interaction',
			{
				title    = _U('traffic_interaction'),
				align    = 'bottom-right',
				elements = {
					{label = _U('cone'),		value = 'prop_mp_cone_01'},
					{label = _U('barrier'),		value = 'prop_barrier_work05'},
					{label = _U('spikestrips'),	value = 'p_ld_stinger_s'},
					{label = _U('box'),			value = 'prop_boxpile_07d'},
					{label = _U('cash'),		value = 'hei_prop_cash_crate_half_full'}
				}
			}, function(data2, menu2)
				local model     = data2.current.value
				local playerPed = PlayerPedId()
				local coords    = GetEntityCoords(playerPed)
				local forward   = GetEntityForwardVector(playerPed)
				local x, y, z   = table.unpack(coords + forward * 1.0)
				
				ESX.Game.SpawnObject(model, {
					x = x,
					y = y,
					z = z
				}, function(obj)
					SetEntityHeading(obj, GetEntityHeading(playerPed))
					PlaceObjectOnGroundProperly(obj)
				end)

			end, function(data2, menu2)
				menu2.close()
			end)
		end

	end, function(data, menu)
		menu.close()
	end)
end

function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Wait(10)
	end
end

function SacarDni(player)
	local ped = PlayerPedId()
	local animacion = 'missbigscore2aig_7@driver'
	LoadAnim(animacion)
	ExecuteCommand('me le busca el dni por todo el cuerpo')
	TaskPlayAnim(ped, animacion, 'boot_r_loop', 1.0, 1.0, 4000, 1, 0, false, false, false)
	Wait(3000)
	ExecuteCommand('do encontraria el dni')
	--ClearPedTasksImmediately(ped)
	Wait(2000)
	ExecuteCommand('me toma el dni y lo observa')
	Wait(2000)
	Ver(player)
end

local dniopen = false
local badgeProp = nil

function Ver(player)
	local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    badgeProp = CreateObject(GetHashKey('prop_cs_swipe_card'), coords.x, coords.y, coords.z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(ped, 36029)
        
    AttachEntityToEntity(badgeProp, ped, boneIndex, 0.08, 0.04, 0.05, -130.0, -50.0, 0.0, true, true, false, true, 1, true)
	
	local ad = "missfam4"
	LoadAnim(ad)
	
    TaskPlayAnim(ped,ad,'base',2.0,2.0, -1, 51, 0, false, false, false)
	
	TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
	dniopen = true
	DniAbierto()
end

function DniAbierto()
	while dniopen do
	Wait(5)
		if IsControlJustPressed(0, 202) then
			Cerrar()
		end
	end
end

function Cerrar()
	local ped = PlayerPedId()
	ClearPedSecondaryTask(ped)
    DeleteObject(badgeProp)
	dniopen = false
end

RegisterNetEvent('esx_police2job:hardcuff')
AddEventHandler('esx_police2job:hardcuff', function()
	local playerPed = PlayerPedId()
	Citizen.CreateThread(function()
		if IsShackles then
			if Config.EnableHandcuffTimer then
				if HandcuffTimer.active then
					ESX.ClearTimeout(HandcuffTimer.task)
				end
				StartHandcuffTimer()
			end
		else
			if Config.EnableHandcuffTimer and HandcuffTimer.active then
				ESX.ClearTimeout(HandcuffTimer.task)
			end
		end
	end)
end)

RegisterNetEvent('esx_police2job:doarrested')
AddEventHandler('esx_police2job:doarrested', function()
	Citizen.Wait(250)
	LoadAnimDict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)

end) 

RegisterNetEvent('esx_police2job:getarrestedhard')
AddEventHandler('esx_police2job:getarrestedhard', function(playerheading, playercoords, playerlocation)
	playerPed = GetPlayerPed(-1)
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	LoadAnimDict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Citizen.Wait(3760)
	IsHandcuffed = true
	IsShackles = true
	--FreezeEntityPosition(playerPed, true)
	TriggerEvent('esx_police2job:hardcuff')
	LoadAnimDict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
	FreezeEntityPosition(playerPed, true)
end)

RegisterNetEvent('esx_police2job:douncuffing')
AddEventHandler('esx_police2job:douncuffing', function()
	Citizen.Wait(250)
	LoadAnimDict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('esx_police2job:getuncuffed')
AddEventHandler('esx_police2job:getuncuffed', function(playerheading, playercoords, playerlocation)
	FreezeEntityPosition(playerPed, false)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	LoadAnimDict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	IsHandcuffed = false
	IsShackles = false
	--FreezeEntityPosition(playerPed, false)
	TriggerEvent('esx_police2job:handcuff')
	ClearPedTasks(GetPlayerPed(-1))
	--exports["faint_script"]:Preso(false)
	TriggerEvent('faint_script:preso', false)
	TriggerEvent('CarryPeople:broyale', false)
	TriggerEvent('TakeHostage:broyale', false)
	--exports["CarryPeople"]:Preso(false)
	--exports["TakeHostage"]:Preso(false)
end)

RegisterNetEvent('esx_police2job:handcuff')
AddEventHandler('esx_police2job:handcuff', function()
	local playerPed = PlayerPedId()
	Citizen.CreateThread(function()
		if IsHandcuffed then
			if Config.EnableHandcuffTimer then
				if HandcuffTimer.active then
					ESX.ClearTimeout(HandcuffTimer.task)
				end
				StartHandcuffTimer()
			end
		else
			if Config.EnableHandcuffTimer and HandcuffTimer.active then
				ESX.ClearTimeout(HandcuffTimer.task)
			end
		end
	end)
end)


function OpenIdentityCardMenu(player)

	ESX.TriggerServerCallback('esx_police2job:getOtherPlayerData', function(data)

		local elements    = {}
		local nameLabel   = _U('name', data.name)
		local jobLabel    = nil
		local sexLabel    = nil
		local dobLabel    = nil
		local heightLabel = nil
		local idLabel     = nil
	
		if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
			jobLabel = _U('job', data.job.label .. ' - ' .. data.job.grade_label)
		else
			jobLabel = _U('job', data.job.label)
		end
	
		if Config.EnableESXIdentity then
	
			nameLabel = _U('name', data.firstname .. ' ' .. data.lastname)
	
			if data.sex ~= nil then
				if string.lower(data.sex) == 'm' then
					sexLabel = _U('sex', _U('male'))
				else
					sexLabel = _U('sex', _U('female'))
				end
			else
				sexLabel = _U('sex', _U('unknown'))
			end
	
			if data.dob ~= nil then
				dobLabel = _U('dob', data.dob)
			else
				dobLabel = _U('dob', _U('unknown'))
			end
	
			if data.height ~= nil then
				heightLabel = _U('height', data.height)
			else
				heightLabel = _U('height', _U('unknown'))
			end
	
			if data.name ~= nil then
				idLabel = _U('id', data.name)
			else
				idLabel = _U('id', _U('unknown'))
			end
	
		end
	
		local elements = {
			{label = nameLabel, value = nil},
			{label = jobLabel,  value = nil},
		}
	
		if Config.EnableESXIdentity then
			table.insert(elements, {label = sexLabel, value = nil})
			table.insert(elements, {label = dobLabel, value = nil})
			table.insert(elements, {label = heightLabel, value = nil})
			table.insert(elements, {label = idLabel, value = nil})
		end
	
		if data.drunk ~= nil then
			table.insert(elements, {label = _U('bac', data.drunk), value = nil})
		end
	
		if data.licenses ~= nil then
	
			table.insert(elements, {label = _U('license_label'), value = nil})
	
			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label, value = nil})
			end
	
		end
	
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction',
		{
			title    = _U('citizen_interaction'),
			align    = 'bottom-right',
			elements = elements,
		}, function(data, menu)
	
		end, function(data, menu)
			menu.close()
		end)
	
	end, GetPlayerServerId(player))

end

function OpenBodySearchMenu(player)

	ESX.TriggerServerCallback('esx_police2job:getOtherPlayerData', function(data)

		local elements = {}

		for i=1, #data.accounts, 1 do

			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then

				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Round(data.accounts[i].money)),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end

		end

		table.insert(elements, {label = _U('guns_label'), value = nil})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label'), value = nil})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end


		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search',
		{
			title    = _U('search'),
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)

			local itemType = data.current.itemType
			local itemName = data.current.value
			local amount   = data.current.amount

			if data.current.value ~= nil then
				TriggerServerEvent('esx_police2job:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
				OpenBodySearchMenu(player)
			end

		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))

end

function OpenFineMenu(player)

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine',
	{
		title    = _U('fine'),
		align    = 'bottom-right',
		elements = {
			{label = _U('traffic_offense'), value = 0},
			{label = _U('minor_offense'),   value = 1},
			{label = _U('average_offense'), value = 2}
			--{label = _U('major_offense'),   value = 3}
		}
	}, function(data, menu)
		OpenFineCategoryMenu(player, data.current.value)
	end, function(data, menu)
		menu.close()
	end)

end

function OpenFineCategoryMenu(player, category)

	ESX.TriggerServerCallback('esx_police2job:getFineList', function(fines)

		local elements = {}

		for i=1, #fines, 1 do
			table.insert(elements, {
				label     = fines[i].label .. ' <span style="color: green;">$' .. fines[i].amount .. '</span>',
				value     = fines[i].id,
				amount    = fines[i].amount,
				fineLabel = fines[i].label
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine_category',
		{
			title    = _U('fine'),
			align    = 'bottom-right',
			elements = elements,
		}, function(data, menu)

			local label  = data.current.fineLabel
			local amount = data.current.amount

			menu.close()

			if Config.EnablePlayerManagement then
				TriggerServerEvent('esx_billing:sendBill_zs', GetPlayerServerId(player), 'society_police2', _U('fine_total', label), amount)
			else
				TriggerServerEvent('esx_billing:sendBill_zs', GetPlayerServerId(player), '', _U('fine_total', label), amount)
			end

			ESX.SetTimeout(300, function()
				OpenFineCategoryMenu(player, category)
			end)

		end, function(data, menu)
			menu.close()
		end)

	end, category)

end

function LookupVehicle()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_vehicle',
	{
		title = _U('search_database_title'),
	}, function(data, menu)
		local length = string.len(data.value)
		if data.value == nil or length < 2 or length > 13 then
			ESX.ShowNotification(_U('search_database_error_invalid'))
		else
			ESX.TriggerServerCallback('esx_police2job:getVehicleFromPlate', function(owner, found)
				if found then
					ESX.ShowNotification(_U('search_database_found', owner))
				else
					ESX.ShowNotification(_U('search_database_error_not_found'))
				end
			end, data.value)
			menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end

function ShowPlayerLicense(player)
	local elements = {}
	local targetName
	ESX.TriggerServerCallback('esx_police2job:getOtherPlayerData', function(data)
		if data.licenses ~= nil then
			for i=1, #data.licenses, 1 do
				if data.licenses[i].label ~= nil and data.licenses[i].type ~= nil then
					table.insert(elements, {label = data.licenses[i].label, value = data.licenses[i].type})
				end
			end
		end
		
		if Config.EnableESXIdentity then
			targetName = data.firstname .. ' ' .. data.lastname
		else
			targetName = data.name
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license',
		{
			title    = _U('license_revoke'),
			align    = 'bottom-right',
			elements = elements,
		}, function(data, menu)
			if data.current.value ~= 'gym' then
				ESX.ShowNotification(_U('licence_you_revoked', data.current.label, targetName))
				TriggerServerEvent('esx_police2job:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))
				TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.value)
			
				ESX.SetTimeout(300, function()
					ShowPlayerLicense(player)
				end)
			else	
				ESX.ShowNotification('~r~No puedes confiscar el carnet de gymnasio!')
			end
		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))
end

function OpenUnpaidBillsMenu(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_billing:getTargetBills', function(bills)
		for i=1, #bills, 1 do
			table.insert(elements, {label = bills[i].label .. ' - <span style="color: red;">$' .. bills[i].amount .. '</span>', value = bills[i].id})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing',
		{
			title    = _U('unpaid_bills'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
	
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenVehicleInfosMenu(vehicleData)

	ESX.TriggerServerCallback('esx_police2job:getVehicleInfos', function(retrivedInfo)

		local elements = {}

		table.insert(elements, {label = _U('plate', retrivedInfo.plate), value = nil})

		if retrivedInfo.owner == nil then
			table.insert(elements, {label = _U('owner_unknown'), value = nil})
		else
			table.insert(elements, {label = _U('owner', retrivedInfo.owner), value = nil})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos',
		{
			title    = _U('vehicle_info'),
			align    = 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)

	end, vehicleData.plate)

end

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('esx_police2job:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon',
		{
			title    = _U('get_weapon_menu'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)

			menu.close()

			ESX.TriggerServerCallback('esx_police2job:removeArmoryWeapon', function()
				OpenGetWeaponMenu()
			end, data.current.value)

		end, function(data, menu)
			menu.close()
		end)
	end)

end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon',
	{
		title    = _U('put_weapon_menu'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		menu.close()

		ESX.TriggerServerCallback('esx_police2job:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value, true)

	end, function(data, menu)
		menu.close()
	end)
end

function OpenBuyWeaponsMenu(station)

	ESX.TriggerServerCallback('esx_police2job:getArmoryWeapons', function(weapons)

		local elements = {}

		for i=1, #Config.PoliceStations[station].AuthorizedWeapons, 1 do
			local weapon = Config.PoliceStations[station].AuthorizedWeapons[i]
			local count  = 0

			for i=1, #weapons, 1 do
				if weapons[i].name == weapon.name then
					count = weapons[i].count
					break
				end
			end

			table.insert(elements, {
				label = 'x' .. count .. ' ' .. ESX.GetWeaponLabel(weapon.name) .. ' $' .. weapon.price,
				value = weapon.name,
				price = weapon.price
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons',
		{
			title    = _U('buy_weapon_menu'),
			align    = 'bottom-right',
			elements = elements,
		}, function(data, menu)

			ESX.TriggerServerCallback('esx_police2job:buy', function(hasEnoughMoney)
				if hasEnoughMoney then
					ESX.TriggerServerCallback('esx_police2job:addArmoryWeapon', function()
						OpenBuyWeaponsMenu(station)
					end, data.current.value, false)
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end, data.current.price)

		end, function(data, menu)
			menu.close()
		end)

	end)

end

function OpenGetStocksMenu()
	if PlayerData.job.grade_name == 'boss' then
	ESX.TriggerServerCallback('esx_police2job:getStockItems', function(inventory)


		local elements = {}
		
		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dinero Sucio: <span style="color:red;">$ '..ESX.Math.GroupDigits(inventory.blackMoney)..'</span> ';
				type = 'item_account',
				value = 'black_money'
			})
		end
		
		if inventory.Money > 0 then
			table.insert(elements, {
				label = 'Dinero: <span style="color:green;">$ '..ESX.Math.GroupDigits(inventory.Money)..'</span> ';
				type = 'item_money',
				value = 'money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name)..' ['..weapon.ammo..']',
				type  = 'item_weapon',
				value = weapon.name,
				index = i
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = _U('police2_stock'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.type == 'item_weapon' then
				menu.close()

				TriggerServerEvent('esx_police2job:getStockItem', data.current.type, data.current.value, data.current.index)
				ESX.SetTimeout(300, function()
					OpenGetStocksMenu()
				end)
			else

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_police2job:getStockItem', data.current.type, data.current.value, count)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		end
		end, function(data, menu)
			menu.close()
		end)

	end)
	else
		ESX.ShowNotification('~r~SOLO EL JEFE PUEDE RETIRAR')
	end
end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_police2job:getPlayerInventory', function(inventory)

		local elements = {}
		
		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dinero Sucio: <span style="color:red;">$ '..ESX.Math.GroupDigits(inventory.blackMoney)..'</span> ';
				type  = 'item_account',
				value = 'black_money'
			})
		end
		
		if inventory.Money > 0 then
			table.insert(elements, {
				label = 'Dinero: <span style="color:green;">$ '..ESX.Math.GroupDigits(inventory.Money)..'</span> ';
				type  = 'item_money',
				value = 'money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = weapon.label .. ' [' .. weapon.ammo .. ']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = _U('inventory'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
		
			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('esx_police2job:putStockItems', data.current.type, data.current.value, data.current.ammo)
				ESX.SetTimeout(300, function()
					OpenPutStocksMenu()
				end)
			else
			
			local itemName = data.current.value
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_police2job:putStockItems', data.current.type, itemName, count)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		end
		end, function(data, menu)
			menu.close()
		end)
	end)

end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_police2'),
		number     = 'police2',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTVGcd/u3cfSXaTLEk2j80TCI8ECI9ABCyoiBqhBVQqVG2ppVKBQqUVgUl5OU7HKqNOHUHU0oHamZZWoGkVS6cWAR2JPJuAQBPy2ISEvLN57+v2u2E33e4k6Ngz85+9d++95/zP9/h/39GpqsqiRYsIGz8QZAq28/8PRfC+4HT4fMXFxeiH+GC54NeCbYLLATLpYe/ECx4VnBTsF0wWhM6lXY8VbBE0Ch4IzLcpfDFD2P1TgrdC7nMCZLRxQ9AkiAkQCn77DcH3BC2COoFRkCSIG2JzLwqiQi0RSmCD4JXbmNKh0+kc/X19tLtc9Ll9sk9ZS1yoU71YIk3xsbEx8QaDEc2ttxmaJSKC1ggSKBK8MKwTFQVXRzs3WzpJGjmZgvxcMpMtWIwqsjztvSrlzjYul56jp+46qSmJmMwR+P3+4aZ8TtCprRkk0DvUW7JjmV6lsqoKW/pU1q9YQOE4Nxkx4ladE7zd8ivuVmJQfXZKW5dx5EwPRw4fxNx2g5SUVLw+33AkzoRaQDP9SkFu6OKqz0uF8yaz7vsOL6ycQVLkcSg/BlWNsjuFoKE1knqDSl5aNnmPLmThrE0UvXqQqvJPyMrMGorEHwQfEha57/3P7mXS684GFjy8kreLppPUuBXfyd/ibeoS2kb0mWPANhJdYjb61AxUvx5PdT3+4y+Tb3mTd19ZSebE+VTXVGNQlHAC7w4VhH8TbA36vKq6ilnzlvPSunHw6Trc7XpZ14AyfgYeyz18crGN1Alz6e3qwNNQSv4dZox1h/BW9+O7eIaEsVv41Y4XeHJDG83Nl4mLTwzGhJYtx0PzNTjOB9KMTlc7Nkcem39YAGU7cbeBKVLMPGMVf296nMd2VbBq1wmizHoqqm/wrS1/Zf0+N19YN2PIu1fcIda4Vk66Zx/rVi+jo9eIX9wZGGcFXUMR6BHUa76/2ezioYcXMtpyAl91DSaTfDxlJbtLprHm2ecpObqPuTPzSNV9yKz4a4zJSuLo71/j8Q17ON69EmXiPIlNMe6FoyzOqWPW/MU03Lw5EFcyKghTrNDh7+/vw545mcJcWbTiGKpRdGPMXbx90sGmDaux6sXk+kimjU+BjnMkx3kYP34cXrFuZ+3nrHi6iDMt92JITcPjk3R3naRwZhpuNSqoD93DKaFVU7j2dhcF8+YzNlpErbIBTVh8toVccbaysPB+4pMcuPw25kwSsau7BIlmHpy3guaOPtISYyi/UkaJM5Lpc5agq5Xkcl6gIHkmqaMn0dtylcjIyPThCNyhaXyfR2W0I1our0v6qBii07ih5rDtGSOxNVdk1y4R2SR8jR/g7hQD9l1jUeY/WLJB5m39AlZN4GZyIQ1fFJNsEgt0duBIc5GRkcZF53mNwIzhXPDgQPoZIkiMkbTxtstDMVnmFA4cOsbz2/aKjSQjev4Mp9ZAg+hIpFhB3EH5Yal16+X+Kq3dGfxkzRY+KauBjBzREvGN0kNCTARu94AejBLMHorAQ7cEQMGs2cXvkWshYLDi6e9l728O8P1XW6hKeB2yv42q18tjj+iFTGoSi+X9jJM9RTxS9E+OHT0krhNiZqlbqraoT7RAU5bBGrEknEBhgJks7KXbLS8qERI0ErVqF/Y4K6NHZfLZB+/wzJvncacvFd91oXO3o/O40MfZKJOKu/rne+mRQByXM4lYreb1tUnkizVVA/0SpfpbWaCNBeEE5gb/UH19NLqEgDF+oNDQWcn41Cj0EXFEWqzkOIyYekslFkThsvMxpIyE2hIc6lXGZ6cPyK7Nnk5OipixRdxgUESAYmhq68VsGgy5CYKCUAJTg0+izApXne3CJFmUTwg4L3FProFxU+6krqmXu3MskkhSD2av41jLdzlnfFrSdCZxyqfMnppN6ZUa7pwt0h3fiK9DCt4IO9e7YqisvI7VYgmNv7mhBKKD/9psNi5dOMv5ZjukjsLdr0ffWsyTi6eSlfcA+dmiVyOXs+/sHNZu3M6PdxzgVO9GmDSHsSNqmTz/R6y6Xxqma4fwaS5Mn85n1ZE0Vl3CHBER3lUNEhiURpPJRFdTOcVnpUJnPIhR7cZXfoH5UYc5+E4RzRH3sfSnl9m2dSMjE+Tz9msse+o5dr7UwcQ5T3HwlWUkNuzG3dKFSTbsNs7m/Y8vExOlC29UWkMJlAxKoRQMR3IC7x85zOn6fHS50+U/2Untx2R1voinu5no+DQmz7yPXmMKZnsu0wrm0Oe3YhOVHdm8A09dBQYhTv4T7C+xUPrZh8Qn2MMr4qcDSRfoirWgKAvtgOpv1JI8Zi77X15G7L+fxeOUOiUFxZiULD5fSlNzNM62W+k1yq5gjajGX/ZHvOIyxd+Fkj+P092rWP/si0Qr7VisMaEWuCiYonXFwbAUTWWPYLV245NITnGkUXnpI9butLJn2y6iba+hlp7C09qBcvoN7FYL9mhxo1/y/LoEXK8Pv6qIC8WbBY/xr9YlPLf9dZT+OqKTUwfmDBm/GOw7ws4FWpuUP2gJEZvKqmocuXPZuWYJMzKuSsH+SNwh3bo0p6hao6HeEqwYEZ2M6aKWd3PwTCy7du/D0F1DsmzE6/WGLr5LsDF4LggnYBacCOboQLHQ3FFfR58SR+HCR1iQH8ukhA5s5o5AYZMwUqOp74nl8xvRHDlRTsnxYpJsUjtsceHt2C8Fm0MPJrphTkZvBc4It9RKLOFx91Pf0Igu0k7W2MmkOewS2QYJUJVWVz9VNbXUVVwkyuAmKTFJayrDo/4Jwe/CT0aGYTrWVYEeUfsgXssMRcpyenraQJa0VX9O3ZU+Ma1fax4xGxUsUVFkOUbcama1hf+7+LmA9juHWshwmwOE1iMmCFYEzg1jtIm1BaxW6wCGGoFdewPfvyE4ertTiv4rHC73B855dwp2a23bbd4tC1hvhOCbX7b4VyUQKhxrtSOaYKngasizvwi0RmOS4O1QZf2yYfiaR+73AvhTQEVf+rpn9/8IMAChKDrDzfsdIQAAAABJRU5ErkJggg=='
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
	if type(PlayerData.job.name) == 'string' and PlayerData.job.name == 'police2' and PlayerData.job.name == dispatchNumber then
		-- if esx_service is enabled
		if Config.MaxInService ~= -1 and not playerInService then
			CancelEvent()
		end
	end
end)


AddEventHandler('esx_police2job:hasEnteredMarker', function(station, part, partNum)

	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {station = station}

	elseif part == 'Armory' then

		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}

	elseif part == 'VehicleSpawner' then

		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {station = station, partNum = partNum}

	elseif part == 'HelicopterSpawner' then
		
		CurrentAction     = 'menu_helicopter_spawner'
		CurrentActionMsg  = 'Presionar ~INPUT_CONTEXT~ para sacar el HELICOPTERO'
		CurrentActionData = {station = station, partNum = partNum}

	elseif part == 'VehicleDeleter' then

		local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		
			if DoesEntityExist(vehicle) then
				CurrentAction     = 'delete_vehicle'
				CurrentActionMsg  = _U('store_vehicle')
				CurrentActionData = {vehicle = vehicle}
			end
		
	elseif part == 'HelicopterDeleter' then

		local playerPed = PlayerPedId()

		--if IsPedInFlyingVehicle(playerPed,  false) then

			local vehicle = GetVehiclePedIsIn(playerPed, false)

			if DoesEntityExist(vehicle) then
				CurrentAction     = 'delete_helicopter'
				CurrentActionMsg  = 'Presionar ~INPUT_CONTEXT~ para guardar el ~g~HELICOPTERO'
				CurrentActionData = {vehicle = vehicle}
			end
		--else
			--ESX.ShowNotification('~r~No es un helicoptero!')
		--end	

	elseif part == 'BossActions' then

		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}

	end

end)

AddEventHandler('esx_police2job:hasExitedMarker', function(station, part, partNum)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

AddEventHandler('esx_police2job:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if PlayerData.job ~= nil and (PlayerData.job.name == 'police2') and IsPedOnFoot(playerPed) then --or PlayerData.job.name == 'ambulance'
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('remove_prop')
		CurrentActionData = {entity = entity}
	end

	if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle, i, true, 1000)
			end
		end
	end
end)

AddEventHandler('esx_police2job:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)

function PRESO()
	return IsHandcuffed
end

RegisterNetEvent('esx_police2job:handcuff_zs')
AddEventHandler('esx_police2job:handcuff_zs', function()
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if IsHandcuffed then

			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end

			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			--TaskPlayAnim(playerPed, 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8, -1, 48, 0, 0, 0, 0)
			
			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)
			FreezeEntityPosition(playerPed, true)
			DisplayRadar(false)

			if Config.EnableHandcuffTimer then

				if HandcuffTimer.Active then
					ESX.ClearTimeout(HandcuffTimer.Task)
				end

				StartHandcuffTimer()
			end

		else

			if Config.EnableHandcuffTimer and HandcuffTimer.Active then
				ESX.ClearTimeout(HandcuffTimer.Task)
			end
			
			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			--DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			FreezeEntityPosition(playerPed, false)
			DisplayRadar(true)
			
			--exports["faint_script"]:Preso(false)
			TriggerEvent('faint_script:preso', false)
			TriggerEvent('CarryPeople:broyale', false)
			TriggerEvent('TakeHostage:broyale', false)
			--exports["CarryPeople"]:Preso(false)
			--exports["TakeHostage"]:Preso(false)
		end
	end)

end)

RegisterNetEvent('esx_police2job:desesposar')
AddEventHandler('esx_police2job:desesposar', function()
	local playerPed = PlayerPedId()
	IsHandcuffed = false
	
	if Config.EnableHandcuffTimer and HandcuffTimer.Active then
		ESX.ClearTimeout(HandcuffTimer.Task)
	end
			
	ClearPedSecondaryTask(playerPed)
	SetEnableHandcuffs(playerPed, false)
	DisablePlayerFiring(playerPed, false)
	SetPedCanPlayGestureAnims(playerPed, true)
	FreezeEntityPosition(playerPed, false)
	DisplayRadar(true)
			
	--exports["faint_script"]:Preso(false)
	TriggerEvent('faint_script:preso', false)
	TriggerEvent('CarryPeople:broyale', false)
	TriggerEvent('TakeHostage:broyale', false)
	--exports["CarryPeople"]:Preso(false)
	--exports["TakeHostage"]:Preso(false)
end)

RegisterNetEvent('esx_police2job:unrestrain')
AddEventHandler('esx_police2job:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false
		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
		--exports["faint_script"]:Preso(false)
		TriggerEvent('faint_script:preso', false)
		TriggerEvent('CarryPeople:broyale', false)
		TriggerEvent('TakeHostage:broyale', false)
		--exports["CarryPeople"]:Preso(false)
		--exports["TakeHostage"]:Preso(false)
		-- end timer
		if Config.EnableHandcuffTimer and HandcuffTimer.Active then
			ESX.ClearTimeout(HandcuffTimer.Task)
		end
	end
end)

RegisterNetEvent('esx_police2job:drag')
AddEventHandler('esx_police2job:drag', function(copID)
	if not IsHandcuffed then
		return
	end
	
	DragStatus.IsDragged = not DragStatus.IsDragged
	DragStatus.CopId     = tonumber(copID)
	
end)

Citizen.CreateThread(function()
	local playerPed
	local targetPed

	while true do
		Citizen.Wait(5)

		if IsHandcuffed then
			playerPed = PlayerPedId()

			if DragStatus.IsDragged then
			
				targetPed = GetPlayerPed(GetPlayerFromServerId(DragStatus.CopId))

				-- undrag if target is in an vehicle
				if not IsPedSittingInAnyVehicle(targetPed) then
					AttachEntityToEntity(playerPed, targetPed, 11816, -0.06, 0.65, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				else
					DragStatus.IsDragged = false
					DetachEntity(playerPed, true, false)
				end

				if IsPedDeadOrDying(targetPed, true) then
					DragStatus.IsDragged = false
					DetachEntity(playerPed, true, false)
				end

			else
				DetachEntity(playerPed, true, false)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_police2job:putInVehicle_zs')
AddEventHandler('esx_police2job:putInVehicle_zs', function()
    local playerPed = PlayerPedId()
    if not IsHandcuffed then
        return
    end
        local vehicle = VehicleInFront()
        if vehicle ~= 0 then
            local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
            for i=maxSeats-1, 0, -1 do
                if GetPedInVehicleSeat(vehicle, i) == 0 then
                    SetPedIntoVehicle(playerPed, vehicle, i)
                    DragStatus.IsDragged = false
                    break
                end
            end
    end
end)

function VehicleInFront()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 3.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end

RegisterNetEvent('esx_police2job:OutVehicle_zs')
AddEventHandler('esx_police2job:OutVehicle_zs', function()
	local playerPed = PlayerPedId()
	
	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
	while IsPedInVehicle(playerPed, vehicle, false) do 
		TriggerServerEvent('esx_police2job:handcuff_zs', GetPlayerServerId(playerPed))
		break
	end	
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerPed = PlayerPedId()

		if IsHandcuffed then
			DisableControlAction(0, 1, true) -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			--DisableControlAction(0, Keys['W'], true) -- W
			--DisableControlAction(0, Keys['A'], true) -- A
			--DisableControlAction(0, 31, true) -- S (fault in Keys table!)
			--DisableControlAction(0, 30, true) -- D (fault in Keys table!)

			DisableControlAction(0, Keys['R'], true) -- Reload
			DisableControlAction(0, Keys['SPACE'], true) -- Jump
			DisableControlAction(0, Keys['Q'], true) -- Cover
			DisableControlAction(0, Keys['TAB'], true) -- Select Weapon
			DisableControlAction(0, Keys['F'], true) -- Also 'enter'?

			DisableControlAction(0, Keys['F1'], true) -- Disable phone
			DisableControlAction(0, Keys['F2'], true) -- Inventory
			DisableControlAction(0, Keys['F3'], true) -- Animations
			DisableControlAction(0, Keys['F6'], true) -- Job

			DisableControlAction(0, Keys['V'], true) -- Disable changing view
			DisableControlAction(0, Keys['C'], true) -- Disable looking behind
			DisableControlAction(0, Keys['X'], true) -- Disable clearing animation
			DisableControlAction(2, Keys['P'], true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
			DisableControlAction(2, Keys['F10'], true) -- Disable SUICIDE
			DisableControlAction(2, Keys['LEFTALT'], true) -- Disable Radio 
			DisableControlAction(2, Keys['RIGHTCTRL'], true)
			DisableControlAction(2, Keys['Z'], true)
			DisableControlAction(2, Keys['B'], true)
			DisableControlAction(2, Keys['H'], true)
			DisableControlAction(0, 21, true) --DISABLE SHIFT IZQUIERDO PARA SACAR RADIO
			
			--DisableControlAction(1, 137, true) --/suelo 243
			--DisableControlAction(0, 245, true) --chat T
			DisableControlAction(0, 344, true)
			--exports["faint_script"]:Preso(true)
			TriggerEvent('faint_script:preso', true)
			TriggerEvent('CarryPeople:broyale', true)
			TriggerEvent('TakeHostage:broyale', true)
			--exports["CarryPeople"]:Preso(true)
			--exports["TakeHostage"]:Preso(true)
			
			if not IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) then
				--ESX.ShowNotification('IS in IF')
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()

	for k,v in pairs(Config.PoliceStations) do
		local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('map_blip'))
		EndTextCommandSetBlipName(blip)
	end

end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if PlayerData.job ~= nil and PlayerData.job.name == 'police2' then
			hud = true
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)

			for k,v in pairs(Config.PoliceStations) do

				for i=1, #v.Cloakrooms, 1 do
					if GetDistanceBetweenCoords(coords, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end
					
				for i=1, #v.Armories, 1 do
					if GetDistanceBetweenCoords(coords, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end
					
				for i=1, #v.Vehicles, 1 do
					if GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, true) < Config.DrawDistance then
						DrawMarker(36, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
					end
				end
				
				--if 	PlayerData.job.grade_name == 'boss' then
					for i=1, #v.Helicopters, 1 do
						if GetDistanceBetweenCoords(coords, v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y, v.Helicopters[i].Spawner.z, true) < Config.DrawDistance then
							DrawMarker(34, v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y, v.Helicopters[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						end
					end
				--end
					
				--if 	PlayerData.job.grade_name == 'boss' then
					for i=1, #v.HelicoptersDeleters, 1 do
						if GetDistanceBetweenCoords(coords, v.HelicoptersDeleters[i].x, v.HelicoptersDeleters[i].y, v.HelicoptersDeleters[i].z, true) < Config.DrawDistance then
							DrawMarker(Config.MarkerType, v.HelicoptersDeleters[i].x, v.HelicoptersDeleters[i].y, v.HelicoptersDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 10.0, 10.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
						end
					end
				--end
				
				for i=1, #v.VehicleDeleters, 1 do
					if GetDistanceBetweenCoords(coords, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.5, 3.5, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
					end
				end

				if 	PlayerData.job.grade_name == 'boss' then
					for i=1, #v.BossActions, 1 do
						if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, true) < Config.DrawDistance then
							DrawMarker(2, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						end
					end
				end

			end

		else
			Citizen.Wait(500)
			hud = false
		end

	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

	while true do

		Citizen.Wait(10)

		if PlayerData.job ~= nil and PlayerData.job.name == 'police2' then

			local playerPed      = PlayerPedId()
			local coords         = GetEntityCoords(playerPed)
			local isInMarker     = false
			local currentStation = nil
			local currentPart    = nil
			local currentPartNum = nil

			for k,v in pairs(Config.PoliceStations) do
				
				--if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'subcomi' or PlayerData.job.grade_name == 'comi' or PlayerData.job.grade_name == 'lieutenant' or PlayerData.job.grade_name == 'inspect' or PlayerData.job.grade_name == 'sergeant' then
					for i=1, #v.Helicopters, 1 do
						if GetDistanceBetweenCoords(coords, v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y, v.Helicopters[i].Spawner.z, true) < Config.MarkerSize.x then
							isInMarker     = true
							currentStation = k
							currentPart    = 'HelicopterSpawner'
							currentPartNum = i
						end
					end
					
					for i=1, #v.HelicoptersDeleters, 1 do
						if GetDistanceBetweenCoords(coords, v.HelicoptersDeleters[i].x, v.HelicoptersDeleters[i].y, v.HelicoptersDeleters[i].z, true) < 10.0 then
							isInMarker     = true
							currentStation = k
							currentPart    = 'HelicopterDeleter'
							currentPartNum = i
						end
					end
				--end
				
				for i=1, #v.Cloakrooms, 1 do
					if GetDistanceBetweenCoords(coords, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Cloakroom'
						currentPartNum = i
					end
				end

				for i=1, #v.Armories, 1 do
					if GetDistanceBetweenCoords(coords, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Armory'
						currentPartNum = i
					end
				end

				for i=1, #v.Vehicles, 1 do
					if GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'VehicleSpawner'
						currentPartNum = i
					end
				end


				for i=1, #v.VehicleDeleters, 1 do
					if GetDistanceBetweenCoords(coords, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, true) < 3.5 then
						isInMarker     = true
						currentStation = k
						currentPart    = 'VehicleDeleter'
						currentPartNum = i
					end
				end

				if PlayerData.job.grade_name == 'boss' then
					for i=1, #v.BossActions, 1 do
						if GetDistanceBetweenCoords(coords, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, true) < Config.MarkerSize.x then
							isInMarker     = true
							currentStation = k
							currentPart    = 'BossActions'
							currentPartNum = i
						end
					end
				end

			end

			local hasExited = false

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

				if
					(LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_police2job:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_police2job:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_police2job:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

		else
			Citizen.Wait(500)
		end

	end
end)

-- Enter / Exit entity zone events
--[[
Citizen.CreateThread(function()
	local trackedEntities = {
		'prop_mp_cone_01',
		'prop_barrier_work05',
		'p_ld_stinger_s',
		'prop_boxpile_07d',
		'hei_prop_cash_crate_half_full'
	}

	while true do
		Citizen.Wait(500)

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil
		
		if PlayerData.job ~= nil and (PlayerData.job.name == 'police2' or PlayerData.job.name == 'gendarme' or PlayerData.job.name == 'seguridad') then

			for i=1, #trackedEntities, 1 do
				local object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

				if DoesEntityExist(object) then
					local objCoords = GetEntityCoords(object)
					local distance  = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, objCoords.x, objCoords.y, objCoords.z, true)

					if closestDistance == -1 or closestDistance > distance then
						closestDistance = distance
						closestEntity   = object
					end
				end
			end

			if closestDistance ~= -1 and closestDistance <= 3.0 then
				if LastEntity ~= closestEntity then
					TriggerEvent('esx_police2job:hasEnteredEntityZone', closestEntity)
					LastEntity = closestEntity
				end
			else
				if LastEntity ~= nil then
					TriggerEvent('esx_police2job:hasExitedEntityZone', LastEntity)
					LastEntity = nil
				end
			end
		end
	end
end)
]]--

-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(5)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and (PlayerData.job.name == 'police2') then --or PlayerData.job.name == 'ambulance'

				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu(CurrentActionData.station)
				elseif CurrentAction == 'menu_armory' then
					if Config.MaxInService == -1 then
						OpenArmoryMenu(CurrentActionData.station)
					elseif playerInService then
						OpenArmoryMenu(CurrentActionData.station)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'menu_vehicle_spawner' then
					OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
				elseif CurrentAction == 'menu_helicopter_spawner' then
					if Config.LicenseEnable then
						ESX.TriggerServerCallback('esx_license:checkLicense', function(hasDriversLicense)
							if hasDriversLicense then
								OpenHelicopterSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
							else
								ESX.ShowNotification('~r~No tienes Permiso para sacar Helicoptero!')
							end
						end, GetPlayerServerId(PlayerId()), 'drive_heli')
					else
						OpenHelicopterSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
					end
				elseif CurrentAction == 'delete_vehicle' then
					local pa = ESX.Math.Trim(GetVehicleNumberPlateText(CurrentActionData.vehicle))
					if pa == 'POLICIA' then
						if Config.EnableSocietyOwnedVehicles then
							local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
							TriggerServerEvent('esx_society:putVehicleInGarage_zs', 'police2', vehicleProps)
						end
						ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
					else
						ESX.ShowNotification('~r~AQUI SOLO GUARDAMOS PATRULLAS DE LA POLICIA!')
					end
				elseif CurrentAction == 'delete_helicopter' then
					local playerPed = PlayerPedId()
					if IsPedInFlyingVehicle(playerPed,  false) then					
						if Config.EnableSocietyOwnedVehicles then
							local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
							TriggerServerEvent('esx_society:putVehicleInGarage_zs', 'police2', vehicleProps)
						end
						ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
					else
						ESX.ShowNotification('~r~Solo guardamos Helicopteros!!')
					end
				elseif CurrentAction == 'menu_boss_actions' then
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBossMenu_zs', 'police2', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, { wash = false }) -- disable washing money
				elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end
				
				CurrentAction = nil
			end
		end -- CurrentAction end

		if IsControlJustReleased(0, Keys['F6']) and not isDead and PlayerData.job ~= nil and PlayerData.job.name == 'police2' then
			Openpolice2ActionsMenu()
		end
		
		if IsControlJustReleased(0, Keys['E']) and CurrentTask.Busy then
			ESX.ShowNotification(_U('impound_canceled'))
			ESX.ClearTimeout(CurrentTask.Task)
			ClearPedTasks(PlayerPedId())
			
			CurrentTask.Busy = false
		end
	end
end)


function createBlip(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)
		
		table.insert(blipsCops, blip) -- add blip to array so we can remove it later
	end
end

RegisterNetEvent('esx_police2job:updateBlip')
AddEventHandler('esx_police2job:updateBlip', function(policias)
	
	-- Refresh all blips
	for k, existingBlip in pairs(blipsCops) do
		RemoveBlip(existingBlip)
	end
	
	-- Clean the blip table
	blipsCops = {}

	if not Config.EnableJobBlip then
		return
	end
	
	--local id = GetPlayerFromServerId(players[i].source)
	for k,v in pairs(policias) do
		local id = GetPlayerFromServerId(k)
		if GetPlayerPed(id) ~= PlayerPedId() then
			createBlip(id)
		end
    end
end)


AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	
	--[[
	TriggerEvent('esx_police2job:unrestrain')
	
	if not hasAlreadyJoined then
		TriggerServerEvent('esx_police2job:spawned')
	end
	hasAlreadyJoined = true
	]]--
end)


AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_police2job:unrestrain')
		TriggerEvent('esx_phone:removeSpecialContact', 'police2')

		if Config.MaxInService ~= -1 then
			TriggerServerEvent('esx_service:disableService', 'police2')
		end

		if Config.EnableHandcuffTimer and HandcuffTimer.Active then
			ESX.ClearTimeout(HandcuffTimer.Task)
		end
	end
end)

-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and HandcuffTimer.Active then
		ESX.ClearTimeout(HandcuffTimer.Task)
	end

	HandcuffTimer.Active = true

	HandcuffTimer.Task = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('esx_police2job:unrestrain')
		HandcuffTimer.Active = false
	end)
end

-- TODO
--   - return to garage if owned
--   - message owner that his vehicle has been impounded
function ImpoundVehicle(vehicle)
	--local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	--TriggerEvent('persistent-vehicles/forget-vehicle', vehicle)
	ESX.Game.DeleteVehicle(vehicle) 
	ESX.ShowNotification(_U('impound_successful'))
	CurrentTask.Busy = false
end

function JailPlayer(player)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_menu', {
		title = _U('jail_menu_info'),
	}, function (data2, menu)
		local jailTime = tonumber(data2.value)
		if jailTime == nil then
			ESX.ShowNotification('invalid number!')
		else
			TriggerServerEvent("esx_jail:sendToJail_zs", player, jailTime * 60)
			menu.close()
		end
	end, function (data2, menu)
		menu.close()
	end)
end

function JailPlayer2(player)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_menu', {
		title = _U('jail_menu_info'),
	}, function (data, menu)
		local jailTime = tonumber(data.value)
		if jailTime == nil then
			ESX.ShowNotification('invalid number!')
		else
			menu.close()
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_menu', {
				title = "Numero de Celda:",
			}, function (data2, menu2)
				local celda = tonumber(data2.value)
				if celda > 0 and celda <= 3 then 
					menu2.close()
					TriggerServerEvent("esx_jail:jail_celda", player, jailTime * 60, celda)
					ESX.ShowNotification("~g~Preso en celda Nº: "..celda)
				else
					ESX.ShowNotification("~r~Ese numero de Celda no Existe.")
				end
			end, function (data2, menu2)
				menu2.close()
			end)
		end
	end, function (data, menu)
		menu.close()
	end)
end

function SendToCommunityService(player)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Community Service Menu', {
		title = "Cantidad de Meses:",
	}, function (data2, menu)
		local community_services_count = tonumber(data2.value)
		
		if community_services_count == nil then
			ESX.ShowNotification('Cantidad invalida.')
		else
			TriggerServerEvent("esx_communityservice:sendToCommunityService_zs", player, community_services_count)
			menu.close()
		end
	end, function (data2, menu)
		menu.close()
	end)
end

function SpawnCar()
	Spawner    = { x = 454.69, y = -1017.40, z = 27.43 }
	coords = {x = 405.64, y = -1643.4, z = 27.61}
	Heading = 229.54
	local veh = "police23"
	local vehicle = CreateVehicle(1912215274, 454.69, -1017.40, 27.43 + 1.0, Heading, true, false)
	SetVehicleIsStolen(vehicle, false)
	SetVehicleIsWanted(vehicle, false)
	SetVehRadioStation(vehicle, 'OFF')
end
