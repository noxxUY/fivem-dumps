Config                 = {}
Config.DrawDistance    = 100.0
Config.MaxErrors       = 5
Config.SpeedMultiplier = 3.6
Config.Locale          = 'es'

Config.Prices = {
	dmv         = 1000,
	drive       = 3000,
	drive_bike  = 2500,
	drive_truck = 5000,
	drive_bus   = 5000
}

Config.VehicleModels = {
	drive       = 'blista',
	drive_bike  = 'sanchez',
	drive_truck = 'mule3',
	drive_bus   = 'bus'
}

Config.SpeedLimits = {
	residence = 50,
	town      = 80,
	freeway   = 120,
	norte1 = 40,
	norte2 = 90,
	norte3 = 120,
}

Config.Zones = {

	DMVSchool = {
		Pos   = {x = 228.471, y = 372.960, z = 106.741},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	},

	VehicleSpawnPoint = {
		Pos   = {x = 218.409, y = 377.230, z = 106.4094, h = 156.0},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1
	},
	DMVSchool2 = {
		Pos   = {x = -769.271, y = 5596.030, z = 33.441},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	},

	VehicleSpawnPoint2 = {
		Pos   = {x = -778.989, y = 5576.930, z = 33.4094, h = 156.0},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1
	}
}
--[[Config.Zones2 = {

	DMVSchool = {
		Pos   = {x = -769.271, y = 5596.030, z = 33.441},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	},

	VehicleSpawnPoint = {
		Pos   = {x = -778.989, y = 5576.930, z = 33.4094, h = 156.0},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1
	}
}--]]
Config.CheckPoints = {

	{
		Pos = {x = 197.139, y = 365.731, z = 107.537},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('next_point_speed', Config.SpeedLimits['residence']), 5000)
		end
	},

	{
		Pos = {x = 84.874, y = 333.574, z = 111.932},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000) 
		end
	},

	{
		Pos = {x = 35.907, y = 278.385, z = 108.542},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_for_ped'), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(4000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_lets_cont'), 5000)
			end)
		end
	},

	{
		Pos = {x = -71.821, y = 293.520, z = 105.292},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')

			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_look_left', Config.SpeedLimits['town']), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(6000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_turn_right'), 5000)
			end)
		end
	},

	{
		Pos = {x = -152.550, y = 444.755, z = 111.725},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -337.542, y = 475.335, z = 110.789},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('stop_for_passing'), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(6000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -496.143, y = 577.282, z = 120.868},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -476.148, y = 804.100, z = 180.704},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -694.790, y = 991.726, z = 237.665},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('freeway')

			DrawMissionText(_U('hway_time', Config.SpeedLimits['freeway']), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
		end
	},

	{
		Pos = {x = -317.237, y = 981.178, z = 232.519},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 142.647, y = 933.28, z = 209.109},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 310.759, y = 961.792, z = 209.718},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 282.759, y = 606.792, z = 154.718},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')
			DrawMissionText(_U('in_town_speed', Config.SpeedLimits['town']), 5000)
		end
	},

	{
		Pos = {x = 575.603, y = 265.771, z = 102.679},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('gratz_stay_alert'), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
		end
	},

	{
		Pos = {x = 217.283, y = 377.329, z = 105.921},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			ESX.Game.DeleteVehicle(vehicle)
		end
	}
}

Config.CheckPoints2 = {

	{
		Pos = {x = -777.659, y = 5562.931, z = 33.317},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('next_point_speed', Config.SpeedLimits['norte2']), 5000)
		end
	},

	{
		Pos = {x = -782.234, y = 5552.054, z =33.232},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_for_ped'), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(4000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_lets_cont'), 5000)
			end)
		end
	},

	{
		Pos = {x = -616.121, y = 6078.320, z = 7.97},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('norte1')

			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_look_left', Config.SpeedLimits['norte1']), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(2500)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText('Sube por tu derecha con cuidado', 5000)
			end)
		end
	},

	{
		Pos = {x = -448.492, y = 6070.03, z = 31.289},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText('Espera en el STOP 5 segundos!', 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(5000)
			DrawMissionText('Gira hacia tu derecha.', 5000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -414.292, y = 5978.83, z = 31.4289},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('norte3')
			DrawMissionText('Espera en el STOP 5 segundos!', Config.SpeedLimits['norte3'],5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(5000)
			DrawMissionText('Sigue todo recto.', 5000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -757.448, y = 5510.41, z = 35.20},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('norte1')
			DrawMissionText('Gira a la derechaen la proxima intercepción.',Config.SpeedLimits['norte1'], 5000)
		end
	},

	{
		Pos = {x = -781.242, y = 5544.08, z = 33.389},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText('Espera para revisar si hay personas cercanas!', 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(2000)
			DrawMissionText('Ve hacia el último punto , ya casi terminamos!', 5000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -759.23, y = 5527.029, z = 33.321},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			ESX.Game.DeleteVehicle(vehicle)
		end
	}
}
