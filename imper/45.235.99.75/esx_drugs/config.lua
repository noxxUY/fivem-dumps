Config = {}

Config.Locale = 'es'

Config.Delays = {
	WeedProcessing = 1000 * 7,
	MethProcessing = 1000 * 7,
	CokeProcessing = 1000 * 7,
	lsdProcessing = 1000 * 5,
	HeroinProcessing = 1000 * 5,
	thionylchlorideProcessing = 1000 * 7,
}

Config.DrugDealerItems = {
	heroin = 1000000,
	marijuana = 900000,
	meth = 100000,
	coke = 350000,
	lsd = 1300000,
}

Config.ChemicalsConvertionItems = {
	lsa = 0,
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

	WeedField = {coords = vector3(2530.8, 4353.7, 40.3), name = _U('blip_WeedFarm'), color = 25, sprite = 496, radius = 100.0},

	WeedProcessing = {coords = vector3(2329.12, 2571.86, 46.68), name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 100.0},

	ChemicalsField = {coords = vector3(484.13, -3143.66, 6.07)},
	
	ChemicalsConvertionMenu = {coords = vector3(2262.14, 4980.73, 42.39), name = _U('blip_ChemicalsProcessing'), color = 25, sprite = 496, radius = 0.0},
	
	CokeField = {coords = vector3(-310.43, 2496.34, 76.60), name = _U('blip_CokeFarm'), color = 25, sprite = 496, radius = 20.0},
	CokeProcessing = {coords = vector3(1689.14, 3291.36, 41.15), name = _U('blip_Cokeprocessing'),color = 25, sprite = 496, radius = 20.0},

	lsdProcessing = {coords = vector3(3333.34, 5160.22, 18.31), name = _U('blip_lsdprocessing'),color = 25, sprite = 496, radius = 20.0},
	thionylchlorideProcessing = {coords = vector3(1028.85, 1648.75, -42.49), name = _U('blip_lsdprocessing'),color = 25, sprite = 496, radius = 20.0},

    HeroinField = {coords = vector3(13.4, 6852.5, 13.2)},
	
	HeroinProcessing = {coords = vector3(10.34, -519.53, 18.46), name = _U('blip_heroinprocessing'), color = 25, sprite = 496, radius = 100.0},
	
	DrugDealer = {coords = vector3(1545.8, 2182.02, 78.81)},

}
