--Truck
Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 100



-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {
	bread = 500,
	water = 500,
	WEAPON_COMBATPISTOL = 1500, -- poid poir une munnition
	WEAPON_PISTOL50 = 1500,
	WEAPON_PISTOL = 1500,
	WEAPON_REVOLVER = 5000,
	WEAPON_MACHINEPISTOL = 5000,
	WEAPON_COMBATPDW = 5000,
	GADGET_PARACHUTE = 1500,
	
	WEAPON_GUSENBERG = 4000,
	
	WEAPON_ASSAULTRIFLE = 4000,
	WEAPON_SPECIALCARBINE = 4000,
	WEAPON_SAWNOFFSHOTGUN = 3000,
	WEAPON_BAT = 1000,
	WEAPON_MACHETE = 1000,
	WEAPON_SWITCHBLADE = 1000,
	WEAPON_HEAVYPISTOL = 1500,
	WEAPON_DOUBLEACTION = 3500,
	headbag = 1000,
	raspberry = 1000,
	phone = 1000,
	c4_bank = 5000,
	blowtorch = 2500,
	multi_key = 1000,
	weaclip = 1000,
	black_money = 1, -- poids pour un argent
	marijuana = 500,
	mari_paquet = 500,
	coke = 500,
	coke_pooch = 500,
	metanfetamina = 500,
	metanfetamina_pooch = 500,
	stone = 5000,
	washed_stone = 5000,
	petrol = 5000,
	petrol_raffin = 5000,
	alive_chicken = 10000,
	slaughtered_chicken = 10000,
	packaged_chicken = 10000,
	wood = 5000,
	cutted_wood = 5000,
	packaged_plank = 5000,
	fish = 500,
	shark = 10000,
	turtle = 5000,
	kev1 = 1000,
	kev2 = 1000,
	kev3 = 1000,
	kev4 = 1000,
	div1 = 2000,
	div2 = 2000,
}


Config.VehicleLimit = {
    [0] = 30000, --Compact
    [1] = 40000, --Sedan
    [2] = 70000, --SUV
    [3] = 25000, --Coupes
    [4] = 30000, --Muscle
    [5] = 10000, --Sports Classics
    [6] = 25000, --Sports
    [7] = 25000, --Super
    [8] = 5000, --Motorcycles
    [9] = 180000, --Off-road
    [10] = 300000, --Industrial
    [11] = 70000, --Utility
    [12] = 100000, --Vans
    [13] = 0, --Cycles
    [14] = 5000, --Boats
    [15] = 25000, --Helicopters
    [16] = 25000, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 0, --Military
    [20] = 300000, --Commercial
    [21] = 0, --Trains
}
Config.VehiclePlate = {
	taxi        = "TAXI",
	cop         = "LSPD",
	ambulance   = "EMS0",
	mecano	    = "MECA",
}
