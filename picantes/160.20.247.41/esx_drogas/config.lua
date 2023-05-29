Config = {}

Config.Locale = 'es'

Config.Delays = {
	WeedProcessing = 400 * 20,
	MethProcessing = 400 * 20,
	CokeProcessing = 400 * 20,
	lsdProcessing = 400 * 20,
	HeroinProcessing = 400 * 20,
	thionylchlorideProcessing = 400 * 20,
}

Config.DrugDealerItems = {
	heroin = 246,
	marijuana = 1000,
	meth = 635,
	coke = 427,
	lsd = 798,
}

Config.ChemicalsConvertionItems = {
	hydrochloric_acid = 0,
	sodium_hydroxide = 0,
	sulfuric_acid = 0,
	lsa = 0,
}

Config.ChemicalsLicenseEnabled = false
Config.MoneyWashLicenseEnabled = false

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 15000}
}

Config.Licenses = {
	moneywash = 95000,
	chemicalslisence = 75000,
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	-- Marihuana
	WeedField = {coords = vector3(2194.64, 5566.03, 53.75)},
	WeedProcessing = {coords = vector3(899.854, 3563.341, 33.795)},
	
	-- Metanfetamina
	MethProcessing = {coords = vector3(1980.409, 5176.549, 47.629)},
	HydrochloricAcidFarm = {coords = vector3(290.72, -2434.14, 8.04)},
	SulfuricAcidFarm = {coords = vector3(292.34, -2425.22, 8.04)},
	SodiumHydroxideFarm = {coords = vector3(300.04, -2426.73, 8.04)},
	
	-- Quimicos
	ChemicalsField = {coords = vector3(2410.49, 3062, 48)},
	ChemicalsConvertionMenu = {coords = vector3(-171.72, 6144.22, 42.64)},
	
	-- Cocaina
	CokeField = {coords = vector3(2837.15, -1462.36, 12.14)},
	CokeProcessing = {coords = vector3(-459.05, -1668.09, 19.01)},
	
	--LSD
	lsdProcessing = {coords = vector3(2434.1, 4968.36, 42.35)},
	thionylchlorideProcessing = {coords = vector3(2530.67, 4984.26, 44.83)},
	
	-- Heroina
	HeroinField = {coords = vector3(3501.41, 2577.64, 11.47)},
	HeroinProcessing = {coords = vector3(2340.431, 3128, 48.21)},

	-- Narcotraficante
	DrugDealer = {coords = vector3(2340.431, 3128, 48.21)},
	
	-- Licencia
	LicenseShop = {coords = vector3(-1101.83, 2722.58, 18.8)},
	
	-- Lavado de dinero
	MoneyWash = {coords = vector3(244.82, 371.42, 105.74)},
}