Keys = {
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

ESX = nil
local menuOpen = false
local wasOpen = false
jobWL = {
	--['armeriaSur'] = {society='society_armeriasur', logs=''},
	--['armasNorte'] = {society='society_armerianorte', logs=''}, 
	['LosCorona'] = {society='society_LosCorona', logs='farina'}, 
	--['armeriaSandy'] = {society='society_ameriaSandy', logs=''}, 
	['TheUnion'] = {society='society_TheUnion', logs='hive'},  
	--['medusa'] = {society='society_medusa', logs='bahamas'},  
--	['bahamas'] = {society='society_bahamas', logs='bahamas'},
	['BallasChowy'] = {society='society_BallasChowy', logs='ballas'}, 
	['Families'] = {society='society_Families', logs='verdes'}, 
	['Crips'] = {society='society_Crips', logs='Crips'}, 
	['GlockGang'] = {society='society_GlockGang', logs='glock'}, 
--	['armasmenor'] = {society='society_armeriamenor', logs=''}, 
	['TheMasacre'] = {society='society_TheMasacre', logs='masacre'}, 
	['TheDarks'] = {society='society_TheDarks', logs='rex'}, 
	['TheCriminals'] = {society='society_TheCriminals', logs='TheCriminals'},
	['LosAngeles'] = {society='society_LosAngeles', logs= 'LosAngeles'},


--	['medusa'] = {society='society_medusa', logs = ''},
  }
snowiCoords = {}
snowiCoords.pepe =  vector3(3094.906, -4714.694, 15.26086)

local pagado = false
local comprobado = false
function checkDonador()
	ESX.TriggerServerCallback("snowiCheckVentas", function(es)
		print(es)
		comprobado = true
		pagado = es
	end)
end
local veces= 0
RegisterCommand('getventas', function()
if veces < 2 then
	veces = veces +1
	comprobado = false
	checkDonador()
else
print('Excediste el limite para comprobar si tienes permiso para cachear!') end end)
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(1000)
	end
ESX.TriggerServerCallback("snowiGetStateDrogas", function(a) 
	 TriggerEvent('snowiSyncWLDrogas', a)

end)
	ESX.PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
local dormir = true
		if GetDistanceBetweenCoords(coords, snowiCoords.pepe, true) < 3.50 then
			dormir = false
			DrawMarker(0, snowiCoords.pepe.x, snowiCoords.pepe.y, snowiCoords.pepe.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5-0.5,1.0, 1.0-0.2, 0,255,150, 100, true, true, 2, false, false, false, false)
			if not menuOpen then
				ESX.ShowFloatingHelpNotification(_U('dealer_prompt'))

				if IsControlJustReleased(0, Keys['E']) then
					--[[local name = GetPlayerName(PlayerId())
					local ped = GetPlayerPed(PlayerId())
					local x, y, z = table.unpack(GetEntityCoords(ped, true))
					local street = GetStreetNameAtCoord(x, y, z)
					local location = GetStreetNameFromHashKey(street)
					local msg = 'Alguien esta vendiendo drogas en '..location..''
					local tipo = 'drogas'
					TriggerServerEvent('cris_entornos_entorno:aviso', location, msg, x, y, z, tipo)
					wasOpen = true--]]
					local playerPed = PlayerPedId()
	PedPosition		= GetEntityCoords(playerPed)
	
	local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }
    local msg = 'Alguien está vendiendo drogas... Acudan rápido a la localización indicada para intervenir!'
    TriggerServerEvent('esx_addons_gcphone:startCall', 'police', msg, PlayerCoords, {

		PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
    })
    TriggerEvent('chatMessage', '^5[^1Entorno^5]', {255,255,255}, ' ^7Los vecinos te han visto trapichear y han avisado a las autoridades!.')
					OpenDrugShop()
				end
			else
				Citizen.Wait(0)
			end
			else
			if wasOpen then
				wasOpen = false
				ESX.UI.Menu.CloseAll()
			end
			Citizen.Wait(0)
		end
		if dormir == true then
			Citizen.Wait(2500)
		end
	end
end)
RegisterNetEvent('snowiSyncWLDrogas', function(A) 
if A == 'todos' then
	ESX.ShowNotification("Ahora el punto de venta de drogas está disponible para todas las familias!")
	jobWL = nil 

	jobWL = {
		--['armeriaSur'] = {society='society_armeriasur', logs=''},
		--['armasNorte'] = {society='society_armerianorte', logs=''}, 
		['LosCorona'] = {society='society_LosCorona', logs='farina'}, 
		--['armeriaSandy'] = {society='society_ameriaSandy', logs=''}, 
		['TheUnion'] = {society='society_TheUnion', logs='hive'},  
		--['medusa'] = {society='society_medusa', logs='bahamas'},  
	--	['bahamas'] = {society='society_bahamas', logs='bahamas'},
		['BallasChowy'] = {society='society_BallasChowy', logs='ballas'}, 
		['Families'] = {society='society_Families', logs='verdes'}, 
		['Crips'] = {society='society_Crips', logs='Crips'}, 
		['GlockGang'] = {society='society_GlockGang', logs='glock'}, 
	--	['armasmenor'] = {society='society_armeriamenor', logs=''}, 
		['TheMasacre'] = {society='society_TheMasacre', logs='masacre'}, 
		['TheDarks'] = {society='society_TheDarks', logs='rex'}, 
		['TheCriminals'] = {society='society_TheCriminals', logs='TheCriminals'},
	['LosAngeles'] = {society='society_LosAngeles', logs= 'LosAngeles'},


	--	['medusa'] = {society='society_medusa', logs = ''},
	  }
	else
	ESX.ShowNotification("Ahora el punto de venta de drogas está disponible para BlackWater")

		jobWL = nil 

		jobWL = {
			['TheDarks'] = {society='society_TheDarks', logs='rex'}, 
		  }

end
end)

  function checkWL()
	local xPlayer = ESX.GetPlayerData()
	local jobP = xPlayer.job.name
	print(jobP)
	for i, job in pairs(jobWL) do
	  if i == jobP then
		return true
	  end
	end
	return false
	end
  function OpenDrugShop()
	ESX.UI.Menu.CloseAll()
	local elements = {}
	menuOpen = true
	tiene = false
	print('Vamos a check')
	if comprobado == false then
		checkDonador()
	end
if checkWL() or pagado then
	for k, v in pairs(ESX.GetPlayerData().inventory) do
		print(v.name)
		local price = snowiPrices.price[v.name]
		if v.count > 250 then
			valuee = 250
		else
			valuee=50
		end
		if price and v.count >= 50 then
			tiene = true
			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format(v.label, _U('dealer_item', ESX.Math.GroupDigits(price))),
				name = v.name,
				price = price,

				-- menu properties
				type = 'slider',
				value = valuee,
				min = 50,
				max = 250
			})
		end--]]
	end
	if tiene == false then
		table.insert(elements, {
			label = ('<span style="color:green;">Necesitas al menos 50gr de alguna droga!!</span>'),
			value = 'min50'
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_shop', {
		title    = _U('dealer_title'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		local u = true
		Citizen.CreateThread(function()
	   while u do
	  Citizen.Wait(1)
	  u = false
	  if data.current.value == 'min50' then
		TriggerEvent('chatMessage', '^5[^1NARCO^5]', {255,255,255}, ' ^7Necesitas mínimo, 50gr de droga!.')
		u = false
		return
	  end
		RequestAnimDict('missmechanic')
	  
		while not HasAnimDictLoaded('missmechanic') do
		  Wait(100)
		end
		FreezeEntityPosition(PlayerPedId(), true)  
		TaskPlayAnim(GetPlayerPed(-1), 'missmechanic', 'work_in', 8.0, -8, -1, 49, 0, 0, 0, 0)
		tiempo = data.current.value*10
		tiempoens = tiempo/100
		ESX.ShowNotification('Debes esperar ['..tonumber(tiempoens)..'] Segundos para terminar de vender esta mercancía.')
		ESX.UI.Menu.CloseAll()
		h=true
		while h do
Citizen.Wait(1)
tiempo = tiempo -1
print(tiempo)
		DisableAllControlActions(1)
	if tiempo == 0 then
		 h=false
		 print('acabo')
		 tiempo = 0 
	end
end
		menuOpen = false
		--Citizen.Wait(tiempo)
		EnableAllControlActions(1)
		FreezeEntityPosition(PlayerPedId(), false)
		TriggerServerEvent('esx_illegal:sellDrug', data.current.name, data.current.value)

		
	end end)

	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
else
	menuOpen = false
	ESX.ShowNotification("No puedes tratar con este tipo de negocios, tú directamente, debes ir a vender tu mercancía a ventas ilegales!")
end
	
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if menuOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

function OpenBuyLicenseMenu(licenseName)
	menuOpen = true
	local license = Config.LicensePrices[licenseName]

	local elements = {
		{
			label = _U('license_no'),
			value = 'no'
		},

		{
			label = ('%s - <span style="color:green;">%s</span>'):format(license.label, _U('dealer_item', ESX.Math.GroupDigits(license.price))),
			value = licenseName,
			price = license.price,
			licenseName = license.label
		}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'license_shop', {
		title    = _U('license_title'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value ~= 'no' then
			ESX.TriggerServerCallback('esx_illegal:buyLicense', function(boughtLicense)
				if boughtLicense then
					ESX.ShowNotification(_U('license_bought', data.current.licenseName, ESX.Math.GroupDigits(data.current.price)))
				else
					ESX.ShowNotification(_U('license_bought_fail', data.current.licenseName))
				end
			end, data.current.value)
		else
			menu.close()
		end

	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

--[[function CreateBlipCircle(coords, text, radius, color, sprite)	
	local blip = AddBlipForRadius(coords, radius)
	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 1)
	SetBlipAlpha (blip, 128)
	-- create a blip in the middle
	blip = AddBlipForCoord(coords)
	SetBlipHighDetail(blip, true)
	SetBlipSprite (blip, sprite)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, color)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end
Citizen.CreateThread(function()
	for k,zone in pairs(Config.CircleZones) do
		CreateBlipCircle(zone.coords, zone.name, zone.radius, zone.color, zone.sprite)
	end
end)]]