Config = {}

Config.Locale = 'es'

Config.Delays = {
	WeedProcessing = 1000 * 10,
	MethProcessing = 1000 * 10,
	CokeProcessing = 1000 * 10,
	lsdProcessing = 1000 * 10,
	HeroinProcessing = 1000 * 10,
	thionylchlorideProcessing = 1000 * 10,
}

Config.DrugDealerItems = {
	heroin = 1046,
	marijuana = 4100,
	meth = 1835,
	coke = 4900,
	lsd = 2000,
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
	moneywash = 750000000,
	chemicalslisence = 100000000,
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	--Weed
	WeedField = {coords = vector3(3417.441, 5499.842, 23.824)},
	WeedProcessing = {coords = vector3(1258.05, -2559.41, 42.72)},
	
	
	--Chemicals
	ChemicalsField = {coords = vector3(817.46, -3192.84, 500.9)},
	ChemicalsConvertionMenu = {coords = vector3(3718.8, 4533.45, 210.67)},
	
	--Coke
	CokeField = {coords = vector3(867.22, 3336.97, 44.41)},
	CokeProcessing = {coords = vector3(3614.02, 5023.72, 11.34)},
	
	--LSD
	lsdProcessing = {coords = vector3(91.26, 3749.31, 401.77)},
	
	--Heroin

	--DrugDealer
	DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66)},
	
	--License
	LicenseShop = {coords = vector3(5467.63, -4521.43, 210.0)},
	
}
