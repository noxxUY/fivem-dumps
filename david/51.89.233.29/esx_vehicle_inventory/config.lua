--Truck
Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 100000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 0



-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {
	bread = 150,
	water = 330,
	cannabis = 100,
	marijuana = 300,
	metanfetamina = 100,
	metarefinada = 300,
	cocaina = 100,
	tablascocaina = 300,
	advanced_scope = 300,
	alive_chicken = 400,
	armor = 800,
	bandage = 330,
	barrel = 300,
	blowpipe = 330,
	carokit = 330,
	carotool = 330,
	clip = 500,
	clothe = 150,
	coffee = 330,
	coke = 150,
	coke_pooch = 300,
	compansator = 300,
	copper = 450,
	croquettes = 130,
	cutted_wood = 800,
	diamond = 450,
	essence = 600,
	extended_magazine = 300,
	fabric = 150,
	fish = 130,
	fixkit = 330,
	fixtool = 330,
	flashlight = 300,
	fmj = 300,
	gazbottle = 300,
	gold = 450,
	grip = 300,
	hollow = 300,
	incendiary = 300,
	iron = 450,
	lazer_scope = 300,
	lowrider = 300,
	medikit = 300,
	meth = 150,
	meth_pooch = 300,
	moneywashid = 1,
	nightvision_scope = 300,
	opium = 150,
	opium_pooch = 300,
	packaged_chicken = 400,
	packaged_plank = 400,
	petrol = 800,
	petrol_raffin = 800,
	poubelle = 200,
	scope = 300,
	silent = 300,
	slaughtered_chicken = 400,
	stone = 800,
	thermal_scope = 300,
	tracer_clip = 300,
	turtle = 600,
	turtle_meat = 600,
	very_extended_magazine = 300,
	washed_stone = 800,
	weed = 150,
	weed_pooch = 300,
	wood = 800,
	wool = 400,
	yusuf = 300,
	WEAPON_KNIFE = 300,
	WEAPON_NIGHTSTICK = 300,
	WEAPON_HAMMER = 300,
	WEAPON_BAT = 300,
	WEAPON_GOLFCLUB = 300,
	WEAPON_CROWBAR = 300,
	WEAPON_PISTOL = 1000,
	WEAPON_COMBATPISTOL = 1000,
	WEAPON_APPISTOL = 1000,
	WEAPON_PISTOL50 = 1000,
	WEAPON_MICROSMG = 1200,
	WEAPON_SMG = 1200,
	WEAPON_ASSAULTSMG = 2000,
	WEAPON_ASSAULTRIFLE = 2000,
	WEAPON_CARBINERIFLE = 2000,
	WEAPON_ADVANCEDRIFLE = 2000,
	WEAPON_MG = 2000,
	WEAPON_COMBATMG = 2000,
	WEAPON_PUMPSHOTGUN = 2000,
	WEAPON_SAWNOFFSHOTGUN = 2000,
	WEAPON_ASSAULTSHOTGUN = 2000,
	WEAPON_BULLPUPSHOTGUN = 2000,
	WEAPON_STUNGUN = 800,
	WEAPON_SNIPERRIFLE = 2000,
	WEAPON_HEAVYSNIPER = 2000,
	WEAPON_REMOTESNIPER = 2000,
	WEAPON_GRENADELAUNCHER = 2000,
	WEAPON_RPG = 2000,
	WEAPON_STINGER = 2000,
	WEAPON_MINIGUN = 2000,
	WEAPON_GRENADE = 800,
	WEAPON_STICKYBOMB = 1000,
	WEAPON_SMOKEGRENADE = 800,
	WEAPON_BZGAS = 800,
	WEAPON_MOLOTOV = 800,
	WEAPON_FIREEXTINGUISHER = 800,
	WEAPON_PETROLCAN = 800,
	WEAPON_DIGISCANNER = 800,
	WEAPON_BALL = 800,
	WEAPON_SNSPISTOL = 1000,
	WEAPON_BOTTLE = 300,
	WEAPON_GUSENBERG = 1000,
	WEAPON_SPECIALCARBINE = 2000,
	WEAPON_HEAVYPISTOL = 1000,
	WEAPON_BULLPUPRIFLE = 2000,
	WEAPON_DAGGER = 300,
	WEAPON_VINTAGEPISTOL = 1000,
	WEAPON_FIREWORK = 2000,
	WEAPON_MUSKET = 2000,
	WEAPON_HEAVYSHOTGUN = 2000,
	WEAPON_MARKSMANRIFLE = 2000,
	WEAPON_HOMINGLAUNCHER = 2000,
	WEAPON_PROXMINE = 1000,
	WEAPON_SNOWBALL = 300,
	WEAPON_FLAREGUN = 800,
	WEAPON_GARBAGEBAG = 1000,
	WEAPON_HANDCUFFS = 1000,
	WEAPON_COMBATPDW = 1200,
	WEAPON_MARKSMANPISTOL = 1000,
	WEAPON_KNUCKLE = 300,
	WEAPON_HATCHET = 300,
	WEAPON_RAILGUN = 1000,
	WEAPON_MACHETE = 300,
	WEAPON_MACHINEPISTOL = 1000,
	WEAPON_SWITCHBLADE = 300,
	WEAPON_REVOLVER = 1000,
	WEAPON_DBSHOTGUN = 2000,
	WEAPON_COMPACTRIFLE = 2000,
	WEAPON_AUTOSHOTGUN = 2000,
	WEAPON_BATTLEAXE = 300,
	WEAPON_COMPACTLAUNCHER = 2000,
	WEAPON_MINISMG = 1000,
	WEAPON_PIPEBOMB = 800,
	WEAPON_POOLCUE = 300,
	WEAPON_WRENCH = 300,
	WEAPON_FLASHLIGHT = 300,
	GADGET_NIGHTVISION = 500,
	GADGET_PARACHUTE = 500,
	WEAPON_FLARE = 300,
	WEAPON_SNSPISTOL_MK2 = 1000,
	WEAPON_REVOLVER_MK2 = 1000,
	WEAPON_DOUBLEACTION = 2000,
	WEAPON_SPECIALCARBINE_MK2 = 2000,
	WEAPON_BULLPUPRIFLE_MK2 = 2000,
	WEAPON_PUMPSHOTGUN_MK2 = 2000,
	WEAPON_MARKSMANRIFLE_MK2 = 2000,
	WEAPON_ASSAULTRIFLE_MK2 = 2000,
	WEAPON_CARBINERIFLE_MK2 = 2000,
	WEAPON_COMBATMG_MK2 = 2000,
	WEAPON_HEAVYSNIPER_MK2 = 2000,
	WEAPON_PISTOL_MK2 = 1000,
	WEAPON_SMG_MK2 = 1000,
	black_money = 1, -- poids pour un argent
}


-- http://gta.wikia.com/wiki/Category:Vehicle_Classes

Config.VehicleLimit ={
    [0]=120, -- Compacts
    [1]=140, -- Sedans
    [2]=300, -- SUVs
    [3]=170, -- Coupes
    [4]=120, -- Muscle
    [5]=75, -- Sports Classics
    [6]=100, -- Sports
    [7]=50, -- Super
    [8]=20, -- Motorcycles
    [9]=160, -- Off-road
    [10]=900, -- Industrial
    [11]=300, -- Utility
    [12]=600, -- Vans
    [13]=0, -- Cycles
    [14]=180, -- Boats
    [15]=300, -- Helicopters
    [16]=300, -- Planes
    [17]=300, -- Service
    [18]=300, -- Emergency
    [19]=1000, -- Military
    [20]=1500, -- Commercial
}


