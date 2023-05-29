Config = {}
Config.Locale = 'en'
Config.Deposito = 2500

--#############################################
--### QUE CARRO PONER Y SPAWN DEL VEHICULO ###
--#############################################
Config.Vehiculo      = "ratloader"
Config.VehiclespawnX = -512.38
Config.VehiclespawnY = -969.49
Config.VehiclespawnZ = 23.58
Config.VehiclespawnH = 76.23
Config.SpawnCar = {x = -512.38, y = -969.49, z = 23.58}
Config.VehicleDelete = {x=-499.02, y=-942.14, z=22.96}
Config.PrecioHacha = 1500
--#############################----

--#############################################
--###### BLIP Y VESTUARIO MINERO ######
--#############################################
--LLEGAMOS AL CERRADERO
Config.EstacionarCamion = {x=-554.93,y=5390.18,z=67.47}
-- 1 PASO 
Config.BlipInicioTrabajo = "Maderero Inicio"  
Config.BotonInicioTrabajo  = "Press ~INPUT_CONTEXT~ para iniciar el trabajo"

Config.InicioTrabajoX = -510.03
Config.InicioTrabajoY = -1001.58
Config.InicioTrabajoZ = 23.55
---#############################----

--#############################################
--###### BLIP RECOLECCION MADERA ######
--#############################################

Config.blipdemandera  = "Madera" 
Config.BotonRecoleccion =  "Press ~INPUT_CONTEXT~ para Cortar madera."

Config.BlipmaderaX = -564.0
Config.BlipmaderaY = 5378.39
Config.BlipmaderaZ = 70.2

---#############################----

--#############################################
--###### BLIP Y PUNTO DE PROCESAMIENTO ######
--#############################################
-- 2 PASO 
Config.BlipProcesomiento= "Madera Corte"
Config.ProcesamientoLetra = " Cortando Madera ~g~ "
Config.BotonProcesamiento = "Press ~INPUT_CONTEXT~ Para procesar madera "

Config.ProcesamientoX     = -533.19
Config.ProcesamientoY     = 5292.06
Config.ProcesamientoZ     = 74.17
Config.Procesamiento = {x=-533.19,y=5292.06,z=74.17}
---#############################----

--#############################################
--###### BLIP Y 1 PUNTO DE FUNDICION DE ROPA ######
--#############################################
-- 3PASO 
Config.BlipRefinado   = "Madera Empaquetar"
Config.RefinadoLetra  = " Contando maderas empaquetadas ~g~ "
Config.BotonRefinado  = "Press ~INPUT_CONTEXT~ para empaquetar madera "

Config.RefinadoX      = -508.48
Config.RefinadoY      = 5257.21
Config.RefinadoZ      = 80.62
Config.Refinado = {x=-508.48,y=5257.21,z=80.62}
---#############################----

--#############################################
--###### BLIP Y UN PUNTO DE VENTA DE JOYAS ######
--#############################################
-- 4 PASO 
Config.BlipVenta   = "Venta Madera" 
Config.VentaLetraEnCirculo = "Presiona [E] Vender tus Tablas de madera"
Config.BotonVenta ="Press ~INPUT_CONTEXT~ Para vende madera "

Config.VentaX = -507.97
Config.VentaY = -941.3
Config.VentaZ = 24.03 -0.95 -- " PARA QUE EL CIRCULO SALGA AL BORDE DEL SUELO"
Config.Venta = {x=-507.97,y=-941.3,z=24.03 -0.95}

--## PUNTO VENTA SIN BLIP
Config.Venta2X = -506.5
Config.Venta2Y = -938.52
Config.Venta2Z = 24.1 -0.95

-- CORDENADA ADORNO VENTA NPC1
Config.ModeloNpc1 = "s_m_y_construct_02"
Config.NpcVenta1X = -504.36
Config.NpcVenta1Y = -941.64
Config.NpcVenta1Z = 23.98 -0.95 --"-0.95 ES PARA QUE EL NPC ESTE TOCANDO SUELO "
Config.NpcVenta1H = 65.26

-- CORDENADA ADORNO VENTA NPC2
Config.ModeloNpc2 = "s_m_y_construct_02"
Config.NpcVenta2X = -503.5
Config.NpcVenta2Y = -937.43
Config.NpcVenta2Z = 24.07 -0.95 --"-0.95 ES PARA QUE EL NPC ESTE TOCANDO SUELO "
Config.NpcVenta2H = 60.48

-- CORDENADA ADORNO VENTA NPC3
Config.ModeloNpc3 = "s_m_y_construct_02"
Config.NpcVenta3X = -510.28
Config.NpcVenta3Y = -942.84
Config.NpcVenta3Z = 24.06 -0.95 --"-0.95 ES PARA QUE EL NPC ESTE TOCANDO SUELO "
Config.NpcVenta3H = 337.72

--NPC VENTA DE HACHA
Config.ModeloNpc4 = "s_m_y_construct_02"
Config.NpcVenta4X = -572.53
Config.NpcVenta4Y = 5361.48
Config.NpcVenta4Z = 70.22 -0.95 --"-0.95 ES PARA QUE EL NPC ESTE TOCANDO SUELO "
Config.NpcVenta4H = 251.4
Config.NpcVentaHacha = {x=-572.53,y=5361.48,z=70.22 -0.95}

---#############################----

--#############################################
--###### PRECIO DE MINERALES ######
--#############################################
Config.MaterialNivel4 =  700
Config.MaterialNivel3 =  650
Config.MaterialNivel2 =  550
Config.MaterialNivel1 =  400
---#############################----