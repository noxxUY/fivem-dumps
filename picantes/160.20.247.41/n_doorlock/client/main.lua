ESX = nil

Citizen.CreateThread(
	function()
		while ESX == nil do
			TriggerEvent(
				"esx:getSharedObject",
				function(obj)
					ESX = obj
				end
			)
			Citizen.Wait(500)
		end
	end
)

local closestDoorKey, closestDoorValue = nil, nil

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
	while true do
		for key, doorID in ipairs(DATA.Doors) do
			if doorID.doors then
				for k,v in ipairs(doorID.doors) do
					if not v.object or not DoesEntityExist(v.object) then
						if type(v.objName) == "number" then
							v.object = GetClosestObjectOfType(v.objCoords, 1.0, v.objName, false, false, false)
						else
							v.object = GetClosestObjectOfType(v.objCoords, 1.0, GetHashKey(v.objName), false, false, false)
						end
						
					end
				end
			else
				if not doorID.object or not DoesEntityExist(doorID.object) then
					if type(doorID.objName) == "number" then
						doorID.object = GetClosestObjectOfType(doorID.objCoords, 1.0, doorID.objName, false, false, false)
					else
						doorID.object = GetClosestObjectOfType(doorID.objCoords, 1.0, GetHashKey(doorID.objName), false, false, false)
					end
				end
			end
		end

		Citizen.Wait(2500)
	end
end)

local maxDistance = 1.0
local actualDistance = 1000
local closestOne = k

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords, awayFromDoors = GetEntityCoords(GetPlayerPed(-1)), true

		for k,doorID in ipairs(DATA.Doors) do
			local distance

			if doorID.doors then
				distance = #(playerCoords - doorID.doors[1].objCoords)
			else
				distance = #(playerCoords - doorID.objCoords)
			end

			if doorID.distance then
				maxDistance = doorID.distance
			else
				maxDistance = 1.25
			end
			if distance < 50 then
				awayFromDoors = false
				if doorID.doors then
					for _,v in ipairs(doorID.doors) do
						-- FreezeEntityPosition(v.object, doorID.locked)
						if doorID.locked and v.objYaw  then--and GetEntityRotation(v.object).z > v.objYaw-4 and GetEntityRotation(v.object).z < v.objYaw+4  then
							SetEntityRotation(v.object, 0.0, 0.0, v.objYaw, 2, true)
							FreezeEntityPosition(v.object, doorID.locked)
						elseif doorID.locked and not v.objYaw then
							FreezeEntityPosition(v.object, doorID.locked)
						elseif not doorID.locked then
							FreezeEntityPosition(v.object, doorID.locked)
						end
						-- if doorID.locked and v.objYaw and GetEntityRotation(v.object).z ~= v.objYaw then
						-- 	SetEntityRotation(v.object, 0.0, 0.0, v.objYaw, 2, true)
						-- end
					end
				else
					if doorID.locked and doorID.objYaw and (GetEntityRotation(doorID.object).z > doorID.objYaw-2 and GetEntityRotation(doorID.object).z < doorID.objYaw+2 or doorID.auto)  then
						SetEntityRotation(doorID.object, 0.0, 0.0, doorID.objYaw, 2, true)
						FreezeEntityPosition(doorID.object, doorID.locked)
					elseif doorID.locked and not doorID.objYaw then
						FreezeEntityPosition(doorID.object, doorID.locked)
					elseif not doorID.locked then
						FreezeEntityPosition(doorID.object, doorID.locked)
					end
					-- if doorID.locked and doorID.objYaw and GetEntityRotation(doorID.object).z ~= doorID.objYaw then
					-- 		SetEntityRotation(doorID.object, 0.0, 0.0, doorID.objYaw, 2, true)
					-- end
				end
			end

			if distance < actualDistance then
				actualDistance = distance
				closestOne = k
			end

			if distance < maxDistance and k == closestOne then
				actualDistance = distance
				awayFromDoors = false
				if doorID.size then
					size = doorID.size
				end

				local isAuthorized = IsAuthorized(doorID)

				if isAuthorized then
					if doorID.locked then
						displayText = "~g~E~w~ - Abrir"
						if doorID.timer then
							if doorID.timer > 1 then
								displayText = displayText .. " | Abrira en "..doorID.timer-1 .."m"
							else
								displayText = displayText .. " | ~b~Y~w~ - Tiempo"
								if IsControlJustReleased(0, 246) then
									if isAuthorized then
										setDoorTime(doorID, k)
									end
								end
							end
						end
					elseif not doorID.locked then
						displayText = "~g~E~w~ - Cerrar"
					end
				elseif not isAuthorized then
					if doorID.locked then
						if doorID.timer and doorID.timer > 1 then
							displayText = "Cerrada | Abrira en "..doorID.timer-1 .."m"
						else
							displayText = "Cerrada"
						end
					elseif not doorID.locked then
						displayText = "Abierta"
					end
				end

				if doorID.locking then
					if doorID.locked then
						displayText = "Abriendo.."
					else
						displayText = "Cerrando.."
					end
				end

				if doorID.objCoords == nil then
					doorID.objCoords = doorID.textCoords
				end


				DrawText3Ds(doorID.textCoords.x, doorID.textCoords.y, doorID.textCoords.z, displayText)

				if IsControlJustReleased(0, 38) then
					if isAuthorized then
						setDoorLocking(doorID, k)
					end
				end
			elseif distance > maxDistance and k == closestOne then
				actualDistance = 1000
				closestOne = nil
			end
		end

		if awayFromDoors then
			Citizen.Wait(1000)
		end
	end
end)

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function setDoorLocking(doorId, key)
	doorId.locking = true
	openDoorAnim()
    SetTimeout(400, function()
		doorId.locking = false
		doorId.locked = not doorId.locked
		TriggerServerEvent('doorlock:server:updateState', key, doorId.locked)
	end)
end

function setDoorTime(doorId, key)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'time_door',
    {
        title = "Escribe el tiempo en minutos!",
	}, function(data, menu)
        TriggerServerEvent('doorlock:server:updateTime', key, tonumber(data.value))
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function IsAuthorized(doorID)
	local PlayerData = ESX.GetPlayerData()
	while PlayerData == nil or PlayerData.job == nil do 
		PlayerData = ESX.GetPlayerData()
		Wait(1000); 
	end
	for _,job in pairs(doorID.authorizedJobs) do
		if job == PlayerData.job.name then
			return true
		end
	end
	return false
end

function openDoorAnim()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim( GetPlayerPed(-1), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
	SetTimeout(400, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
end

RegisterNetEvent('doorlock:client:setState')
AddEventHandler('doorlock:client:setState', function(doorID, state)
	DATA.Doors[doorID].locked = state
	if DATA.Doors[doorID].timer and DATA.Doors[doorID].timer > 1 then
		DATA.Doors[doorID].timer = 1 
	end
end)

RegisterNetEvent('doorlock:client:setDoors')
AddEventHandler('doorlock:client:setDoors', function(doorList)
	DATA.Doors = doorList
end)

RegisterNetEvent('doorlock:client:updateTime')
AddEventHandler('doorlock:client:updateTime', function(key,time)
    DATA.Doors[key].timer = time + 1
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent("doorlock:server:setupDoors")
end)


ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
    end
end)

----------------------------------------------------------------------------------------------------

-- Command /rskin
RegisterCommand("fixpj", function(source, args, rawCommand)
  reloadSkin()
end)

function reloadSkin()
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  local model = nil
       
  if skin.sex == 0 then
    model = GetHashKey("mp_m_freemode_01")
  else
    model = GetHashKey("mp_f_freemode_01")
  end

  RequestModel(model)

  SetPlayerModel(PlayerId(), model)
  SetModelAsNoLongerNeeded(model)

  TriggerEvent('skinchanger:loadSkin', skin)
  TriggerEvent('esx:restoreLoadout')
  end)
end