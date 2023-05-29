local menuopen = false
local DrawDistance = 50.0
local donationsfinish = false
local this_Garage             = {}

--Aca probamos la nueva funciona como Policias para optimizar
local HasAlreadyEnteredMarker = false
local LastZone
local CurrentAction
local CurrentActionMsg        = ''
local CurrentCoords = nil
local PlayerData              = {}
local bases = {}
local pongoblip = false
--local broyale = false


ESX = nil

Citizen.CreateThread(function()
	
	while not NetworkIsSessionStarted() do 
        Wait(250)
    end
	
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(250)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(250)
	end
	
	PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent('tm1_mafias:reload')
AddEventHandler('tm1_mafias:reload',function(basess)
	bases = basess
	while bases == nil do
		Citizen.Wait(250)
	end
	local blip = AddBlipForCoord(bases[1].inventory.x, bases[1].inventory.y)
	SetBlipSprite (blip, 630)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, 1)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(group.name)
	EndTextCommandSetBlipName(blip)
	Start()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

radios = {
	banda1 = 20,
	banda2 = 21,
	banda3 = 22,
	banda4 = 23,
	banda5 = 24,
	banda6 = 25,
	banda7 = 26,
	banda8 = 27,
	banda9 = 28,
	banda10 = 29,
	banda11 = 30,
	banda12 = 31,
	banda13 = 32,
	banda14 = 33,
	mafia1 = 34,
	mafia2 = 35,
	mafia3 = 36,
	mafia4 = 37,
	mafia5 = 38,
	mafia6 = 39,
	mafia7 = 40,
	mafia8 = 41,
	mafia9 = 42,
	mafia10 = 43,
	mafia11 = 44,
	mafia12 = 45,
	mafia13 = 46,
	mafia14 = 47,
	flia1 = 48,
	flia2 = 49,
	flia3 = 50,
	flia4 = 51,
	flia5 = 52,
	flia6 = 53,
	flia7 = 54,
	flia8 = 55,
	flia9 = 56,
	flia10= 57,
	flia11= 58,
	flia12=59,
	flia13=60,
	mafia15 = 61,
	mafia16 = 62,
	banda15 = 63,
	banda16 = 64,
	flia14 = 65
}

local armas_pfa = {
	armas_si = {
		`WEAPON_UNARMED`,
		`WEAPON_PISTOL`,
		`WEAPON_PISTOL50`,
		`WEAPON_SNSPISTOL`,
		`WEAPON_BAT`,
		`WEAPON_MACHETE`,
		`WEAPON_SWITCHBLADE`,
		`WEAPON_ASSAULTSMG`,
		`WEAPON_COMBATPISTOL`,
		`WEAPON_NIGHTSTICK`,
		`WEAPON_STUNGUN`,
		`WEAPON_FLASHLIGHT`,
		`WEAPON_FIREEXTINGUISHER`,
		`WEAPON_FLAREGUN`,
		`WEAPON_PUMPSHOTGUN`,
		`WEAPON_SMOKEGRENADE`,
		`WEAPON_FLARE`,
		`WEAPON_CARBINERIFLE`,
		`GADGET_PARACHUTE`,
		`WEAPON_HEAVYPISTOL`,
		`WEAPON_CARBINERIFLE_MK2`,
		`WEAPON_HEAVYSNIPER`,
		`WEAPON_KNIFE`,
		`WEAPON_CROWBAR`,
	},
	armas_no = {
		`WEAPON_APPISTOL`,
		`WEAPON_MACHINEPISTOL`,
		`WEAPON_MICROSMG`,
		`WEAPON_SMG`,
		`WEAPON_ASSAULTRIFLE`,
		`WEAPON_GUSENBERG`,
		`WEAPON_SAWNOFFSHOTGUN`,
		`WEAPON_ASSAULTRIFLE_MK2`,
		`WEAPON_SPECIALCARBINE`,
		`WEAPON_BULLPUPRIFLE`,
		`WEAPON_DOUBLEACTION`,
		`WEAPON_SNIPERRIFLE`,
	}
}

local armas_gna = {
	armas_si = {
		`WEAPON_UNARMED`,
		`WEAPON_PISTOL`,
		`WEAPON_PISTOL50`,
		`WEAPON_SNSPISTOL`,
		`WEAPON_BAT`,
		`WEAPON_MACHETE`,
		`WEAPON_SWITCHBLADE`,
		`WEAPON_ASSAULTSMG`,
		`WEAPON_COMBATPISTOL`,
		`WEAPON_NIGHTSTICK`,
		`WEAPON_STUNGUN`,
		`WEAPON_FLASHLIGHT`,
		`WEAPON_FIREEXTINGUISHER`,
		`WEAPON_FLAREGUN`,
		`WEAPON_PUMPSHOTGUN`,
		`WEAPON_SMOKEGRENADE`,
		`WEAPON_FLARE`,
		`WEAPON_CARBINERIFLE`,
		`GADGET_PARACHUTE`,
		`WEAPON_HEAVYPISTOL`,
		`WEAPON_CARBINERIFLE_MK2`,
		`WEAPON_HEAVYSNIPER`,
		`WEAPON_KNIFE`,
		`WEAPON_CROWBAR`,
	},
	armas_no = {
		`WEAPON_APPISTOL`,
		`WEAPON_MACHINEPISTOL`,
		`WEAPON_MICROSMG`,
		`WEAPON_SMG`,
		`WEAPON_ASSAULTRIFLE`,
		`WEAPON_GUSENBERG`,
		`WEAPON_SAWNOFFSHOTGUN`,
		`WEAPON_ASSAULTRIFLE_MK2`,
		`WEAPON_SPECIALCARBINE`,
		`WEAPON_BULLPUPRIFLE`,
		`WEAPON_DOUBLEACTION`,
		`WEAPON_SNIPERRIFLE`,
	}
}

local armas_psg = {
	armas_si = {
		`WEAPON_UNARMED`,
		`WEAPON_PISTOL`,
		`WEAPON_PISTOL50`,
		`WEAPON_SNSPISTOL`,
		`WEAPON_BAT`,
		`WEAPON_MACHETE`,
		`WEAPON_SWITCHBLADE`,
		`WEAPON_APPISTOL`,
		`WEAPON_COMBATPISTOL`,
		`WEAPON_NIGHTSTICK`,
		`WEAPON_STUNGUN`,
		`WEAPON_PUMPSHOTGUN`,
		`WEAPON_SMOKEGRENADE`,
		`WEAPON_ASSAULTSMG`,
		`WEAPON_CARBINERIFLE`,
		`GADGET_PARACHUTE`,
		`WEAPON_CARBINERIFLE_MK2`,
		`WEAPON_HEAVYSNIPER`,
		`WEAPON_KNIFE`,
		`WEAPON_CROWBAR`,
	},
	armas_no = {
		`WEAPON_FLASHLIGHT`,
		`WEAPON_FIREEXTINGUISHER`,
		`WEAPON_FLAREGUN`,
		`WEAPON_FLARE`,
		`WEAPON_HEAVYPISTOL`,
		`WEAPON_MACHINEPISTOL`,
		`WEAPON_MICROSMG`,
		`WEAPON_SMG`,
		`WEAPON_ASSAULTRIFLE`,
		`WEAPON_GUSENBERG`,
		`WEAPON_SAWNOFFSHOTGUN`,
		`WEAPON_ASSAULTRIFLE_MK2`,
		`WEAPON_SPECIALCARBINE`,
		`WEAPON_BULLPUPRIFLE`,
		`WEAPON_DOUBLEACTION`,
		`WEAPON_SNIPERRIFLE`,
	}
}

local armas_banda = {
	armas_si = {
		`WEAPON_UNARMED`,
		`WEAPON_SWITCHBLADE`,
		`WEAPON_MACHETE`,
		`WEAPON_HEAVYPISTOL`,
		`WEAPON_BAT`,
		`WEAPON_PISTOL`,
		`WEAPON_PISTOL50`,
		`WEAPON_MACHINEPISTOL`,
		`WEAPON_MICROSMG`,
		`WEAPON_SMG`,
		`GADGET_PARACHUTE`,
		`WEAPON_SNSPISTOL`,
		`WEAPON_KNIFE`,
		`WEAPON_CROWBAR`,	
	},
	armas_no = {
		`WEAPON_ASSAULTSMG`,
		`WEAPON_COMBATPISTOL`,
		`WEAPON_NIGHTSTICK`,
		`WEAPON_STUNGUN`,
		`WEAPON_FLASHLIGHT`,
		`WEAPON_FIREEXTINGUISHER`,
		`WEAPON_FLAREGUN`,
		`WEAPON_PUMPSHOTGUN`,
		`WEAPON_SMOKEGRENADE`,
		`WEAPON_FLARE`,
		`WEAPON_CARBINERIFLE`,
		`WEAPON_CARBINERIFLE_MK2`,
		`WEAPON_HEAVYSNIPER`,
		`WEAPON_APPISTOL`,
		`WEAPON_ASSAULTRIFLE`,
		`WEAPON_GUSENBERG`,
		`WEAPON_SAWNOFFSHOTGUN`,
		`WEAPON_ASSAULTRIFLE_MK2`,
		`WEAPON_SPECIALCARBINE`,
		`WEAPON_BULLPUPRIFLE`,
		`WEAPON_DOUBLEACTION`,
		`WEAPON_SNIPERRIFLE`,
	}
}

local armas_mafia = {
	armas_si = {
		`WEAPON_UNARMED`,
		`WEAPON_SWITCHBLADE`,
		`WEAPON_MACHETE`,
		`WEAPON_HEAVYPISTOL`,
		`WEAPON_BAT`,
		`WEAPON_PISTOL`,
		`WEAPON_PISTOL50`,
		`WEAPON_MACHINEPISTOL`,
		`WEAPON_MICROSMG`,
		`WEAPON_SMG`,
		`WEAPON_ASSAULTRIFLE`,
		`WEAPON_GUSENBERG`,
		`GADGET_PARACHUTE`,
		`WEAPON_SAWNOFFSHOTGUN`,
		`WEAPON_ASSAULTRIFLE_MK2`,
		`WEAPON_SNSPISTOL`,
		`WEAPON_DOUBLEACTION`,
		`WEAPON_KNIFE`,
		`WEAPON_CROWBAR`,
	},
	armas_no = {
		`WEAPON_ASSAULTSMG`,
		`WEAPON_COMBATPISTOL`,
		`WEAPON_NIGHTSTICK`,
		`WEAPON_STUNGUN`,
		`WEAPON_FLASHLIGHT`,
		`WEAPON_FIREEXTINGUISHER`,
		`WEAPON_FLAREGUN`,
		`WEAPON_PUMPSHOTGUN`,
		`WEAPON_SMOKEGRENADE`,
		`WEAPON_FLARE`,
		`WEAPON_CARBINERIFLE`,
		`WEAPON_CARBINERIFLE_MK2`,
		`WEAPON_HEAVYSNIPER`,
		`WEAPON_APPISTOL`,
		`WEAPON_SPECIALCARBINE`,
		`WEAPON_BULLPUPRIFLE`,
		`WEAPON_SNIPERRIFLE`,
	}
}

local armas_cartel = {
	armas_si = {
		`WEAPON_UNARMED`,
		`WEAPON_SWITCHBLADE`,
		`WEAPON_MACHETE`,
		`WEAPON_HEAVYPISTOL`,
		`WEAPON_BAT`,
		`WEAPON_PISTOL`,
		`WEAPON_PISTOL50`,
		`WEAPON_MACHINEPISTOL`,
		`WEAPON_MICROSMG`,
		`WEAPON_SMG`,
		`WEAPON_ASSAULTRIFLE`,
		`WEAPON_GUSENBERG`,
		`GADGET_PARACHUTE`,
		`WEAPON_SAWNOFFSHOTGUN`,
		`WEAPON_ASSAULTRIFLE_MK2`,
		`WEAPON_SPECIALCARBINE`,
		`WEAPON_BULLPUPRIFLE`,
		`WEAPON_SNSPISTOL`,
		`WEAPON_DOUBLEACTION`,
		`WEAPON_SNIPERRIFLE`,
		--`WEAPON_CARBINERIFLE_MK2`,
		`WEAPON_KNIFE`,
		`WEAPON_CROWBAR`,
	},
	armas_no = {
		`WEAPON_ASSAULTSMG`,
		`WEAPON_COMBATPISTOL`,
		`WEAPON_NIGHTSTICK`,
		`WEAPON_STUNGUN`,
		`WEAPON_FLASHLIGHT`,
		`WEAPON_FIREEXTINGUISHER`,
		`WEAPON_FLAREGUN`,
		`WEAPON_PUMPSHOTGUN`,
		`WEAPON_SMOKEGRENADE`,
		`WEAPON_FLARE`,
		`WEAPON_CARBINERIFLE`,
		`WEAPON_HEAVYSNIPER`,
		`WEAPON_APPISTOL`,
	}
}

local armas_civil = {
	armas_si = {
		`WEAPON_UNARMED`,
		`WEAPON_PISTOL`,
		`WEAPON_PISTOL50`,
		`WEAPON_SNSPISTOL`,
		`WEAPON_BAT`,
		`WEAPON_MACHETE`,
		`WEAPON_SWITCHBLADE`,
		`WEAPON_KNIFE`,
		`WEAPON_CROWBAR`,
		`WEAPON_MACHINEPISTOL`,
	},
	armas_no = {
		`WEAPON_ASSAULTSMG`,
		`WEAPON_COMBATPISTOL`,
		`WEAPON_NIGHTSTICK`,
		`WEAPON_STUNGUN`,
		`WEAPON_FLASHLIGHT`,
		`WEAPON_FIREEXTINGUISHER`,
		`WEAPON_FLAREGUN`,
		`WEAPON_PUMPSHOTGUN`,
		`WEAPON_SMOKEGRENADE`,
		`WEAPON_FLARE`,
		`WEAPON_CARBINERIFLE`,
		`GADGET_PARACHUTE`,
		`WEAPON_HEAVYPISTOL`,
		`WEAPON_CARBINERIFLE_MK2`,
		`WEAPON_HEAVYSNIPER`,
		`WEAPON_APPISTOL`,
		--`WEAPON_MACHINEPISTOL`,
		`WEAPON_MICROSMG`,
		`WEAPON_SMG`,
		`WEAPON_ASSAULTRIFLE`,
		`WEAPON_GUSENBERG`,
		`WEAPON_SAWNOFFSHOTGUN`,
		`WEAPON_ASSAULTRIFLE_MK2`,
		`WEAPON_SPECIALCARBINE`,
		`WEAPON_BULLPUPRIFLE`,
		`WEAPON_DOUBLEACTION`,
		`WEAPON_SNIPERRIFLE`,
	}
}

local armas_transito = {
	armas_si = {
		`WEAPON_UNARMED`,
		`WEAPON_PISTOL`,
		`WEAPON_PISTOL50`,
		`WEAPON_SNSPISTOL`,
		`WEAPON_BAT`,
		`WEAPON_MACHETE`,
		`WEAPON_SWITCHBLADE`,
		`WEAPON_STUNGUN`,
		`WEAPON_KNIFE`,
		`WEAPON_CROWBAR`,
	},
	armas_no = {
		`WEAPON_ASSAULTSMG`,
		`WEAPON_COMBATPISTOL`,
		`WEAPON_NIGHTSTICK`,
		`WEAPON_FLASHLIGHT`,
		`WEAPON_FIREEXTINGUISHER`,
		`WEAPON_FLAREGUN`,
		`WEAPON_PUMPSHOTGUN`,
		`WEAPON_SMOKEGRENADE`,
		`WEAPON_FLARE`,
		`WEAPON_CARBINERIFLE`,
		`GADGET_PARACHUTE`,
		`WEAPON_HEAVYPISTOL`,
		`WEAPON_CARBINERIFLE_MK2`,
		`WEAPON_HEAVYSNIPER`,
		`WEAPON_APPISTOL`,
		`WEAPON_MACHINEPISTOL`,
		`WEAPON_MICROSMG`,
		`WEAPON_SMG`,
		`WEAPON_ASSAULTRIFLE`,
		`WEAPON_GUSENBERG`,
		`WEAPON_SAWNOFFSHOTGUN`,
		`WEAPON_ASSAULTRIFLE_MK2`,
		`WEAPON_SPECIALCARBINE`,
		`WEAPON_BULLPUPRIFLE`,
		`WEAPON_DOUBLEACTION`,
		`WEAPON_SNIPERRIFLE`,
	}
}

local armas_todas = {
	`WEAPON_UNARMED`,
	`WEAPON_PISTOL`,
	`WEAPON_PISTOL50`,
	`WEAPON_SNSPISTOL`,
	`WEAPON_BAT`,
	`WEAPON_MACHETE`,
	`WEAPON_SWITCHBLADE`,
	`WEAPON_ASSAULTSMG`,
	`WEAPON_COMBATPISTOL`,
	`WEAPON_NIGHTSTICK`,
	`WEAPON_STUNGUN`,
	`WEAPON_FLASHLIGHT`,
	`WEAPON_FIREEXTINGUISHER`,
	`WEAPON_FLAREGUN`,
	`WEAPON_PUMPSHOTGUN`,
	`WEAPON_SMOKEGRENADE`,
	`WEAPON_FLARE`,
	`WEAPON_CARBINERIFLE`,
	`GADGET_PARACHUTE`,
	`WEAPON_HEAVYPISTOL`,
	`WEAPON_CARBINERIFLE_MK2`,
	`WEAPON_HEAVYSNIPER`,
	`WEAPON_APPISTOL`,
	`WEAPON_MACHINEPISTOL`,
	`WEAPON_MICROSMG`,
	`WEAPON_SMG`,
	`WEAPON_ASSAULTRIFLE`,
	`WEAPON_GUSENBERG`,
	`WEAPON_SAWNOFFSHOTGUN`,
	`WEAPON_ASSAULTRIFLE_MK2`,
	`WEAPON_SPECIALCARBINE`,
	`WEAPON_BULLPUPRIFLE`,
	`WEAPON_DOUBLEACTION`,
	`WEAPON_SNIPERRIFLE`,
	`WEAPON_KNIFE`,
	`WEAPON_CROWBAR`,
}


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)
		local ped = PlayerPedId()
		if not broyale and PlayerData.job ~= nil then
			if PlayerData.job.name == 'police' then
				for k, v in ipairs(armas_pfa['armas_si']) do
					SetCanPedEquipWeapon(ped, v, true)
				end
				for k, v in ipairs(armas_pfa['armas_no']) do
					if GetSelectedPedWeapon(ped) == v  then
						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
					end
					SetCanPedEquipWeapon(ped, v, false)
				end
			elseif PlayerData.job.name == 'transito' then
				for k, v in ipairs(armas_transito['armas_si']) do
					SetCanPedEquipWeapon(ped, v, true)
				end
				for k, v in ipairs(armas_transito['armas_no']) do
					if GetSelectedPedWeapon(ped) == v  then
						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
					end
					SetCanPedEquipWeapon(ped, v, false)
				end
			elseif PlayerData.job.name == 'fbi' then
				for k, v in ipairs(armas_pfa['armas_si']) do
					SetCanPedEquipWeapon(ped, v, true)
				end
				for k, v in ipairs(armas_pfa['armas_no']) do
					if GetSelectedPedWeapon(ped) == v  then
						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
					end
					SetCanPedEquipWeapon(ped, v, false)
				end
			elseif PlayerData.job.name == 'police2' then
				for k, v in ipairs(armas_pfa['armas_si']) do
					SetCanPedEquipWeapon(ped, v, true)
				end
				for k, v in ipairs(armas_pfa['armas_no']) do
					if GetSelectedPedWeapon(ped) == v  then
						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
					end
					SetCanPedEquipWeapon(ped, v, false)
				end
			elseif PlayerData.job.name == 'gendarme' then
				for k, v in ipairs(armas_gna['armas_si']) do
					SetCanPedEquipWeapon(ped, v, true)
				end
				for k, v in ipairs(armas_gna['armas_no']) do
					if GetSelectedPedWeapon(ped) == v  then
						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
					end
					SetCanPedEquipWeapon(ped, v, false)
				end
			elseif PlayerData.job.name == 'seguridad' then
				for k, v in ipairs(armas_psg['armas_si']) do
					SetCanPedEquipWeapon(ped, v, true)
				end
				for k, v in ipairs(armas_psg['armas_no']) do
					if GetSelectedPedWeapon(ped) == v  then
						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
					end
					SetCanPedEquipWeapon(ped, v, false)
				end
			else
				if group.enclosure then
					if group.aprove == 0 then
						for k, v in ipairs(armas_banda['armas_si']) do
							SetCanPedEquipWeapon(ped, v, true)
						end
						for k, v in ipairs(armas_banda['armas_no']) do
							if GetSelectedPedWeapon(ped) == v  then
								SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							end
							SetCanPedEquipWeapon(ped, v, false)
						end
					elseif group.aprove == 1 then
						for k, v in ipairs(armas_mafia['armas_si']) do
							SetCanPedEquipWeapon(ped, v, true)
						end
						for k, v in ipairs(armas_mafia['armas_no']) do
							if GetSelectedPedWeapon(ped) == v  then
								SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							end
							SetCanPedEquipWeapon(ped, v, false)
						end
					elseif group.aprove == 3 then			
						for k, v in ipairs(armas_cartel['armas_si']) do
							SetCanPedEquipWeapon(ped, v, true)
						end
						for k, v in ipairs(armas_cartel['armas_no']) do
							if GetSelectedPedWeapon(ped) == v  then
								SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							end
							SetCanPedEquipWeapon(ped, v, false)
						end
					else
						for k, v in ipairs(armas_civil['armas_si']) do
							SetCanPedEquipWeapon(ped, v, true)
						end
						for k, v in ipairs(armas_civil['armas_no']) do
							if GetSelectedPedWeapon(ped) == v  then
								SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							end
							SetCanPedEquipWeapon(ped, v, false)
						end
					end
				else
					--CIVIL
					for k, v in ipairs(armas_civil['armas_si']) do
						SetCanPedEquipWeapon(ped, v, true)
					end
					for k, v in ipairs(armas_civil['armas_no']) do
						if GetSelectedPedWeapon(ped) == v  then
							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
						end
						SetCanPedEquipWeapon(ped, v, false)
					end
				end
			end
		end
	end
end)

-- Enter / Exit marker events & Draw Markers
--Citizen.CreateThread(function()
function Start()
	exports["rp-radio"]:GivePlayerAccessToFrequency(radios[group.enclosure])
	while true do
		Citizen.Wait(0)
		if group.enclosure and bases then
		
			local playerCoords = GetEntityCoords(PlayerPedId())
			local isInMarker, letSleep, currentZone = false, true		

				for k,v in pairs(bases[1]) do
					if k ~= 'spawnCar' and k ~= 'helicopterSpawnPoint' and k ~= 'boteSpawn' and k ~= 'boteTP' then
						if v.x ~= 0 and v.y ~= 0 and v.z ~= 0 then
							local punto = vector3(v.x,v.y,v.z)
							local distance = #(playerCoords - punto)
							if distance < 20 then
								letSleep = false						
								DrawMarker(v.m, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 255, 0, 0, 100, false, true, 2, true, nil, nil, false)
								for i=1, #k, 1 do
									if k ~= 'helicopterDelete' and k ~= 'saveCar' and k ~= 'boteDelete' then
										if distance < 1 then
											isInMarker, currentZone = true, k
										end
									else
										if distance < 3 then
											isInMarker, currentZone = true, k
										end
									end
								end
							end
						end
					end
				end
			
			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker, LastZone = true, currentZone
				LastZone = currentZone
				TriggerEvent('tm1_mafias:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('tm1_mafias:hasExitedMarker', LastZone)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		end
	end
end

AddEventHandler('tm1_mafias:hasEnteredMarker', function(zone)
	if zone == 'weapon' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para comprar armas'
	elseif zone == 'inventory' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para abrir Inventario'
	elseif zone == 'garage' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para abrir Garage'
	elseif zone == 'saveCar' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para guardar el vehiculo!'
	elseif zone == 'helicopter' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para sacar Helicoptero!'
	elseif zone == 'helicopterDelete' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para guardar Helicoptero!'
	elseif zone == 'vestPoint' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para abrir guardaropas!'
	elseif zone == 'gotop' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para Subir'
	elseif zone == 'godown' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para Bajar'
	elseif zone == 'bote' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para abrir guarderia'
	elseif zone == 'boteDelete' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Presiona ~g~[E]~w~ para guardar Bote'
	end
end)

-- Exited Marker
AddEventHandler('tm1_mafias:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if CurrentAction and bases then
			--DrawText3D(Config.Zones[group.enclosure][CurrentAction].x, Config.Zones[group.enclosure][CurrentAction].y, Config.Zones[group.enclosure][CurrentAction].z + 1, CurrentActionMsg)
			DrawText3D(bases[1][CurrentAction].x, bases[1][CurrentAction].y, bases[1][CurrentAction].z + 1, CurrentActionMsg)
			local playerPed = GetPlayerPed(-1)
			
			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'weapon' then
					MenudeArmas()
				elseif CurrentAction == 'inventory' then
					MenuInventario()
				elseif CurrentAction == 'garage' then
					ListOwnedCarsMenu()
				elseif CurrentAction == 'saveCar' then
					if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
						StoreOwnedCarsMenu()
					else
						ESX.ShowNotification("No hay ningun coche para meter")
					end
				elseif CurrentAction == 'helicopter' then
					MenuHelicoptero()
				elseif CurrentAction == 'helicopterDelete' then
					GuardarHeli()
				elseif CurrentAction == 'vestPoint' then
					outfit()
				elseif CurrentAction == 'godown' then
					ESX.Game.Teleport(playerPed, bases[1].gotop, function()
						SetEntityHeading(playerPed, bases[1].gotop.w)
					end)
				elseif CurrentAction == 'gotop' then
					ESX.Game.Teleport(playerPed, bases[1].godown, function()
						SetEntityHeading(playerPed, bases[1].godown.w)
					end)
				elseif CurrentAction == 'bote' then
					ListOwnedBoatsMenu()
				elseif CurrentAction == 'boteDelete' then
					local vehicle = GetVehiclePedIsIn(playerPed, false)
					local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
					if IsPedInAnyBoat(playerPed) then
						DeleteEntity(vehicle)
						TriggerServerEvent('esx_advancedgarage:setVehicleState', vehicleProps.plate, true)		
						ESX.Game.Teleport(playerPed, bases[1].boteTP, function()
							SetEntityHeading(playerPed, bases[1].boteTP.w)
						end)
						ESX.ShowNotification('~g~BOTE GUARDADO!')
					else
						TriggerEvent('esx:showNotification', "No hay ningun BOTE para guardar!")
					end
				end
				CurrentAction = nil
			end
		else
			Citizen.Wait(500)	
		end
	end
end)

function GuardarHeli()
	local playerPed  = GetPlayerPed(-1)
	if IsPedInFlyingVehicle(playerPed,  false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetPedInVehicleSeat(vehicle, -1 ) == playerPed then
			local playerPed = GetPlayerPed(-1)
			local coords = GetEntityCoords(playerPed)
			local vehicle = GetVehiclePedIsIn(playerPed, false)
			local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
			local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
			local engineHealth = GetVehicleEngineHealth(current)
			local plate = vehicleProps.plate
			
			vehicleProps.fuelLevel = exports["LegacyFuel"]:GetFuel(vehicle)

			ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
				if valid then
					StoreVehicle(vehicle, vehicleProps)					
				elseif valid == 2 then
					DeleteEntity(vehicle)
				else
					ESX.ShowNotification('No eres dueño del Helicoptero!')
				end
			end, vehicleProps)
		else
			ESX.ShowNotification('~r~Tu no eres el Piloto!')
		end
	else
		ESX.ShowNotification('No hay ningun HELICOPTERO para guardar!')
	end
	--[[
	local playerPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	if IsPedInFlyingVehicle(playerPed) then
		DeleteEntity(vehicle)
	else
		TriggerEvent('esx:showNotification', "No hay ningun HELICOPTERO para guardar!")
	end
	]]--
end

function MenuHelicoptero()
	if group.aprove == 1 then
		local coords = vector3(bases[1].helicopterSpawnPoint.x,bases[1].helicopterSpawnPoint.y,bases[1].helicopterSpawnPoint.z)
		local ModelHash = `buzzard2` -- Use Compile-time hashes to get the hash of this model
		if not IsModelInCdimage(ModelHash) then return end
		RequestModel(ModelHash) -- Request the model
		while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			Citizen.Wait(10)
		end
		TriggerServerEvent('tm1_mafias:CrearAuto', ModelHash, coords, bases[1].helicopterSpawnPoint.w, group.enclosure..'B')
	elseif 	group.aprove == 3 then
		SpawnHelicoptero(bases[1].helicopterSpawnPoint)
	else
		ESX.Game.SpawnVehicle('swift2', bases[1].helicopterSpawnPoint, bases[1].helicopterSpawnPoint.w, function(callback_vehicle)
			SetVehRadioStation(callback_vehicle, "OFF")
			SetVehicleNumberPlateText(callback_vehicle, group.enclosure..'S')
			exports["esx_carlock"]:SetCamion(callback_vehicle)
			TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
		end)
	end	
end

function MenuInventario()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafia_inventory', {
		title    = "Inventario de mafia",
		align    = 'bottom-right',
		elements = {
			{label = "Depositar objetos",    value = 'deposit'},
			{label = "Retirar objetos", value = 'withdraw'},
			{label = "Retirar Armas", value = 'withdraw_armas'},
		}}, function(data, menu)
		
		if data.current.value == 'deposit' then
			OpenPutStocksMenu(group.enclosure)
		elseif data.current.value == 'withdraw' then
			OpenGetStocksMenu(group.enclosure)
		elseif data.current.value == 'withdraw_armas' then
			OpenGetStocksMenuArmas(group.enclosure)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function MenudeArmas()
	local elements = {
		{label = 'Comprar Armas', value = 'buy_blanco'}
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = 'Tienda Mafia',
			align    = 'bottom-right',
			elements = elements,
		}, function(data, menu)
		
		if data.current.value == 'buy_blanco' then
			OpenShopMenub(group.enclosure)
		elseif data.current.value == 'buy_negro' then
			OpenShopMenub2()
		end
	end, function(data, menu)
		menu.close()
	end)
end

--TERMINAMOS EL NUEVO SCRIPT PARA OPTIMIZAR


local pricesblack = {
	[1] = 7500,
  	[2] = 225000,
	[3] = 30000,
	[4] = 60000,
	[5] = 180000,
	[6] = 60000,
  	[7] = 90000,
	[8] = 3000,
	[9] = 105000,
	[10] = 120000,
	[11] = 120000,
	[12] = 10000,
	[13] = 150000,
	[14] = 75000,
	[15] = 3000,
	[16] = 4500
}

if donationsfinish == true then
	for i,c in pairs(Config.prices) do
		TriggerServerEvent("tm1_mafias:print",c)
		c = c * 0.5
	end
end

function getShopBanda()
	local shop = {
		{label = "Chaleco Nivel 2  - <span style='color:red;'>$15.000</span>", value = "kev2", money = Config.prices[4],whatItIs = "item"},
		{label = "Navaja - <span style='color:red;'>$8.000</span>", value= "WEAPON_SWITCHBLADE",money = 8000, whatItIs = "weapon"},
		{label = "Machete - <span style='color:red;'>$8.000</span>", value= "WEAPON_MACHETE",money = 8000, whatItIs = "weapon"},		
		{label = "Bate - <span style='color:red;'>$8.000</span>", value= "WEAPON_BAT",money = 8000, whatItIs = "weapon"},
		{label = "Cuchilla - <span style='color:red;'>$8.000</span>", value= "WEAPON_KNIFE",money = 8000, whatItIs = "weapon"},
		{label = "Ganzua - <span style='color:red;'>$8.000</span>", value= "WEAPON_CROWBAR",money = 8000, whatItIs = "weapon"},
		{label = "Pistola - <span style='color:red;'>$80.000</span>", value = "WEAPON_PISTOL", money = Config.prices[6],whatItIs = "weapon"},
		{label = "Pistola.50 - <span style='color:red;'>$110.000</span>", value = "WEAPON_PISTOL50", money = Config.prices[9],whatItIs = "weapon"},
		{label = "HEAVYPISTOL - <span style='color:red;'>$120.000</span>", value= "WEAPON_HEAVYPISTOL",money = Config.prices[10], whatItIs = "weapon"},
		{label = "Tec 9 - <span style='color:red;'>$120.000</span>", value="WEAPON_MACHINEPISTOL", money = Config.prices[5], whatItIs = "weapon"},
		{label = "MICRO SMG - <span style='color:red;'>$80.000</span>", value="WEAPON_MICROSMG", money = Config.prices[11], whatItIs = "weapon"},
		{label = "SMG - <span style='color:red;'>$110.000</span>", value = "WEAPON_SMG", money = Config.prices[9],whatItIs = "weapon"},
		{label = "Cargador  - <span style='color:red;'>$3.000</span>", value = "weaclip", money = Config.prices[16],whatItIs = "item"},
		{label = "Permiso Divisa %50  - <span style='color:red;'>$75.000</span>", value = "div2", money = Config.prices[14],whatItIs = "item"},
		{label = "BINOCULARES - <span style='color:red;'>$10.000</span>", value = "binoculars", money = Config.prices[3],whatItIs = "item"},
		{label = "Memoria USB - <span style='color:red;'>$10.000</span>", value = "usbstick", money = Config.prices[3],whatItIs = "item"},
	}
	return shop
end

function getShop()
	local shop = {
		{label = "Chaleco Nivel 2  - <span style='color:red;'>$15.000</span>", value = "kev2", money = Config.prices[4],whatItIs = "item"},
		{label = "Chaleco Nivel 3  - <span style='color:red;'>$20.000</span>", value = "kev3", money = Config.prices[7],whatItIs = "item"},
		{label = "Termita  - <span style='color:red;'>$5.000</span>", value = "thermite", money = 5000, whatItIs = "item"},
		{label = "Mascara Oxigeno  - <span style='color:red;'>$5.000</span>", value = "oxygenmask", money = 5000, whatItIs = "item"},
		{label = "Ganzúa Humane  - <span style='color:red;'>$5.000</span>", value = "humane_lockpick", money = 5000, whatItIs = "item"},
		{label = "Silenciador  - <span style='color:red;'>$2.000</span>", value = "silenciador", money = 2000,whatItIs = "item"},
		{label = "Skin de Arma  - <span style='color:red;'>$5.000</span>", value = "yusuf", money = Config.prices[1],whatItIs = "item"},
		{label = "Navaja - <span style='color:red;'>$8.000</span>", value= "WEAPON_SWITCHBLADE",money = 8000, whatItIs = "weapon"},
		{label = "Machete - <span style='color:red;'>$8.000</span>", value= "WEAPON_MACHETE",money = 8000, whatItIs = "weapon"},				
		{label = "Bate - <span style='color:red;'>$8.000</span>", value= "WEAPON_BAT",money = 8000, whatItIs = "weapon"},
		{label = "Cuchilla - <span style='color:red;'>$8.000</span>", value= "WEAPON_KNIFE",money = 8000, whatItIs = "weapon"},
		{label = "Ganzua - <span style='color:red;'>$8.000</span>", value= "WEAPON_CROWBAR",money = 8000, whatItIs = "weapon"},
		{label = "Pistola - <span style='color:red;'>$100.000</span>", value = "WEAPON_PISTOL", money = Config.prices[6],whatItIs = "weapon"},
		{label = "Pistola.50 - <span style='color:red;'>$130.000</span>", value = "WEAPON_PISTOL50", money = Config.prices[9],whatItIs = "weapon"},
		{label = "HEAVYPISTOL - <span style='color:red;'>$120.000</span>", value= "WEAPON_HEAVYPISTOL",money = Config.prices[10], whatItIs = "weapon"},
		{label = "Tec 9 - <span style='color:red;'>$120.000</span>", value="WEAPON_MACHINEPISTOL", money = Config.prices[5], whatItIs = "weapon"},
		{label = "MICRO SMG - <span style='color:red;'>$80.000</span>", value="WEAPON_MICROSMG", money = Config.prices[11], whatItIs = "weapon"},
		{label = "SMG - <span style='color:red;'>$110.000</span>", value = "WEAPON_SMG", money = Config.prices[9],whatItIs = "weapon"},
		{label = "Escopeta Recortada - <span style='color:red;'>$170.000</span>", value= "WEAPON_SAWNOFFSHOTGUN",money = Config.prices[13], whatItIs = "weapon"},
		{label = "AK-47 - <span style='color:red;'>$150.000</span>", value = "WEAPON_ASSAULTRIFLE", money = Config.prices[2],whatItIs = "weapon"},
		{label = "AK-47 MK2 - <span style='color:red;'>$180.000</span>", value = "WEAPON_ASSAULTRIFLE_MK2", money = 180000,whatItIs = "weapon"},
		{label = "GUSENBERG - <span style='color:red;'>$150.000</span>", value = "WEAPON_GUSENBERG", money = Config.prices[2],whatItIs = "weapon"},
		{label = "Paracaidas - <span style='color:red;'>$2.000</span>", value = "GADGET_PARACHUTE", money = Config.prices[15],whatItIs = "weapon"},
		{label = "Cargador  - <span style='color:red;'>$3.000</span>", value = "weaclip", money = Config.prices[16],whatItIs = "item"},
		--{label = "Bolsa Negra  - <span style='color:red;'>$2.000</span>", value = "headbag", money = Config.prices[8],whatItIs = "item"},
		{label = "Raspberry Banco Central - <span style='color:red;'>$5.000</span>", value = "raspberry", money = Config.prices[1],whatItIs = "item"},
		{label = "Notebook Banco Central  - <span style='color:red;'>$5.000</span>", value = "notebook", money = Config.prices[1],whatItIs = "item"},
		{label = "Soplete Banco Central  - <span style='color:red;'>$5.000</span>", value = "blowtorch", money = Config.prices[1],whatItIs = "item"}, --'<span style="color:red;">$' .. Config.prices[1] .. '</span>'
		{label = "Permiso Divisa %50  - <span style='color:red;'>$75.000</span>", value = "div2", money = Config.prices[14],whatItIs = "item"},
		{label = "BINOCULARES - <span style='color:red;'>$10.000</span>", value = "binoculars", money = Config.prices[3],whatItIs = "item"},
		{label = "Memoria USB - <span style='color:red;'>$10.000</span>", value = "usbstick", money = Config.prices[3],whatItIs = "item"},
		--{label = "Mascara FullFace - <span style='color:red;'>$2.500</span>", value = "humane_mask", money = 2500, whatItIs = "item"},
		--{label = "Alicate - <span style='color:red;'>$1.500</span>", value = "humane_pliers", money = 1500, whatItIs = "item"},
		
	}
	return shop
end

function getShopBlack()
	local shop = {
		{label = "Chaleco Nivel 1  - $"..pricesblack[3], value = "kev1", money = pricesblack[3],whatItIs = "item"},
		{label = "Chaleco Nivel 2  - $"..pricesblack[4], value = "kev2", money = pricesblack[4],whatItIs = "item"},
		{label = "Chaleco Nivel 3  - $"..pricesblack[7], value = "kev3", money = pricesblack[7],whatItIs = "item"},
		{label = "Navaja - $"..pricesblack[15], value= "WEAPON_SWITCHBLADE",money = pricesblack[15], whatItIs = "weapon"},
		{label = "Machete - $"..pricesblack[15], value= "WEAPON_MACHETE",money = pricesblack[15], whatItIs = "weapon"},
		{label = "HEAVYPISTOL - $"..pricesblack[10], value= "WEAPON_HEAVYPISTOL",money = pricesblack[10], whatItIs = "weapon"},
		--{label = "DOUBLE ACTION- $"..pricesblack[12], value= "WEAPON_DOUBLEACTION",money = pricesblack[12], whatItIs = "weapon"},
		{label = "Escopeta Recortada- $"..pricesblack[13], value= "WEAPON_SAWNOFFSHOTGUN",money = pricesblack[13], whatItIs = "weapon"},
		{label = "Bate - $"..pricesblack[15], value= "WEAPON_BAT",money = pricesblack[15], whatItIs = "weapon"},
		{label = "Pistola - $"..pricesblack[6], value = "WEAPON_PISTOL", money = pricesblack[6],whatItIs = "weapon"},
		{label = "Pistola.50 - $"..pricesblack[9], value = "WEAPON_PISTOL50", money = pricesblack[9],whatItIs = "weapon"},
		{label = "Revolver Pesado - $"..pricesblack[5], value = "WEAPON_REVOLVER", money = pricesblack[5],whatItIs = "weapon"},
		{label = "Tec 9 - $"..pricesblack[7], value="WEAPON_MACHINEPISTOL", money = pricesblack[7], whatItIs = "weapon"},
		{label = "SMG - $"..pricesblack[11], value="WEAPON_MICROSMG", money = pricesblack[11], whatItIs = "weapon"},
		{label = "AK-47 - $"..pricesblack[2], value = "WEAPON_ASSAULTRIFLE", money = pricesblack[2],whatItIs = "weapon"},
		--{label = "Francotirador - "..prices[1].."€", value = "WEAPON_SNIPERRIFLE", money = prices[1],whatItIs = "weapon"},
		{label = "Paracaidas - $"..pricesblack[15], value = "GADGET_PARACHUTE", money = pricesblack[15],whatItIs = "weapon"},
		{label = "Cargador  - $"..pricesblack[16], value = "weaclip", money = pricesblack[16],whatItIs = "item"},
		{label = "Bolsa Negra  - $"..pricesblack[8], value = "headbag", money = pricesblack[8],whatItIs = "item"},
		{label = "Raspberry  - $"..pricesblack[1], value = "raspberry", money = pricesblack[1],whatItIs = "item"},
		{label = "C4 Banco Central  - $"..pricesblack[1], value = "c4_bank", money = pricesblack[1],whatItIs = "item"},
		{label = "Soplete Banco Central  - $"..pricesblack[1], value = "blowtorch", money = pricesblack[1],whatItIs = "item"},
		{label = "Invitacion Carrera Ilegal  - $"..pricesblack[1], value = "multi_key", money = pricesblack[1],whatItIs = "item"},
		{label = "Permiso Divisa %50  - $"..pricesblack[14], value = "div2", money = pricesblack[14],whatItIs = "item"},
		{label = "Salir", whatItIs = "exit"}
	}
	return shop
end

local state = true
local seconds = 0
local isStarted = 0
local isIn = false
local isPosible = true

--===========
-- RECUPERAR DATOS SOBRE RECINTOS
--===========
AddEventHandler('playerSpawned', function(spawn)
	local enclosuresa = {}
	for _, info in pairs(Config.Zones) do
	    enclosuresa[_] = k     	
	end
	TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)
end)

--[[
local enclosuresa = {}

for _, info in pairs(Config.Zones) do
	enclosuresa[_] = k      	
end


TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)
]]--

RegisterNetEvent('tm1_mafias:puttedGroupsInEnclosures')
AddEventHandler('tm1_mafias:puttedGroupsInEnclosures',function()
	Citizen.CreateThread(function()
		local enclosuresa = {}
		for _, info in pairs(Config.Zones) do
	      	enclosuresa[_] = k     	
	    end
	    TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)
	end)
end)

--===========
-- AÑADIENDO DATOS A EL ENCLOUSERS
--===========
RegisterNetEvent('tm1_mafias:putGroupsInEnclosures')
AddEventHandler('tm1_mafias:putGroupsInEnclosures',function(enclosuresInfo)
	for i,v in pairs(enclosuresInfo) do
		for a,b in pairs(Config.Zones) do
			if v.name == a then
				b.owner = v.groupid
			end
		end
	end
	if isStarted == 1 then

	else
		--varReady()
		isStarted = 1
	end
	
end)

RegisterNetEvent('tm1_mafias:changeIsPosible')
AddEventHandler('tm1_mafias:changeIsPosible',function(isPosiblea)
	isPosible = isPosiblea
end)

--===========
-- BORRAR VEHÍCULO
--===========
RegisterNetEvent('tm1_mafias:clearV')
AddEventHandler('tm1_mafias:clearV',function(x,y,z)
	local vehicleu = GetClosestVehicle(x,y,z, 6.5, 0, 70)
	SetEntityAsMissionEntity( vehicleu, true, true )
	Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( vehicleu ) )
end)

--===========
-- HILO PRINCIPAL
--===========
function OpenWashedMenu()
	local elements = {
		{label = 'Lavar dinero', 	value = 'wash_money'},
		{label = 'No',			value = 'no'}
		}
		
		ESX.UI.Menu.CloseAll()
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wash', {
			title		= 'Menú de lavado de dinero',
			align		= 'bottom-right',
			elements	= elements
		}, function(data, menu)
			if data.current.value == 'wash_money' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'wash_money_amount_', {
					title = 'Menú de lavado de dinero',
				}, function(data, menu)
				
					local amount = tonumber(data.value)
					
					if amount == nil then
						ESX.ShowNotification('Cantidad inválida')
					else
						menu.close()
						TriggerServerEvent('tm1_mafias:washMoney', amount)
					end
				end, function(data, menu)
					menu.closeAll()
				end)
			elseif data.current.value == 'no' then
				menu.close()
			end
		end)

end

local data = {}

function GetGroup()
	if group.enclosure then
		for k,v in pairs(bases[1]) do
			data = { name = group.name, coords = bases[1].inventory, enclosure = group.enclosure }
			return data
		end
	else
		return false
	end	
end

--[[
local relationshipTypes = {
"PLAYER",
"CIVMALE",
"CIVFEMALE",
"COP",
"SECURITY_GUARD",
"PRIVATE_SECURITY",
"FIREMAN",
"GANG_1",
"GANG_2",
"GANG_9",
"GANG_10",
"AMBIENT_GANG_LOST",
"AMBIENT_GANG_MEXICAN",
"AMBIENT_GANG_FAMILY",
"AMBIENT_GANG_BALLAS",
"AMBIENT_GANG_MARABUNTE",
"AMBIENT_GANG_CULT",
"AMBIENT_GANG_SALVA",
"AMBIENT_GANG_WEICHENG",
"AMBIENT_GANG_HILLBILLY",
"DEALER",
"HATES_PLAYER",
--"HEN",
--"WILD_ANIMAL",
--"SHARK",
--"COUGAR",
"NO_RELATIONSHIP",
"SPECIAL",
"MISSION2",
"MISSION3",
"MISSION4",
"MISSION5",
"MISSION6",
"MISSION7",
"MISSION8",
"ARMY",
--"GUARD_DOG",
"AGGRESSIVE_INVESTIGATE",
"MEDIC",
--"CAT",
}

local RELATIONSHIP_HATE = 1

Citizen.CreateThread(function()
    while true do
        Wait(50)
        for _, group in ipairs(relationshipTypes) do
            SetRelationshipBetweenGroups(RELATIONSHIP_HATE, GetHashKey('PLAYER'), GetHashKey(group))
            SetRelationshipBetweenGroups(RELATIONSHIP_HATE, GetHashKey(group), GetHashKey('PLAYER'))
        end
    end
end)
]]--

function SpawnHelicoptero(coords)
	local elements = {}

	if Config.ShowVehicleLocation and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - <span style="color:red;">%s</span> |'):format('PATENTE', 'VEHICULO', 'LUGAR')
		table.insert(elements, {label = spacer, value = nil})
	elseif Config.ShowVehicleLocation == false and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format('PATENTE', 'VEHICULO')
		table.insert(elements, {label = ('<span style="color:red;">%s</span>'):format(_U('spacer1')), value = nil})
		table.insert(elements, {label = spacer, value = nil})
	end

	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedAircrafts', function(ownedAircrafts)
		if #ownedAircrafts == 0 then
			ESX.ShowNotification('No tienes Aeronaves!')
		else
			for _,v in pairs(ownedAircrafts) do
				local hashVehicule = v.vehicle.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
				local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)

				if Config.ShowVehicleLocation then
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format('GARAGE')
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format('DEPOSITO')
					end
				else
					if v.stored then
						labelvehicle = labelvehicle3
					else
						labelvehicle = labelvehicle3
					end
				end
				
				--if GetVehicleClass(hashVehicule) == 15 then
					table.insert(elements, {label = labelvehicle, value = v})
				--end
			end
		end
		
		table.insert(elements, {label = 'Maverick', value = 'maverick'})
		table.insert(elements, {label = 'Buzzard 2', value = 'buzzard2'})

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_aircraft', {
			title = 'Aeronaves',
			align = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value == nil then
			else
				if data.current.value == 'maverick' then
					local coord = vector3(coords.x, coords.y, coords.z)
					local ModelHash = `maverick`
					if not IsModelInCdimage(ModelHash) then return end
						RequestModel(ModelHash)
						while not HasModelLoaded(ModelHash) do
							Citizen.Wait(10)
						end
						ESX.UI.Menu.CloseAll()
						TriggerServerEvent('tm1_mafias:CrearAuto', ModelHash, coord, coords.w, group.enclosure..'M')
				elseif data.current.value == 'buzzard2' then
					local coord = vector3(coords.x, coords.y, coords.z)
					local ModelHash = `buzzard2`
					if not IsModelInCdimage(ModelHash) then return end
						RequestModel(ModelHash)
						while not HasModelLoaded(ModelHash) do
							Citizen.Wait(10)
						end
						ESX.UI.Menu.CloseAll()
						TriggerServerEvent('tm1_mafias:CrearAuto', ModelHash, coord, coords.w, group.enclosure..'B')	
				else
					if data.current.value.stored then
						menu.close()
						SpawnVehicle3(data.current.value.vehicle, data.current.value.plate, data.current.value.vehicle.fuelLevel, true)
					else
						ESX.ShowNotification(_U('aircraft_is_impounded'))
					end
				end
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

--[[
function SpawnHelicoptero(coords)
	local elements = {}
	table.insert(elements, {label = 'Maverick', value = 'maverick'})
	table.insert(elements, {label = 'Buzzard 2', value = 'buzzard2'})
								
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = 'Helicopteros',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'maverick' then
				local coord = vector3(coords.x, coords.y, coords.z)
				local ModelHash = `maverick` -- Use Compile-time hashes to get the hash of this model
				if not IsModelInCdimage(ModelHash) then return end
					RequestModel(ModelHash) -- Request the model
					while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
						Citizen.Wait(10)
					end
				TriggerServerEvent('tm1_mafias:CrearAuto', ModelHash, coord, coords.w, group.enclosure..'M')
			elseif data.current.value == 'buzzard2' then
				local coord = vector3(coords.x, coords.y, coords.z)
				--local coords = bases[1].helicopterSpawnPoint
				local ModelHash = `buzzard2` -- Use Compile-time hashes to get the hash of this model
				if not IsModelInCdimage(ModelHash) then return end
					RequestModel(ModelHash) -- Request the model
					while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
						Citizen.Wait(10)
					end
				TriggerServerEvent('tm1_mafias:CrearAuto', ModelHash, coord, coords.w, group.enclosure..'B')	
			end
		end, function(data, menu)
			menu.close()
	end)
end
]]--

function outfit()
	local elements = {}
		table.insert(elements, {label = 'Cambiar de Ropa', value = 'player_dressing'})
		table.insert(elements, {label = 'Eliminar Ropa', value = 'remove_cloth'})
								
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = 'Guardarropas',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'player_dressing' then
				cambiar_ropa()
			elseif data.current.value == 'remove_cloth' then

			ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
					title    = 'Eliminar Ropa',
					align    = 'bottom-right',
					elements = elements
				}, function(data, menu)
					menu.close()
					TriggerServerEvent('esx_eden_clotheshop:removeOutfit', data.current.value)
					ESX.ShowNotification('~r~Outfit Eliminado')
				end, function(data, menu)
					menu.close()
				end)
			end)
			end
			end, function(data, menu)
			menu.close()
		end)
end

function cambiar_ropa()
	
	ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
					title    = 'Ropa',
					align    = 'bottom-right',
					elements = elements
				}, function(data, menu)
					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data.current.value)
					end)
				end, function(data, menu)
					menu.close()
				end)
			end)

end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function OpenShopMenub(enclosure)
	
	local elements = {}
	
	if group.aprove == 0 then
		elements = getShopBanda()
	else
		elements = getShop()
	end
	
	if group.aprove == 3 then
		table.insert(elements, {label = "Carabina Especial - <span style='color:red;'>$180.000</span>", value = 'WEAPON_SPECIALCARBINE', money = 180000, whatItIs = "weapon"})
		table.insert(elements, {label = "Bullpup Rifle - <span style='color:red;'>$180.000</span>", value = 'WEAPON_BULLPUPRIFLE', money = 180000, whatItIs = "weapon"})
		table.insert(elements, {label = "Carabina MK2 - <span style='color:red;'>$180.000</span>", value = 'WEAPON_CARBINERIFLE_MK2', money = 180000, whatItIs = "weapon"})
--`WEAPON_CARBINERIFLE_MK2`,		
		--table.insert(elements, {label = "Francotirador - <span style='color:red;'>$500.000</span>", value = 'WEAPON_SNIPERRIFLE', money = 500000, whatItIs = "weapon"})
		--table.insert(elements, {label = 'Chaleco Nivel 4 - $25.000', value = 'kev4', money = 25000, whatItIs = "item"})
	end
	
	table.insert(elements, {label = 'Salir', whatItIs = "exit"})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'promoteMenu',
		{
			title  = "Tienda de Mafia",
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			--[[
			if data.current.value == 'kev3' then
				ESX.TriggerServerCallback('tm1_mafias:getMoney', function(money)
					if money then
						ESX.TriggerServerCallback('1974_drogas:check', function(serial)
							if serial then
								TriggerServerEvent('tm1_mafias:comprakev', 'kev3', 1, 'society_'..enclosure, serial, group.name)
							end
						end)
					else
						ESX.ShowNotification('~r~No tienes dinero suficiente!')
					end
				end, data.current.money)
			elseif data.current.value == 'kev4' then
				ESX.TriggerServerCallback('tm1_mafias:getMoney', function(money)
					if money then
						ESX.TriggerServerCallback('1974_drogas:check', function(serial)
							if serial then
								TriggerServerEvent('tm1_mafias:comprakev', 'kev4', 1, 'society_'..enclosure, serial, group.name)
							end
						end)
					else
						ESX.ShowNotification('~r~No tienes dinero suficiente!')
					end
				end, data.current.money)
			elseif data.current.value == 'kev2' then
				ESX.TriggerServerCallback('tm1_mafias:getMoney', function(money)
					if money then
						ESX.TriggerServerCallback('1974_drogas:check', function(serial)
							if serial then
								TriggerServerEvent('tm1_mafias:comprakev', 'kev2', 1, 'society_'..enclosure, serial, group.name)
							end
						end)
					else
						ESX.ShowNotification('~r~No tienes dinero suficiente!')
					end
				end, data.current.money)
			else
			]]--
				if data.current.whatItIs == "weapon" then
					--[[
					ESX.TriggerServerCallback('tm1_mafias:getMoney', function(money)
						if money then
							ESX.TriggerServerCallback('1974_drogas:check', function(serial)
								if serial then
									TriggerServerEvent('tm1_mafias:compra_arma', data.current.value, 250, 'society_'..enclosure, serial, group.name)
								end
							end)
						else
							ESX.ShowNotification('~r~No tienes dinero suficiente!')
						end
					end, data.current.money)
					]]--
					
					ESX.TriggerServerCallback('1974_drogas:check', function(serial)
						if serial then
							TriggerServerEvent('tm1_mafias:buyWeapon',data.current.value,data.current.money, serial)
						end
					end)
					
				elseif data.current.whatItIs == "item" then
					--[[
					ESX.TriggerServerCallback('tm1_mafias:getMoney', function(money)
						if money then
							ESX.TriggerServerCallback('1974_drogas:check', function(serial)
								if serial then
									TriggerServerEvent('tm1_mafias:comprakev', data.current.value, 1, 'society_'..enclosure, serial, group.name)
								end
							end)
						else
							ESX.ShowNotification('~r~No tienes dinero suficiente!')
						end
					end, data.current.money)
					]]--
					
					ESX.TriggerServerCallback('1974_drogas:check', function(serial)
						if serial then
							TriggerServerEvent('tm1_mafias:addItem_zs',data.current.value,data.current.money,serial)
						end
					end)
					
				elseif data.current.whatItIs == "exit" then
					menu.close()
				end	
			--end	
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end 

RegisterNetEvent('tm1_mafias:esposar')
AddEventHandler('tm1_mafias:esposar',function(option)
	local player, distance = ESX.Game.GetClosestPlayer()
	if distance ~= -1 and distance <= 3.0 then	
		TriggerServerEvent('tm1_mafias:toClientEsposar',GetPlayerServerId(player),option)
	end
end)

RegisterNetEvent('tm1_mafias:changeEsposar')
AddEventHandler('tm1_mafias:changeEsposar',function(option)
  IsHandcuffed    = option
  local playerPed = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    if IsHandcuffed == true then

      RequestAnimDict('mp_arresting')

      while not HasAnimDictLoaded('mp_arresting') do
        Wait(100)
      end

      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
      SetEnableHandcuffs(playerPed, true)
      SetPedCanPlayGestureAnims(playerPed, false)
      FreezeEntityPosition(playerPed,  true)

    elseif IsHandcuffed == false then

      ClearPedSecondaryTask(playerPed)
      SetEnableHandcuffs(playerPed, false)
      SetPedCanPlayGestureAnims(playerPed,  true)
      FreezeEntityPosition(playerPed, false)

    end

  end)
end)

function OpenPutStocksMenu(enclosure)
	ESX.TriggerServerCallback('tm1_mafias:getPlayerInventory', function(inventory)

		local elements = {}
		
		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dinero Sucio: <span style="color:red;">$ '..ESX.Math.GroupDigits(inventory.blackMoney)..'</span> ';
				type  = 'item_account',
				value = 'black_money'
			})
		end
		
		if inventory.money > 0 then
			table.insert(elements, {
				label = 'Dinero: <span style="color:green;">$ '..ESX.Math.GroupDigits(inventory.money)..'</span> ';
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
			title    = 'Inventario',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
		
			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('tm1_mafias:putStockItems', data.current.type, data.current.value, data.current.ammo, 'society_'..enclosure, group.name)
					Citizen.Wait(300)
					OpenPutStocksMenu(enclosure)
			else
			
			local itemName = data.current.value
			local tipo = data.current.type
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
					title = 'Cantidad'
				}, function(data, menu)

					local count = tonumber(data.value)

					if count == nil then
						ESX.ShowNotification('Cantidad Invalida')
					else
						--menu2.close()
						menu.close()
						TriggerServerEvent('tm1_mafias:putStockItems', tipo, itemName, count, 'society_'..enclosure, group.name)
						Citizen.Wait(300)
						OpenPutStocksMenu(enclosure)
					end

				end, function(data, menu)
					menu.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenGetWeaponMenu()
	ESX.TriggerServerCallback('tm1_mafias:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name),
					value = weapons[i].name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon', {
			title    = 'Inventario de armas',
			align = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('tm1_mafias:removeArmoryWeapon', function()
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
			table.insert(elements, {
				label = weaponList[i].label,
				value = weaponList[i].name
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon', {
		title    = 'Inventario de armas',
		align = 'bottom-right',
		elements = elements
	}, function(data, menu)
		menu.close()

		ESX.TriggerServerCallback('tm1_mafias:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value, true)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenGetStocksMenuArmas(enclosure)
	ESX.TriggerServerCallback('tm1_mafias:getStockItems', function(inventory)
		local elements = {}
		
		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name)..' ['..weapon.ammo..']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo = weapon.ammo
			})
		end
		
		table.sort(elements, function(a, b)
			return a.value < b.value --and a.ammo < b.ammo
		end)
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu_armas',
		{
			title    = 'Stock Armas',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()
			TriggerServerEvent('tm1_mafias:getStockItem', data.current.type, data.current.value, data.current.ammo, 'society_'..enclosure, group.name)
			Citizen.Wait(300)
			OpenGetStocksMenuArmas(enclosure)
		end, function(data, menu)
			menu.close()
		end)
	end, 'society_'..enclosure)
end

function OpenGetStocksMenu(enclosure)
	ESX.TriggerServerCallback('tm1_mafias:getStockItems', function(inventory)
		local elements = {}
		
		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dinero Sucio: <span style="color:red;">$ '..ESX.Math.GroupDigits(inventory.blackMoney)..'</span> ';
				type = 'item_account',
				value = 'black_money'
			})
		end
		
		if inventory.money > 0 then
			table.insert(elements, {
				label = 'Dinero: <span style="color:green;">$ '..ESX.Math.GroupDigits(inventory.money)..'</span> ';
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

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = 'Stock',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
		
			local tipo = data.current.type
			local itemName = data.current.value
			
			if itemName == 'kev3' then
				menu.close()
				ESX.TriggerServerCallback('tm1_mafias:borrarkev', function(bool)
					if bool then
						SetKev(75)
					end
				end, tipo, itemName, 1, 'society_'..enclosure, group.name)	
			elseif itemName == 'kev4' then
				menu.close()
				ESX.TriggerServerCallback('tm1_mafias:borrarkev', function(bool)
					if bool then
						SetKev(100)
					end
				end, tipo, itemName, 1, 'society_'..enclosure)
			elseif itemName == 'kev2' then
				menu.close()
				ESX.TriggerServerCallback('tm1_mafias:borrarkev', function(bool)
					if bool then
						SetKev(50)
					end
				end, tipo, itemName, 1, 'society_'..enclosure, group.name)
			else
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = 'Cantidad'
					}, function(data, menu)

					local count = tonumber(data.value)
				
					if count == nil then
						ESX.ShowNotification('Cantidad Invalida!')
					else
						menu.close()
						TriggerServerEvent('tm1_mafias:getStockItem', tipo, itemName, count, 'society_'..enclosure, group.name)
						Citizen.Wait(300)
						OpenGetStocksMenu(enclosure)
					end
				end, function(data, menu)
					menu.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)

	end, 'society_'..enclosure)
end

--List Botes

function ListOwnedBoatsMenu()
	local elements = {}

	local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - <span style="color:red;">%s</span> |'):format('PATENTE', 'BOTE', 'LUGAR')
	table.insert(elements, {label = spacer, value = nil})
	
	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedBoats', function(ownedBoats)
		if #ownedBoats == 0 then
			ESX.ShowNotification('No tienes botes!')
		else
			for _,v in pairs(ownedBoats) do
				local hashVehicule = v.vehicle.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
				local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)

				if v.stored then
					labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format('GARAGE')
				else
					labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format('DEPOSITO')
				end

				table.insert(elements, {label = labelvehicle, value = v})
				
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_boat', {
			title = 'Guarderia Nautica',
			align = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value.stored then
				menu.close()					
				SpawnVehicle2(data.current.value.vehicle, data.current.value.plate)
			else
				ESX.ShowNotification('~r~Tu bote esta en el deposito!')
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function ListOwnedCarsMenu()
	ESX.UI.Menu.CloseAll()
	local UseVehicleNamesLua = true
	local elements = {}	
	
	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedCars', function(ownedCars)
		if #ownedCars == 0 then
			ESX.ShowNotification('No tienes coches')
		else
			for _,v in pairs(ownedCars) do
				if UseVehicleNamesLua == true then
					local hashVehicule = v.vehicle.model
					local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
					local vehicleName  = GetLabelText(aheadVehName)
					local plate = v.plate
					local labelvehicle
					local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
					local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)
					local Fuel = v.vehicle.fuelLevel
					
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format('Garage')
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format('Deposito')
					end
					table.insert(elements, {label = labelvehicle, value = v})
				end
			end
		
			if group.aprove == 3 then --and group.rank == 6 or group.aprove == 3 and group.rank == 5 
				table.insert(elements, {label = 'AUTO BLINDADO CARTEL', value = 'cog552'})
				table.insert(elements, {label = 'JEEP CARTEL', value = 'dubsta2'})
				table.insert(elements, {label = 'CAMION', value = 'vetir'})
			end
		
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
				title    = 'Tus coches',
				align    = 'bottom-right',
				elements = elements
			}, function(data, menu)
				if data.current.value == nil then
				else
					if data.current.value.stored then
						menu.close()
						SpawnVehicle(data.current.value.vehicle, data.current.value.plate, data.current.value.vehicle.fuelLevel)
						ESX.UI.Menu.CloseAll()
					elseif data.current.value == "dubsta2" then
						local coords = vector3(bases[1].spawnCar.x,bases[1].spawnCar.y,bases[1].spawnCar.z)
						menu.close()
						local ModelHash = `dubsta2` -- Use Compile-time hashes to get the hash of this model
						if not IsModelInCdimage(ModelHash) then return end
						RequestModel(ModelHash) -- Request the model
						while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
							Citizen.Wait(10)
						end
						TriggerServerEvent('tm1_mafias:CrearAuto', ModelHash, coords, bases[1].spawnCar.w, group.enclosure..'D')
					elseif data.current.value == "vetir" then
						local coords = vector3(bases[1].spawnCar.x,bases[1].spawnCar.y,bases[1].spawnCar.z)
						menu.close()
						local ModelHash = `vetir` -- Use Compile-time hashes to get the hash of this model
						if not IsModelInCdimage(ModelHash) then return end
						RequestModel(ModelHash) -- Request the model
						while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
							Citizen.Wait(10)
						end
						TriggerServerEvent('tm1_mafias:CrearAuto', ModelHash, coords, bases[1].spawnCar.w, group.enclosure..'V')
					elseif data.current.value == "cog552" then
						local coords = vector3(bases[1].spawnCar.x,bases[1].spawnCar.y,bases[1].spawnCar.z)
						menu.close()
						local ModelHash = `cog552` -- Use Compile-time hashes to get the hash of this model
						if not IsModelInCdimage(ModelHash) then return end
						RequestModel(ModelHash) -- Request the model
						while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
							Citizen.Wait(10)
						end
						TriggerServerEvent('tm1_mafias:CrearAuto', ModelHash, coords, bases[1].spawnCar.w, group.enclosure..'C')
					else
						ESX.ShowNotification('Tu coche está secuestrado')
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		end
	end) 
end

function GetVehicleSpawned(patente)
	local vehs = GetGamePool('CVehicle')
    for _, vehicle in ipairs(vehs) do
        if NetworkGetEntityIsNetworked(vehicle) then
			--print(patente..' LISTA: '..GetVehicleNumberPlateText(vehicle))
			if GetVehicleNumberPlateText(vehicle) == string.upper(patente) then				
				ESX.ShowNotification('~r~Ya sacaron un Vehiculo de este modelo!')
				return true
			else
				ESX.ShowNotification('~r~No hay auto con esa patente!')
			end			
        end
		return false
    end
end

function SpawnVehicle(vehicle, plate, fuelLevel)
	ESX.UI.Menu.CloseAll()
	ESX.Game.SpawnVehicle(vehicle.model, {
		x = bases[1].spawnCar.x,
		y = bases[1].spawnCar.y,
		z = bases[1].spawnCar.z+1,
	},bases[1].spawnCar.w, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "OFF")
		exports["LegacyFuel"]:SetFuel(callback_vehicle, fuelLevel)
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	end)
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false)
end

function SpawnVehicle3(vehicle, plate, fuelLevel)
	ESX.UI.Menu.CloseAll()
	ESX.Game.SpawnVehicle(vehicle.model, {
		x = bases[1].helicopterSpawnPoint.x,
		y = bases[1].helicopterSpawnPoint.y,
		z = bases[1].helicopterSpawnPoint.z+1,
	},bases[1].helicopterSpawnPoint.w, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "OFF")
		exports["LegacyFuel"]:SetFuel(callback_vehicle, fuelLevel)
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	end)
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false)
end

function SpawnVehicle2(vehicle, plate)
	ESX.Game.SpawnVehicle(vehicle.model, {
		x = bases[1].boteSpawn.x,
		y = bases[1].boteSpawn.y,
		z = bases[1].boteSpawn.z+1,
	},bases[1].boteSpawn.w, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "OFF")
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	end)
	TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false)
end

function StoreOwnedCarsMenu()
	local playerPed  = GetPlayerPed(-1)

	if IsPedInAnyVehicle(playerPed,  false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetPedInVehicleSeat(vehicle, -1 ) == playerPed then
			local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
			local plate = GetVehicleNumberPlateText(vehicle)
			local platetrim = string.gsub(plate, "%s+", "")
			--print(platetrim..' + '..string.upper(group.enclosure..'B'))
			if platetrim == string.upper(group.enclosure..'D') or platetrim == string.upper(group.enclosure..'C') then
				DeleteEntity(vehicle)
				ESX.ShowNotification('Vehículo guardado en el garage')				
			else
				vehicleProps.fuelLevel = exports["LegacyFuel"]:GetFuel(vehicle)
				ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
					if valid then
						StoreVehicle(vehicle, vehicleProps)
					else
						ESX.ShowNotification('No hay vehiculo para guardar!')
					end
				end, vehicleProps)
			end
		else
			ESX.ShowNotification('Debes estar manejando el vehiculo!')
		end	
	else
		ESX.ShowNotification('No puedes guardar este vehiculo!')
	end
end

function StoreVehicle(vehicle, vehicleProps)
	--TriggerEvent('persistent-vehicles/forget-vehicle', vehicle)
	DeleteEntity(vehicle)
	TriggerServerEvent('esx_advancedgarage:setVehicleState', vehicleProps.plate, true)
	--[[
	local playerPed = PlayerPedId()
	ESX.Game.Teleport(playerPed, teleportCoords, function()
		SetEntityHeading(playerPed, teleportCoords.w)
	end)
	]]
	ESX.ShowNotification('Vehículo guardado en el garage')
end

--[[
function putaway(vehicle, vehicleProps)
	ESX.Game.DeleteVehicle(vehicle)
	TriggerServerEvent('esx_advancedgarage:setVehicleState', vehicleProps.plate, true)
	ESX.ShowNotification('Vehículo guardado en el garage')
end
]]

function reparation(apprasial, vehicle, vehicleProps)
	ESX.UI.Menu.CloseAll()
	
	local elements = {
		{label = 'Guardar vehículo'.." ($"..apprasial..")", value = 'yes'},
		{label = 'Visita mecánico', value = 'no'}
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'delete_menu', {
		title    = 'Daño del vehículo',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		menu.close()
		
		if data.current.value == 'yes' then
			TriggerServerEvent('esx_advancedgarage:payhealth', apprasial)
			putaway(vehicle, vehicleProps)
		elseif data.current.value == 'no' then
			ESX.ShowNotification('Visita al mecánico')
		end
	end, function(data, menu)
		menu.close()
	end)
end


function DrawText3D(x,y,z, text) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.5*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end


function SetKev(nivel)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
	RequestAnimDict("clothingshirt")
    while not HasAnimDictLoaded("clothingshirt") do
        Citizen.Wait(100)
    end
    TaskPlayAnim(GetPlayerPed(PlayerId()), "clothingshirt", "try_shirt_positive_d", 1.0, -1, -1, 50, 0, 0, 0, 0) -- mp_clothing@female@shirt  try_shirt_base    try_shirt_positive_a
        Citizen.Wait(10000)
	ClearPedTasks(GetPlayerPed(-1))
	if nivel == 25 then
		TriggerEvent('skinchanger:change', 'bproof_1', 1)
		TriggerEvent('skinchanger:change', 'bproof_2', 0)
	elseif nivel == 50 then
		TriggerEvent('skinchanger:change', 'bproof_1', 1)
		TriggerEvent('skinchanger:change', 'bproof_2', 4)
	elseif nivel == 75 then
		TriggerEvent('skinchanger:change', 'bproof_1', 22)
		TriggerEvent('skinchanger:change', 'bproof_2', 9)
	elseif nivel == 100 then
		TriggerEvent('skinchanger:change', 'bproof_1', 15)
		TriggerEvent('skinchanger:change', 'bproof_2', 2)
	end
		ESX.ShowNotification("Te has puesto tu chaleco")
		SetPedArmour(GetPlayerPed(-1), nivel)
	end)
end

RegisterNetEvent('tm1_mafias:blindado')
AddEventHandler('tm1_mafias:blindado', function(net)
	
	while not NetworkDoesEntityExistWithNetworkId(net) do
        Wait(0)
    end

	local callback_vehicle = NetworkGetEntityFromNetworkId(net)

    while not DoesEntityExist(callback_vehicle) do
        Wait(0)
    end
	SetVehRadioStation(callback_vehicle, "OFF")
	TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	exports["LegacyFuel"]:SetFuel(callback_vehicle, 100)
	exports["esx_carlock"]:SetCamion(callback_vehicle)	

end)

--GARAGE HELICOPTEROS
function ListOwnedAircraftsMenu()
	local elements = {}

	if Config.ShowVehicleLocation and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - <span style="color:red;">%s</span> |'):format(_U('plate'), _U('vehicle'), _U('location'))
		table.insert(elements, {label = spacer, value = nil})
	elseif Config.ShowVehicleLocation == false and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
		table.insert(elements, {label = ('<span style="color:red;">%s</span>'):format(_U('spacer1')), value = nil})
		table.insert(elements, {label = spacer, value = nil})
	end

	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedAircrafts', function(ownedAircrafts)
		if #ownedAircrafts == 0 then
			ESX.ShowNotification(_U('garage_no_aircrafts'))
		else
			for _,v in pairs(ownedAircrafts) do
				local hashVehicule = v.vehicle.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
				local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)

				if Config.ShowVehicleLocation then
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('loc_garage'))
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format(_U('loc_pound'))
					end
				else
					if v.stored then
						labelvehicle = labelvehicle3
					else
						labelvehicle = labelvehicle3
					end
				end

				table.insert(elements, {label = labelvehicle, value = v})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_aircraft', {
			title = _U('garage_aircrafts'),
			align = Config.MenuAlign,
			elements = elements
		}, function(data, menu)
			if data.current.value == nil then
			else
				if data.current.value.stored then
					menu.close()
					SpawnVehicle(data.current.value.vehicle, data.current.value.plate, data.current.value.vehicle.fuelLevel, true)
				else
					ESX.ShowNotification(_U('aircraft_is_impounded'))
				end
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end