Config          	= {}

Config.Locale   	= 'en'

Config.EntityBan = true
Config.Entity = true
Config.AntiEntity = false
Config.LogOutDis = false
Config.AntiVPN = false
Settings = {}
Settings.AntiAttachVehicle = true
Settings.AntiPickUps = true
Config.LogsScreenshotBan = 'https://discord.com/api/webhooks/787237802601086996/sUedbREvEQv1rZU1bwnkhEQ7JaF1oe0QoF1COLbOdyKrjcQa2ddqlRwYH-UyPXI4RWhR'
Config.AntiSpawnWeapon = true
Config.BorrarPed = false
Config.logconsoleAdminF = true
Config.ActivaridenAdminF = false --Para ver los identificadores de quien pone mal la contraseña de menu de admin,desactivado por defecto por que se manda 3 veces seguidas el log.(se puede activar))
Config.clavemenu = "bacalao"
Config.openkey = 121 --USA https://docs.fivem.net/docs/game-references/controls/ para asignar una tecla especifica para abrir el menu de admin
Config.opentecla = '~r~INSERT'
Config.EnableESXIdentity = false
Config.Servername = 'Agrio RP' --NOMBRE DE TU SERVIDOR 
Config.AntiPedAttack = false  -- Anti ped con armas
Config.threadDelay = 2000
Config.TokenLength	= 60
Config.pedThreshold = 20 --NUMERO MAXIMO DE PEDS QUE PUEDEN SPAWNEAR DE GOLPE PARA QUE SE EMPIEZEN A BORRAR
Config.permission        = 'admin'
Config.adminRanks = { 'superadmin', 'admin', 'mod' }
Config.reportCooldown = 180
Config.discordwebhook = 'https://discord.com/api/webhooks/787235634770477097/ehCAx0VE0JE0W5XzVoPRDxbdotvgoMgwPbQLblDJduJdoZMA8ekXrePYYysDK7myDOg7'
Config.Discord				= 'https://discord.gg/5R8MHN' --AQUI PONEIS VUESTRO DISCORD
Config.EnableDiscordLink = true
Config.webhookban        = 'https://discord.com/api/webhooks/787235634770477097/ehCAx0VE0JE0W5XzVoPRDxbdotvgoMgwPbQLblDJduJdoZMA8ekXrePYYysDK7myDOg7' --WEBHOOK DE DISCORD
Config.webhookunban      = 'https://discord.com/api/webhooks/787235634770477097/ehCAx0VE0JE0W5XzVoPRDxbdotvgoMgwPbQLblDJduJdoZMA8ekXrePYYysDK7myDOg7'
Config.green             = 56108
Config.grey              = 8421504
Config.red               = 16711680
Config.orange            = 16744192
Config.blue              = 2061822
Config.purple            = 11750815



Config.SeeOwnLabel = true
Config.SeeDistance = 100
Config.TextSize = 0.8
Config.ZOffset = 1.2
Config.NearCheckWait = 500
Config.TagByPermission = false --Using xPlayer.getPermissions() which is deprecated method for old ESX
Config.GroupLabels = {
    _dev = "~y~[SNOWII]🐶",
    mod = "~g~[MODERADOR]⏰",
    admin = "~b~[ADMINISTRADOR]🧭",
    superadmin = "~r~[SUPERADMIN]⭐",
}

Config.PermissionLabels = {
    [1] = "HELPER",
    [2] = "~g~MODERATOR",
    [3] = "~b~ADMINISTRATOR",
    [4] = "~r~GOD",
    [5] = "~r~GOD",
}
Config.ResourceStop = false --DETECTA SI UN JUGADOR INTENTA PARAR UN RECURSO(RECOMENDABLE DESACTIVARLO SI REINICIAS/INICIAS/PARAS RECURSOS DEL SERVIDOR CUANDO ESTA ENCENDIDO Y CON GENTE JUGANDO)
--##________  _________ ___________ _____ ___   _   _ _____ _____ 
--##|_   _|  \/  || ___ \  _  | ___ \_   _/ _ \ | \ | |_   _|  ___|
--##  | | | .  . || |_/ / | | | |_/ / | |/ /_\ \|  \| | | | | |__  
--##  | | | |\/| ||  __/| | | |    /  | ||  _  || . ` | | | |  __| 
--## _| |_| |  | || |   \ \_/ / |\ \  | || | | || |\  | | | | |___ 
--## \___/\_|  |_/\_|    \___/\_| \_| \_/\_| |_/\_| \_/ \_/ \____/                                                               
Config.ResourceStart = false -- DETECTA CUANDO UN JUGADOR INICIA UN RECURSO(MANDA LOGS A TU WEBHOOK CUANDO SE INICIAN RECURSOS)

Config.IPWL = {
	"185.223.99.193",
	"85.56.106.67",
	"185.223.99.193",
	"193.27.12.100",
	"178.156.98.82",
	--"190.2.133.224",
}
Config.PEDBLACK = {
	"MP_S_ARMOURED_01",
	"S_F_Y_Cop_01",
	"S_F_Y_Cop_02",
	"S_F_Y_Cop_03",
	"a_c_sharktiger",
	"S_M_Y_Cop_01",
	"a_m_m_hasjew_01",
	"ig_orleans",
	"S_M_Y_Cop_02",
	"S_M_Y_Cop_03",
	"A_C_MtLion",
	"S_F_Y_Sheriff_01",
	"S_F_Y_Sheriff_02",
	"S_F_Y_Sheriff_03",
	"S_M_Y_Marine_01",
	"S_M_Y_Marine_02",
	"S_M_Y_Marine_03",
	"S_M_SECURITY_01",
	"S_M_SECURITY_02",
	"s_m_y_swat_01",
	"a_m_y_mexthug_01",
	"u_m_y_zombie_01",
	"S_M_SECURITY_03",
	"s_m_y_swat_01",
	"S_M_Y_ARMYMECH_01",
	"S_M_Y_ARMYMECH_02",
	"S_M_Y_ARMYMECH_03",
	"S_M_Y_BLACKOPS_01",
	"S_M_Y_BLACKOPS_02",
	"S_M_Y_BLACKOPS_03"
}

-- Lista negra de armas 
Config.BlacklistedWeapons = {
    --'WEAPON_KNIFE',
	---'WEAPON_HAMMER',
	--'WEAPON_GOLFCLUB',
	--'WEAPON_CROWBAR',
	--'WEAPON_BOTTLE',
	'WEAPON_PROXMINE',
	--'WEAPON_MOLOTOV',
	'WEAPON_FIREEXTINGUISHER', 
	--'WEAPON_SNOWBALL',
	'WEAPON_FLARE',
	'WEAPON_BALL',
	'WEAPON_POOLCUE',
	--'WEAPON_PIPEWRENCH',
	'WEAPON_PISTOL_MK2',
	--'WEAPON_COMBATPISTOL',
	--'WEAPON_SNSPISTOL',
	--'WEAPON_VINTAGEPISTOL',
	'WEAPON_FLAREGUN',
	--'WEAPON_MARKSMANPISTOL',
	--'WEAPON_MINISMG',
	--'WEAPON_SMG_MK2',
	'WEAPON_COMBATMG_MK2',
--	'WEAPON_GUSENBERG',
	'WEAPON_ASSAULTRIFLE_MK2',
	'WEAPON_CARBINERIFLE_MK2',
	'WEAPON_COMPACTRIFLE',
	'WEAPON_SWEEPERSHOTGUN',
	--'WEAPON_SAWNOFFSHOTGUN',
	---'WEAPON_DBSHOTGUN',
	'WEAPON_HEAVYSNIPER_MK2',
	'WEAPON_MARKSMANRIFLE',
	'WEAPON_GRENADELAUNCHER',
	'WEAPON_GRENADELAUNCHER_SMOKE',
	'WEAPON_RPG',
	'WEAPON_MINIGUN',
	'WEAPON_FIREWORK',
	'WEAPON_RAILGUN',
	'WEAPON_HOMINGLAUNCHER',
	'WEAPON_GRENADE',
	'WEAPON_STICKYBOMB',
	'WEAPON_COMPACTLAUNCHER',
--	'WEAPON_SNSPISTOL_MK2',
	'WEAPON_REVOLVER_MK2',
	'WEAPON_SPECIALCARBINE_MK2',
	'WEAPON_BULLPUPRIFLE_MK2',
	'WEAPON_PUMPSHOTGUN_MK2',
	'WEAPON_MARKSMANRIFLE_MK2',
	'WEAPON_RAYPISTOL',
	'WEAPON_RAYCARBINE',
	'WEAPON_RAYMINIGUN',
	--'WEAPON_DIGISCANNER'
}


Config.WhitelistedProps = {

}
-- Lista negra de vehiculos
Config.BlacklistedVehicles = {
	'RHINO',
	'SAVAGE',
	'HUNTER',
	'BUZZARD',
	'BUZZARD2',
--	'ANNIHILATOR',
	'HYDRA',
	'APC',
	'Trailersmall2',
	--'avenger',
	'stromberg',
	'nightshark',
	'besra',
	'babushka ',
--	'starling',
	'insurgent',
	'cargobob',
	--'cargobob2',
	'cargobob3',
	'cargobob4',
   -- 'viseris',
   -- 'halftrack',
   -- 'nokota',
   -- 'strikeforce',
    --'bombushka',
    'molotok',
    'limo2',
    'technical',
    'technical2',
    'technical3',
    'insurgent3',
	'boxville5',
--	'bruiser',
  --  'bruiser2',
  --  'bruiser3',
    'brutus',
    'brutus2',
    'brutus3',
    'cerberus',
    'cerberus2',
    'cerberus3',
    'dominator4',
    'dominator5',
    'dominator6',
    'impaler2',
    'impaler3',
    'impaler4',
    'imperator',
    'imperator2',
    'imperator3',
   -- 'monster3',
    --'monster4',
    --'monster5',
    'scarab',
    'scarab2',
    'scarab3',
    'slamvan4',
    'slamvan5',
    'slamvan6',
    'zr380',
    'zr3802',
    'zr3803',
	--'alphaz1',
	--'avenger2',
	'blimp',
	'blimp2',
	'blimp3',
	'cargoplane',
	'cuban800',
	--'howard',
	'jet',
	'luxor',
	--'luxor2',
	--'mammatus',
	--'microlight',
	'miljet',
	--'seabreeze',
	'shamal',
	--'stunt',
	'titan',
	--'tula',
	--'velum',
	'monster',
	'velum2',
	--'vestra'
}
