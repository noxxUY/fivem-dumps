Config 					= {}

Config.Locale 			= 'en'
Config.DrawDistance 	= 10


local second = 1000
local minute = 60 * second
local hour = 60 * minute

--[[ 
	Below are the zones for laundering. You can set multiple zones just follow the format below. 
	Failure to do so will result in the script breaking.
	Set the job to 'any' if you want anybody to use the location. Otherwise set the required job you want to use for the location
	Any job not allowed to use the location WILL NOT see a marker or get a popup to use it.

	
	EXAMPLE LOCATION!!! JUST COPY THIS AND PASTE TO ADD MORE LOCATIONS!
		
	{
		Pos = {
			{x = 1090.84 , y = -2233.43 , z = 31.5}
		},
		
		Jobs = {
			--'any', -- SET THE 'any' TAG TO ALLOW ALL JOBS INCLUDING POLICE TO USE THE LOCATION
			--'miner',
			--'cardealer'
		},
		TaxRate = 0.50, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
	},
	
]]

Config.Zones = {
	


	
	['Mafia'] = {	
		Pos = { 
			{x = 1348.13 , y = 4388.58 , z = 44.34},
		}, 
		
		Jobs = {
			'any'
		},
		TaxRate = 0.70, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 27,
	
	},
	
	['Pablito'] = {	---steam:11000014350ace4
		Pos = { 
			{x = 38.13 , y = -1910.32 , z = -5.7},
		}, 
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 27,
	
	}, 
    ['RenzoFuga'] = {	
		Pos = {
			{x = 212.44 , y = 623.43 , z = 159.06},
		},
		
		Jobs = {
			'any'
		},
	    TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 27,
	},
	
	['Nico'] = {	----permanente
		Pos = {
			{x = -36.65 , y = 349.16 , z = 86.3},
		}, 
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},
	['Joaquin'] = {	----permanente
		Pos = {
			{x = 196.92 , y = 1207.78, z = 198.09},
		},  
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},
	['Brian'] = {	----permanente
		Pos = {
			{x = -129.14 , y = 591.05, z = 177.01},
		}, 
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},

	['Radna'] = {	----perma
		Pos = {
			{x = 2155.79 , y = 4785.06, z = 14.27},
		},  
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},

	['Jead09'] = {	----permanente
		Pos = { 
			{x = -932.3 , y = -1179.9, z = -21.6},
		}, 
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},

	['Cubana'] = {	----permanente
		Pos = { 
			{x = -242.0 , y = 6360.9, z = 5.8},
		}, 
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},
	['Cacoo'] = {	----permanente
		Pos = { 
			{x = 201.7 , y = -85.0, z = 41.4},
		}, 
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},
	['Kristt'] = {	----permanente
		Pos = { 
			{x = -289.5 , y = -802.5, z = 5.3},
		},  
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},
	
	['Polaa'] = {	----permanente
		Pos = { 
			{x = -454.2 , y = 588.3, z = 101.0},
		},  
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},
		['BKsotw'] = {	----permanente
		Pos = { 
			{x = -1502.7 , y = 429.0, z = 97.9}, 
		},  
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},

  ['MabF1_44'] = {	----perma  
		Pos = { 
			{x = -88.3 , y = -79.4, z = -31.2}, 
		},  
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},



['peperatzo'] = {	----permanente 
		Pos = {  
			{x = -91.4 , y = -86.6, z = 29.8}, 
		},  
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},
	['Subzero'] = {	----4/05 
		Pos = {  
			{x = -900.5 , y = -989.3, z = -17.5}, 
		},  
		
		Jobs = {
			'any'
		},
		TaxRate = 1.0, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 29,
	},

}
