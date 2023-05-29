-- SCRIPT HECHO POR AGUSTINBN

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

ESX                             = nil
local PlayerData                = {}
local GUI                       = {}
GUI.Time                        = 0
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local onDuty                    = false
local BlipCloakRoom             = nil
local BlipVehicle               = nil
local BlipVehicleDeleter		= nil
local Blips                     = {}
local OnJob                     = false
local Done 						= false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
	onDuty = false
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
	onDuty = false
end)

function SelectPool()
    local index = GetRandomIntInRange(1,  #Config.Pool)

    for k,v in pairs(Config.Zones) do
      if v.Pos.x == Config.Pool[index].x and v.Pos.y == Config.Pool[index].y and v.Pos.z == Config.Pool[index].z then
        return k
      end
    end
end

function StartNPCJob()
    NPCTargetPool     = SelectPool()
    local zone            = Config.Zones[NPCTargetPool]

    Blips['NPCTargetPool'] = AddBlipForCoord(zone.Pos.x,  zone.Pos.y,  zone.Pos.z)
    SetBlipRoute(Blips['NPCTargetPool'], true)
    Done = true
end

function StopNPCJob(cancel)

    if Blips['NPCTargetPool'] ~= nil then
      RemoveBlip(Blips['NPCTargetPool'])
      Blips['NPCTargetPool'] = nil
	end

	OnJob = false

    if cancel then
	  exports['mythic_notify']:SendAlert('inform', 'Cancelaste el trabajo.')
	else
		TriggerServerEvent('esx_edenor:recibirpago')
		StartNPCJob()
		Done = true
	end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(6)

        if NPCTargetPool ~= nil then

            local coords = GetEntityCoords(GetPlayerPed(-1))
            local zone   = Config.Zones[NPCTargetPool]
            local playerPed = GetPlayerPed(-1)

           	if GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < 3 then

                DrawText3D(zone.Pos.x, zone.Pos.y, zone.Pos.z, "[E] - Inpeccionar")

                if IsControlJustReleased(1, Keys["E"]) and PlayerData.job ~= nil then
                    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_POLICE_INVESTIGATE", 0, true)
                    exports['progressBars']:startUI(12000, "Buscando la falla...")
					Wait(12000)
                    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
                    Wait(17000)
                    StopNPCJob()
                    Wait(3000)
                    ClearPedTasksImmediately(playerPed)
                    Done = false
                end
            end
        end
    end
end)

-- Activar menu cuando esta en el marker

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
			
			local pos = GetEntityCoords(PlayerPedId(-1))
			local trabajo = #(GetEntityCoords(PlayerPedId()) - vector3(2463.54,-320.37, 93.09))
		    local borrar = #(GetEntityCoords(PlayerPedId()) - vector3(2485.61,-328.41,93.09))
				  
						if trabajo < 5 then
			DrawMarker(20, 2463.54, -320.37, 92.60, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 0, 255, 0, 100, false, true, 2, false, false, false, false)
			if trabajo > 1.4 then		
				DrawText3D(2463.54,-320.37, 93.09, 'Menu Trabajo')
			elseif trabajo <= 1.39 then
				DrawText3D(2463.54,-320.37, 93.09, '~g~E~w~ - Menu Trabajo')
			end
				    if IsControlJustReleased(0, 38) then
					  	MenuTrabajo()
				    end
				  
		elseif borrar < 10  and IsPedInAnyVehicle(GetPlayerPed(-1), false) and OnJob then
			DrawMarker(20,2485.61, -328.41, 92.60, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 0, 255, 0, 100, false, true, 2, false, false, false, false)
			if borrar > 2 then
				DrawText3D(2485.61,-328.41,93.09, 'Guardar Vehiculo')
			elseif borrar < 1.9 then
				DrawText3D(2485.61,-328.41,93.09, '~g~E~w~ - Guardar Vehiculo')
			end
			if IsControlJustReleased(0, Keys["E"]) then
			    if PlayerData.job ~= nil and PlayerData.job.name == 'edenor' then
					TriggerEvent('esx:deleteVehicle')
					exports['mythic_notify']:SendAlert('inform', 'Gracias por devolver el vehiculo')
					OnJob = false
				end
			end
		else
			Citizen.Wait(300)
		end
	end
end)

function MenuTrabajo()
    local elements = {
        {label = 'Pedir Empleo', value = 'contratar'}
    
    }
    
    if PlayerData.job ~= nil and PlayerData.job.name == 'edenor' then
        table.insert(elements, {label = 'Iniciar Trabajo ($200)', value = 'iniciar'})
    end

    ESX.UI.Menu.CloseAll()
    
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu',
    {
        title       = ('Menu'),
        align       = 'right',
        elements = elements
    }, function(data, menu)
    
        if data.current.value == 'contratar' then
            TriggerServerEvent('esx_edenor:setJob')
            exports['mythic_notify']:SendAlert('inform', 'Tienes un empleo nuevo')
        
        elseif data.current.value == 'iniciar' then
		ESX.TriggerServerCallback('esx_edenor:cartera', function(tienedinero)
				if tienedinero then
					TriggerServerEvent('esx_edenor:pagar')
				else
					exports['mythic_notify']:SendAlert('error', 'No tienes para la renta')
				end
			end)
		end
    menu.close()
    end, function(data, menu)
        menu.close()
    end)
end

-- Crear Blips
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(2463.48,-320.44,93.09)

	SetBlipSprite (blip, 459)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.65)
	SetBlipColour (blip, 1)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Negocio - Edenor')
	EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent('esx_edenor:trabajo')
AddEventHandler('esx_edenor:trabajo', function(job)
	local ped = GetPlayerPed(-1)

	ESX.Game.SpawnVehicle(Config.Vehiculo, vector3(2488.92,-321.20,92.99), 1.69, function(veh)
		exports['LegacyFuel']:SetFuel(veh, 100.0)
		TaskWarpPedIntoVehicle(ped, veh, -1)
		SetVehicleEngineOn(veh, true, true)
	end)
	StartNPCJob()
	OnJob = true


end)

function DrawText3D(x, y, z, text)
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
	DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0 ,0,75)
	ClearDrawOrigin()
end
