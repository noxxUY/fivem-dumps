Config = {}

Config.WebHook = "https://discord.com/api/webhooks/1095467246953967676/ojFZT5foi7dPBJgZBIPpeWnx_RzoGaOE3eMpcoOFtOQSVVsEba0ZE_upSPUftsiiclWQ"--your webhook here

Config.Currency = "$"

Config.Range = 3.5 -- The range that you can open the menu

Config.TunningLocations = {
	{
		name = "Bennys", -- Name of the Location that will appear if blipmap == true
		coords = vector3(-233.6749,-1316.4832,30.3887), --The coords to open menu
		job = "mechanic", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Bennys2", -- Name of the Location that will appear if blipmap == true
		coords = vector3(-199.0665,-1324.6675,30.6135), --The coords to open menu
		job = "mechanic", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Bennys3", -- Name of the Location that will appear if blipmap == true
		coords = vector3(-240.1291,-1316.3572,30.3888), --The coords to open menu
		job = "mechanic", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Bennys4", -- Name of the Location that will appear if blipmap == true
		coords = vector3(-239.9089,-1337.8977,30.3888), --The coords to open menu
		job = "mechanic", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Bennys5", -- Name of the Location that will appear if blipmap == true
		coords = vector3(-211.1141,-1309.3240,17.9483), --The coords to open menu
		job = "mechanic", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Bennys6", -- Name of the Location that will appear if blipmap == true
		coords = vector3(-234.7630,-1309.4539,17.9484), --The coords to open menu
		job = "mechanic", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Redline1", -- Name of the Location that will appear if blipmap == true
		coords = vector3(-560.2166,-914.4556,23.3732), --The coords to open menu
		job = "mechanic2", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Redline2", -- Name of the Location that will appear if blipmap == true
		coords = vector3(-582.9954,-917.6372,23.4463), --The coords to open menu
		job = "mechanic2", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Redline3", -- Name of the Location that will appear if blipmap == true
		coords = vector3(-583.2295,-924.6268,23.4580), --The coords to open menu 
		job = "mechanic2", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Redline4", -- Name of the Location that will appear if blipmap == true
		coords = vector3(-582.9772,-931.9068,23.4455), --The coords to open menu 
		job = "mechanic2", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Sportracing1", -- Name of the Location that will appear if blipmap == true
		coords = vector3(835.7145,-985.4850,26.1337), --The coords to open menu 
		job = "mechanic3", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Sportracing2", -- Name of the Location that will appear if blipmap == true
		coords = vector3(835.9907, -977.0191, 26.1328), --The coords to open menu 
		job = "mechanic3", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Sportracing3", -- Name of the Location that will appear if blipmap == true
		coords = vector3(836.1648, -968.1650, 25.9850), --The coords to open menu  
		job = "mechanic3", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Sportracing4", -- Name of the Location that will appear if blipmap == true
		coords = vector3(836.1648, -968.1650, 25.9850), --The coords to open menu  
		job = "mechanic3", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},

	{
		name = "Sportracing5", -- Name of the Location that will appear if blipmap == true
		coords = vector3(835.6480, -959.6094, 25.9852), --The coords to open menu
		job = "mechanic3", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "Sportracing6", -- Name of the Location that will appear if blipmap == true
		coords = vector3(808.5685, -953.8477, 21.5979), --The coords to open menu 
		job = "mechanic3", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},

	{
		name = "eastcustom1", -- Name of the Location that will appear if blipmap == true
		coords = vector3(909.2198, -2127.8625, 30.0447), --The coords to open menu 
		job = "mechanic4", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "eastcustom2", -- Name of the Location that will appear if blipmap == true
		coords = vector3(897.9928, -2127.1001, 30.0448), --The coords to open menu 
		job = "mechanic4", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "eastcustom3", -- Name of the Location that will appear if blipmap == true
		coords = vector3(887.1158, -2126.5203, 30.0445), --The coords to open menu 
		job = "mechanic4", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "eastcustom4", -- Name of the Location that will appear if blipmap == true
		coords = vector3(875.9503, -2125.8999, 30.0452), --The coords to open menu 
		job = "mechanic4", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "eastcustom5", -- Name of the Location that will appear if blipmap == true
		coords = vector3(888.3459, -2101.8164, 29.9522), --The coords to open menu 
		job = "mechanic4", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
	{
		name = "eastcustom6", -- Name of the Location that will appear if blipmap == true
		coords = vector3(896.0442, -2102.5425, 29.9526), --The coords to open menu 
		job = "mechanic4", --The job that have access to it (remove the line and everyone can access it)
		howmuchtopay = 100, -- The percentage to pay. In this blip, the player/society will pay the normal price (100%), you can change it, for example, if you change it to 190, the player will pay 1.9x the original price, if the tunning costs 1000, the player will pay 1900
		society = true, -- The money that the client pay goes to the society account? (will only work if job isn't nil.)
		societypercentage = 90, --50% of the money goes to society and the other 50% goes to the mechanic (will only work if society = true.)
		blipmap = true, --Show the blip in map?
		blipeveryone = false, --if false, the blip will be only visible to the job
		blipsprite = 72, -- The blip sprite, there's a list of all available: https://docs.fivem.net/docs/game-references/blips/
		used = false, -- Don't tuch
	},
}



Config.PricesByClass = true --true if you want the price to change by vehicle class

Config.ClassPrices = { -- Will only work if Config.PricesByClass == true
	-- Change the number that's after [k], for example 1.0 will pay the normal price, 1.2 will pay price * 1.2
	[0] = 3.0,-- Compacts  
	[1] = 3.0,--Sedans  
	[2] = 3.0,--SUVs  
	[3] = 3.0,--Coupes  
	[4] = 3.0,--Muscle  
	[5] = 5.0,--Sports Classics  
	[6] = 5.0,--Sports  
	[7] = 6.0,--Super  
	[8] = 5.0,--Motorcycles  
	[9] = 5.0,--Off-road  
	[10] = 3.0,--Industrial  
	[11] = 3.0,--Utility  
	[12] = 3.0,--Vans  
	[13] = 3.0,--Cycles  
	[14] = 3.0,--Boats  
	[15] = 3.0,--Helicopters  
	[16] = 3.0,--Planes  
	[17] = 3.0,--Service  
	[18] = 3.0,--Emergency  
	[19] = 3.0,--Military  
	[20] = 3.0,--Commercial  
	[21] = 3.0,--Trains 
}

Config.AllowVehicleExceptions = false

Config.VehicleExceptions = {
	["gtr"] = 1.5, -- In this case, the gtr will pay the price * 1.5. You can add more cars, it's up to you
}

Config.MysqlAsync = true -- Set true if you use Mysql-Async and false if you use ghmattimysql, if you don't know what is the difference, then you probably use Mysql-Async and you shouldn't change this.

Config.Translations = {
	["change"] = "Change",
	["windtint"] = "Window Tint",
	["plate"] = "Plate Style",
	["Spoiler"] = "Spoiler",
	["Front Bumper"] = "Front Bumper",
	["Rear Bumper"] = "Rear Bumper",
	["Side Skirt"] = "Side Skirt",
	["Exhaust"] = "Exhaust",
	["Roll Cage"] = "Roll Cage",
	["Grill"] = "Grill",
	["Hood"] = "Hood",
	["Left Fender"] = "Left Fender",
	["Right Fender"] = "Right Fender",
	["Roof"] = "Roof",
	["Engine"] = "Engine",
	["Brake"] = "Brake",
	["Transmission"] = "Transmission",
	["Horn"] = "Horn",
	["Suspension"] = "Suspension",
	["Armor"] = "Armor",
	["Headlights"] = "Headlights",
	["Tyres Front"] = "Tyres",
	["Tyres Back"] = "Tyres",
	["Plate Holder"] = "Plate Holder",
	["Vanity Plate"] = "Vanity Plate",
	["Trim A"] = "Trim A",
	["Ornaments"] = "Ornaments",
	["Dashboard"] = "Dashboard",
	["Dial"] = "Dial",
	["Doors"] = "Doors",
	["Seats"] = "Seats",
	["Steering Wheel"] = "Steering Wheel",
	["Shifter Leaver"] = "Shifter Leaver",
	["Plaque"] = "Plaque",
	["Speakers"] = "Speakers",
	["Trunk"] = "Trunk",
	["Hydraulic"] = "Hydraulic",
	["Engine Block"] = "Engine Block",
	["Air Filter"] = "Air Filter",
	["Strut"] = "Strut",
	["Arch Cover"] = "Arch Cover",
	["Aerial"] = "Aerial",
	["Trim B"] = "Trim B",
	["Fuel Tank"] = "Fuel Tank",
	["Window"] = "Window",
	["Livery"] = "Livery",
	["Livery2"] = "Livery",
	["stock"] = "stock", --Don't know what this is....
	["sport"] = "sport",
	["muscle"] = "muscle",
	["lowrider"] = "lowrider",
	["suv"] = "suv",
	["offroad"] = "offroad",
	["tuner"] = "tuner",
	["motorcycle"] = "motorcycle",
	["highend"] = "highend",
	["bennys"] = "bennys",
	["bespoke"] = "bespoke",
	["f1"] = "f1",
	["rua"] = "rua",
	["track"] = "track",
	-- The rest of menus:
	["def"] = "Default",
	["vehneons"] = "Vehicle Neons",
	["instneons"] = "Install Neons",
	["remneons"] = "Remove Neons",
	["smoketyres"] = "Tyre Smoke",
	["smokeclr"] = "Smoke Colors",
	["vehclr"] = "Vehicle Colors",
	["vehstyle"] = "Vehicle Style",
	["prima"] = "Primary",
	["primecolor"] = "Primary Color",
	["rgb"] = "RGB Color",
	["normal"] = "Normal",
	["metallic"] = "Metallic",
	["pearl"] = "Pearl",
	["matte"] = "Matte",
	["metal"] = "Metal",
	["chrome"] = "Chrome",
	["sec"] = "Secondary",
	["seccolor"] = "Secondary Color",
	["pearls"] = "Pearlescent",
	["whelclor"] = "Wheel Colour",
	["dashclr"] = "Dashboard Colour",
	["intclr"] = "Interior Colour",
	["bproof"] = "Bullet Proof",
	["toption"] = "Tyres Options",
	["vehtyres"] = "Vehicle Tyres",
	["turbo"] = "Turbo",
	["headlight"] = "Headlight",
	["xenon"] = "Xenon",
	["xenonclr"] = "Xenon Color",
	["extra"] = "Extra",
	["drift"] = "Drift Tyres",
}

--Credits to https://wiki.altv.mp/wiki/GTA:Vehicle_Mods for the amazing Vehicle Mods docs

Config.TunningPrices = {
	["Spoiler"] = {
		base = 1000, --base price
		bylevel = 50 --+ for each level, for example level 1: 1000$; level 2: 1050$
	},
	["Front Bumper"] = {
		base = 1000,
		bylevel = 50
	},
	["Rear Bumper"] = {
		base = 1000,
		bylevel = 50
	},
	["Side Skirt"] = {
		base = 1000,
		bylevel = 50
	},
	["Exhaust"] = {
		base = 1000,
		bylevel = 50
	},
	["Roll Cage"] = {
		base = 1000,
		bylevel = 50
	},
	["Grill"] = {
		base = 1000,
		bylevel = 50
	},
	["Hood"] = {
		base = 1000,
		bylevel = 50
	},
	["Left Fender"] = {
		base = 1000,
		bylevel = 50
	},
	["Right Fender"] = {
		base = 1000,
		bylevel = 50
	},
	["Roof"] = {
		base = 1000,
		bylevel = 50
	},
	["Engine"] = {
		base = 1000,
		bylevel = 50
	},
	["Brake"] = {
		base = 1000,
		bylevel = 50
	},
	["Transmission"] = {
		base = 1000,
		bylevel = 50
	},
	["Horn"] = {
		base = 1000,
		bylevel = 50
	},
	["Suspension"] = {
		base = 1000,
		bylevel = 50
	},
	["Armor"] = {
		base = 1000,
		bylevel = 50
	},
	["Headlights"] = {
		base = 1000,
		bylevel = 50
	},
	["Tyres Front"] = {
		base = 1000,
		bylevel = 50
	},
	["Tyres Back"] = {
		base = 1000,
		bylevel = 50
	},
	["Plate Holder"] = {
		base = 1000,
		bylevel = 50
	},
	["Vanity Plate"] = {
		base = 1000,
		bylevel = 50
	},
	["Trim A"] = {
		base = 1000,
		bylevel = 50
	},
	["Ornaments"] = {
		base = 1000,
		bylevel = 50
	},
	["Dashboard"] = {
		base = 1000,
		bylevel = 50
	},
	["Dial"] = {
		base = 1000,
		bylevel = 50
	},
	["Doors"] = {
		base = 1000,
		bylevel = 50
	},
	["Seats"] = {
		base = 1000,
		bylevel = 50
	},
	["Steering Wheel"] = {
		base = 1000,
		bylevel = 50
	},
	["Shifter Leaver"] = {
		base = 1000,
		bylevel = 50
	},
	["Plaque"] = {
		base = 1000,
		bylevel = 50
	},
	["Speakers"] = {
		base = 1000,
		bylevel = 50
	},
	["Trunk"] = {
		base = 1000,
		bylevel = 50
	},
	["Hydraulic"] = {
		base = 1000,
		bylevel = 50
	},
	["Engine Block"] = {
		base = 1000,
		bylevel = 50
	},
	["Air Filter"] = {
		base = 1000,
		bylevel = 50
	},
	["Strut"] = {
		base = 1000,
		bylevel = 50
	},
	["Arch Cover"] = {
		base = 1000,
		bylevel = 50
	},
	["Aerial"] = {
		base = 1000,
		bylevel = 50
	},
	["Trim B"] = {
		base = 1000,
		bylevel = 50
	},
	["Fuel Tank"] = {
		base = 1000,
		bylevel = 50
	},
	["Window"] = {
		base = 1000,
		bylevel = 50
	},
	["Livery"] = {
		base = 1000,
		bylevel = 50
	},
	["Livery2"] = { -- YHEAAAA, 2 LIVERY? WHY? BECAUSE THERE'S 2 DIFFERENT FUNCTIONS TO LIVERYS... I know... It's stupid, don't blame me xd
		base = 1000,
		bylevel = 50
	},
	["PrimaryRGBColor"] = {
		base = 500,
	},
	["SecondaryRGBColor"] = {
		base = 300,
	},
	["PrimaryColorType"] = {
		base = 200,
		bylevel = 0,
	},
	["SecondaryColorType"] = {
		base = 175,
		bylevel = 0,
	},
	["pearltab"] = { -- Pearlescent Tab
		base = 250,
		bylevel = 0,
	},
	["whlclrtab"] = { -- Wheel Colors Tab
		base = 150,
		bylevel = 0,
	},
	["dshclrtab"] = { -- Dashboard Tab
		base = 120,
		bylevel = 0,
	},
	["intclrtab"] = { -- Interior Tab
		base = 120,
		bylevel = 0,
	},
	["neons"] = { -- Install Neons (Not change color)
		base = 200,
		bylevel = 0,
	},
	["NeonsRGBColor"] = {
		base = 750,
	},
	["SmokeRGBColor"] = {
		base = 300,
	},
	["windtint"] = {
		base = 200,
		bylevel = -10,
	},
	["plate"] = {
		base = 55,
		bylevel = 10,
	},
	["turbo"] = {
		base = 250,
		bylevel = 0,
	},
	["xenon"] = {
		base = 150,
		bylevel = 0,
	},
	["xenoncolor"] = {
		base = 100,
		bylevel = 0,
	},
	---WHEELS TYPE---
	["suv"] = {
		base = 100,
		bylevel = 10,
	},
	["bennys"] = {
		base = 100,
		bylevel = 10,
	},
	["rua"] = {
		base = 100,
		bylevel = 10,
	},
	["track"] = {
		base = 100,
		bylevel = 10,
	},
	["f1"] = {
		base = 100,
		bylevel = 10,
	},
	["motorcycle"] = {
		base = 100,
		bylevel = 10,
	},
	["tuner"] = {
		base = 100,
		bylevel = 10,
	},
	["sport"] = {
		base = 100,
		bylevel = 10,
	},
	["bespoke"] = {
		base = 100,
		bylevel = 10,
	},
	["muscle"] = {
		base = 100,
		bylevel = 10,
	},
	["lowrider"] = {
		base = 100,
		bylevel = 10,
	},
	["offroad"] = {
		base = 100,
		bylevel = 10,
	},
	["highend"] = {
		base = 100,
		bylevel = 10,
	},
	----END
	["bulletproof"] = {
		base = 250,
		bylevel = 0,
	},
	["costum-wheel"] = {
		base = 50,
		bylevel = 0,
	},
	["extra"] = {
		base = 50,
		bylevel = 0,
	},
	["drift"] = {
		base = 500,
		bylevel = 0,
	},
}

Config.TunningMods = {
	["Spoiler"] = 0,
	["Front Bumper"] = 1,
	["Rear Bumper"] = 2,
	["Side Skirt"] = 3,
	["Exhaust"] = 4,
	["Roll Cage"] = 5,
	["Grill"] = 6,
	["Hood"] = 7,
	["Left Fender"] = 8,
	["Right Fender"] = 9,
	["Roof"] = 10,
	["Engine"] = 11,
	["Brake"] = 12,
	["Transmission"] = 13,
	["Horn"] = 14,
	["Suspension"] = 15,
	["Armor"] = 16,
	["Headlights"] = 22,
	["Tyres Front"] = 23,
	["Tyres Back"] = 24,
	["Plate Holder"] = 25,
	["Vanity Plate"] = 26,
	["Trim A"] = 27,
	["Ornaments"] = 28,
	["Dashboard"] = 29,
	["Dial"] = 30,
	["Doors"] = 31,
	["Seats"] = 32,
	["Steering Wheel"] = 33,
	["Shifter Leaver"] = 34,
	["Plaque"] = 35,
	["Speakers"] = 36,
	["Trunk"] = 37,
	["Hydraulic"] = 38,
	["Engine Block"] = 39,
	["Air Filter"] = 40,
	["Strut"] = 41,
	["Arch Cover"] = 42,
	["Aerial"] = 43,
	["Trim B"] = 44,
	["Fuel Tank"] = 45,
	["Window"] = 46,
	["Livery"] = 48,
}

function GetNeons() 
	local r,g,b = GetVehicleNeonLightsColour(carroselected)
	local selecionado = 1
	local neonsligado = false
	for i = 0, 3 do
		if IsVehicleNeonLightEnabled(carroselected,i) then
			neonsligado = true
		end
	end
	if neonsligado then
		selecionado = 2
	end
	local neonstable = {r = r, g = g, b = b,ligado = neonsligado}
	local menu = {
		type = json.encode({tipo = "neons"}),
		title = Config.Translations["vehneons"],
		src = "img/neons.png",
		subMenuTitle = Config.Translations["change"].." "..Config.Translations["vehneons"],
		subMenuSelected = selecionado,
		subMenu = {
			{
				type = json.encode({tipo = "defaultneon",index = {r = r, g = g, b = b},ligado = neonsligado}),
				title = Config.Translations["def"],
				src = "img/Default.png",
			}, 
			{
				type = json.encode({tipo = "neonsc",index = 0}),
				title = Config.Translations["remneons"],
				src = "img/neons.png",
			}, 
			{
				type = json.encode({tipo = "neonsc",index = 1}),
				title = Config.Translations["instneons"],
				src = "img/neons.png",
			}, 
			{
				type = json.encode({tipo = "change-neons"}),
				title = Config.Translations["change"].." "..Config.Translations["vehneons"],
				src = "img/rgb.png",
				colorpicker = true,
				currentColor = {r = r, g = g, b = b},
			}, 
		},
	}
	return menu,neonstable
end

function GetSmoke() 
	local r,g,b = GetVehicleTyreSmokeColor(carroselected)
	local menu = {
		type = json.encode({tipo = "smoke"}),
		title = Config.Translations["smoketyres"],
		src = "img/TyreSmoke.png",
		subMenuTitle = Config.Translations["change"].." "..Config.Translations["smoketyres"],
		subMenuSelected = selecionado,
		subMenu = {
			{
				type = json.encode({tipo = "smokedefault",index = {r = r, g = g, b = b}}),
				title = Config.Translations["def"],
				src = "img/Default.png",
			}, 
			{
				type = json.encode({tipo = "smoke"}),
				title = Config.Translations["change"].." "..Config.Translations["smokeclr"],
				src = "img/rgb.png",
				colorpicker = true,
				currentColor = {r = r, g = g, b = b},
			}, 
		}
	}
	return menu,{r = r, g = g, b = b}
end

Config.Wheels = {
	--["stock"] = -1, --Don't know what this is....
	["sport"] = 0,
	["muscle"] = 1,
	["lowrider"] = 2,
	["suv"] = 3,
	["offroad"] = 4,
	["tuner"] = 5,
	["motorcycle"] = 6,
	["highend"] = 7,
	["bennys"] = 8,
	["bespoke"] = 9,
	["f1"] = 10,
	["rua"] = 11,
	["track"] = 12
}

Config.ColoursExtra = {
	{name = "Black", id = 0},
	{name = "Carbon Black", id = 147},
	{name = "Graphite", id = 1},
	{name = "Black Steel", id = 11},
	{name = "Dark Steel", id = 3},
	{name = "Silver", id = 4},
	{name = "Bluish Silver", id = 5},
	{name = "Rolled Steel", id = 6},
	{name = "Shadow Silver", id = 7},
	{name = "Stone Silver", id = 8},
	{name = "Midnight Silver", id = 9},
	{name = "Cast Iron Silver", id = 10},
	{name = "Red", id = 27},
	{name = "Torino Red", id = 28},
	{name = "Formula Red", id = 29},
	{name = "Lava Red", id = 150},
	{name = "Blaze Red", id = 30},
	{name = "Grace Red", id = 31},
	{name = "Garnet Red", id = 32},
	{name = "Sunset Red", id = 33},
	{name = "Cabernet Red", id = 34},
	{name = "Wine Red", id = 143},
	{name = "Candy Red", id = 35},
	{name = "Hot Pink", id = 135},
	{name = "Pfsiter Pink", id = 137},
	{name = "Salmon Pink", id = 136},
	{name = "Sunrise Orange", id = 36},
	{name = "Orange", id = 38},
	{name = "Bright Orange", id = 138},
	{name = "Gold", id = 99},
	{name = "Bronze", id = 90},
	{name = "Yellow", id = 88},
	{name = "Race Yellow", id = 89},
	{name = "Dew Yellow", id = 91},
	{name = "Dark Green", id = 49},
	{name = "Racing Green", id = 50},
	{name = "Sea Green", id = 51},
	{name = "Olive Green", id = 52},
	{name = "Bright Green", id = 53},
	{name = "Gasoline Green", id = 54},
	{name = "Lime Green", id = 92},
	{name = "Midnight Blue", id = 141},
	{name = "Galaxy Blue", id = 61},
	{name = "Dark Blue", id = 62},
	{name = "Saxon Blue", id = 63},
	{name = "Blue", id = 64},
	{name = "Mariner Blue", id = 65},
	{name = "Harbor Blue", id = 66},
	{name = "Diamond Blue", id = 67},
	{name = "Surf Blue", id = 68},
	{name = "Nautical Blue", id = 69},
	{name = "Racing Blue", id = 73},
	{name = "Ultra Blue", id = 70},
	{name = "Light Blue", id = 74},
	{name = "Chocolate Brown", id = 96},
	{name = "Bison Brown", id = 101},
	{name = "Creeen Brown", id = 95},
	{name = "Feltzer Brown", id = 94},
	{name = "Maple Brown", id = 97},
	{name = "Beechwood Brown", id = 103},
	{name = "Sienna Brown", id = 104},
	{name = "Saddle Brown", id = 98},
	{name = "Moss Brown", id = 100},
	{name = "Woodbeech Brown", id = 102},
	{name = "Straw Brown", id = 99},
	{name = "Sandy Brown", id = 105},
	{name = "Bleached Brown", id = 106},
	{name = "Schafter Purple", id = 71},
	{name = "Spinnaker Purple", id = 72},
	{name = "Midnight Purple", id = 142},
	{name = "Bright Purple", id = 145},
	{name = "Cream", id = 107},
	{name = "Ice White", id = 111},
	{name = "Frost White", id = 112},
	{name = "Black", id = 12},
	{name = "Gray", id = 13},
	{name = "Light Gray", id = 14},
	{name = "Ice White", id = 131},
	{name = "Blue", id = 83},
	{name = "Dark Blue", id = 82},
	{name = "Midnight Blue", id = 84},
	{name = "Midnight Purple", id = 149},
	{name = "Schafter Purple", id = 148},
	{name = "Red", id = 39},
	{name = "Dark Red", id = 40},
	{name = "Orange", id = 41},
	{name = "Yellow", id = 42},
	{name = "Lime Green", id = 55},
	{name = "Green", id = 128},
	{name = "Forest Green", id = 151},
	{name = "Foliage Green", id = 155},
	{name = "Olive Darb", id = 152},
	{name = "Dark Earth", id = 153},
	{name = "Desert Tan", id = 154},
	{name = "Brushed Steel", id = 117},
	{name = "Brushed Black Steel", id = 118},
	{name = "Brushed Aluminium", id = 119},
	{name = "Pure Gold", id = 158},
	{name = "Brushed Gold", id = 159},
	{name = "Chrome", id = 120}
}

function GetColors() 
	local pr,pg,pb = GetVehicleCustomPrimaryColour(carroselected)
	local sr,sg,sb = GetVehicleCustomSecondaryColour(carroselected)
	local plrcolour, whcolour = GetVehicleExtraColours(carroselected)
	local dsh = GetVehicleDashboardColour(carroselected)
	local int = GetVehicleInteriorColour(carroselected)
	local colrcostump = {}
	local colrcostumw = {}
	local colrcostumd = {}
	local colrcostumi = {}
	local ptp, colorp,nnn = GetVehicleModColor_1(carroselected)
	local pts, colors = GetVehicleModColor_2(carroselected)
	local tabelapr = {r = pr, g = pg, b = pb,tipao=ptp,crl=colorp}
	local tabelasc = {r = sr, g = sg, b = sb,tipao=pts,clr=colors}
	local pearltab = plrcolour
	local whlclrtab = whcolour
	local dshclrtab = dsh
	local intclrtab	= int
	table.insert(colrcostump,{type = json.encode({tipo = "corextra", index = plrcolour}), title = Config.Translations["def"]..": "..getnameclr(plrcolour), src = "img/Default.png",})
	table.insert(colrcostumw,{type = json.encode({tipo = "corextra", index = whcolour}), title = Config.Translations["def"]..": "..getnameclr(whcolour), src = "img/Default.png",})
	table.insert(colrcostumd,{type = json.encode({tipo = "corextra", index = dsh}), title = Config.Translations["def"]..": "..getnameclr(dsh), src = "img/Default.png",})
	table.insert(colrcostumi,{type = json.encode({tipo = "corextra", index = int}), title = Config.Translations["def"]..": "..getnameclr(int), src = "img/Default.png",})
	local selectedprl = 99
	local selectedw = 99
	local selectedd = 99
	local selectedi = 99
	for k in pairs(Config.ColoursExtra) do
		local clri = Config.ColoursExtra[k]
		if clri.id == plrcolour then
			selectedprl = k
		elseif clri.id == whcolour then
			selectedw = k
		elseif clri.id == dsh then
			selectedd = k
		elseif clri.id == int then
			selectedi = k
		end
		table.insert(colrcostump,{type = json.encode({tipo = "corextra", index = clri.id}), title = clri.name, src = "img/pearlescent.png",})
		table.insert(colrcostumw,{type = json.encode({tipo = "corextra", index = clri.id}), title = clri.name, src = "img/pearlescent.png",})
		table.insert(colrcostumd,{type = json.encode({tipo = "corextra", index = clri.id}), title = clri.name, src = "img/pearlescent.png",})
		table.insert(colrcostumi,{type = json.encode({tipo = "corextra", index = clri.id}), title = clri.name, src = "img/pearlescent.png",})
	end
	local menu = {
		type = json.encode({tipo = "color"}),
		title = Config.Translations["vehclr"],
		src = "img/color.png",
		subMenuTitle = Config.Translations["change"].." "..Config.Translations["vehstyle"],
		subMenuSelected = 99,
		subMenu = {
			{
				type = json.encode({tipo = "prim-color"}),
				title = Config.Translations["prima"],
				src = "img/color.png",
				subSubMenuSelected = 99,
				subSubMenuTitle = Config.Translations["change"].." "..Config.Translations["primecolor"],
				subSubMenu = {
					{
						type = json.encode({tipo = "defaultprgb",index = tabelapr}),
						title = Config.Translations["def"],
						src = "img/Default.png",
					},
					{
						type = json.encode({tipo = "corrgbp"}),
						title = Config.Translations["rgb"],
						src = "img/rgb.png",
						colorpicker = true,
						currentColor = {r = pr, g = pg, b = pb},
					},
					{
						type = json.encode({tipo = "cortipop",index = 0}),
						title = Config.Translations["normal"],
						src = "img/pearlescent.png",
					},
					{
						type = json.encode({tipo = "cortipop",index = 1}),
						title = Config.Translations["metallic"],
						src = "img/pearlescent.png",
					},
					--[[{
						type = json.encode({tipo = "cortipop",index = 2}),
						title = Config.Translations["pearl"],
						src = "img/pearlescent.png",
					},--]]
					{
						type = json.encode({tipo = "cortipop",index =3}),
						title = Config.Translations["matte"],
						src = "img/pearlescent.png",
					},
					{
						type = json.encode({tipo = "cortipop",index =4}),
						title = Config.Translations["metal"],
						src = "img/pearlescent.png",
					},
					{
						type = json.encode({tipo = "cortipop",index = 5}),
						title = Config.Translations["chrome"],
						src = "img/pearlescent.png",
					},
				},
			}, 
			{
				type = json.encode({tipo = "sec-color"}),
				title = Config.Translations["sec"],
				src = "img/color.png",
				subSubMenuSelected = 99,
				subSubMenuTitle = Config.Translations["change"].." "..Config.Translations["seccolor"],
				subSubMenu = {
					{
						type = json.encode({tipo = "defaultsrgb",index = tabelasc}),
						title = Config.Translations["def"],
						src = "img/Default.png",
					},
					{
						type = json.encode({tipo = "corrgbs"}),
						title = Config.Translations["rgb"],
						src = "img/rgb.png",
						colorpicker = true,
						currentColor = {r = sr, g = sg, b = sb},
					},
					{
						type = json.encode({tipo = "cortipos",index = 0}),
						title = Config.Translations["normal"],
						src = "img/pearlescent.png",
					},
					{
						type = json.encode({tipo = "cortipos",index = 1}),
						title = Config.Translations["metallic"],
						src = "img/pearlescent.png",
					},
					--[[{
						type = json.encode({tipo = "cortipos",index = 2}),
						title = Config.Translations["pearl"],
						src = "img/pearlescent.png",
					},--]]
					{
						type = json.encode({tipo = "cortipos",index =3}),
						title = Config.Translations["matte"],
						src = "img/pearlescent.png",
					},
					{
						type = json.encode({tipo = "cortipos",index =4}),
						title = Config.Translations["metal"],
						src = "img/pearlescent.png",
					},
					{
						type = json.encode({tipo = "cortipos",index = 5}),
						title = Config.Translations["chrome"],
						src = "img/pearlescent.png",
					},
				},
			}, 
			{
				type = json.encode({tipo = "pearlescent"}),
				title = Config.Translations["pearls"],
				src = "img/pearlescent.png",
				subSubMenuSelected = selectedprl,
				subSubMenuTitle = Config.Translations["change"].." "..Config.Translations["pearls"],
				subSubMenu = colrcostump
			},
			{
				type = json.encode({tipo = "wheel-colour"}),
				title = Config.Translations["whelclor"],
				src = "img/TyresFront.png",
				subSubMenuSelected = selectedw,
				subSubMenuTitle = Config.Translations["change"].." "..Config.Translations["whelclor"],
				subSubMenu = colrcostumw
			},
			{
				type = json.encode({tipo = "dash-colour"}),
				title = Config.Translations["dashclr"],
				src = "img/Dashboard.png",
				subSubMenuSelected = selectedd,
				subSubMenuTitle = Config.Translations["change"].." "..Config.Translations["dashclr"],
				subSubMenu = colrcostumd
			},
			{
				type = json.encode({tipo = "int-colour"}),
				title = Config.Translations["intclr"],
				src = "img/Interior.png",
				subSubMenuSelected = selectedi,
				subSubMenuTitle = Config.Translations["change"].." "..Config.Translations["intclr"],
				subSubMenu = colrcostumi
			}
		},
	}
	return menu, tabelapr, tabelasc,pearltab,whlclrtab,dshclrtab,intclrtab
end

function GetTyresOptions()
	local submenus = {}
	local costumselec = 999
	if GetVehicleModVariation(carroselected,23) then
		costumselec = 0
	end
	local brpoofselec = 999
	if not GetVehicleTyresCanBurst(carroselected) then
		brpoofselec = 0
	end
	--[[table.insert(submenus, {type = json.encode({tipo = "costum",index = 0}),title = "Costum", src = "img/costum.png", subSubMenuSelected = costumselec, subSubMenu = {{
			type = json.encode({tipo = "costum", index = 0}),
			title = "Costum",
			src = "img/costum.png",
		}}
	})--]] -- Who use this?
	table.insert(submenus, {type = json.encode({tipo = "bproof",index = 0}),title = Config.Translations["bproof"], src = "img/bproof.png", subSubMenuSelected = brpoofselec, subSubMenu = {{
			type = json.encode({tipo = "bproof", index = 0}),
			title = Config.Translations["bproof"],
			src = "img/bproof.png",
		}}
	})
	local drift = nil
	if GetGameBuildNumber() >= 2372 then
		drift = GetDriftTyresEnabled(carroselected)
		table.insert(submenus, {type = json.encode({tipo = "drift",index = 0}),title = Config.Translations["drift"], src = "img/drift.png", subSubMenuSelected = not drift, subSubMenu = {{
			type = json.encode({tipo = "drift", index = 0}),
			title = Config.Translations["drift"],
			src = "img/drift.png",
			}}
		})
	end
	local menu = {
		type = json.encode({tipo = "tyresoptions"}),
		title = Config.Translations["toption"],
		src = "img/tyresoptions.png",
		subMenuTitle = Config.Translations["change"].." "..Config.Translations["toption"],
		subMenuSelected = 999,
		subMenu = submenus
	}
	return menu,{costum=GetVehicleModVariation(carroselected,23),bproof=GetVehicleTyresCanBurst(carroselected),drift=drift}
end

function GetTyres(tipom)
	local numeromod = Config.TunningMods[tipom]
	local submenus = {}
	local transl = Config.Translations[tipom]
	if transl == nil then
		transl = tipom
	end
	SetVehicleMod(carroselected,23, -1,GetVehicleModVariation(carroselected,23))
	local tableza = {}
	for k in pairs(Config.Wheels) do
		local bool,wheel,num = isWheelType(k,numeromod)
		if bool then
			local transla = Config.Translations[k]
			if transla == nil then
				transla = k
			end
			tableza = {rodadefault=wheel,tipo=k}
			if tipom == "Tyres Front" then
				table.insert(submenus, {type = json.encode({tipo = "rodadefault", index = {tipo = k, roda = wheel,mota=23}}),title = Config.Translations["def"]..": "..transla..wheel+1, src = "img/Default.png"})
			else
				table.insert(submenus, {type = json.encode({tipo = "rodadefault", index = {tipo = k, roda = wheel,mota=24}}),title = Config.Translations["def"]..": "..transla..wheel+1, src = "img/Default.png"})
			end
		end
	end
	for k in pairs(Config.Wheels) do
		local podiri = false
		if tipom == "Tyres Front" then
			if k ~= "motorcycle" then
				podiri = true
			end
		else
			podiri = true
		end
		if podiri then
			local bool,wheel,num = isWheelType(k,numeromod)
			local transla = Config.Translations[k]
			if transla == nil then
				transla = k
			end
			local roda = 999
			if bool then
				roda = wheel+1
			end
			if num >= 1 then
				table.insert(submenus, {type = json.encode({tipo = k, index = #submenus+1}),title = transla, src = "img/"..k..".png", subSubMenuSelected = roda-1, subSubMenu = AddToSubMenu(k,num,numeromod)})
			end
		end
	end
	SetVehicleMod(carroselected,23, rodaatual,GetVehicleModVariation(carroselected,23))
	local menu = {
		type = json.encode({tipo = tipom}),
		title = transl,
		src = "img/"..tipom..".png",
		subMenuTitle = Config.Translations["change"].." "..Config.Translations["vehtyres"],
		subMenuSelected = 999,
		subMenu = submenus
	}
	return menu,tableza
end

function TurboMenu()
	local turboon = IsToggleModOn(carroselected,18)
	local numm = 999
	if turboon then
		numm = 0
	end
	local menu = {
		type = json.encode({tipo = "turbo"}),
		title = Config.Translations["turbo"],
		src = "img/".."turbo.png",
		subMenuSelected = numm,
		subMenu = {{type = json.encode({tipo = "turbo", index = 0}),title = Config.Translations["turbo"], src = "img/turbo.png"}}
	}
	return menu
end

function HeadLight() 
	local ssmenu = 99
	local xenonn = IsToggleModOn(carroselected,22)
	local numm = 999
	if xenonn then
		xenonn = true
		numm = 0
		ssmenu = GetVehicleXenonLightsColour(carroselected)+1
	else
		xenonn = false
	end
	local subSubMenu = {
		{
			type = json.encode({tipo = "xcolor",index = -1}),
			title = Config.Translations["def"],
			src = "img/Default.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 0}),
			title = "White",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 1}),
			title = "Blue",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 2}),
			title = "Electric Blue",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index =3}),
			title = "Mint Green",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index =4}),
			title = "Lime Green",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 5}),
			title = "Yellow",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 6}),
			title = "Golden Shower",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 7}),
			title = "Orange",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 8}),
			title = "Red",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 9}),
			title = "Pony Pink",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 10}),
			title = "Hot Pink",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 11}),
			title = "Purple",
			src = "img/pearlescent.png",
		},
		{
			type = json.encode({tipo = "xcolor",index = 12}),
			title = "Blacklight",
			src = "img/pearlescent.png",
		},
	}
	local menu = {
		type = json.encode({tipo = "HeadLight"}),
		title = Config.Translations["headlight"],
		src = "img/Headlights.png",
		subMenuTitle = Config.Translations["change"].." "..Config.Translations["headlight"],
		subMenuSelected = numm+1,
		subMenu = {
			{
				type = json.encode({tipo = "xenonfault",index = ssmenu-1,ligado = xenonn}),
				title = Config.Translations["def"],
				src = "img/Default.png",
			}, 
			{
				type = json.encode({tipo = "xenon", index = -2}),
				title = Config.Translations["xenon"],
				src = "img/Headlights.png",
			}, 
			{
				type = json.encode({tipo = "xcolor"}),
				title = Config.Translations["xenonclr"],
				src = "img/pearlescent.png",
				subSubMenuSelected = ssmenu,
				subSubMenuTitle = Config.Translations["change"].." "..Config.Translations["xenonclr"],
				subSubMenu = subSubMenu
			}, 
		},
	}
	return menu,{nmr=ssmenu-1,ligado =xenonn}
end

function GetExtraOptions()
	local default = {}
	local submenu = {{
		type = json.encode({tipo = "extrafault",index = "deftable"}),
		title = Config.Translations["def"],
		src = "img/Default.png",
	}, }
	for id = 0, 20, 1 do
		if DoesExtraExist(carroselected, id) then
			if IsVehicleExtraTurnedOn(carroselected, id) then
				default[id] = true
			end
			table.insert(submenu,{type = json.encode({tipo = "extra", index = id}),title = Config.Translations["extra"], src = "img/extra.png"})
		end
	end
	local menu = {
		type = json.encode({tipo = "extra"}),
		title = Config.Translations["extra"],
		src = "img/".."extra.png",
		subMenuSelected = 99,
		subMenu = submenu
	}
	return menu,default
end