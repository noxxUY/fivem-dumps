local canDraw = false
local cantspawn = false
local data = {}

ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  Wait(5000)
  TriggerEvent('s_carhunt:GetServerCoords')
end)

RegisterNetEvent('s_carhunt:cSync',function(sync)
	print('tän pitäs printata kerran!')
	drawing = false
	ESX.ShowNotification('<span style="color:blue">CarHunt:</span> <br>Un Vehiculo ha sido reclamado! <br>Siguiente Vehiculo aparecera en 10 segundos.')
	TriggerEvent('s_carhunt:GetServerCoords')
end)

RegisterNetEvent('s_carhunt:cantSpawn', function(cantspawn)
	cantspawn = true
end)


--Functio jolla hakee auton koordit ja claim koordit
RegisterNetEvent('s_carhunt:GetServerCoords', function()
	ESX.TriggerServerCallback('s_carhunt:coords',function(info)
		data = info
		koordit = info.coords
		heading = info.h
		model = info.model
		triggersafe = info.triggersafe
		Wait(1000)
		spawnAmbient()
		drawing = true
		markers()
	end)
end)

function markers()
	print('nonii2')
	while true do
		pedc = GetEntityCoords(PlayerPedId())
		coords = vector3(data.coords.x, data.coords.y, data.coords.z)
		dist = #(pedc - coords)
		w = 2000
		if dist <= 4 then
			w = 5
			if drawing then
				s = 5
				if Config.TextType == "Floating" then
					ShowFloatingHelpNotification('Presiona ~g~[E]~s~ ~g~reclamar~s~ este Vehiculo', vector3(coords.x, coords.y, coords.z + 1.23))
				elseif Config.TextType == "Draw3DText" then
					Draw3DText(coords.x, coords.y, coords.z + 1.23, 'Presiona ~g~[E]~s~ ~g~reclamar~s~ este Vehiculo')
				end
				if IsControlJustReleased(0, 38) then
					if IsPedInAnyVehicle(PlayerPedId(), true) then
						vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
						local vehped = GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1)
						if vehped == PlayerPedId() then
							prepare()
							drawing = false
						else
							ESX.ShowNotification('Debes estar en el asiento del Conductor!')
						end
					else
						ESX.ShowNotification('Metete al vehiculo primero')
					end
				end
			else
				break
			end
		end
		Wait(w)
	end
end

function prepare()
	drawing = false
	DoScreenFadeOut(1000)
	Wait(1000)
	DeleteEntity(vehicle) --Poistaa aiemmin spawnatun ajoneuvon
	claimcar() --Spawnaa perseen alle claimatun auton
	Wait(1000)
	DoScreenFadeIn(1000)
	PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 1)
	Scaleforms()
	TriggerServerEvent('s_carhunt:getcar') --Viedään auto clientin databaseen
end

function spawnAmbient()
	RequestModel(data.model)
	coords = coords22
	while not HasModelLoaded(data.model) do
		Wait(10)
	end
	while true do
		w = 100
		pedcoords = GetEntityCoords(PlayerPedId())
		claimcoords = vector3(data.coords.x, data.coords.y, data.coords.z)
		dist = #(pedcoords - claimcoords)
		if dist < 30 then
			--print(cantspawn)
			if not cantspawn then
				if ESX.Game.IsSpawnPointClear(claimcoords, 3.0) then
					--print('create vehicle')
					spawnvehicle = CreateVehicle(data.model, data.coords, false, true)
					PlaceObjectOnGroundProperly(spawnvehicle)
					FreezeEntityPosition(spawnvehicle, true)
					if Config.SpawnDamagedCar then
            					SetVehicleEngineHealth(spawnvehicle, 10)
						SetVehicleDoorBroken(spawnvehicle, (math.random(0, 5)))
						SetVehicleTyreBurst(spawnvehicle, (math.random(2, 5)), true, 1000)
            					SetVehicleUndriveable(spawnvehicle, true)
						SmashVehicleWindow(spawnvehiclee, (math.random(0, 7)))
					end
					Wait(1000)
					SetEntityVisible(spawnvehicle, true, 0)
					SetEntityCollision(spawnvehicle, true)
					livery = SetVehicleLivery(spawnvehicle, 0)
					newPlate     = GeneratePlate()
					local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
					--local vehicleProps = exports.renzu_customs:GetVehicleProperties(spawnvehicle)
					--vehicleProps.plate = newPlate
					--vehicleProps.livery = livery
					SetVehicleNumberPlateText(spawnvehicle, newPlate)
					break
				else
					break
				end
			end
		end
		Citizen.Wait(w)
	end
end

function claimcar()
	Newvehicle = CreateVehicle(data.model, data.coords, true, true)
	while (not DoesEntityExist(Newvehicle)) do
		Citizen.Wait(100)
	end
	if DoesEntityExist(Newvehicle) then
		SetEntityVisible(Newvehicle, true, true)
		SetEntityCollision(Newvehicle, true)
		if Config.SpawnDamagedCar then
            		SetVehicleEngineHealth(Newvehicle, 10)
			SetVehicleDoorBroken(Newvehicle, (math.random(0, 5)))
			SetVehicleTyreBurst(Newvehicle, (math.random(2, 5)), true, 1000)
            		SetVehicleUndriveable(Newvehicle, true)
			SmashVehicleWindow(Newvehicle, (math.random(0, 7)))
		end
		livery = SetVehicleLivery(Newvehicle, 0)
		--local vehicleProps = exports.renzu_customs:GetVehicleProperties(Newvehicle)
		local vehicleProps = ESX.Game.GetVehicleProperties(Newvehicle)
		vehicleProps.plate = newPlate
		vehicleProps.livery = livery
		SetVehicleNumberPlateText(Newvehicle, newPlate)
		TaskWarpPedIntoVehicle(PlayerPedId(), Newvehicle, -1)
		TriggerServerEvent(triggersafe..'s_carhunt:setVehicle', vehicleProps, coords, data.model)
	end
end

--scaleformit sun muut
function Scaleforms()

        local scaleform = RequestScaleformMovie("MIDSIZED_MESSAGE")
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(10)
	end
	canDraw = 2000
        BeginScaleformMovieMethod(scaleform, "SHOW_COND_SHARD_MESSAGE")
	PushScaleformMovieMethodParameterString("Felicidades!")
	PushScaleformMovieMethodParameterString("El ~g~Vehiculo~s~ ahora es tuyo!")
	PushScaleformMovieMethodParameterInt(Config.ScaleFormColor)
	EndScaleformMovieMethod()
	while canDraw > 0 do
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		w = 5
		Wait(w)
		if canDraw then
			canDraw = canDraw - 10
		end
	end

end

function Draw3DText(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 159)
end

ShowFloatingHelpNotification = function(msg, coords)
    SetFloatingHelpTextWorldPosition(1, coords.x, coords.y, coords.z)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(2, false, true, 0)
end

-----------------------------------------------------------GENERATE PLATES---------------------------------------------------------
local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())
		if Config.PlateUseSpace then
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. ' ' .. GetRandomNumber(Config.PlateNumbers))
		else
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. GetRandomNumber(Config.PlateNumbers))
		end

		ESX.TriggerServerCallback('s_carhunt:isPlateTaken', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

-- mixing async with sync tasks
function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('s_carhunt:isPlateTaken', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

