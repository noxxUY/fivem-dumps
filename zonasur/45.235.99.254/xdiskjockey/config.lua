Config = {}

-- Mysql Async type
Config.MysqlAsync = true

--  Ghmatti Mysql type
Config.GhmattiMysql = false

-- oxmysql.
Config.oxmysql = false

-- is the script standalone?
Config.StandAlone = false

-- is the script es_extended based?
Config.ESX = true
Config.ESX_Object = "esx:getSharedObject"

-- is the script qbcore based?
Config.QBCore = false
Config.QBCore_Object = "QBCore:GetObject"

-- Key to open menu
Config.KeyToOpen = "E"

-- Locale for script
Config.Locale = "en"

-- ESX shared object (is no needed, its prebuilded only)
Config.ESX = 'esx:getSharedObject'

-- how much volume will adjust each +/- button
Config.VolumeAdjust = 0.1

-- Do we want cached music for dj mixes? Might be buggy (its experimental feature)
Config.AllowCachedMusic = true

Config.Venta = {
	--Perico = vector3(4902.39,-4941.3,3.37),
	--Vanilla = vector3(128.2389, -1285.15, 29.279),
	--Piletas = vector3(-3023.83, 41.49501, 10.117),
	--Casino = vector3(1108.268, 208.7515, -49.44) --venta casino mapeado: 1108.268, 208.7515, -49.44
}

Config.Items = {
	{value="hamburger", label="Hamburguesa", price=500},
	{value="tacos", label="Tacos", price=500},
	{value="cocacola", label="Coca-Cola", price=500},
	{value="sprite", label="Sprite", price=500},
	{value="beer", label="Cerveza", price=500},
	{value="vodka", label="Vodka", price=1000},
	{value="grand_cru", label="Champagne", price=1000},
	{value="wine", label="Vino", price=500},
}

Config.Blips = {
	--Vanila = vector3(120.72, -1281.12, 29.48),
	--Bahamas = vector3(-1378.58, -628.918, 30.627),
	Perico = vector3(4893.404, -4903.89, 3.4866),
	--Piletas = vector3(-3023.16, 38.35131, 10.117),
}
-- DJ mixer list
Config.MixerList = { 
    vanila = {
        mixer = {
            {
                pos = vector3(106.2528,-1305.98,21.111),
                distance = 5,
            },
			jobs = {"vanilla", "banda8", "steam:110000134f39d79"}, -- if left nil everyone will be able to open it
			steam = nil,
        },
        speaker = {
            {
                pos = vector3(104.2497,-1287.95,22.079),
                distance = 45,
            },
        },
        defaultVolume = 1.0,
    },
   
    Bahamas = {
        mixer = {
            {
                pos = vector3(-1378.58, -628.918, 30.627),
				distance = 5,
            },
			jobs = {"bahamas", "steam:11000014e866f7f"}, -- if left nil everyone will be able to open it
			steam = nil,
        },
        speaker = {
            {
				pos = vector3(-1383.43, -621.505, 29.926),
                distance = 25,
            },
        },
        defaultVolume = 1.0,
	},
	
	--[[
	Flamingov1 = {
        mixer = {
            {
                pos = vector3(-2331.08,-489.971,9.8212),
				distance = 5,
            },
			jobs = {"flamingo", "steam:110000106e6d6fc"}, -- if left nil everyone will be able to open it
			steam = 'steam:110000106e6d6fc',
        },
        speaker = {
            {
				pos = vector3(-2321.97,-514.022,9.6420),
                distance = 60,
            },
        },
        defaultVolume = 1.0,
	},
	]]--
	
    Perico = {
        mixer = {
            {
                pos = vector3(4893.404, -4903.89, 3.4866),
                distance = 5,
            },
			jobs = nil, -- if left nil everyone will be able to open it
			steam = nil,
        },
        speaker = {
            {
                pos = vector3(4890.584, -4924.37, 3.3675),
                distance = 45,
            },
		},
        defaultVolume = 1.0,
    },
	
	galaxy = {
        mixer = {
            {
                pos = vector3(375.8097, 275.8189, 92.399),
                distance = 5,
            },
			jobs = {"galaxy"}, -- if left nil everyone will be able to open it
			steam = nil,
        },
        speaker = {
            {
                pos = vector3(369.1427, 277.7478, 91.189),
                distance = 30,
            },
        },
        defaultVolume = 1.0,
    },
	
	Tequila = {
        mixer = {
            {
                pos = vector3(-560.684,281.7427,85.676),
                distance = 5,
            },
			jobs = {"tequila"}, -- if left nil everyone will be able to open it
			steam = nil,
        },
        speaker = {
            {
                pos = vector3(-553.881,285.6683,82.176),
                distance = 30,
            },
        },
        defaultVolume = 1.0,
    },
}