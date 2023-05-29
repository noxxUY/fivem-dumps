Config              = {}

Config.CopsRequired = 0

Config.PoliceJobName1 = 'police'

Config.AlertCops = false

Config.AlertAllPlayer = false

Config.CooldownMinutes = 0

Config.DeleteBlipAfterMinutes = 2

Config.PlaneArrivalTimeSecons = 10

Config.loot = 
{
	{Item = 'water', count = 10},
	--{Item = 'lsd', count = 20},
	---{Item = 'meth', count = 30},
	---{Item = 'goldbar', count = 40},
	--{Item = 'goldnecklace', count = 20},
	--{Item = 'raudonsparnis', count = 19},
	---{Item = 'brokenphone', count = 15},
	{Item = 'bread', count = 20},
	---ADD YOUR ITEMS 
}

Config.loot_items_count = 6
	
Config.weapon_loot_enable = true

Config.weapon_get_chance  =  10

----In box be random
Config.weapon_loot = 
{
	{weapon = 'weapon_pistol', ammo_count = 10},
	{weapon = 'weapon_revolver', ammo_count = 20},
	{weapon = 'weapon_microsmg', ammo_count = 50},
	---ADD YOUR WEAPON 	
}

Config.plane_flies = "~r~The plane will arrive after "
Config.press_e_text  = " ~r~E  ~g~Open box."
Config.plane_crashed = "The plane crashed, use flare again."
Config.not_enough_cops = '~r~Not enough cops.'
Config.already = '~r~It is not possible now.'
Config.Cooldown = '~r~Cooldown~r~ '
Config.seconds = '~r~ seconds.'
Config.in_progress = '~r~ Somebody call the drop , can see it in your GPS.'
Config.drop_taken = "^9^*[Crates]^2 Drop taken.Wait next drop"

config = {

	zones = {
    {coords = {x = 1611.04, y = 3225.52, z = 40.41}, radius = 250.0, color = 1, 
	text = "^9^*[Crates]^2 A loot crate has available , be sure to look at your GPS to find the location.^1 Drop zone 1"},

	{coords = {x = -1833.11, y = -1214.88, z = 13.02}, radius = 200.0, color = 1, 
	text = "^9^*[Crates]^2 A loot crate has available , be sure to look at your GPS to find the location.^1 Drop zone 2"},

	{coords = {x = 73.29, y = 6536.86, z = 31.68}, radius = 150.0, color = 1,
	text = "^9^*[Crates]^2 A loot crate has available , be sure to look at your GPS to find the location.^1 Drop zone 3"},

	{coords = {x = 2395.22, y = 2323.22, z = 71.68}, radius = 150.0, color = 1,
    text = "^9^*[Crates]^2 A loot crate has available , be sure to look at your GPS to find the location.^1 Drop zone 4"},
	
	{coords = {x = -1084.37, y = 4912.69, z = 214.4}, radius = 150.0, color = 1,
	text = "^9^*[Crates]^2 A loot crate has available , be sure to look at your GPS to find the location.^1 Drop zone 5"},
		

    -----You can add more	


	},
	
	timer = 180, -- How often will the zone change (In Seconds). --
	
	draw_blip = true, -- If "true" it will draw a blip in center of zone. --
	
	draw_route = false, -- "draw_blip" must be "true" for this to work. If "true" then it will draw a GPS route to the zone. --
	
	blip_text = "AIR DROP", -- "draw_blip" must be "true" for this to work. This will change the name of the blip on the map. --

	ItemsInBox = 5 ,
			
	blip_id = 408 -- "draw_blip" must be "true" for this to work. This will change the blip icon. --

	
	
}


