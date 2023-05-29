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
		{  -- Pelota
			coords = {x = 2890.9697, y = 4417.9468,  z = 54.1170}, 			
			zone = {radius = 150.0, color = 1}, 
			blip = {draw = true, id = 303, color = 1, text = "Zona roja"}
		},

		{  -- Polle
			coords = {x = -87.5380, y = 6166.3457,  z = 30.7661}, 			
			zone = {radius = 150.0, color = 1}, 
			blip = {draw = true, id = 303, color = 1, text = "Zona roja"}
		},
		
		{ 
			coords = {x = 1338.5851, y = 4359.6133,  z = 44.3628}, 			
			zone = {radius = 150.0, color = 1}, 
			blip = {draw = true, id = 303, color = 1, text = "Zona roja"}
		},
		

		{ 
			coords = {x = 1841.3108, y = 3675.0303,  z = 34.2762}, 			
			zone = {radius = 40.0, color = 45}, 
			blip = {draw = true, id = 305, color = 37, text = "Zona Blanca"}
		}
		
	}
	
}
