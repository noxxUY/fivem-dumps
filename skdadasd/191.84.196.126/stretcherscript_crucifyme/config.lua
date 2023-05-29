local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config              = {}
Config.OpenMenuSpawn= {x = 266.62, y = -1354.23, z = 24.53}

-- Hash: Ambulance spawn code
-- Detection: How close does one have to be to the ambulance (Lesser number is closer, bigger number is further)
-- Depth: How far into the ambulance does the stretcher go (More positive is closer to cab, more negative is further from cab)
-- Height: How high up is the stretcher in the ambulance (Lesser number is lower, higher number is higher)
Config.Hash = {
	{hash = "ambulance", detection = 4.8, depth = -1.0, height = 0.45},
	--{hash = "ghispo2", detection = 4.8, depth = -1.5, height = 0.10},
	--{hash = "sheriff2", detection = 5.8, depth = -3.0, height = 0.10},
	--{hash = "medic13", detection = 4.8, depth = -3.0, height = 0.45},
}

Config.Press = {
	open_menu = Keys["Y"],
	take_bed = Keys["E"],
	do_action = Keys["E"],
	out_vehicle_bed = Keys["E"],
	release_bed = Keys["E"],
	in_vehicle_bed = Keys["E"],
	go_out_bed = Keys["E"],
}


Config.Language = {
	name_hospital = 'Camilla',
	open_menu = '~b~E',
	do_action = '~INPUT_CONTEXT~ para interactuar con la camilla',
	take_bed = "~INPUT_CONTEXT~ para agarrar la camilla",
	release_bed = "~INPUT_CONTEXT~ para soltar la camilla",
	in_vehicle_bed = "~INPUT_CONTEXT~ para guardar la camilla",
	out_vehicle_bed = "~INPUT_CONTEXT~ para retirar una camilla",
	go_out_bed = "levantarse de la cama",
	delete_bed = "eliminar cama",
	toggle_backboard = "alternar tablero",
	lit_1 = "Cama sin matela",
	toggle_seat = "Asiento plegable",
	toggle_lifepak = "Alternar medikit",
	toggle_bag = "Bolsa de palanca",
	toggle_backpack = "Alternar mochila",
	anim = {
		spawn_command = "Litter",
		lie_back = "Acuestese de espalda",
		sit_right = "Sientese de lado derecho",
		sit_left = "Sientese del lado izquierdo",
		convulse = "Recibir RCP",
		pls = "Sientese en la cama",
	}
}