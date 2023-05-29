Config = {}

Config.Locale = 'es'

Config.Delays = {
	WeedProcessing = 1000 * 7
}

Config.DrugDealerItems = {
	marijuana = 91
}

Config.spawnLocations 	= {
	{x=2216.59,y=5579.66,z=53.96},
	{x=2217.43,y=5577.54,z=53.85},
	{x=2217.12,y=5575.23,z=53.72},
	{x=2219.58,y=5575.19,z=53.72},
	{x=2219.63,y=5577.22,z=53.85},
	{x=2220.56,y=5579.5,z=53.95},
	{x=2224.09,y=5576.96,z=53.85},
	{x=2224.91,y=5574.62,z=53.76},
	{x=2226.61,y=5576.91,z=53.86},
	{x=2227.57,y=5579.03,z=53.95},
	{x=2228.93,y=5576.71,z=53.91},
	{x=2229.08,y=5574.42,z=53.87},
	{x=2231.25,y=5576.51,z=53.99},
	{x=2231.99,y=5578.85,z=54.07},
	{x=2234.24,y=5576.39,z=54.06},
	{x=2233.5,y=5574.17,z=54.00}
}

Config.spawnCoke = {
	{x=1052.222,y=-2475.08,z=28.486},
	{x=1050.366,y=-2470.80,z=28.507},
	{x=1050.571,y=-2467.55,z=28.506},
	{x=1052.864,y=-2469.81,z=28.499},
	{x=1054.282,y=-2464.92,z=28.547},
	{x=1057.366,y=-2464.69,z=28.608},
	{x=1057.423,y=-2468.95,z=28.586},
	{x=1056.929,y=-2473.35,z=28.556},
	{x=1060.154,y=-2474.68,z=28.613},
	{x=1061.318,y=-2470.58,z=28.648},
	{x=1062.896,y=-2465.43,z=28.711},
	{x=1065.924,y=-2473.20,z=28.764},
	{x=1069.496,y=-2474.83,z=28.844},
}

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 15000}
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	WeedField = {	
		[1] = {x=2216.59,y=5579.66,z=53.96},
		[2] = {x=2217.43,y=5577.54,z=53.85}
	},	
	WeedFieldCoke = {coords = vector3(1057.423,-2468.95,28.586), name = 'Procesar Cocaina', color = 25, sprite = 496, radius = 20.0},
	WeedProcessing = {coords = vector3(1255.74, -1992.45, 43.49), name = _U('blip_weedprocessing'), color = 25, sprite = 496},
	--CokeProcessing = {coords = vector3(2431.13,4970.64,42.35), name = _U('blip_weedprocessing'), color = 25, sprite = 496},	
	--ProcesoQuimico = {coords = vector3(2431.99,4967.63,42.35), name = _U('blip_weedprocessing'), color = 25, sprite = 496},	
	--ProcesoCoca = {coords = vector3(2435.93,4965.38,42.35), name = _U('blip_weedprocessing'), color = 25, sprite = 496},
	--DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66), name = _U('blip_drugdealer'), color = 6, sprite = 378},
}

Config.RopaCoca = {x=2428.71,y=4969.36,z=42.35}
Config.ProcesoHoja = {x=2431.13,y=4970.64,z=42.35}
Config.ProcesoQuimico = {x=2431.99,y=4967.63,z=42.35}
Config.ProcesoCoca = {x=2435.93,y=4965.38,z=42.35}

Config.Uniforms = {
	coca = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 67,   ['torso_2'] = 2,
			['arms'] = 88,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['pants_1'] = 40,   ['pants_2'] = 2,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['mask_1'] = 38,
			['glasses_1'] = -1,  ['glasses_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bracelets_1'] = -1,
			['watches_1'] = -1, ['watches_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 61,   ['torso_2'] = 2,
			['arms'] = 101,
			['bags_1'] = 0,    ['bags_2'] = 0,
			['pants_1'] = 40,   ['pants_2'] = 2,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['mask_1'] = 38,
			['glasses_1'] = -1,  ['glasses_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bracelets_1'] = -1,
			['watches_1'] = -1, ['watches_2'] = 0
		}
	}
}