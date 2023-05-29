Config              = {}

Config.CopsRequired = 2

Config.PoliceJobName1 = 'police'

Config.AlertCops = true

Config.AlertAllPlayer = false
Config.CooldownMinutes = 60

Config.DeleteBlipAfterMinutes = 5

Config.PlaneArrivalTimeSecons = 40

Config.loot = 
{
	{Item = 'weed_lemonhaze_seed', count = 5},
	{Item = 'weed_ak47_seed', count = 5},
	{Item = 'coca_seed', count = 4},
	{Item = 'cocaine_processing_table', count = 1},

	---ADD YOUR ITEMS 
}

Config.loot_items_count = 5
	
Config.weapon_loot_enable = true

Config.weapon_get_chance  =  1

----In box be random
Config.weapon_loot = 
{
	{weapon = 'weapon_pistol', ammo_count = 10},
	{weapon = 'weapon_revolver', ammo_count = 20},
	{weapon = 'weapon_microsmg', ammo_count = 50},
	---ADD YOUR WEAPON 	
}

Config.plane_flies = "~r~El avión esta llegando... "
Config.press_e_text  = " ~r~E  ~g~Abrir CAJA."
Config.plane_crashed = "El avión se murió, tira otra bengala."
Config.not_enough_cops = '~r~No hay suficientes policias.'
Config.already = '~r~No es posible ahora.'
Config.Cooldown = '~r~Cooldown~r~ '
Config.seconds = '~r~ segundos.'
Config.in_progress = '~g~GENDARMERIA INFORMA~r~ AVIONETA PARAGUAYA CON CARGA ILEGAL DETECTADA EN EL RADAR.'
Config.drop_taken = "^9^*[Boxes]^2 Drop reclamado.Espera al proximo"

config = {

	zones = {
    {coords = {x = 1611.04, y = 3225.52, z = 40.41}, radius = 250.0, color = 1, 
	text = "^9^*[Cajas]^2 Una caja esta disponible, busca la ubicacion en el gps.^1 Drop zone 1"},

	{coords = {x = -1833.11, y = -1214.88, z = 13.02}, radius = 200.0, color = 1, 
	text = "^9^*[Cajas]^2 Una caja esta disponible, busca la ubicacion en el gps.^1 Drop zone 2"},

	{coords = {x = 73.29, y = 6536.86, z = 31.68}, radius = 150.0, color = 1,
	text = "^9^*[Cajas]^2 Una caja esta disponible, busca la ubicacion en el gps.^1 Drop zone 3"},

	{coords = {x = 2395.22, y = 2323.22, z = 71.68}, radius = 150.0, color = 1,
    text = "^9^*[Cajas]^2 Una caja esta disponible, busca la ubicacion en el gps.^1 Drop zone 4"},
	
	{coords = {x = -1084.37, y = 4912.69, z = 214.4}, radius = 150.0, color = 1,
	text = "^9^*[Cajas]^2 Una caja esta disponible, busca la ubicacion en el gps.^1 Drop zone 5"},
		

    -----You can add more	


	},
	
	timer = 216000, -- How often will the zone change (In Seconds). --
	
	draw_blip = true, -- If "true" it will draw a blip in center of zone. --
	
	draw_route = false, -- "draw_blip" must be "true" for this to work. If "true" then it will draw a GPS route to the zone. --
	
	blip_text = "AVIÓN ILEGAL", -- "draw_blip" must be "true" for this to work. This will change the name of the blip on the map. --

	ItemsInBox = 5 ,
			
	blip_id = 408 -- "draw_blip" must be "true" for this to work. This will change the blip icon. --

	
	
}


