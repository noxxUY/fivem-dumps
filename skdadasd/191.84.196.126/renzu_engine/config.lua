Config = {}

Config.Mysql = 'oxmysql'
Config.Ox_Inventory = true -- ox inventory for engine item and shop
Config.custom_engine_enable = true
Config.jobonly = false
Config.mufflerjob = 'mechanic'
Config.engine_handling = true
Config.Command = false -- standalone purpose /changeengine vigilante              | /changeengine (modelname)
Config.custom_engine_enable = true -- enable custom engine
Config.custom_engine = { -- advanced usage, Custom Engine, customsounds, custom handling (handling for engine speed and power only) -- the item can be spawn using engine_b16b for example. 
	-- nInitialDriveGears = total gears of engine's tranny.
	-- fInitialDriveForce = affects engine speed thats affect tranny (not topspeed), engine speed = rpm, this is like a flywheel of engine.
	-- fDriveInertia = affects engine speed again but majority is how fast you are reving for ea gears, this is like a final drive, crank.
	-- fInitialDriveMaxFlatVel = affects vehicle top speed ( value is not kmh,mph or meters ) , you can calculate the estimate ex. (200 * 1.25 or 1.3) = kmh
	-- fClutchChangeRateScaleUpShift = affects how fast you are up shifting
	-- fMass = fmass is a default vehicle weight from handling meta, our engine system using a weight ratio, if fMass is greater than the existing vehicle weight, engine will produce more power.( wont explain full why we need this , but in short explanation, i believe gta devs uses this kind of ratio formula before they produced any handling final value for any gta cars)
	-- LEARN MORE ABOUT HANDLING https://gtamods.com/wiki/Handling.meta
	-- turboinstall = default engine have turbo
	-- custom = enable custom engine
	-- handlingName = important, this will be the item name prefix (engine_handlingName or engine_b16b)
	-- soundname = important, this will be the sound hash will the system be using, example hash: blista,blista2, ruston. ( you can add custom sounds if you know how : example this toysupmk4 is a custom soundfile)
	-- label = label of the item
	-- you can add as many custom engine as you want
	-- important that the arrayname should have a backtick like this [`customengine`]


	[`b16b`] = {custom = true, turboinstall = false, handlingName = 'b16b', label = 'Ek9 B16b Type R', soundname = 'ruston', fMass = '800.000000', nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 225.000000, price = 180000,},
	[`rb26dett`] = {custom = true, turboinstall = true, handlingName = 'rb26dett', label = 'BNR34 RB26DE Twin Turbo', soundname = 'elegyx', fMass = '1500.000000', nInitialDriveGears = 6, fInitialDriveForce = 0.525000, fDriveInertia = 1.120000, fClutchChangeRateScaleUpShift = 7.200000, fClutchChangeRateScaleDownShift = 7.200000, fInitialDriveMaxFlatVel = 268.000000, price = 200000,},
	[`supra2jzgtett`] = {custom = true, turboinstall = true, handlingName = 'supra2jzgtett', label = 'Supra 2JZ GTE Twin Turbo', soundname = 'toysupmk4', fMass = '1600.000000', nInitialDriveGears = 6, fInitialDriveForce = 0.475000, fDriveInertia = 1.000000, fClutchChangeRateScaleUpShift = 7.400000, fClutchChangeRateScaleDownShift = 7.500000, fInitialDriveMaxFlatVel = 300.000000, price = 240000,},
	[`rx713b`] = {custom = true, turboinstall = true, handlingName = 'rx713b', label = 'RX7 13B-REW twin-rotor Twin Turbo', soundname = 'rotary7', fMass = '1340.000000', nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.090000, fClutchChangeRateScaleUpShift = 7.700000, fClutchChangeRateScaleDownShift = 7.100000, fInitialDriveMaxFlatVel = 260.000000, price = 180000,},

	-- BELOW is custom added, the handling is set to default, you may want to customized the handling
	-- BELOW is custom added, the handling is set to default, you may want to customized the handling
	-- BELOW is custom added, the handling is set to default, you may want to customized the handling
	[`musv8`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 250.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'musv8',  -- sound name
		label = 'Mustang V8', -- ITEM LABEL
		soundname = 'musv8',  -- sound name
		price = 180000,
	}, 

	[`r488sound`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 216.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'r488sound',  -- sound name
		label = 'r488sound', -- ITEM LABEL
		soundname = '488sound',  -- sound name
		price = 500000,
	}, 
	[`apollosv8`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 395.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'apollosv8',  -- sound name
		label = 'Apollos v8', -- ITEM LABEL
		soundname = 'apollosv8',  -- sound name
		price = 600000,
	},
	[`avesvv12`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 290.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'avesvv12',  -- sound name
		label = 'Avesv V12', -- ITEM LABEL
		soundname = 'avesvv12',  -- sound name
		price = 450000,
	},

	[`c6v8sound`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 306.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'c6v8sound',  -- sound name
		label = 'C6 V8', -- ITEM LABEL
		soundname = 'c6v8sound',  -- sound name
		price = 280000,
	},

	[`diablov12`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 325.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'diablov12',  -- sound name
		label = 'Diablo V12', -- ITEM LABEL
		soundname = 'diablov12',  -- sound name
		price = 450000,
	},

	[`f40v8`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 325.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'f40v8',  -- sound name
		label = 'F40 V8', -- ITEM LABEL
		soundname = 'f40v8',  -- sound name
		price = 430000,
	},

	[`f50v12`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 376.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'f50v12',  -- sound name
		label = 'F50 V12', -- ITEM LABEL
		soundname = 'f50v12',  -- sound name
		price = 440000,
	},

	[`ferrarif12`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 340.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'ferrarif12',  -- sound name
		label = 'Ferrari F12', -- ITEM LABEL
		soundname = 'ferrarif12',  -- sound name
		price = 500000,
	},

	[`gtaspanov10`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 370.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'gtaspanov10',  -- sound name
		label = 'Spano V10', -- ITEM LABEL
		soundname = 'gtaspanov10',  -- sound name
		price = 500000,
	},

	[`k20a`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 275.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'k20a',  -- sound name
		label = 'K20a Type R', -- ITEM LABEL
		soundname = 'k20a',  -- sound name
		price = 140000,
	},

	[`r35sound`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 315.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'r35sound',  -- sound name
		label = 'GTR R35', -- ITEM LABEL
		soundname = 'r35sound',  -- sound name
		price = 370000,
	},

	[`mclarenv8`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 328.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'mclarenv8',  -- sound name
		label = 'Mclaren V8', -- ITEM LABEL
		soundname = 'mclarenv8',  -- sound name
		price = 400000,
	},

	[`murciev12`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 341.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'murciev12',  -- sound name
		label = 'Murcie V12', -- ITEM LABEL
		soundname = 'murciev12',  -- sound name
		price = 440000,
	},

	[`perfov10`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 331.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'perfov10',  -- sound name
		label = 'Perfo V10', -- ITEM LABEL
		soundname = 'perfov10',  -- sound name
		price = 420000,
	},

	[`sestov10`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 350.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'sestov10',  -- sound name
		label = 'Sesto V10', -- ITEM LABEL
		soundname = 'sestov10',  -- sound name
		price = 460000,
	},

	[`urusv8`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 305.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'urusv8',  -- sound name
		label = 'Urus V8', -- ITEM LABEL
		soundname = 'urusv8',  -- sound name
		price = 400000,
	},

	[`veyronsound`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 431.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'veyronsound',  -- sound name
		label = 'Veyron Engine', -- ITEM LABEL
		soundname = 'veyronsound',  -- sound name
		price = 1000000,
	},

	[`viperv10`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 321.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'viperv10',  -- sound name
		label = 'Viper V10', -- ITEM LABEL
		soundname = 'viperv10',  -- sound name
		price = 350000,
	},

	[`gt3flat6`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 310.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'gt3flat6',  -- sound name
		label = 'Flat 6', -- ITEM LABEL
		soundname = 'gt3flat6',  -- sound name
		price = 420000,
	},

	[`m158huayra`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 383.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'm158huayra',  -- sound name
		label = 'Huayra', -- ITEM LABEL
		soundname = 'm158huayra',  -- sound name
		price = 700000,
	},

	[`m297zonda`] = { 
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 370.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'm297zonda',  -- sound name
		label = 'Zonda', -- ITEM LABEL
		soundname = 'm297zonda',  -- sound name
		price = 680000,
	},

	[`p60b40`] = {
		nInitialDriveGears = 5, fInitialDriveForce = 0.425000, fDriveInertia = 1.200000, fClutchChangeRateScaleUpShift = 8.200000, fClutchChangeRateScaleDownShift = 8.200000, fInitialDriveMaxFlatVel = 295.000000, fMass = '1400.000000',
		custom = true, -- DECLARE AS CUSTOM ENGINE
		turboinstall = true, -- this engine has a default turbo install?
		handlingName = 'p60b40',  -- sound name
		label = 'Bmw Engine M3', -- ITEM LABEL
		soundname = 'p60b40',  -- sound name
		price = 400000,
	},
}