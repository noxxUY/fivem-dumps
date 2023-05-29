Config = {}

Config.Command = 'battlepass'			--Command to open the battlepass
Config.EnableLog = true				--Send discord logs? Check server_functions.lua to enter your discod webhook
Config.EnableWhitelist = false			--If true everyone can use battlepass, false if you want to be whitelisted
Config.IsEveryoneCriminal = false		--If true everyone can use the criminal battlepass, false if you want specific players [Check server_functions.lua function IsPlayerCriminal(player)]
Config.ShowNotificationMaxXp = true		--If true a notification will be shown if max xp is reached
Config.ImagePath = 'https://cfx-nui-'..GetCurrentResourceName()..'/html/images/items/'	--Path of images of items [image must be .png]

Config.BattlepassAccess = {		--Which type of admins can use the battlepass admin commands
	['superadmin']	= true,
	['admin']		= true
}

Config.CivilianXpPerMinute = 11			--How many civilian XP the player gets per minute
Config.MaxCivilianXpPerLevel = 1200		--Max civilian XP per level
Config.CivilianTimer = 60				--Interval in seconds to update the player's civilian XP

Config.CriminalXpPerMinute = 18			--How many criminal XP the player gets per minute
Config.MaxCriminalXpPerLevel = 1200		--Max criminal XP per level
Config.CriminalTimer = 60				--Interval in seconds to update the player's criminal XP

Config.Prices = {
	['civilian'] = {
		LevelPrice = 100,				--Price to buy a civilian level
		resetPrice = 3000				--Price reset civilian battlepass
	},
	
	['criminal'] = {
		LevelPrice = 75,				--Price to buy a criminal level
		resetPrice = 3000				--Price reset criminal battlepass
	},
}

--title:	The title
--item:		The spawnname of item (bread, water, etc...), weapon (WEAPON_PISTOL, WEAPON_CARBINERIFLE, etc...), money name (money, black_money etc...)
--amount:	Amount of item to give, money to give, weapon bullets to give
--type:		Available types: item, money, weapon
--desc:		The description

Config.CivilianLevelRewards = {
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 10000,		type = 'money',			desc = '$10.000'},
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 10000,		type = 'money',			desc = '$10.000'},
	{title = 'PISTOLA',					item = 'WEAPON_PISTOL',			amount = 100,		type = 'weapon',		desc = 'CON 100 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 10,		type = 'item',			desc = 'X10 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 5,			type = 'item',			desc = 'X5 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 1,			type = 'item',			desc = 'X1 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'pistolclip',			amount = 3,			type = 'item',			desc = 'X3 CARGADORES DE PISTOLA'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 3,			type = 'item',			desc = 'X3 CARGADORES DE SMG'},
	{title = 'PISTOLA .50',				item = 'WEAPON_PISTOL50',		amount = 100,		type = 'weapon',		desc = 'CON 100 MUNICIONES'},
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 20000,		type = 'money',			desc = '$20.000'},
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 20000,		type = 'money',			desc = '$20.000'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 10,		type = 'item',			desc = 'X10 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 5,			type = 'item',			desc = 'X5 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 1,			type = 'item',			desc = 'X1 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'pistolclip',			amount = 3,			type = 'item',			desc = 'X3 CARGADORES DE PISTOLA'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 3,			type = 'item',			desc = 'X3 CARGADORES DE SMG'},
	{title = 'ACCESORIO ARMA',			item = 'grip',					amount = 1,			type = 'item',			desc = 'X1 GRIP'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 1,			type = 'item',			desc = 'X1 CARGADOR EXTENDIDO'},
	{title = 'MICRO SMG',				item = 'WEAPON_MICROSMG',		amount = 100,		type = 'weapon',		desc = 'CON 100 MUNICIONES'},
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 30000,		type = 'money',			desc = '$30.000'},
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 30000,		type = 'money',			desc = '$30.000'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 10,		type = 'item',			desc = 'X10 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 5,			type = 'item',			desc = 'X5 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 2,			type = 'item',			desc = 'X2 CHALECO PESADO'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'},
	{title = 'CARGADOR',				item = 'pistolclip',			amount = 3,			type = 'item',			desc = 'X3 CARGADORES DE PISTOLA'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 3,			type = 'item',			desc = 'X3 CARGADORES DE SMG'},
	{title = 'ACCESORIO ARMA',			item = 'suppressor',			amount = 3,			type = 'item',			desc = 'X3 SILENCIADORES'},
	{title = 'SMG',						item = 'WEAPON_SMG',			amount = 100,		type = 'weapon',		desc = 'CON 100 MUNICIONES'},
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 40000,		type = 'money',			desc = '$40.000'},
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 40000,		type = 'money',			desc = '$40.000'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 10,		type = 'item',			desc = 'X10 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 5,			type = 'item',			desc = 'X5 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 2,			type = 'item',			desc = 'X2 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'pistolclip',			amount = 6,			type = 'item',			desc = 'X6 CARGADORES DE PISTOLA'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 6,			type = 'item',			desc = 'X6 CARGADORES DE SMG'},
	{title = 'ACCESORIO ARMA',			item = 'grip',					amount = 2,			type = 'item',			desc = 'X2 GRIP'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 2,			type = 'item',			desc = 'X2 CARGADOR EXTENDIDO'},
	{title = 'ESCOPETA RECORTADA',		item = 'WEAPON_SAWNOFFSHOTGUN',	amount = 100,		type = 'weapon',		desc = 'CON 100 MUNICIONES'},
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 50000,		type = 'money',			desc = '$50.000'},
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 50000,		type = 'money',			desc = '$50.000'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 30,		type = 'item',			desc = 'X30 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 20,		type = 'item',			desc = 'X20 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 2,			type = 'item',			desc = 'X2 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'pistolclip',			amount = 10,		type = 'item',			desc = 'X10 CARGADORES DE PISTOLA'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 10,		type = 'item',			desc = 'X10 CARGADORES DE SMG'},
	{title = 'ACCESORIO ARMA',			item = 'suppressor',			amount = 5,			type = 'item',			desc = 'X5 SILENCIADORES'},
	{title = 'FUSIL DE ASALTO',			item = 'WEAPON_ASSAULTRIFLE',	amount = 100,		type = 'weapon',		desc = 'CON 100 MUNICIONES'},
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 200000,	type = 'money',			desc = '$200.000'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 300,		type = 'money',			desc = 'x300 BITCOIN'},
}


Config.CriminalLevelRewards = {
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'}, -- Nivel 1
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 100000,	type = 'money',			desc = '$100.000'},
	{title = 'PISTOLA .50',				item = 'WEAPON_PISTOL50',		amount = 200,		type = 'weapon',		desc = 'CON 200 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 30,		type = 'item',			desc = 'X30 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 20,		type = 'item',			desc = 'X20 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 2,			type = 'item',			desc = 'X2 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 6,			type = 'item',			desc = 'X6 CARGADORES DE SMG'},
	{title = 'CARGADOR',				item = 'rifleclip',				amount = 6,			type = 'item',			desc = 'X6 CARGADORES DE RIFLE'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 5,			type = 'item',			desc = 'X5 CARGADOR EXTENDIDO'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'}, -- Nivel 10
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 100000,	type = 'money',			desc = '$100.000'},
	{title = 'MICRO SMG',				item = 'WEAPON_MICROSMG',		amount = 200,		type = 'weapon',		desc = 'CON 200 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 30,		type = 'item',			desc = 'X30 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 20,		type = 'item',			desc = 'X20 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 2,			type = 'item',			desc = 'X2 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 6,			type = 'item',			desc = 'X6 CARGADORES DE SMG'},
	{title = 'CARGADOR',				item = 'rifleclip',				amount = 6,			type = 'item',			desc = 'X6 CARGADORES DE RIFLE'},
	{title = 'ACCESORIO ARMA',			item = 'grip',					amount = 5,			type = 'item',			desc = 'X5 GRIP'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 5,			type = 'item',			desc = 'X5 CARGADOR EXTENDIDO'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'}, -- Nivel 20
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 200000,	type = 'money',			desc = '$200.000'},
	{title = 'SMG',						item = 'WEAPON_SMG',			amount = 200,		type = 'weapon',		desc = 'CON 200 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 30,		type = 'item',			desc = 'X30 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 20,		type = 'item',			desc = 'X20 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 4,			type = 'item',			desc = 'X4 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 6,			type = 'item',			desc = 'X6 CARGADORES DE SMG'},
	{title = 'CARGADOR',				item = 'rifleclip',				amount = 6,			type = 'item',			desc = 'X6 CARGADORES DE RIFLE'},
	{title = 'ACCESORIO ARMA',			item = 'grip',					amount = 7,			type = 'item',			desc = 'X7 GRIP'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 7,			type = 'item',			desc = 'X7 CARGADOR EXTENDIDO'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'}, -- Nivel 30
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 200000,	type = 'money',			desc = '$200.000'},
	{title = 'ESCOPETA RECORTADA',		item = 'WEAPON_SAWNOFFSHOTGUN',	amount = 200,		type = 'weapon',		desc = 'CON 200 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 30,		type = 'item',			desc = 'X30 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 20,		type = 'item',			desc = 'X20 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 4,			type = 'item',			desc = 'X4 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 12,		type = 'item',			desc = 'X12 CARGADORES DE SMG'},
	{title = 'CARGADOR',				item = 'rifleclip',				amount = 12,		type = 'item',			desc = 'X12 CARGADORES DE RIFLE'},
	{title = 'ACCESORIO ARMA',			item = 'grip',					amount = 10,		type = 'item',			desc = 'X10 GRIP'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 10,		type = 'item',			desc = 'X10 CARGADOR EXTENDIDO'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'}, -- Nivel 40
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 300000,	type = 'money',			desc = '$300.000'},
	{title = 'FUSIL DE ASALTO',			item = 'WEAPON_ASSAULTRIFLE',	amount = 200,		type = 'weapon',		desc = 'CON 200 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 30,		type = 'item',			desc = 'X30 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 20,		type = 'item',			desc = 'X20 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 6,			type = 'item',			desc = 'X6 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 12,		type = 'item',			desc = 'X12 CARGADORES DE SMG'},
	{title = 'CARGADOR',				item = 'rifleclip',				amount = 12,		type = 'item',			desc = 'X12 CARGADORES DE RIFLE'},
	{title = 'ACCESORIO ARMA',			item = 'grip',					amount = 15,		type = 'item',			desc = 'X15 GRIP'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 15,		type = 'item',			desc = 'X15 CARGADOR EXTENDIDO'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'}, -- Nivel 50
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 300000,	type = 'money',			desc = '$300.000'},
	{title = 'PISTOLA MK2',				item = 'WEAPON_PISTOL_MK2',		amount = 200,		type = 'weapon',		desc = 'CON 200 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 50,		type = 'item',			desc = 'X50 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 30,		type = 'item',			desc = 'X30 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 6,			type = 'item',			desc = 'X6 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 12,		type = 'item',			desc = 'X12 CARGADORES DE SMG'},
	{title = 'CARGADOR',				item = 'rifleclip',				amount = 12,		type = 'item',			desc = 'X12 CARGADORES DE RIFLE'},
	{title = 'ACCESORIO ARMA',			item = 'grip',					amount = 15,		type = 'item',			desc = 'X15 GRIP'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 15,		type = 'item',			desc = 'X15 CARGADOR EXTENDIDO'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'}, -- Nivel 60
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 400000,	type = 'money',			desc = '$400.000'},
	{title = 'SMG MK2',					item = 'WEAPON_SMG_MK2',		amount = 200,		type = 'weapon',		desc = 'CON 200 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 50,		type = 'item',			desc = 'X50 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 30,		type = 'item',			desc = 'X30 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 8,			type = 'item',			desc = 'X8 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 20,		type = 'item',			desc = 'X20 CARGADORES DE SMG'},
	{title = 'CARGADOR',				item = 'rifleclip',				amount = 20,		type = 'item',			desc = 'X20 CARGADORES DE RIFLE'},
	{title = 'ACCESORIO ARMA',			item = 'grip',					amount = 20,		type = 'item',			desc = 'X20 GRIP'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 20,		type = 'item',			desc = 'X20 CARGADOR EXTENDIDO'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'}, -- Nivel 70
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 400000,	type = 'money',			desc = '$400.000'},
	{title = 'FUSIL DE ASALTO MK2',	item = 'WEAPON_ASSAULTRIFLE_MK2',	amount = 200,		type = 'weapon',		desc = 'CON 200 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 50,		type = 'item',			desc = 'X50 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 30,		type = 'item',			desc = 'X30 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 8,			type = 'item',			desc = 'X8 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 20,		type = 'item',			desc = 'X20 CARGADORES DE SMG'},
	{title = 'CARGADOR',				item = 'rifleclip',				amount = 20,		type = 'item',			desc = 'X20 CARGADORES DE RIFLE'},
	{title = 'ACCESORIO ARMA',			item = 'grip',					amount = 20,		type = 'item',			desc = 'X20 GRIP'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 20,		type = 'item',			desc = 'X20 CARGADOR EXTENDIDO'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'}, -- Nivel 80
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 500000,	type = 'money',			desc = '$500.000'},
	{title = 'AP PISTOL',				item = 'WEAPON_APPISTOL',		amount = 200,		type = 'weapon',		desc = 'CON 200 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 50,		type = 'item',			desc = 'X50 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 30,		type = 'item',			desc = 'X30 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 10,		type = 'item',			desc = 'X10 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 20,		type = 'item',			desc = 'X20 CARGADORES DE SMG'},
	{title = 'CARGADOR',				item = 'rifleclip',				amount = 20,		type = 'item',			desc = 'X20 CARGADORES DE RIFLE'},
	{title = 'ACCESORIO ARMA',			item = 'grip',					amount = 25,		type = 'item',			desc = 'X25 GRIP'},
	{title = 'ACCESORIO ARMA',			item = 'clip_extended',			amount = 25,		type = 'item',			desc = 'X25 CARGADOR EXTENDIDO'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 100,		type = 'money',			desc = 'x100 BITCOIN'}, -- Nivel 90
	{title = 'DINERO NEGRO',			item = 'black_money',			amount = 1000000,	type = 'money',			desc = '$1.000.000'},
	{title = 'AP PISTOL',				item = 'WEAPON_APPISTOL',		amount = 200,		type = 'weapon',		desc = 'CON 200 MUNICIONES'},
	{title = 'MARIHUANA',				item = 'marihuana',				amount = 75,		type = 'item',			desc = 'X75 MARIHUANA'},
	{title = 'COCAINA',					item = 'cocawithout',			amount = 50,		type = 'item',			desc = 'X50 COCAINA'},
	{title = 'CHALECO',					item = 'nb-armourhigh',			amount = 10,		type = 'item',			desc = 'X10 CHALECO PESADO'},
	{title = 'CARGADOR',				item = 'smgclip',				amount = 30,		type = 'item',			desc = 'X30 CARGADORES DE SMG'},
	{title = 'CARGADOR',				item = 'rifleclip',				amount = 30,		type = 'item',			desc = 'X30 CARGADORES DE RIFLE'},
	{title = 'CAJA SORPRESA',			item = 'cajaoro',					amount = 5,		type = 'item',			desc = 'X5 CAJA DE ORO'},
	{title = 'CAJA SORPRESA',			item = 'cajadiamante',			amount = 3,		type = 'item',			desc = 'X3 CAJA DIAMANTE'},
	{title = 'BITCOIN',					item = 'bitcoin',				amount = 1000,		type = 'money',			desc = 'x1000 BITCOIN'}, -- Nivel 100
}

ESX = nil

if IsDuplicityVersion() then	--server-side
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	
	--ESX = exports['es_extended']:getSharedObject()
else							--client-side
	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Wait(0)
		end
	end)
	
	--ESX = exports['es_extended']:getSharedObject()
end

