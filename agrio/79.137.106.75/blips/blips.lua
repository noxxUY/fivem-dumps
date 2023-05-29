local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

	 {name="Tequila (disponible)", colour=7, id=93, x = -564.91, y = 276.28, z = 83.12, scale=0.8},
	 {name="Local - Moteros", colour=6, id=93, x = 981.86, y = -103.19, z = 74.85, scale=0.8},
   {name="Iglesia", colour=21, id=492, x = -790.27, y = -7.95, z = 40.77, scale=0.8},
	 --{name="Gama Media", colour=38, id=40, x = -1054.45, y = -1025.23, z = 2.13, scale=0.8},
   --{name="Gama Baja", colour=5, id=40, x = 160.55, y = -1881.47, z = 23.85, scale=0.8},
   {name="Banco Central", colour=24, id=500, x = 250.32, y = 219.52, z = 106.29, scale=0.8},
   --{name="Gama Alta", colour=1, id=40, x = 1130.47, y = -506.38, z = 64.26, scale=0.8},
   --{name="Banco de sociedades", colour=69, id=140, x = -225.24, y = -2001.27, z = 23.80, scale=0.8},
   --{name="ADMINISTRADORES", colour=1, id=269, x = 316.54, y = -700.57, z = 29.34, scale=0.8},
   {name="Hospital Paleto Bay", colour=3, id=61, x = -242.51, y = 6325.04, z = 32.43, scale=0.8},
   {name="Hospital Los Santos", colour=3, id=61, x = 374.68, y = -595.63, z = 28.82, scale=0.8},
   {name="Oficina de Amazon", colour=3, id=616, x = 78.9, y = 111.93, z = 79.16, scale=0.8},
   {name="Bahamas Club", colour=27, id=93, x = -1395.58, y = -605.05, z = 30.32, scale=0.8},
   {name="+18 (disponible)", colour=83, id=121, x = 129.25, y = -1299.36, z = 29.23, scale=0.8},
   --{name="Circuto Moto-Cros", colour=46, id=491, x = 1304.63, y = -3197.4, z = 31.20, scale=0.8},
   --{name="Circuto Nascar", colour=46, id=491, x = -393.12, y = -1878.71, z = 20.53, scale=0.8},
   --{name="Circuto Karting", colour=38, id=127, x = -1027.47, y = -3476.14, z = 13.40, scale=0.8},
   --{name="Farmacia", colour=48, id=51, x = -489.05, y = -340.45, z = 42.48, scale=0.8},
  -- {name="Cirugia Plástica[Planta Baja]", colour=26, id=51, x =  -456.78, y = -311.59, z = -130.79, scale=0.8},
   {name="Taxi", colour=66, id=198, x = 906.71, y = -169.05, z = 257.54, scale=0.8},
   {name="Banco Fleeca", colour=1, id=255, x = 147.04, y = -1044.94, z = 29.36, scale=0.8},
   {name="Banco Fleeca(Autopista)", colour=1, id=255, x = -2957.66, y = 481.45, z =  15.69, scale=0.8},
   --{name="Hospital AgrioRP", colour=1, id=586, x = -440.73, y = -327.45, z =  34.69, scale=1.4},
   {name="Atraco Blaine County", colour=1, id=255, x = -107.06, y = 6474.80, z = 31.62, scale=0.8},
   {name="Atraco Blaine County", colour=1, id=255, x = 311.07, y = -283.06, z = 54.17, scale=0.8},
   {name="Atraco Blaine County", colour=1, id=255, x = -354.09, y = -53.94, z = 49.05, scale=0.8},
   --{name="FAME OR SHAME [EVENTO ESPECIAL CON PREMIOS]", colour=1, id=136, x = -231.09, y = -1999.94, z = 24.05, scale=1.5},
   --{name="FAME OR SHAME [EVENTO ESPECIAL CON PREMIOS]", colour=1, id=136, x = -254.09, y = -1843.94, z = 24.05, scale=0.5},
   --{name="FAME OR SHAME [EVENTO ESPECIAL CON PREMIOS]", colour=1, id=136, x = -169.09, y = -1931.94, z = 24.05, scale=0.5},
   --{name="FAME OR SHAME [EVENTO ESPECIAL CON PREMIOS]", colour=1, id=136, x = -150.09, y = -1764.94, z = 24.05, scale=0.5},
   --{name="FAME OR SHAME [EVENTO ESPECIAL CON PREMIOS]", colour=1, id=136, x = -395.09, y = -1830.94, z = 24.05, scale=0.5},
   --{name="FAME OR SHAME [EVENTO ESPECIAL CON PREMIOS]", colour=1, id=136, x = -184.09, y = -1963.94, z = 24.05, scale=1.0},
   --{name="Atraco Blaine County", colour=1, id=255, x = -1211.9, y = -335.75, z = 37.79, scale=0.8},
   --{name="Atraco Joyería", colour=74, id=617, x = -629.99, y = -236.542, z = 38.05, scale=0.8},
   --{name="Comisaria", colour=74, id=617, x = -629.99, y = -236.542, z = 38.05, scale=0.8},
   --{name="🏴MAPEADO EN VENTA ☠️", colour=29, id=476, x = 2638.88, y = 6537.65, z = 146.10, scale=1.8},
   --{name="🏴MAPEADO EN VENTA ☠️", colour=29, id=476, x = -2237.34, y = -44.45, z = 118.89, scale=1.8},
   --{name="🏴MAPEADO EN VENTA ☠️", colour=29, id=476, x = -102.74, y = 3000.45, z = 37.89, scale=1.8},
   --{name="🏴MAPEADO EN VENTA ☠️", colour=29, id=476, x = 939.34, y = 438.45, z = 121.89, scale=1.8},
   --{name="🏴MAPEADO EN VENTA VIP☠️", colour=29, id=476, x = -1013.34, y = 1556.82, z = 278.49, scale=1.8},
   {name="CINE | ESCENARIO", colour=26, id=135, x = -1687.34, y = -920.82, z = 7.49, scale=1.5},
   {name="Aereopuerto Perico", colour=22, id=307, x = 4485.74, y = -4477.82, z = 4.49, scale=1.1},
   {name="Medusa", colour=27, id=93, x = 765.64, y = -565.82, z = 31.49, scale=1.1},
   {name="Puerto Perico", colour=3, id=404, x = 5138.54, y = -4638.92, z = 0.49, scale=1.1},
  -- {name="Propiedad privada [NO ENTRAR]", colour=49, id=163, x = 4897.54, y = -5689.92, z = 0.49, scale=1.1},
 -- {name="BW", colour=8, id=671, x = 4976.84, y = -5702.52, z = 19.89, scale=1.1},
--  {name="Fuerzas especiales B.O.P.E.", colour=1, id=84, x = 610.74, y = -2.82, z = 90.49, scale=1.1},
   {name="Yellow Jack [Zona de Relax]", colour=46, id=280, x = 2007.74, y = 3087.82, z = 47.49, scale=1.1},
   {name="Hospital AgrioRP | Norte ", colour=1, id=586, x = -254.83, y = 6329.45, z =  34.69, scale=1.4},
   {name="Hospital AgrioRP | Sur ", colour=1, id=586, x = 305.47, y = -587.32, z =  43.28, scale=1.4},
   {name="GYM [Zona de Relax]", colour=46, id=280, x = -1227.74, y = -1582.82, z = 4.49, scale=1.1},
   {name="Médico del NORTE [Tratamientos gratis]", colour=46, id=61, x = 1821.04, y = 3688.42, z = 34.29, scale=1.1},
   {name="Comisaria Seguridad Civil", colour=4, id=60, x = -1320.34, y = -1524.02, z = 13.79, scale=1.1},
   {name="Casino", colour=30, id=679, x = 956.34, y = 54.92, z = 74.79, scale=1.1},
   {name="Ruleta", colour=27, id=681, x = 949.34, y = 44.92, z = 71.79, scale=0.6},
   {name="Tienda máscaras", colour=27, id=102, x=151.0, y=6646.56, z=31.4, scale=0.6},
   {name="Billar", colour=25, id=103, x=-1596.90, y=-982.56, z=13.04, scale=0.6},
   {name="Motoconcho", colour=21, id=494, x=1777.6878662109, y=3641.3405761719, z=34.857177734375, scale=0.9},
   {title="Tienda de Electronica", colour= 7, id=521, x = -1210.39, y = -1501.88, z = 4.3738, scale=0.9},
  {title="Tienda de Objetos", colour= 17, id=521, x = -1225.39, y = -1482.21, z = 4.3738, scale=0.9}, 
  {title="Farmacia", colour= 1, id=51, x = -1229.04, y = -1477.22, z = 4.3738, scale=0.9},
   {name="Tienda Electronica", colour=21, id=606, x=-1211.6878662109, y=-1505.3405761719, z=4.857177734375, scale=0.9},
   {name="UwuCat", colour=27, id=93,  x=-572.50549316406, y=-1100.0307617188, z=22.169189453125, h=36.850395202637, scale=0.8},
 
  }
  
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      --SetBlipScale(info.blip, 0.8)
      SetBlipScale(info.blip, info.scale)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.name)
      EndTextCommandSetBlipName(info.blip)
    end
end)