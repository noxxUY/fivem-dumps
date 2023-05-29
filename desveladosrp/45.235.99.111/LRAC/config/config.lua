Config = {}
Config.Locale = 'es'

Config.AntiResourceStopCheck = true -- banea si un jugador para un script
Config.AntiSpectate = true -- Banea si un jugador usa el modo spectate
Config.AntiBMCGLOBAL = false --Detecta si un jugador ejecuta un executor
Config.AntiCMD = true -- Detecta si un jugador startea otro script o mennu .lua
Config.AntiCheatEngine = true -- Detecta si un jugador usa el Cheat Engine
Config.AntiInyection = true --Banea si un jugador se injecta un menu
Config.AntiInyectionv2 = true --Banea si un jugador se injecta un menu
Config.AntiInyectionv3 = true --Banea si un jugador se injecta un menu
Config.AntiACBypass = true --Detecta si intenta omitir el AC
Config.AntiCheat = true -- Activa el AC
Config.AntiCarDetroy = true --Detecta si un coche esta roto y lo elimina
Config.AntiGodmode = true -- Detecta si un jugador tiene GodMode
Config.AntiPedCrasher = false -- Detecta si un jugador intenta crasear el server
Config.AntiSpeed  = true -- Detecta si un jugador tiene super velocidad
Config.AntiBlips = true  -- Detecta si un jugador tiene los blips de los jugadores
Config.PlayerProtection = true -- Proteccion para el jugador de explosiones y fuego
Config.AntiPedAttack = true  -- Anti ped con armas
Config.AntiBlackweapons = true
Config.AntiCarBlack    = true -- Detecta, banea o elimina si sacan el coche
Config.AntiObjetsBlack = true -- Detecta, banea o elimina si sacan el objeto
Config.MiniMap         = false --Activa el MiniMapa
Config.AntiMenyoo      = true
Config.AntiWeaponDMGModifier = true -- Evita la modificación de daño de armas / vehículos, además de evitar la modificación de la dureza de los vehículos, es decir, su protección.

-- Detecta si un jugador puso una tecla prohibida
Config.AntiKey       = true 
Config.AntiKeyInsert = false
Config.AntiKeyALTF8  = true
Config.AntiKeyShiftG = false
Config.AntiKeyct5rlf8 = true

-- Peds prohibidos
Config.PEDBLACK = {
    [`CSB_BallasOG`] = true,
	[`MP_S_ARMOURED_01`] = true,
	[`S_F_Y_Cop_01`] = true,
	[`S_F_Y_Cop_02`] = true,
	[`S_F_Y_Cop_03`] = true,
	[`S_M_Y_Cop_01`] = true,
	[`S_M_Y_Cop_02`] = true,
	[`S_M_Y_Cop_03`] = true,
	[`A_C_MtLion`] = true,
	[`S_F_Y_Sheriff_01`] = true,
	[`S_F_Y_Sheriff_02`] = true,
	[`S_F_Y_Sheriff_03`] = true,
	[`S_M_Y_Marine_01`] = true,
	[`S_M_Y_Marine_02`] = true,
	[`S_M_Y_Marine_03`] = true,
	[`S_M_SECURITY_01`] = true,
	[`S_M_SECURITY_02`] = true,
	[`s_m_y_swat_01`] = true,
	[`a_m_y_mexthug_01`] = true,
	[`u_m_y_zombie_01`] = true,
	[`S_M_SECURITY_03`] = true,
	[`s_m_y_swat_01`] = true,
	[`S_M_Y_ARMYMECH_01`] = true,
	[`S_M_Y_ARMYMECH_02`] = true,
	[`S_M_Y_ARMYMECH_03`] = true,
	[`S_M_Y_BLACKOPS_01`] = true,
	[`S_M_Y_BLACKOPS_02`] = true,
	[`S_M_Y_BLACKOPS_03`] = true
}
-- Armas prohibidos
Config.WeaponBL={
	"WEAPON_HAMMER",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_STINGER",
	"WEAPON_GRENADE",
	"WEAPON_FIREWORK",
	"WEAPON_BOTTLE",
	"WEAPON_RAILGUN",
	"WEAPON_RAILPISTOL",
	"WEAPON_RAILGUN",
	"WEAPON_RAYPISTOL", 
	"WEAPON_RAYCARBINE", 
	"WEAPON_RAYMINIGUN",
	"WEAPON_DIGISCANNER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_FIREWORK",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_PRECISIONRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MINIGUN",
	"WEAPON_PIPEBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_MG",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_GADGETPISTOL",
	"WEAPON_NAVYREVOLVER",
	"WEAPON_CERAMICPISTOL",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_SNSPISTOL",
	"WEAPON_APPISTOL"
}