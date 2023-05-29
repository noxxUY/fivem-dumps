------------------------------------------
--	iEnsomatic RealisticVehicleFailure  --
------------------------------------------
--
--	Created by Jens Sandalgaard
--
--	This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
--
--	https://github.com/iEns/RealisticVehicleFailure
--


-- Configuration:

-- IMPORTANT: Some of these values MUST be defined as a floating point number. ie. 10.0 instead of 10

cfg = {
	deformationMultiplier = -1,					-- ¿Cuánto debería deformarse visualmente el vehículo por una colisión? Rango 0.0 a 10.0 Donde 0.0 es sin deformación y 10.0 es deformación 10x. -1 = No tocar. El daño visual no se sincroniza bien con otros jugadores.
	deformationExponent = 0.4,					-- ¿Cuánto debe comprimirse la configuración de deformación del archivo de manejo hacia 1.0? (Haz que los autos sean más similares). Un valor de 1 = sin cambios. Los valores más bajos comprimirán más, los valores superiores a 1 se expandirán. No lo ponga a cero o negativo.
	collisionDamageExponent = 0.6,				-- ¿Cuánto debe comprimirse la configuración de deformación del archivo de manejo hacia 1.0? (Haz que los autos sean más similares). Un valor de 1 = sin cambios. Los valores más bajos comprimirán más, los valores superiores a 1 se expandirán. No lo ponga a cero o negativo.

	damageFactorEngine = 10.0,					-- Los valores cuerdos van de 1 a 100. Los valores más altos significan más daño al vehículo. Un buen punto de partida es 10
	damageFactorBody = 10.0,					-- Los valores cuerdos van de 1 a 100. Los valores más altos significan más daño al vehículo. Un buen punto de partida es 10
	damageFactorPetrolTank = 64.0,				-- Los valores cuerdos van de 1 a 200. Los valores más altos significan más daño al vehículo. Un buen punto de partida es 64
	engineDamageExponent = 1.0,					-- ¿Cuánto debe comprimirse la configuración de daño del motor de archivos de manejo hacia 1.0. (Haz que los autos sean más similares). Un valor de 1 = sin cambios. Los valores más bajos comprimirán más, los valores superiores a 1 se expandirán. No lo ponga a cero o negativo.
	weaponsDamageMultiplier = 1.0,				-- Cuánto daño debería recibir el vehículo por disparos de armas. Rango de 0.0 a 10.0, donde 0.0 es sin daño y 10.0 es 10 veces el daño. -1 = no tocar
	degradingHealthSpeedFactor = 0.0,			-- Velocidad de degradación lenta de la salud, pero no falla. El valor 10 significa que tomará alrededor de 0,25 segundos por punto de salud, por lo que la degradación de 800 a 305 tomará alrededor de 2 minutos de conducción limpia. Los valores más altos significan una degradación más rápida
	cascadingFailureSpeedFactor = 8.0,			-- Los valores cuerdos van de 1 a 100. Cuando la salud del vehículo cae por debajo de cierto punto, se produce una falla en cascada y la salud cae rápidamente hasta que el vehículo muere. Los valores más altos significan fallas más rápidas. Un buen punto de partida es 8

	degradingFailureThreshold = 800.0,			-- Por debajo de este valor, se producirá una degradación lenta de la salud
	cascadingFailureThreshold = 360.0,			-- Por debajo de este valor, se establecerá una falla en cascada de salud
	engineSafeGuard = 100.0,					-- Valor de falla final. Ajústelo demasiado alto y el vehículo no fumará cuando esté desactivado. Si lo pone demasiado bajo, el automóvil se incendiará con una sola bala en el motor. Con una salud de 100, un automóvil típico puede recibir de 3 a 4 balas en el motor antes de incendiarse.

	torqueMultiplierEnabled = false,			-- Disminuya el par motor a medida que el motor se daña cada vez más

	limpMode = false,							-- Si es cierto, el motor nunca falla por completo, por lo que siempre podrá acudir a un mecánico a menos que gire el vehículo y evite que el deslizamiento del vehículo esté configurado en verdadero
	limpModeMultiplier = -1,					-- El multiplicador de par para usar cuando el vehículo está cojeando. Los valores sanos son 0.05 a 0.25

	preventVehicleFlip = true,					-- Si es cierto, no puede volcar un vehículo al revés

	sundayDriver = true,						-- Si es cierto, la respuesta del acelerador se escala para permitir una conducción lenta y fácil. No evitará el acelerador a fondo. No funciona con aceleradores binarios como un teclado. Establecer en falso para deshabilitar. La función de parada sin retroceso y retención de luz de freno incluida también funciona para teclados.
	sundayDriverAcceleratorCurve = 7.5,			-- La curva de respuesta que se aplicará al acelerador. Rango de 0.0 a 10.0. Los valores más altos permiten una conducción lenta más fácil, lo que significa que se requiere más presión en el acelerador para acelerar hacia adelante. No hace nada para los controladores de teclado
	sundayDriverBrakeCurve = 5.0,				-- La curva de respuesta que se aplicará al freno. Rango de 0.0 a 10.0. Los valores más altos permiten un frenado más fácil, lo que significa que se requiere más presión sobre el acelerador para frenar con fuerza. No hace nada para los controladores de teclado

	displayBlips = false,						-- Show blips for mechanics locations

	compatibilityMode = false,					-- evita que otros scripts modifiquen el estado del tanque de combustible para evitar fallas aleatorias del motor con BVA 2.01 (la desventaja es que desactiva la prevención de explosiones)

	randomTireBurstInterval = 0,				-- Número de minutos (estadísticamente, no precisamente) para conducir por encima de las 22 mph antes de pincharse un neumático. 0 = función desactivada


	-- Class Damagefactor Multiplier
	-- The damageFactor for engine, body and Petroltank will be multiplied by this value, depending on vehicle class
	-- Use it to increase or decrease damage for each class

	classDamageMultiplier = {
		[0] = 	1.0,		--	0: Compacts
				1.0,		--	1: Sedans
				1.0,		--	2: SUVs
				1.0,		--	3: Coupes
				1.0,		--	4: Muscle
				1.0,		--	5: Sports Classics
				1.0,		--	6: Sports
				1.0,		--	7: Super
				0.15,		--	8: Motorcycles
				0.25,		--	9: Off-road
				0.25,		--	10: Industrial
				1.0,		--	11: Utility
				1.0,		--	12: Vans
				1.0,		--	13: Cycles
				0.0,		--	14: Boats
				1.0,		--	15: Helicopters
				1.0,		--	16: Planes
				0.1,		--	17: Service
				0.25,		--	18: Emergency
				0.75,		--	19: Military
				0.25,		--	20: Commercial (Phantom, Lavado dinero etc.-)
				1.0			--	21: Trains
	}
}



--[[

	-- Alternate configuration values provided by ImDylan93 - Vehicles can take more damage before failure, and the balance between vehicles has been tweaked.
	-- To use: comment out the settings above, and uncomment this section.

cfg = {

	deformationMultiplier = -1,					-- How much should the vehicle visually deform from a collision. Range 0.0 to 10.0 Where 0.0 is no deformation and 10.0 is 10x deformation. -1 = Don't touch
	deformationExponent = 1.0,					-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
	collisionDamageExponent = 1.0,				-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.

	damageFactorEngine = 5.1,					-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
	damageFactorBody = 5.1,						-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
	damageFactorPetrolTank = 61.0,				-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 64
	engineDamageExponent = 1.0,					-- How much should the handling file engine damage setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
	weaponsDamageMultiplier = 0.124,			-- How much damage should the vehicle get from weapons fire. Range 0.0 to 10.0, where 0.0 is no damage and 10.0 is 10x damage. -1 = don't touch
	degradingHealthSpeedFactor = 7.4,			-- Speed of slowly degrading health, but not failure. Value of 10 means that it will take about 0.25 second per health point, so degradation from 800 to 305 will take about 2 minutes of clean driving. Higher values means faster degradation
	cascadingFailureSpeedFactor = 1.5,			-- Sane values are 1 to 100. When vehicle health drops below a certain point, cascading failure sets in, and the health drops rapidly until the vehicle dies. Higher values means faster failure. A good starting point is 8

	degradingFailureThreshold = 677.0,			-- Below this value, slow health degradation will set in
	cascadingFailureThreshold = 310.0,			-- Below this value, health cascading failure will set in
	engineSafeGuard = 100.0,					-- Final failure value. Set it too high, and the vehicle won't smoke when disabled. Set too low, and the car will catch fire from a single bullet to the engine. At health 100 a typical car can take 3-4 bullets to the engine before catching fire.

	torqueMultiplierEnabled = true,				-- Decrease engine torge as engine gets more and more damaged

	limpMode = false,							-- If true, the engine never fails completely, so you will always be able to get to a mechanic unless you flip your vehicle and preventVehicleFlip is set to true
	limpModeMultiplier = 0.15,					-- The torque multiplier to use when vehicle is limping. Sane values are 0.05 to 0.25

	preventVehicleFlip = true,					-- If true, you can't turn over an upside down vehicle

	sundayDriver = true,						-- If true, the accelerator response is scaled to enable easy slow driving. Will not prevent full throttle. Does not work with binary accelerators like a keyboard. Set to false to disable. The included stop-without-reversing and brake-light-hold feature does also work for keyboards.
	sundayDriverAcceleratorCurve = 7.5,			-- The response curve to apply to the accelerator. Range 0.0 to 10.0. Higher values enables easier slow driving, meaning more pressure on the throttle is required to accelerate forward. Does nothing for keyboard drivers
	sundayDriverBrakeCurve = 5.0,				-- The response curve to apply to the Brake. Range 0.0 to 10.0. Higher values enables easier braking, meaning more pressure on the throttle is required to brake hard. Does nothing for keyboard drivers

	displayBlips = true,						-- Show blips for mechanics locations

	classDamageMultiplier = {
		[0] = 	1.0,		--	0: Compacts
				1.0,		--	1: Sedans
				1.0,		--	2: SUVs
				0.95,		--	3: Coupes
				1.0,		--	4: Muscle
				0.95,		--	5: Sports Classics
				0.95,		--	6: Sports
				0.95,		--	7: Super
				0.27,		--	8: Motorcycles
				0.7,		--	9: Off-road
				0.25,		--	10: Industrial
				0.35,		--	11: Utility
				0.85,		--	12: Vans
				1.0,		--	13: Cycles
				0.4,		--	14: Boats
				0.7,		--	15: Helicopters
				0.7,		--	16: Planes
				0.75,		--	17: Service
				0.85,		--	18: Emergency
				0.67,		--	19: Military
				0.43,		--	20: Commercial
				1.0			--	21: Trains
	}
}

]]--





-- End of Main Configuration

-- Configure Repair system

-- id=446 for wrench icon, id=72 for spraycan icon

repairCfg = {
	mechanics = {
		{name="Mechanic", id=446, r=25.0, x=-337.0,  y=-135.0,  z=39.0},	-- LSC Burton
		{name="Mechanic", id=446, r=25.0, x=-1155.0, y=-2007.0, z=13.0},	-- LSC by airport
		{name="Mechanic", id=446, r=25.0, x=734.0,   y=-1085.0, z=22.0},	-- LSC La Mesa
		{name="Mechanic", id=446, r=25.0, x=1177.0,  y=2640.0,  z=37.0},	-- LSC Harmony
		{name="Mechanic", id=446, r=25.0, x=108.0,   y=6624.0,  z=31.0},	-- LSC Paleto Bay
		{name="Mechanic", id=446, r=18.0, x=538.0,   y=-183.0,  z=54.0},	-- Mechanic Hawic
		{name="Mechanic", id=446, r=15.0, x=1774.0,  y=3333.0,  z=41.0},	-- Mechanic Sandy Shores Airfield
		{name="Mechanic", id=446, r=15.0, x=1143.0,  y=-776.0,  z=57.0},	-- Mechanic Mirror Park
		{name="Mechanic", id=446, r=30.0, x=2508.0,  y=4103.0,  z=38.0},	-- Mechanic East Joshua Rd.
		{name="Mechanic", id=446, r=16.0, x=2006.0,  y=3792.0,  z=32.0},	-- Mechanic Sandy Shores gas station
		{name="Mechanic", id=446, r=25.0, x=484.0,   y=-1316.0, z=29.0},	-- Hayes Auto, Little Bighorn Ave.
		{name="Mechanic", id=446, r=33.0, x=-1419.0, y=-450.0,  z=36.0},	-- Hayes Auto Body Shop, Del Perro
		{name="Mechanic", id=446, r=33.0, x=268.0,   y=-1810.0, z=27.0},	-- Hayes Auto Body Shop, Davis
	--	{name="Mechanic", id=446, r=24.0, x=288.0,   y=-1730.0, z=29.0},	-- Hayes Auto, Rancho (Disabled, looks like a warehouse for the Davis branch)
		{name="Mechanic", id=446, r=27.0, x=1915.0,  y=3729.0,  z=32.0},	-- Otto's Auto Parts, Sandy Shores
		{name="Mechanic", id=446, r=45.0, x=-29.0,   y=-1665.0, z=29.0},	-- Mosley Auto Service, Strawberry
		{name="Mechanic", id=446, r=44.0, x=-212.0,  y=-1378.0, z=31.0},	-- Glass Heroes, Strawberry
		{name="Mechanic", id=446, r=33.0, x=258.0,   y=2594.0,  z=44.0},	-- Mechanic Harmony
		{name="Mechanic", id=446, r=18.0, x=-32.0,   y=-1090.0, z=26.0},	-- Simeons
		{name="Mechanic", id=446, r=25.0, x=-211.0,  y=-1325.0, z=31.0},	-- Bennys
		{name="Mechanic", id=446, r=25.0, x=903.0,   y=3563.0,  z=34.0},	-- Auto Repair, Grand Senora Desert
		{name="Mechanic", id=446, r=25.0, x=437.0,   y=3568.0,  z=38.0}		-- Auto Shop, Grand Senora Desert
	},

	fixMessages = {
		"You put the oil plug back in",
		"You stopped the oil leak using chewing gum",
		"You repaired the oil tube with gaffer tape",
		"You tightened the oil pan screw and stopped the dripping",
		"You kicked the engine and it magically came back to life",
		"You removed some rust from the spark tube",
		"You yelled at your vehicle, and it somehow had an effect"
	},
	fixMessageCount = 7,

	noFixMessages = {
		"You checked the oil plug. It's still there",
		"You looked at your engine, it seemed fine",
		"You made sure that the gaffer tape was still holding the engine together",
		"You turned up the radio volume. It just drowned out the weird engine noises",
		"You added rust-preventer to the spark tube. It made no difference",
		"Never fix something that ain't broken they said. You didn't listen. At least it didn't get worse"
	},
	noFixMessageCount = 6
}

RepairEveryoneWhitelisted = false
RepairWhitelist =
{
	"steam:123456789012345",
	"steam:000000000000000",
	"ip:192.168.0.1"			-- not sure if ip whitelist works?
}
