
Config = {

BlipSprite = 237,
BlipColor = 26,
BlipText = 'Mesa de Crafteo',

UseLimitSystem = true, -- Enable if your esx uses limit system

CraftingStopWithDistance = true, -- Crafting will stop when not near workbench

ExperiancePerCraft = 10, -- The amount of experiance added per craft (100 Experiance is 1 level)

HideWhenCantCraft = false, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job

Categories = {

['objetos'] = {
	Label = 'OBJETOS',
	Image = 'objetos',
	Jobs = {}
},

['weapons'] = {
	Label = 'ARMAS',
	Image = 'weapon_appistol',
	Jobs = {}
},
--['partes'] = {
--	Label = 'PARTES DE ARMAS',
--	Image = 'partes',
--	Jobs = {}
--}


},

PermanentItems = { -- Items that dont get removed when crafting
	['wrench'] = false
},

Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque







['WEAPON_SNSPISTOL'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = true, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 25, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['hierro'] = 1000,
		['cobre'] = 1750,
		--['azufre'] = 16,
		['plata'] = 375
		--['diamantes'] = 1 -- item name and count, adding items that dont exist in database will crash the script
	}
}, 

['WEAPON_PISTOL50'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = true, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	['hierro'] = 1750,
	['cobre'] = 2500,
	['azufre'] = 2000,
	['plata'] = 750
	--['diamantes'] = 1-- item name and count, adding items that dont exist in database will crash the script
	}
		
}, 

['WEAPON_DOUBLEACTION'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = true, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 90, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	['hierro'] = 2000,
	['cobre'] = 3250,
	['azufre'] = 2500,
	['plata'] = 1225 -- item name and count, adding items that dont exist in database will crash the script
	}
		
}, 

['WEAPON_SMG'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = true, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {'LosCorona', 'TheCriminals', 'TheUnion', 'GlockGang', 'TheDarks', 'TheMasacre', 'BallasChowy', 'Crips'}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	['hierro'] = 2000,
	['cobre'] = 4000,
	['azufre'] = 3750,
	['plata'] = 1750,
	['diamantes'] = 50 -- item name and count, adding items that dont exist in database will crash the script
	}
		
}, 

['WEAPON_GUSENBERG'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = true, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {'LosCorona', 'TheCriminals', 'TheUnion', 'GlockGang', 'TheDarks', 'TheMasacre', 'BallasChowy', 'Crips'}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	['hierro'] = 3000,
	['cobre'] = 5000,
	['azufre'] = 4500,
	['plata'] = 2000,
	['diamantes'] = 60 -- item name and count, adding items that dont exist in database will crash the script
	}
		
}, 


['WEAPON_CARBINERIFLE'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = true, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {'LosCorona', 'TheCriminals', 'TheUnion', 'GlockGang', 'TheDarks', 'TheMasacre', 'BallasChowy', 'Crips'}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	['hierro'] = 3750,
	['cobre'] = 6250,
	['azufre'] = 5000,
	['plata'] = 2000,
	['diamantes'] = 60 -- item name and count, adding items that dont exist in database will crash the script
	}
		
}, 

['WEAPON_ASSAULTRIFLE'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = true, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {'LosCorona', 'TheCriminals', 'TheUnion', 'GlockGang', 'TheDarks', 'TheMasacre', 'BallasChowy', 'Crips'}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['hierro'] = 3750,
		['cobre'] = 6250,
		['azufre'] = 5000,
		['plata'] = 2000,
		['diamantes'] = 60 -- item name and count, adding items that dont exist in database will crash the script
	}
		
}, 

['WEAPON_SNIPERRIFLE'] = {
	Level = 999, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = true, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 25, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	['hierro'] = 6500,
	['cobre'] = 10000,
	['azufre'] = 8500,
	['plata'] = 5000,
	['diamantes'] = 100,
	['esmeralda'] = 50 -- item name and count, adding items that dont exist in database will crash the script
	}
		
}, 

['WEAPON_HEAVYSNIPER'] = {
	Level = 999, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = true, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 25, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	['hierro'] = 10000,
	['cobre'] = 17500,
	['azufre'] = 12500,
	['plata'] = 7500,
	['diamantes'] = 120,
	['esmeralda'] = 60 -- item name and count, adding items that dont exist in database will crash the script
	}
		
}, 



},

Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access

		{coords = vector3(101.59,6616.26,32.44), jobs = {'LosCorona', 'TheCriminals', 'TheUnion', 'GlockGang', 'TheDarks',
		'Families','Crips','TheMasacre','LosAngeles',
		 'BallasChowy'}, blip = false, recipes = {}, radius = 3.0 }
		--{coords = vector3(101.26113891602,6615.810546875,33.58126831054), jobs = {'mechanic'}, blip = false, recipes = {}, radius = 3.0 }

},
 

Text = {

    ['not_enough_ingredients'] = 'No tienes suficientes ingredientes',
    ['you_cant_hold_item'] = 'You cant hold the item',
    ['item_crafted'] = 'Crafteo con exito!',
    ['wrong_job'] = 'No puedes abrir esta mesa',
    ['workbench_hologram'] = ' PULSA [~b~E~w~] PARA ACCEDER A LA MESA DE CRAFTEO',
    ['wrong_usage'] = 'Wrong usage of command',
    ['inv_limit_exceed'] = 'Limite de inventario completo',
    ['crafting_failed'] = 'Has fallado al craftear el item!'

}

}




function SendTextMessage(msg)

	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)

	--EXAMPLE USED IN VIDEO
	--exports['mythic_notify']:SendAlert('inform', msg)

end


