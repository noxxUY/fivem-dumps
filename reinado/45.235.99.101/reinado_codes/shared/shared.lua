Config = {}


----
-- Anti Bug
----

-- maximum radius the camera will orbit at (in meters)
Config.radius = 1.5

----
-- ID ADMIN
----

Config.SeeOwnLabel = true
Config.SeeDistance = 100
Config.TextSize = 0.8
Config.ZOffset = 1.2
Config.NearCheckWait = 500
Config.TagByPermission = false --Using xPlayer.getPermissions() which is deprecated method for old ESX
Config.GroupLabels = {
    helper = "STAFF",
    soporte = "STAFF",
    mod = "~g~STAFF",
    moderador = "~g~STAFF",
    admin = "~b~STAFF",
    superadmin = "~r~STAFF",
}

Config.PermissionLabels = {
    [1] = "STAFF",
    [2] = "STAFF",
    [3] = "~g~STAFF",
    [4] = "~b~STAFF",
    [5] = "~r~STAFF",
    [6] = "~r~STAFF",
}

----
-- Ropa Faccion
----
Config.Factions = { 
	
	Policia = {
		JobName = "police",
		Society = "society_police",

		Vehicles = {
			{model = 'polgs350'},
            {model = 'motopfa'},
            {model = 'camionetapfa'},
			{model = 'carpol'},
            {model = 'polgt17'},
            {model = 'autosecreto'},
            {model = 'chevpol'},
            {model = 'polraptor'},
            {model = 'geof'},
            {model = 'cgeof'},
            {model = 'pol718'},
            {model = 'g63amg6x6cop'},
		},
	},
}

Config.Jobs = {
    {
        job = 'police',
        title = 'POLICIA',
        tshirt = vector4(8, 57, 0, 2),  -- Remera
        panta = vector4(4, 35, 0, 2),    -- Pantalon
        shoes = vector4(6, 24, 0, 2),   -- Zapatos
        torso = vector4(11, 29, 0, 2),   -- torso
        chaleco = vector4(9, 6, 0, 2),   -- Chaleco
        coords = vector3(462.8650, -996.4364, 30.6896)
    },
    {
        job = 'police',
        title = 'POLICIA',
        tshirt = vector4(8, 34, 0, 2),  -- Remera
        panta = vector4(4, 34, 0, 2),    -- Pantalon
        shoes = vector4(6, 25, 0, 2),   -- Zapatos
        torso = vector4(11, 48, 0, 2),   -- torso
        chaleco = vector4(9, 31, 9, 2),   -- Chaleco
        coords = vector3(460.3521, -996.2648, 30.6896)
    },
    {
        job = 'fbi',
        title = 'FBI',
        tshirt = vector4(8, 16, 0, 2),  -- Remera
        panta = vector4(4, 47, 0, 2),    -- Pantalon
        shoes = vector4(6, 61, 0, 2),   -- Zapatos
        torso = vector4(11, 22, 1, 2),   -- torso
        chaleco = vector4(9, 12, 2, 2),   -- Chaleco
        coords = vector3(2515.4482, -357.7341, 94.1302)
    }
	
	--[[ ,
    {
        job = 'ambulance',
        title = 'AMBULANCIA',
        tshirt = vector4(8, 20, 0, 2),  -- Remera
        panta = vector4(4, 86, 3, 2),    -- Pantalon
        shoes = vector4(6, 77, 1, 2),   -- Zapatos
        torso = vector4(11, 244, 0, 2),   -- torso
        chaleco = vector4(9, 0, 0, 2),   -- Chaleco
        coords = vector3(-826.4277, -1237.5442, 7.3374)
    } ]]
}
 



--[[
	Blacklisted Weapons
]]


-- IMPORTANT: Some of these values MUST be defined as a floating point number. ie. 10.0 instead of 10
Config.VehicleDamage = {
	deformationMultiplier = -1,					-- How much should the vehicle visually deform from a collision. Range 0.0 to 10.0 Where 0.0 is no deformation and 10.0 is 10x deformation. -1 = Don't touch. Visual damage does not sync well to other players.
	deformationExponent = 0.4,					-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
	collisionDamageExponent = 0.6,				-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.

	damageFactorEngine = 1.0,					-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
	damageFactorBody = 1.0,						-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
	damageFactorPetrolTank = 16.0,				-- Sane values are 1 to 200. Higher values means more damage to vehicle. A good starting point is 64
	engineDamageExponent = 0.6,					-- How much should the handling file engine damage setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
	weaponsDamageMultiplier = -1,				-- How much damage should the vehicle get from weapons fire. Range 0.0 to 10.0, where 0.0 is no damage and 10.0 is 10x damage. -1 = don't touch
	degradingHealthSpeedFactor = 2,			-- Speed of slowly degrading health, but not failure. Value of 10 means that it will take about 0.25 second per health point, so degradation from 800 to 305 will take about 2 minutes of clean driving. Higher values means faster degradation
	cascadingFailureSpeedFactor = 4.0,			-- Sane values are 1 to 100. When vehicle health drops below a certain point, cascading failure sets in, and the health drops rapidly until the vehicle dies. Higher values means faster failure. A good starting point is 8

	degradingFailureThreshold = 120.0,			-- Below this value, slow health degradation will set in
	cascadingFailureThreshold = 100.0,			-- Below this value, health cascading failure will set in
	engineSafeGuard = 160.0,					-- Final failure value. Set it too high, and the vehicle won't smoke when disabled. Set too low, and the car will catch fire from a single bullet to the engine. At health 100 a typical car can take 3-4 bullets to the engine before catching fire.

	torqueMultiplierEnabled = true,				-- Decrease engine torque as engine gets more and more damaged

	limpMode = false,							-- If true, the engine never fails completely, so you will always be able to get to a mechanic unless you flip your vehicle and preventVehicleFlip is set to true
	limpModeMultiplier = 0.19,					-- The torque multiplier to use when vehicle is limping. Sane values are 0.05 to 0.25

	preventVehicleFlip = true,					-- If true, you can't turn over an upside down vehicle

	sundayDriver = false,						-- If true, the accelerator response is scaled to enable easy slow driving. Will not prevent full throttle. Does not work with binary accelerators like a keyboard. Set to false to disable. The included stop-without-reversing and brake-light-hold feature does also work for keyboards.
	sundayDriverAcceleratorCurve = 7.5,			-- The response curve to apply to the accelerator. Range 0.0 to 10.0. Higher values enables easier slow driving, meaning more pressure on the throttle is required to accelerate forward. Does nothing for keyboard drivers
	sundayDriverBrakeCurve = 5.0,				-- The response curve to apply to the Brake. Range 0.0 to 10.0. Higher values enables easier braking, meaning more pressure on the throttle is required to brake hard. Does nothing for keyboard drivers

	compatibilityMode = false,					-- prevents other scripts from modifying the fuel tank health to avoid random engine failure with BVA 2.01 (Downside is it disabled explosion prevention)

	randomTireBurstInterval = 0,				-- Number of minutes (statistically, not precisely) to drive above 22 mph before you get a tire puncture. 0=feature is disabled

	-- Class Damagefactor Multiplier
	-- The damageFactor for engine, body and Petroltank will be multiplied by this value, depending on vehicle class
	-- Use it to increase or decrease damage for each class
	classDamageMultiplier = {
		[0] = 	1.0,		--	0: Compacts
				1.0,		--	1: Sedans
				1.0,		--	2: SUVs
				1.0,		--	3: Coupes
				1.0,		--	4: Muscle
				1.0,		--	5: Sports Classics
				1.0,		--	6: Sports
				1.0,		--	7: Super
				0.25,		--	8: Motorcycles
				0.7,		--	9: Off-road
				0.25,		--	10: Industrial
				1.0,		--	11: Utility
				1.0,		--	12: Vans
				1.0,		--	13: Cycles
				0.5,		--	14: Boats
				1.0,		--	15: Helicopters
				1.0,		--	16: Planes
				1.0,		--	17: Service
				0.75,		--	18: Emergency
				0.75,		--	19: Military
				1.0,		--	20: Commercial
				1.0			--	21: Trains
	}
}