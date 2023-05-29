GAME_HORSE = 'horse'
GAME_ATW = 'atw'
GAME_FREE_THROW = 'free-throw'

Config = {
	Framework = 1, --[ 1 = ESX / 2 = QBCore / 3 = Other ] Choose your framework

	FrameworkTriggers = {
		notify = 'esx:showNotification', -- [ ESX = 'esx:showNotification' / QBCore = 'QBCore:Notify' ] Set the notification event, if left blank, default will be used
		object = 'esx:getSharedObject', --[ ESX = 'esx:getSharedObject' / QBCore = 'QBCore:GetObject' ] Set the shared object event, if left blank, default will be used (deprecated for QBCore)
		resourceName = 'es_extended', -- [ ESX = 'es_extended' / QBCore = 'qb-core' ] Set the resource name, if left blank, automatic detection will be performed
	},

	AllowWager = true,

	OxInventory = false,

	HorseLetters = {'H', 'O', 'R', 'S', 'E'},

	Marker = {
		Scale = 1.4,
		Flat = false,
	},

	HideMarkers = false,

	-- qtarget
	UseQTarget = false,

	-- BT-Target
	UseBTTarget = false,

	-- QB-Target
	UseQBTarget = false,

	-- OxTarget
	UseOxTarget = false,

	-- If set to true, players will need basketball in their inventory to play
	RequireBasketball = false,
	BasketballItemName = 'basketball',

	-- Allows players with item basketball_hoop to place the hoop anywhere on the map
	AllowPlacingHoops = true,
	HoopItemName = 'basketball_hoop',

	-- Improves performance by ~30% when near basketball hoop, but makes it less visible when player scores
	-- (Removes the white basketball hoop net effect)
	DisableHoopNetRendering = false,

	-- Locks trick moves until player scores at least given amount of hoops
	TricksRPGProgression = true,
	TrickScoreRequirement = {
		TRICK_SPIN = 50,
		TRICK_BNR = 150,
	},

	HoopNetColor = {255, 255, 255},
	HoopNetScoreFlashColor = {92, 255, 92},
	AimPathColor = {255, 191, 0},

	Controls = {
		CHECKPOINT_INTERACT = {
            key = 38,
		},
		CHECKPOINT_MODIFIER = {
			key = 21,
		},
		AIM_THROW = {
            key = 38,
            name = 'INPUT_PICKUP',
            label = 'Tiro de punteria',
		},
		TRICK_SPIN = {
            keyHold = 19,
            key = 38,
            label = 'Truco: Girar',
		},
		TRICK_BNR = {
            keyHold = 36,
            key = 38,
            label = 'Truco: Giro detrás del cuello',
		},

		AIM_LOCK = {
			key = 36,
			label = 'Bloquear tiro',
		},
		POWER_SPEED = {
			key = 21,
			label = 'Multiplicador de Potencia',
		},
		LOWER_POWER = {
			keyHold = 15,
			key = 14,
			label = 'Fuerza del lanzamiento',
		},
		EXIT = {
			key = 23,
			label = 'Salir',
		},
		THROW = {
			key = 22,
			label = 'Tirar',
		},
	},

	Text = {
		ATW_CP_THROW_POINTS = 'posiciones',
		[GAME_HORSE] = 'Juego normal',
		[GAME_ATW] = 'Establece puntos por la pista',
		[GAME_FREE_THROW] = 'Tiro libre',
		GO_TO_BALL_PICKUP = 'Ve a ~y~el balon~s~ y ~y~recogelo~s~',
		START_GAME = '~INPUT_PICKUP~ Empezar',
		START_TAKE_GAME = '~INPUT_PICKUP~ Empezar~n~~INPUT_SPRINT~ + ~INPUT_PICKUP~ Remover',
		REMOVE_HOOP = 'Remover hoop',
		START_REGISTRATION = '~INPUT_PICKUP~ Empezar registracion',
		BEGIN_GAME = '~INPUT_PICKUP~ Comenzar juego',
		JOIN_GAME = '~INPUT_PICKUP~ Unirse al juego',
		END_THROW = '~INPUT_ENTER~ Cancelar',
		THROW = '~INPUT_JUMP~ Lanzar',
		START_THROW = '~INPUT_PICKUP~ Lanzar',
		PICKUP = '~INPUT_PICKUP~ Coger pelota',
		TOO_CLOSE = 'Tu estas ~r~demasiado cerca~s~ del aro ~y~establece los puntos de lanzamiento~s~',
		PLACE_POINT = '~INPUT_PICKUP~ Establece un punto de tiro',
		REMOVE_POINT = '~INPUT_SPRINT~ + ~INPUT_PICKUP~ Remover punto de lanzamiento',
		TOO_CLOSE_OTHER = 'Tu estas ~r~demasiado cerca~s~ de ~y~otro punto de lanzamiento~s~',
		NOT_ENOUGH_MONEY = 'No tienes suficiente dinero para apostar',
		WON_NO_WAGER = 'Tu has ganado el juego de baloncesto',
		HORSE_SET = 'Lanza desde ~y~cualquier lugar~s~. Otros jugadores tendrán que replicar ~y~el mismo tiro~s~',
		HORSE_THROW = 'Lanza desde ~y~el mismo lugar~s~ que el jugador anterior',
		MUST_BE_IN_MARKER = 'Debes estar ~r~en el marcador~s~ para tirar',
		PLACE_AIM = '~y~Apunta~s~ a una pared para colocar un aro.',
		PLACE_HOOP = '~INPUT_PICKUP~ Lugar~n~~INPUT_ENTER~ Salir',
		PLACE_TOO_FAR = 'El ~y~Punto de interaccion~s~ esta demasiado lejos del aro.',
		GAME_IN_PROGRESS = 'No puedes Quitar el aro, el juego ha comenzado.',
		CANT_TAKE = 'No puedes remover el aro',
		DIF_EASY = 'Facil',
		DIF_MEDIUM = 'Medio',
		DIF_HARD = 'Dificil',
		REGISTER = 'Registrarse',
		START = 'Empezar',
		CLOSE = 'Cerrar',
		BASKETBALL = 'Baloncesto',
		T_OPEN = 'Abrir',
		T_FINISH_SETUP = 'Finalizar',
		T_PICKUP = 'Coger',
		WAGER = 'Apostar',
		WAGER_NONE = 'None',
		GAME_MODE = 'Game Mode',
		DIFFICULTY = 'Dificultad',
		NEED_BASKETBALL = 'Necesitas una pelota de baloncesto para jugar',
		BLIP = 'Baloncesto',
		GAME_SETTING_UP = 'El juego se esta configurando..',
	},
}

HoopOffsets = {
    [`prop_basketball_net`] = {
        hoopCenter = vector3(-0.009, -1.059, 3.11),
        hoopPlanePoint = vector3(0.0, -1.0, 3.4),
        hoopPlaneNormal = vector3(0.0, -0.67, 3.4),
        hoopPlaneNormalLeft = vector3(-1.0, -0.67, 3.4),
        hoopPlaneNormalUp = vector3(0.0, -0.67, 4.4),
    },
    [`prop_basketball_net2`] = {
        hoopCenter = vector3(-0.009, -0.4, 0.0),
        hoopPlanePoint = vector3(0.0, -0.5, 0.2),
        hoopPlaneNormal = vector3(0.0, 0.0, 0.2),
        hoopPlaneNormalLeft = vector3(-1.0, 0.0, 0.2),
        hoopPlaneNormalUp = vector3(0.0, 0.0, 1.0),
    },
}

BasketballHoops = {
	{
		pos = vector3(63.5991, 41.85581, 72.42996), 
		rot = vector4(0, 0, -0.9844655, -0.1755779),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.18,
		threePointSideDist = -0.12,
		threePointRadius = 4.3,
		hideBlip = true,
	},
	{
		pos = vector3(70.55696, 60.9724, 72.42996), 
		rot = vector4(0, 0, -0.1755781, 0.9844655),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.2,
		threePointSideDist = 0.12,
		threePointRadius = 4.35,
	},
	{
		pos = vector3(1239.038, -1636.49, 51.02588), 
		rot = vector4(0, 0, -0.9612619, 0.275637),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = 0.0,
		threePointRadius = 30.35,
	},
	{
		pos = vector3(-213.765, -1523.489, 30.60864), 
		rot = vector4(0, 0, -0.9396927, -0.3420199),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = 0.0,
		threePointRadius = 5.95,
	},
	{
		pos = vector3(-232.5229, -1545.844, 30.60864), 
		rot = vector4(0, 0, -0.9396927, -0.3420199),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = 0.0,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-215.9987, -1526.151, 30.60864), 
		rot = vector4(0, 0, -0.3420199, 0.9396927),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = 0.0,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-197.3071, -1503.875, 30.60864), 
		rot = vector4(0, 0, -0.3420199, 0.9396927),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = 0.0,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-931.7396, -737.2593, 18.91345), 
		rot = vector4(0, 0, 1, 0),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = 0.0,
		threePointRadius = 6.0,
	},
	{
		pos = vector3(-931.7396, -711.652, 18.91345), 
		rot = vector4(0, 0, 0, 1),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = -0.03,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-910.1643, -711.652, 18.91345), 
		rot = vector4(0, 0, 0, 1),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = -0.00,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-910.1643, -737.2593, 18.91345), 
		rot = vector4(0, 0, 1, 0),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = -0.02,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-1306.526, -1611.675, 3.164207), 
		rot = vector4(0, 0, -0.9659259, 0.258819),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 1.37,
		threePointSideDist = 0.04,
		threePointRadius = 5.95,
		hideBlip = true,
	},
	{
		pos = vector3(-1278.527, -1545.03, 3.286994), 
		rot = vector4(0, 0, -0.9914448, -0.130527),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 1.35,
		threePointSideDist = -0.18,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-1321.21, -1586.242, 3.30073), 
		rot = vector4(0, 0, -0.258819, -0.9659258),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 1.37,
		threePointSideDist = -0.04,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-1271.708, -1516.441, 3.298484), 
		rot = vector4(0, 0, -0.130526, 0.9914449),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 1.35,
		threePointSideDist = -0.08,
		threePointRadius = 6.0,
	},
	{
		pos = vector3(-2954.641, 34.54525, 10.60788), 
		rot = vector4(0, 0, -0.5373001, -0.8433911),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = -0.7,
		threePointSideDist = 0.03,
		threePointRadius = 3.35,
	},
	{
		pos = vector3(-2938.064, 26.81527, 10.60788), 
		rot = vector4(0, 0, -0.8433919, 0.5372989),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = -0.65,
		threePointSideDist = -0.03,
		threePointRadius = 3.35,
		hideBlip = true,
	},
	{
		pos = vector3(-1991.334, 628.194, 121.5473), 
		rot = vector4(0, 0, -0.8352958, 0.5498009),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = 0.0,
		threePointRadius = 30.35,
	},
	{
		pos = vector3(-463.3439, 697.6946, 152.0661), 
		rot = vector4(0, 0, -0.9999479, 0.010206),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = 0.0,
		threePointRadius = 30.35,
	},
	{
		pos = vector3(-1103.956, 547.2898, 101.6781), 
		rot = vector4(0, 0, -0.9684339, 0.249271),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = 0.0,
		threePointRadius = 30.35,
	},
	{
		pos = vector3(-1938.21, 3288.614, 31.94385), 
		rot = vector4(0, 0, -0.5000003, -0.8660253),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.65,
		threePointSideDist = -0.06,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-1918.51, 3321.6, 31.9715), 
		rot = vector4(0, 0, -0.5000003, -0.8660253),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.65,
		threePointSideDist = -0.06,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-1895.208, 3308.041, 31.9642), 
		rot = vector4(0, 0, -0.8660254, 0.5000002),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.65,
		threePointSideDist = -0.06,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(-1914.868, 3275.119, 31.92873), 
		rot = vector4(0, 0, -0.8660254, 0.5000002),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.65,
		threePointSideDist = -0.06,
		threePointRadius = 6.0,
		hideBlip = true,
	},
	{
		pos = vector3(970.147, 2730.4, 38.47357), 
		rot = vector4(0, 0, 0, 1),
		State = nil,
		Model = `prop_basketball_net`,
		IsSubscribed = false,
		threePointFwdDist = 0.0,
		threePointSideDist = 0.0,
		threePointRadius = 30.35,
	},
		
}

STATUS_FREE = 'free'
STATUS_CONFIGURING = 'configuring'
STATUS_REGISTRATION = 'registration'
STATUS_PLAYING = 'playing'
STATUS_THROWN = 'thrown'

C_PLAYERS = 'players'

if Config.UseQTarget then
	Config.TargetResourceName = 'qtarget'
end
if Config.UseBTTarget then
	Config.TargetResourceName = 'bt-target'
end
if Config.UseQBTarget then
	Config.TargetResourceName = 'qb-target'
end
if Config.UseOxTarget then
	Config.TargetResourceName = 'ox_target'
end