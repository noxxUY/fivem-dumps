local guiEnabled = false
local myIdentity = {}
local myIdentifiers = {}
local hasIdentity = false
local isDead = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
	end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)

function EnableGui(state)
	SetNuiFocus(state, state)
	guiEnabled = state

	SendNUIMessage({
		type = "enableui",
		enable = state
	})
end
function alazar()
	coger = math.random(1, 2)
	if coger == 1 then
		SetEntityCoordsNoOffset(PlayerPedId(), -141.56, 6203.73, 31.8, false, false, false, true)
	
	else
		SetEntityCoordsNoOffset(PlayerPedId(), -268.56, -956.73, 31.28, false, false, false, true)

	end
	--[[coger = math.random(1, 36)
	print('Le toco '..coger)
	if coger == 1 or coger == 4 then
 SetEntityCoordsNoOffset(PlayerPedId(), 1080.56, -703.73, 57.8, false, false, false, true)
----Citizen.Wait(2000)
 ----SetEntityCoordsNoOffset(PlayerPedId(), 1080.56, -703.73, 57.8, false, false, false, true)
----FreezeEntityPosition(PlayerPedId(), true)
----Citizen.Wait(2000)
 ----SetEntityCoordsNoOffset(PlayerPedId(), 1080.56, -703.73, 57.8, false, false, false, true)
----FreezeEntityPosition(PlayerPedId(), true)
----Citizen.Wait(2000)
	elseif coger == 2 or coger == 6 or coger == 5 then
 SetEntityCoordsNoOffset(PlayerPedId(), 314.26, -1625.23, 32.58, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 314.26, -1625.23, 32.58, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 314.26, -1625.23, 32.58, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
	elseif coger == 3 then
 SetEntityCoordsNoOffset(PlayerPedId(), -268.46, -957.05, 31.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -268.46, -957.05, 31.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -268.46, -957.05, 31.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 7 then
	SetEntityCoordsNoOffset(PlayerPedId(), 5.16, -706.95, 45.98, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 5.16, -706.95, 45.98, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 5.16, -706.95, 45.98, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 8 then
	SetEntityCoordsNoOffset(PlayerPedId(), 140.26, -768.65, 45.78, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 140.26, -768.65, 45.78, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 140.26, -768.65, 45.78, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 9 then
	SetEntityCoordsNoOffset(PlayerPedId(), 167.36, -567.05, 43.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 167.36, -567.05, 43.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 167.36, -567.05, 43.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 10 then
	SetEntityCoordsNoOffset(PlayerPedId(), -117.66, -616.74, 36.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -117.66, -616.74, 36.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -117.66, -616.74, 36.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 11 then
	SetEntityCoordsNoOffset(PlayerPedId(), 389.86, -1535.45, 29.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 389.86, -1535.45, 29.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 389.86, -1535.45, 29.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 12 or coger == 5 then
	SetEntityCoordsNoOffset(PlayerPedId(), 1147.86, -643.05, 56.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 1147.86, -643.05, 56.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 1147.86, -643.05, 56.28, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 13 then
	SetEntityCoordsNoOffset(PlayerPedId(), -1378.46, -502.85, 33.18, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -1378.46, -502.85, 33.18, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -1378.46, -502.85, 33.18, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 14 then
	SetEntityCoordsNoOffset(PlayerPedId(), -1177.96, -1774.05, 3.68, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -1177.96, -1774.05, 3.68, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -1177.96, -1774.05, 3.68, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 15 then
	SetEntityCoordsNoOffset(PlayerPedId(), -1008.88, -487.05, 39.98, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -1008.88, -487.05, 39.98, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -1008.88, -487.05, 39.98, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 16 then
	SetEntityCoordsNoOffset(PlayerPedId(), -606.36, -128.15, 39.08, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -606.36, -128.15, 39.08, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), -606.36, -128.15, 39.08, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 17 then
	SetEntityCoordsNoOffset(PlayerPedId(), 390.06, -356.15, 48.08, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 390.06, -356.15, 48.08, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 390.06, -356.15, 48.08, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
elseif coger == 18 then
	SetEntityCoordsNoOffset(PlayerPedId(), 740.46, 195.5, 84.48, false, false, false, true)
elseif coger == 19 then
	SetEntityCoordsNoOffset(PlayerPedId(), -142.46, 63075.24, 31.58, false, false, false, true)
elseif coger == 20 then
	SetEntityCoordsNoOffset(PlayerPedId(), -145.16, 6437.05, 31.48, false, false, false, true)
elseif coger == 21 then
	SetEntityCoordsNoOffset(PlayerPedId(), 1225.16, 2725.65, 38.48, false, false, false, true)
elseif coger == 22 then
	SetEntityCoordsNoOffset(PlayerPedId(), -358.57, 6262.11, 31.49, false, false, false, true)
elseif coger == 23 then
	SetEntityCoordsNoOffset(PlayerPedId(), -248.98, 6411.55, 31.17, false, false, false, true)
elseif coger == 24 then
	SetEntityCoordsNoOffset(PlayerPedId(), -106.49, 6530.24, 29.89, false, false, false, true)
elseif coger == 25 then
	SetEntityCoordsNoOffset(PlayerPedId(), -55.86, 6644.97, 32.28, false, false, false, true)
elseif coger == 26 then
	SetEntityCoordsNoOffset(PlayerPedId(), -299.15, 6255.27, 31.54, false, false, false, true)
elseif coger == 27 then
	SetEntityCoordsNoOffset(PlayerPedId(), 1224.79, 2726.24, 38.0, false, false, false, true)
elseif coger == 28 then
	SetEntityCoordsNoOffset(PlayerPedId(), -55.86, 6644.5, 32.26, false, false, false, true)
elseif coger == 29 then
	SetEntityCoordsNoOffset(PlayerPedId(), 207.0, 2441.61, 58.87, false, false, false, true)
elseif coger == 30 then
	SetEntityCoordsNoOffset(PlayerPedId(), 2336.81, 4858.87, 41.81, false, false, false, true)
elseif coger == 31 then
	SetEntityCoordsNoOffset(PlayerPedId(), 1730.63, 3849.0, 34.76, false, false, false, true)
elseif coger == 32 then
	SetEntityCoordsNoOffset(PlayerPedId(), 1878.35, 3920.41, 33.15, false, false, false, true)
elseif coger == 33 then
	SetEntityCoordsNoOffset(PlayerPedId(), 1955.14, 3844.1, 32.02, false, false, false, true)
elseif coger == 34 then
	SetEntityCoordsNoOffset(PlayerPedId(), 1658.85, 3544.5, 35.89, false, false, false, true)
elseif coger == 35 then
	SetEntityCoordsNoOffset(PlayerPedId(), 1780.34, 3800.7, 38.37, false, false, false, true)
elseif coger == 36 then
	SetEntityCoordsNoOffset(PlayerPedId(), -324.21, 6179.69, 32.31, false, false, false, true)

--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 740.46, 195.5, 84.48, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
--SetEntityCoordsNoOffset(PlayerPedId(), 740.46, 195.5, 84.48, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
--Citizen.Wait(2000)
	end--]]
	Citizen.Wait(100)
	FreezeEntityPosition(PlayerPedId(), true)
end


RegisterNetEvent('esx_identity:showRegisterIdentity')
AddEventHandler('esx_identity:showRegisterIdentity', function()
	if not isDead then
		EnableGui(true)
		Citizen.Wait(10000)
		alazar()
	end
end)

RegisterNetEvent('esx_identity:identityCheck')
AddEventHandler('esx_identity:identityCheck', function(identityCheck)
	hasIdentity = identityCheck
end)

RegisterNetEvent('esx_identity:saveID')
AddEventHandler('esx_identity:saveID', function(data)
	myIdentifiers = data
end)

RegisterNUICallback('escape', function(data, cb)
	if hasIdentity then
		EnableGui(false)
	else
		TriggerEvent('chat:addMessage', { args = { '^1[IDENTIDAD]', ' ^1Necesitas tener almenos ^9^*1 Identidad' } })
	end
end)
function uppSnnwooiii(str)
    return (str:gsub("^%l", string.upper))
end

RegisterNUICallback('register', function(data, cb)
	local reason = ""
	myIdentity = data
	for theData, value in pairs(myIdentity) do
		if theData == "firstname" then
			value = value:gsub('%W','')
			value= uppSnnwooiii(value)
			print(value)
			reason = verifyName(value)
			data.firstname = value
			if reason ~= "" then
				break
			end
		elseif theData == "lastname" then
			value = value:gsub('%W','')
			value= uppSnnwooiii(value)
			print(value)
			reason = verifyName(value)
			data.lastname = value
			if reason ~= "" then
				break
			end
		elseif theData == "dateofbirth" then
			if value == "invalid" then
				reason = "Invalid date of birth!"
				break
			end
		elseif theData == "height" then
			height = string.sub(value, 1, 3)
			height = tonumber(height)
			data.height = height
			
			if height then
				if height > 200 or height < 140 then
					reason = "Altura inválida"
					break
				end
			else
				reason = "Altura inválida"
				break
			end
		end
	end
	
	if reason == "" then
        local jugadorss = PlayerPedId()
		print(json.encode(data))
		if data.sex == "m" then
--Hombre
TriggerEvent("snowiSetDefRopaS", "hombre")
		else
			TriggerEvent("snowiSetDefRopaS", "mujer")
		end
        TriggerServerEvent('esx_identity:setIdentitysnow', data, myIdentifiers, 'Siloesxd', jugadorss)
		FreezeEntityPosition(PlayerPedId(), false)
        EnableGui(false)
        Citizen.Wait(500)
		TriggerEvent('esx_skin:openSaveableMenu', myIdentifiers.id)
    else
        print("ERROR : " .. reason)
    end
end)
local jjja = 1500
Citizen.CreateThread(function()
	while true do
		if guiEnabled then
			jjja = 1
			DisableControlAction(0, 1,   true) -- LookLeftRight
			DisableControlAction(0, 2,   true) -- LookUpDown
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
			DisableControlAction(0, 21,  true) -- disable sprint
			DisableControlAction(0, 24,  true) -- disable attack
			DisableControlAction(0, 25,  true) -- disable aim
			DisableControlAction(0, 47,  true) -- disable weapon
			DisableControlAction(0, 58,  true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75,  true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
		else
			jjja = 1500
		end
		Citizen.Wait(jjja)
	end
end)
RegisterCommand('disableUi', function()
if guiEnabled == true then
print(' Ui deshabilitado ->', guiEnabled)
else
print('El UI ya esta deshabilitado ->', guiEnabled)
end end)

function verifyName(name)
	-- Don't allow short user names
	local nameLength = string.len(name)
	if nameLength > 25 or nameLength < 2 then
		return 'Your player name is either too short or too long.'
	end
	
	-- Don't allow special characters (doesn't always work)
	local count = 0
	for i in name:gmatch('[abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789 -]') do
		count = count + 1
	end
	if count ~= nameLength then
		return 'Your player name contains special characters that are not allowed on this server.'
	end
	
	-- Does the player carry a first and last name?
	-- 
	-- Example:
	-- Allowed:     'Bob Joe'
	-- Not allowed: 'Bob'
	-- Not allowed: 'Bob joe'
	local spacesInName    = 0
	local spacesWithUpper = 0
	for word in string.gmatch(name, '%S+') do

		if string.match(word, '%u') then
			spacesWithUpper = spacesWithUpper + 1
		end

		spacesInName = spacesInName + 1
	end

	if spacesInName > 2 then
		return 'Your name contains more than two spaces'
	end
	
	if spacesWithUpper ~= spacesInName then
		return 'your name must start with a capital letter.'
	end

	return ''
end
