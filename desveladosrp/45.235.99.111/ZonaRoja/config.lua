config = {

	-- Blip/Color Reference: --
	-- https://docs.fivem.net/docs/game-references/blips/ --
	
	-- Config Info: --
	-- "coords" = Contains the x, y, z, coordinates of the zone. --
		-- "x" = The "X" coordinate of the zone. --
		-- "y" = The "Y" coordinate of the zone. --
		-- "z" = The "Z" coordinate of the zone. --
	-- "zone" = Contains the radius and color of the zone. --
		-- "radius" = The radius of the zone. (Default = 300.0) --
		-- "color" = The color of the zone. (Same color id's as blips.) --
	-- "blip" = Contains the id, color, and text of the blip. --
		-- "draw" = If this is "true" it will show a blip in the center of the zone. --
		-- "id" = The id of the blip. --
		-- "color" = The color of the blip. --
		-- "text" = The text of the blip. --
	
	zones = {
		{
			coords = {x = 905.16,  y = -1763.48,  z = 30.56},
			zone = {radius = 300.0, color = 1}, 
			blip = {draw = false, id = 303, color = 1, text = "Zona roja"}
		},
		{
			coords = {x = 4978.04,  y = -5093.76,  z = 2.36}, 
			zone = {radius = 1300.0, color = 1}, 
			blip = {draw = false, id = 303, color = 1, text = "Zona roja"}
		},
		{
			coords = {x = 1050.68,  y = 2280.52,  z = 76.0}, 
			zone = {radius = 400.0, color = 0}, 
			blip = {draw = true, id = 112, color = 1, text = "Zona X"}
		}
	}
	
}