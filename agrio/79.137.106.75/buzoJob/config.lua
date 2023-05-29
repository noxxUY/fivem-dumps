Config = {}

-----------------------------------------
--==Custom ESX Trigger for Anti-Cheat==--
--== If you don't know what this is  ==--
--==         don't touch it.         ==--
-----------------------------------------
Config.esxTrigger = "esx:getSharedObject"

------------------------------
--==Miscellaneous Settings==--
------------------------------
Config.requireJob = true
Config.salvageUnits = "Libras de salvamento"
Config.carryLimit = 100

--------------------------
--==Remove Gear On Use==--
--------------------------
Config.removeScubaGear = false
Config.removeTorch = false

--------------------------------------------------------
--==              Mini-game Key Layout              ==--
--==    Setting to "false" will use '1,2,3, & 4'    ==--
--==along the top. Setting to "true" will use 'QWER'==--
--------------------------------------------------------
Config.useQWER = true

---------------------------------------------
--==How Long Each Salvage Loop Should Run==--
---------------------------------------------
Config.SalvageTime = {a = 20000, b = 44000}

-------------------------------------
--==Distance that Markers Draw At==--
-------------------------------------
Config.drawDistance = 100
---------------------------
--==Salvage Sale Prices==--
---------------------------
Config.SalvagePrice = {a = 75, b = 175}
Config.IllegalSalvagePrice = {a = 125, b = 225}

------------------------------
--==Salvage Sell Locations==--
------------------------------
Config.SalvageSell = {
	{x = -429.1, y = -1727.96, z = 18.78},
	{x = 2344.39, y = 3052.26, z = 47.15},
}

Config.IllegalSalvageSell = {
	{x = 46.77, y = -2680.78, z = 5.01},
}
---------------------
--==Salvage Zones==--
---------------------
Config.SalvageZones = {
	{x = -2836.41, y = -474.57, z = -28.09},
	{x = 3164.75, y = -312.69, z = -20.7},
	{x = 3406.41, y = 6324.39, z = -53.7},
}

Config.IllegalSalvageZones = {
	{x = 759.44, y = 7391.46, z = -120.49},
	{x = -910.08, y = 6653.65, z = -29.87},
}

Config.ScubaGear = {
	male = {
		['tshirt_1'] = 123,  ['tshirt_2'] = 0,
		['torso_1']  = 243, ['torso_2']  = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms']     = 1,   ['pants_1']  = 94,
		['pants_2']  = 0,   ['shoes_1']  = 67,
		['shoes_2']  = 0,  ['chain_1']  = 0,
		['chain_2']  = 0,	['bproof_1'] = 0,
		['glasses_1'] = 27,  ['glasses_2'] = 0
	},
	female = {
		['tshirt_1'] = 153,  ['tshirt_2'] = 0,
		['torso_1']  = 251, ['torso_2']  = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms']     = 0,   ['pants_1']  = 97,
		['pants_2']  = 0,   ['shoes_1']  = 70,
		['shoes_2']  = 0,  ['chain_1']  = 0,
		['chain_2']  = 0,	['bproof_1'] = 0,
		['glasses_1'] = 29,  ['glasses_2'] = 0
	}
}

--------------
--==Dialog==--
--------------

Config.dialog = {
	['salvageSellBlip'] = "Ventas de salvamento", 													-- Name of Sale Location
	['salvageSpotBlip'] = "Ubicacion de salvamento submarino", 									-- Name of Salvage Locations
	['lostSalvage']		= "Has ~r~perdido~s~  de salvamento", 								-- When you lose the salvage
	['salvageTrigger']	= "Una ~r~seccion de salvamento~s~ se libera \n~h~Pulsa ~g~", 			-- When the salvage breaks free
	['salvageStart']	= "La recuperación  ~g~comenzó~s~. Presiona ~r~Z~s~ para detenerla.", 				-- When you start salvaging
	['stopSalvaging'] 	= "~r~Rescate detenido",											-- When you stop salvaging
	['noSalvage']		= "~y~No hay nada que guardar.",								-- When you are not in a salvage area
	['maxSalvage']		= "No puedes llevar más salvamento.",								-- When you are full
	['gotSalvage']		= "Has recuperado algunos ~g~salvamentos~s~! \n",						-- When you successfully retrieve salvage
	['gotIlSalvage']	= "Has recuperado ~r~cuestionable~s~ salvamento! \n", 		-- When you successfully retrieve illegal salvage
	['notEnough']		= "No tienes suficiente salvamento para vender...",						-- When you don't have enough salvage to sell
	['notEnoughIl']		= "No tienes suficiente ~r~cuestionable~s~ salvamento para vender...",	-- When you don't have enough illegal salvage to sell
	['invalidPed']		= "El equipo de buceo solo se puede usar en Freemodes"					-- When you try to use Scuba Gear on a non-freemode ped
}
