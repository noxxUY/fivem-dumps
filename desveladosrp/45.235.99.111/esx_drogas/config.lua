Config = {}

Config.Locale = 'es'

Config.Delays = {
	WeedProcessing = 500 * 35,
	MethProcessing = 500 * 15,
	CokeProcessing = 500 * 35,
	lsdProcessing = 500 * 35,
	HeroinProcessing = 500 * 35,
	thionylchlorideProcessing = 500 * 5,
}

Config.DrugDealerItems = {
	heroin = 25000,
	marijuana = 60000,
	meth = 200000,
	coke = 10000,
	lsd = 115000,
}

Config.ChemicalsConvertionItems = {
	hydrochloric_acid = 1,
	sodium_hydroxide = 1,
	sulfuric_acid = 1,
	lsa = 1,
}

Config.ChemicalsLicenseEnabled = false --Will Enable or Disable the need for a Chemicals License.

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 15000}
}

Config.Licenses = {
	chemicalslisence = 100000,
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	--Weed
	WeedField = {coords = vector3(269.6, 4370.72, 47.2), name = _U('blip_WeedFarm'), color = 25, sprite = 140, radius = 20.0},
	WeedProcessing = {coords = vector3(1442.769, 6332.308, 23.97217), name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 1.0},
	
	--meth
	MethProcessing = {coords = vector3(57.07253, 3690.567, 39.91211), name = _U('blip_methprocessing'), color = 26, sprite = 499, radius = 0.0},
	HydrochloricAcidFarm = {coords = vector3(1260.422, -2566.207, 42.70911), name = _U('blip_HydrochloricAcidFarm'), color = 26, sprite = 499, radius = 7.0},
	SulfuricAcidFarm = {coords = vector3(5379.48, -5256.72, 34.04), name = _U('blip_SulfuricAcidFarm'), color = 26, sprite = 499, radius = 5.0},
	SodiumHydroxideFarm = {coords = vector3(2945.36, 2797.48, 50.04), name = _U('blip_SodiumHydroxideFarm'), color = 26, sprite = 499, radius = 7.0},
	
	--Chemicals
	ChemicalsField = {coords = vector3(-2175.31, 5175.402, 15.32825), name = _U('blip_ChemicalsFarm'), color = 4, sprite = 310, radius = 0.0},
	ChemicalsConvertionMenu = {coords = vector3(250.4967, -1347.363, 24.5282), name = _U('blip_ChemicalsProcessing'), color = 4, sprite = 310, radius = 0.0},
	
	--Coke
	CokeField = {coords = vector3(1955.723, 4856.822, 45.569), name = _U('blip_CokeFarm'), color = 37, sprite = 514, radius = 20.0},
	CokeProcessing = {coords = vector3(1442.769, 6332.308, 23.97217), name = _U('blip_Cokeprocessing'),color = 37, sprite = 514, radius = 2.0},
	
	--LSD
	lsdProcessing = {coords = vector3(429.8637, 6474.949, 28.77441), name = _U('blip_lsdprocessing'),color = 48, sprite = 51, radius = 20.0},
	thionylchlorideProcessing = {coords = vector3(1391.182, 3607.846, 38.93481), name = _U('blip_lsdprocessing'),color = 48, sprite = 51, radius = 2.0},
	
	--Heroin
	HeroinField = {coords = vector3(4597.398, -4856.453, 16.32239), name = _U('blip_heroinfield'), color = 25, sprite = 497, radius = 20},
	HeroinProcessing = {coords = vector3(2329.477, 2571.244, 46.70251), name = _U('blip_heroinprocessing'), color = 25, sprite = 497, radius = 1.0},

	--DrugDealer
	DrugDealer = {coords = vector3(3094.378, -4718.967, 15.26086), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 1.0},
	
	--License
	LicenseShop = {coords = vector3(2707.17, -2962.5, 230.4), name = _U('blip_lsdprocessing'),color = 25, sprite = 496, radius = 20.0},
}
