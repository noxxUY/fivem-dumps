Config = {}

Config.Locale = 'es'

Config.DrawDistance               = 20
Config.MarkerColor                = {r = 0, g = 128, b = 255}

Config.Delays = {
	WeedProcessing = 1000 * 10,
	MethProcessing = 1000 * 10,
	CokeProcessing = 1000 * 10,
	lsdProcessing = 1000 * 10,
	HeroinProcessing = 1000 * 10,
	--thionylchlorideProcessing = 1000 * 10,
}

Config.DrugDealerItems = {
	heroin = 1500,
	marijuana = 1500,
	meth = 800,
	coke = 1500,
	petroleumgross = 3500,
	lsd = 800,
}

-- Config.ChemicalsConvertionItems = {
-- 	hydrochloric_acid = 0,
-- 	sodium_hydroxide = 0,
-- 	sulfuric_acid = 0,
-- 	lsa = 0,
-- }

Config.ChemicalsConvertionItems = {
	petroleumgross = 0,
}

Config.ChemicalsLicenseEnabled = false --Will Enable or Disable the need for a Chemicals License.
Config.MoneyWashLicenseEnabled = false --Will Enable or Disable the need for a MoneyWash License.

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 15000}
}

Config.Licenses = {
	moneywash = 75000,
	chemicalslisence = 100000,
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	--Marihuana
	WeedField = {coords = vector3(2224.64, 5577.03, 53.85)},
	WeedProcessing = {coords = vector3(2329.12, 2571.86, 46.68)},
	
	--meth
	MethProcessing = {coords = vector3(1390.33, 3608.5, 38.94)},
	--HydrochloricAcidFarm = {coords = vector3(2724.12, 1583.03, 24.5), name = _U('blip_HydrochloricAcidFarm'), color = 25, sprite = 496, radius = 7.0},
	--SulfuricAcidFarm = {coords = vector3(3333.34, 5160.22, 18.31), name = _U('blip_SulfuricAcidFarm'), color = 25, sprite = 496, radius = 5.0},
	--SodiumHydroxideFarm = {coords = vector3(3270.36, 5198.99, 19.34), name = _U('blip_SodiumHydroxideFarm'), color = 25, sprite = 496, radius = 7.0},
	
	--Petróleo
	--ChemicalsField = {coords = vector3(817.46, -3192.84, 5.9), name = _U('blip_ChemicalsFarm'), color = 25, sprite = 496, radius = 0.0},
	ChemicalsField = {coords = vector3(1020.92, -3260.5, 5.9)}, 
	ChemicalsConvertionMenu = {coords = vector3(488.01, -3348.2, 6.07)},
	
	--Coke
	CokeField = {coords = vector3(-310.43, 2496.34, 76.60)},
	CokeProcessing = {coords = vector3(1689.14, 3291.36, 41.15)},
	
	--LSD
	lsdProcessing = {coords = vector3(91.26, 3749.31, 40.77)},
	--thionylchlorideProcessing = {coords = vector3(1903.98, 4922.70, 48.16), name = _U('blip_lsdprocessing'),color = 25, sprite = 496, radius = 20.0},
	
	--Heroin 
	HeroinField = {coords = vector3(2538.0275878906, 4367.6469726563, 39.405807495117)},
	HeroinProcessing = {coords = vector3(1443.39,6332.97,23.98)},

	--DrugDealer
	DrugDealer = {coords = vector3(-840.46697998047, -397.47909545898, 31.325550079346)},
	DrugDealer2 = {x = -840.47, y = -397.48, z = 31.33, h = 294.34}, -- PONER LO MISMO QUE ARRIBA + Agregar heading
	
	--License
	LicenseShop = {coords = vector3(707.17, -962.5, -30.4)},
	
	--MoneyWash
	MoneyWash = {coords = vector3(1129.8551025391, -989.15954589844, 45.969203948975)},
}

Config.Zones = {

	ChemicalsConvertionMenu = {
		Pos   = vector3(488.01, -3348.2, 6.07),
		Size  = {x = 0.4, y = 0.4, z = 0.4},
		Type  = 32
	},

	MoneyWash = {
		Pos   = vector3(1129.8551025391, -989.15954589844, 45.969203948975),
		Size  = {x = 0.4, y = 0.4, z = 0.4},
		Type  = 32
	},

}


Config.Marker = {
	r = 19, g = 173, b = 42, a = 100,  -- red color 24, 84, 40 
	x = 0.6, y = 0.6, z = 0.8,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 29    -- default circle type, low draw distance due to indoors area
}

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary  

Lavados = {
	["jacobo"] = {
		position = {x = -141.06, y= -645.45, z= 168.82},
		comision = 0,
		nombreDePunto = "Jacobo",
		Hexa = "steam:11000010ccf1686",
		expiracion = "permanente"
	},


	["Wezzo"] = {
		position = {x = -77.17, y= -815.88, z= 326.18},
		comision = 0,
		nombreDePunto = "Wezzo",
		Hexa = "license:12bd19d51cd2873e80da90c55a03ae2567c53cd7",
		expiracion = "permanente"
	},

	["Scarfz"] = {
		position = {x = 911.88, y= -639.78, z= 58.01},
		comision = 0,
		nombreDePunto = "Scarfz",
		Hexa = "license:c9c162446f9a37d706391b8ede3a35e7e3fa04de",
		expiracion = "permanente"
	},

	["W9"] = {
		position = {x = 1558.55, y= 1867.6, z= 98.07},
		comision = 0,
		nombreDePunto = "W9",
		Hexa = "license:1f626b7af86ec9a88f50e21198afd83a69507007",
		expiracion = "permanente"
	},

	["Wasabi"] = {
		position = {x = 981.43, y= -1849.46, z= 26.41},
		comision = 0,
		nombreDePunto = "Wasabi",
		Hexa = "license:a636698181b9837b23516e32647a19f67f64ebf0",
		expiracion = "permanente"
	},

	["role1"] = {
		position = {x = -1862.5, y= 2069.87, z= 141.0},
		comision = 0,
		nombreDePunto = "Role1",
		Hexa = "steam:1100001464f6424",
		expiracion = "permanente" 
	}
}