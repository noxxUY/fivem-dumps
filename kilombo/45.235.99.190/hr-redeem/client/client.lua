--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
local notify = false

--================================================================================================
--==   vvvvvvvvvvvvvvvvvvvvvvvvvvv  EVENTS - DO NOT EDIT  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv     ==
--================================================================================================
AddEventHandler('esx:playerLoaded', function(xPlayer)
	TriggerServerEvent("free:updateTimeout")
end)

RegisterNetEvent("free:toggleFreeMenu")
AddEventHandler("free:toggleFreeMenu", function(state)
	SetNuiFocus(state, state)
	SendNUIMessage({type = "toggleshow", enable = state})
end)

RegisterNetEvent("free:toggleRuleta")
AddEventHandler("free:toggleRuleta", function(state)
	SetNuiFocus(state, state)
	SendNUIMessage({type = "ruleta", enable = state})
end)


RegisterNUICallback("ruleta_prueba", function(data, cb)

	local vip = exports['hr-redeem']:isVIP()

	if vip then 
		SetNuiFocus(true, true)
		SendNUIMessage({type = "ruletaToggle", enable = true})
	else
		exports['okokNotify']:Alert("Servidor", "Tenes que ser VIP para usar la ruleta.", 6500, "error")
	end

end)

RegisterNetEvent("free:setTimeout")
AddEventHandler("free:setTimeout", function(t)
	SendNUIMessage({type = "settimeout", timeout = tonumber(t * 1000)})
end)

RegisterNetEvent("free:giveWpn")
AddEventHandler("free:giveWpn", function(wpn,ammo)
	local ped = PlayerPedId()
	wpn = GetHashKey(wpn)
	if HasPedGotWeapon(ped, wpn, false) then AddAmmoToPed(ped, wpn, ammo) else GiveWeaponToPed(ped, wpn, ammo, false, false) end
end)

RegisterNUICallback("hidemenu", function(data, cb)
	TriggerEvent("free:toggleFreeMenu", false)
end)

RegisterNUICallback("collect", function(data, cb)
 	TriggerServerEvent("free:collect", data.t, data.modelo)
end)

RegisterNUICallback("obtengoCoche", function(data)
	query = data
	Citizen.Wait(7500)
	TriggerServerEvent("free:collect", query.t, data.modelo, GeneratePlate())
	-- exports['okokNotify']:Alert("Servidor", "Ganaste un ["..query.coche.."] "..query.modelo.." ", 4500, "error")
end)

Citizen.CreateThread(function()
	TriggerServerEvent("free:updateTimeout")
	while true do
		Citizen.Wait(600000)
		TriggerServerEvent("free:updateTimeout") -- update timeout every 10 minutes because why not
	end
end)


--================================================================================================
--==    ^^^^^^^^^^^^^^^^^^^^^^^^^^  EVENTS - DO NOT EDIT   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^       ==
--================================================================================================

-- GENERAR MATRICULA BOOSTERS


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

		ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function(isPlateTaken)
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

function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end


RegisterNUICallback("hr-vipsystem:codeRedeem",function(data)
    query = data
    TriggerServerEvent("hr-redeem:queryCode", query, GeneratePlate())
    SetDisplay(false)
end)

RegisterNetEvent("hr-vipsystem:sendNUIdata")
AddEventHandler("hr-vipsystem:sendNUIdata", function(data)
    display = false
    SetNuiFocus(true, true)
	SendNUIMessage({type = "toggleshow", enable = true})
end)

--very important cb 
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)

RegisterNetEvent("codehook:errorSound")
AddEventHandler("codehook:errorSound", function()
    PlaySound(-1, "5_Second_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0, 0, 1)
end)

RegisterNetEvent("codehook:successSound")
AddEventHandler("codehook:successSound", function()
    PlaySound(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
end)


RegisterNUICallback("error", function(data)
    -- chat("^7[^1HR-VipSystem^7]^2 You have not entered a code.", {0,255,0})

        exports.pNotify:SendNotification({
            text = "You have not entered a code",
            type = "error",
            timeout = 5000,
            layout = "centerRight",
            queue = "not_code"
        })
        TriggerEvent("codehook:errorSound")
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		SetDisplay(false)
	end
end)


-- Crear suggestions en chat para los comandos
AddEventHandler('onClientResourceStart', function (resourceName)
    if (GetCurrentResourceName() == resourceName) then
        TriggerEvent('chat:addSuggestion', '/vipcode', 'Crear un código VIP.', {
            { name="tipo", help="Tipo de código (platinum, ruby | platinumP, rubyP)." }
        })
        TriggerEvent('chat:addSuggestion', '/canjear', 'Canjear un código VIP.', {
        })
    end
end)

-- Recargo las sugerencias OnStop
AddEventHandler('onClientResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        TriggerEvent('chat:removeSuggestion', '/vipcode')
        TriggerEvent('chat:removeSuggestion', '/redeem')
    end
end)

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end
































-- AV VIP






























local vip, nivel, vencimiento

AddEventHandler('esx:onPlayerSpawn', function()
    TriggerServerEvent('homer_vip:server:spawn')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if NetworkIsSessionStarted() then
            TriggerServerEvent('homer_vip:server:spawn')
            break
        end
    end
end)

RegisterNetEvent('homer_vip:spawn')
AddEventHandler('homer_vip:spawn', function(data)
	vip = data.vip
	nivel = data.level
	vencimiento = data.expiration
end)

RegisterCommand(Config.vipCommand, function()
	if isVIP() then
		local msg1 = Config.Lang['vip_active']..vencimiento
		local msg2 = Config.Lang['vip_level']..nivel
		local type = 'success'
		TriggerEvent('homer_vip:notification',type,msg1)
		TriggerEvent('homer_vip:notification',type,msg2)
        if nivel == 1 then
            exports['okokNotify']:Alert("SERVIDOR", 'Tu rango es: <span style="color:blue;">Platinum Mensual</span>.', 5500, 'info')
        end
        if nivel == 2 then
            exports['okokNotify']:Alert("SERVIDOR", 'Tu rango es: <span style="color:blue;">Platinum Permanente</span>.', 5500, 'info')
        end
        if nivel == 3 then
            exports['okokNotify']:Alert("SERVIDOR", 'Tu rango es: <span style="color:red;">Ruby Mensual</span>.', 5500, 'info')
        end
        if nivel == 4 then
            exports['okokNotify']:Alert("SERVIDOR", 'Tu rango es: <span style="color:red;">Ruby Permanente</span>.', 5500, 'info')
        end
	else
        exports['okokNotify']:Alert("SERVIDOR", Config.Lang['vip_notfound'], 5500, 'error')
	end
end)

function isVIP()
	return vip
end

function Level()
	return nivel
end

TriggerEvent('chat:addSuggestion', '/'..Config.vipCommand, 'Verificar el estado de tu VIP', {})

TriggerEvent('chat:addSuggestion', '/'..Config.Command, 'Redeem a VIP Code', {
    { name="Code", help="Paste your code here" }
})

exports("isVIP", isVIP)
exports("Level", Level)
