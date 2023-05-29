Config = {}
Config.Locale = 'en' -- Localisation

Config.CurrencyPrefix = '$' -- Ex. $ for USD - will be in front of the price
Config.CurrencySuffix = '' -- Ex. DKK for Danish Kroner - will be behind the price, remember a space in the start.

Config.Zones = {
    BikeRental = {
        Enable = true, -- Enable/Disable Bike Rental
        Name = _U('bikerental_blip'), -- Blip Name
      DrawDistance = 20.0, -- DrawDistance lower is better! (controles how fare away you should be before the marker on the ground is drawn)
        MarkerType = 38,
        ZoneSize = {x = 2.0, y = 2.0, z = 2.0}, -- Zone Size (How large the ring is)
        MarkerColor = {r = 0, g = 255, b = 255}, -- Marker Color RGB
        RentetMarkerColor = {r = 255, g = 0, b = 0}, -- Marker Color when bike is rentet
        BlipSprite = 376, -- Map Marker Icon http://gtaxscripting.blogspot.com/2016/05/gta-v-blips-id-and-image.html
        BlipScale = 0.4, -- Size of Map Marker
        BlipColor = 57,  -- Map Marker Color
        EnableBlips = true, -- Enable/Disable Map Markers
        Free = false, -- Controle if bike rental is free
        Multiplier = 5, -- Multiplie the renting price, if bike is not returned (Bike Rental resets on server restart)
        MenuTitle = _U('menu_title_bikerental'), -- Menu Title
        ItemType = 'vehicle', -- Item Type (This one is not used currently, but is intended to be used if script is expanded)
        MenuActions = {
            MenuTrigger = 'bikerental_menu', -- Menu Trigger
            MenuMessage = _U('press_bikerental_menu'), -- Menu Help Text
        },
        Items = { -- Item, label, and price used for the menu
            {item = 'BMX', label = 'BMX Cykel', price = 300},
            {item = 'CRUISER', label = 'Playera', price = 300},
            {item = 'FIXTER', label = 'Biker Torneo', price = 300},
            {item = 'SCORCHER', label = 'Mountainbike', price = 300},
            {item = 'TRIBIKE', label = 'Triathlon Cykel 1', price = 300},

        },
        Pos = { -- Zone positions
								 {x = 521.34 , y = -1654.93, z = 29.29},
						 {x = -841.82 , y = -1192.38, z = 6.1},
							 							 {x = 399.24 , y = -381.38, z = 47.09},
							 							 {x = -155.91 , y = -879.02, z = 29.28},
               							 				 {x = 891.11 , y = -86.61, z = 78.76},
           							 				 {x = 1155.39 , y = -1467.53, z = 34.69},
 {x = 201.8 , y = 6577.0, z = 31.8},
{x = 2623.4 , y = 5113.9, z = 44.8},
{x = 2034.5 , y = 4977.8, z = 41.0}, 
{x = 2742.4 , y = 4409.5, z = 48.3}, 
{x = 2590.5 , y = 3169.7, z = 50.9}, 
{x = 924.5 , y = 2710.2, z = 40.5}, 
{x = -3100.5 , y = 744.2, z = 21.2}, 
{x = 151.5 , y = -1003.2, z = 29.2},
{x = 184.3 , y = -3196.1, z = 5.7},  
{x = -853.2 , y = -690.2, z = 27.7}, 
{x = 51.4 , y = 268.1, z = 109.5}, 
{x = -145.6 , y = -1543.1, z = 34.4}, 
{x = 765.6 , y = -2432.2, z = 19.9}, 
{x = -698.2 , y = 494.8, z = 109.4}, 
{x = -1887.8 , y = -365.8, z = 49.1}, 
{x = -2706.19 , y = -47.22, z = 15.79}, 
{x = -1031.34 , y = -2730.43, z = 13.76}, 
{x = 2568.63 , y = 475.0, z = 108.53}, 
{x = -2066.15 , y = 4463.52, z = 58.46}, 
{x = -2730.11 , y = 2316.51, z = 17.57}, 


        }
    },
    
    Basejumping = {
        Enable = true, -- Enable/Disable Basejumping
        Name = _U('basejumping_blip'), -- Blip Name
        DrawDistance = 10.0, -- DrawDistance lower is better! (controles how fare away you should be before the marker on the ground is drawn)
        MarkerType = 25, -- Marker Type https://forum.fivem.net/t/drawmarker-pictures-for-dev/99136
        ZoneSize = {x = 2.0, y = 2.0, z = 2.0}, -- Zone Size (How large the ring is)
        MarkerColor = {r = 255, g = 168, b = 0}, -- Marker Color RGB
        BlipSprite = 94, -- Map Marker Icon http://gtaxscripting.blogspot.com/2016/05/gta-v-blips-id-and-image.html
        BlipScale = 0.3, -- Size of Map Marker
        BlipColor = 81, -- Map Marker Color
        EnableBlips = true, -- Enable/Disable Map Markers
        Free = false, -- Controle if bike rental is free
        MenuTitle = _U('menu_title_basejumping'), -- Menu Title
        ItemType = 'weapon', -- Item Type (Is in use dont change or it will break)
        MenuActions = {
            MenuTrigger = 'basejumping_menu', -- Menu Trigger
            MenuMessage = _U('press_basejumping_menu'), -- Menu Help Text
        },
        Items = { -- Item, label, and price used for the menu
            {item = 'GADGET_PARACHUTE', label = 'Faldskærm', price = 300},
        },
        Pos = { -- Zone positions
            {x = 451.45, y = 5587.85, z = 780.23},
            {x = -1136.27, y = 4659.88, z = 243.02},
            {x = 1665.17, y = -28.0, z = 195.97},
            {x = -119.97, y = -977.51, z = 303.41},
            {x = -543.86, y = -2226.02, z = 121.44},
        },
        TelePos = { -- Basejump TP locations (used to launch the player for basejumping)
            {x = 446.74, y = 5587.83, z = 791.2, h = 85.5},
            {x = -1146.22, y = 4660.92, z = 243.89, h = 88.5},
            {x = 1659.71, y = -29.39, z = 196.93, h = 103.5},
            {x = -118.81, y = -979.88, z = 304.24, h = 207.5},
            {x = -539.62, y = -2228.61, z = 122.36, h = 237.5},
        }
    }
}
