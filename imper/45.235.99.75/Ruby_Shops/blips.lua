local blips = { 
    -- Example {title="", colour=, id=, x=, y=, z=},-627.99, -274.52, 34.57
			{title="Garage", colour=27, id=290, x = -312.5, y = -872.7, z = 31.6},
	{title="Garage", colour=27, id=290, x = 1698.5, y = 3607.1, z = 34.39},
		{title="Garage", colour=27, id=290, x=410.04, y=-1637.52, z=29.29}, 
		{title="Garage", colour=27, id=290, x=-693.68, y=5769.33, z=17.33}, 
		{title="Garage", colour=27, id=290, x = 904.69, y = -55.49, z = 78.76},
				{title="Garage", colour=27, id=290, x = -1680.12, y = -874.06, z = 8.67},
				

	{title="Confiscados", colour=1, id=477, x = 1479.18, y =6355.83, z = 22.91},
	{title="Confiscados", colour=1, id=477, x = 923.14, y = -1563.83, z = 29.73},
	{title="Confiscados", colour=1, id=477, x=1561.6, y=3522.8, z=34.7},
    {title="Tienda", colour=1, id=52, x=28.463, y=-1353.033, z=29.340},
    {title="Tienda", colour=1, id=52, x=-54.937, y=-1759.108, z=29.005},
    {title="Tienda", colour=1, id=52, x=375.858, y=320.097, z=103.433},
    {title="Tienda", colour=1, id=52, x=1143.813, y=-980.601, z=46.205},
    {title="Tienda", colour=1, id=52, x=1695.284, y=4932.052, z=42.078},
    {title="Tienda", colour=1, id=52, x=2686.051, y=3281.089, z=55.241},
    {title="Tienda", colour=1, id=52, x=1967.648, y=3735.871, z=32.221},
    {title="Tienda", colour=1, id=52, x=-2977.137, y=390.652, z=15.024},
    {title="Tienda", colour=1, id=52, x=1160.269, y=-333.137, z=68.783},
    {title="Tienda", colour=1, id=52, x=-1492.784, y=-386.306, z=39.798},
    {title="Tienda", colour=1, id=52, x=-1229.355, y=-899.230, z=12.263},
    {title="Tienda", colour=1, id=52, x=-712.091, y=-923.820, z=19.014},
    {title="Tienda", colour=1, id=52, x=-1816.544, y=782.072, z=137.600},
    {title="Tienda", colour=1, id=52, x=1729.689, y=6405.970, z=34.453},
    {title="Tienda", colour=1, id=52, x=2565.705, y=385.228, z=108.463},
	    {title="Bahamas", colour=27, id=93, x=-1386.7, y=-609.2, z=43.2},
		
	 {title="Hospital Central", colour=2, id=61, x=1153.3, y=-1515.6, z=34.6},
	  	  {title="Hospital Sandy", colour=2, id=61, x=1830.09, y=3660.27, z=33.92},
		  		  	 {title="Hospital Paleto", colour=2, id=61, x=-251.0, y=6319.65, z=32.42},
					   {title="Banco", colour=2, id=434, x=-2964.76, y=482.658, z=15.7068},
	{title="Banco", colour=2, id=434, x=260.232, y=205.886, z=106.284},
	{title="Banco", colour=2, id=434, x=150.061, y=-1039.99, z=29.3778},
	{title="Banco", colour=2, id=434, x=-1213.57, y=-328.829, z=37.7908},
	{title="Banco", colour=2, id=434, x=-109.453, y=6464.05, z=31.6267},
	   	 {title="Trafico de armas", colour=4, id=150, x=1979.4 , y=5172.4, z=47.6},
		 	   	 {title="Armeria Dito", colour=27, id=110, x=811.8 , y=-2156.1, z=29.6},
		 	   	 {title="Armeria WanShot", colour=27, id=110, x=203.43 , y=-22.16, z=69.9},
                  {title="Armeria Mats", colour=27, id=110, x=-1310.7 , y=-395.3, z=36.6},
		 	   ---	 {title="Pistas de karting", colour=2, id=309, x=-1007.22 , y=-3509.27, z=14.14},

		 	   --	 {title="Correo Argentino", colour=46, id=537, x=834.31 , y=-1403.59, z=26.15},

  }  	


Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 6)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)