Config = {}
Config.ShowUnlockedText = false
Config.CheckVersion = false
Config.CheckVersionDelay = 60 -- Minutes
Config.KeybingText = 'Interact with a door lock'

Config.DoorList = {}

-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	doors = {
		{objHash = 220394186, objHeading = 185.99998474121, objCoords = vector3(-140.6973, -626.2083, 168.9756)},
		{objHash = 220394186, objHeading = 5.9999690055847, objCoords = vector3(-139.0563, -626.0358, 168.9756)}
 },
	maxDistance = 2.5,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['seguridad']=0, ['offseguridad']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	authorizedJobs = { ['taxi']=0, ['offtaxi']=0 },
	lockpick = false,
	locked = true,
	audioRemote = false,
	doors = {
		{objHash = -2023754432, objHeading = 238.01802062988, objCoords = vector3(895.1225, -178.2061, 74.85624)},
		{objHash = -2023754432, objHeading = 58.631664276123, objCoords = vector3(893.7596, -180.4167, 74.85624)}
 },
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	authorizedJobs = { ['taxi']=0, ['offtaxi']=0 },
	lockpick = false,
	locked = true,
	audioRemote = false,
	doors = {
		{objHash = 1519319655, objHeading = 238.3483581543, objCoords = vector3(906.6433, -161.5644, 74.54778)},
		{objHash = 1519319655, objHeading = 58.205558776855, objCoords = vector3(908.1147, -159.1847, 74.54778)}
 },
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = 6.0,
	objCoords = vector3(900.0851, -147.8304, 77.32047),
	objHash = 2064385778,
	lockpick = false,
	locked = true,
	audioRemote = false,
	garage = true,
	objHeading = 147.9923248291,
	fixText = false,
	maxDistance = 3.0,
	authorizedJobs = { ['taxi']=0, ['offtaxi']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	objCoords = vector3(895.2413, -144.8651, 77.04504),
	objHash = -2023754432,
	lockpick = false,
	locked = true,
	audioRemote = false,
	garage = false,
	objHeading = 328.84948730469,
	fixText = false,
	maxDistance = 1.5,
	authorizedJobs = { ['taxi']=0, ['offtaxi']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	maxDistance = 2.0,
	objHash = 884781370,
	objCoords = vector3(-584.7819, -931.7788, 24.0293),
	lockpick = false,
	fixText = false,
	locked = true,
	audioRemote = false,
	garage = false,
	objHeading = 0.0,
	authorizedJobs = { ['telefe']=0, ['offtelefe']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	maxDistance = 2.0,
	objHash = 884781370,
	objCoords = vector3(-582.5726, -926.0486, 24.0293),
	lockpick = false,
	fixText = false,
	locked = true,
	audioRemote = false,
	garage = false,
	objHeading = 270.00003051758,
	authorizedJobs = { ['telefe']=0, ['offtelefe']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	locked = true,
	authorizedJobs = { ['judicial']=0, ['offjudicial']=0 },
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,
	doors = {
		{objHash = -739665083, objHeading = 179.99998474121, objCoords = vector3(251.9079, -1093.266, 29.42789)},
		{objHash = -739665083, objHeading = 1.0017911336035e-05, objCoords = vector3(249.3059, -1093.26, 29.42789)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	locked = true,
	authorizedJobs = { ['judicial']=2, ['offjudicial']=2 },
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,
	doors = {
		{objHash = -739665083, objHeading = 179.99998474121, objCoords = vector3(251.9079, -1093.266, 36.26669)},
		{objHash = -739665083, objHeading = 1.0017911336035e-05, objCoords = vector3(249.3059, -1093.26, 36.26669)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['judicial']=0, ['offjudicial']=0 },
	lockpick = false,
	doors = {
		{objHash = -739665083, objHeading = 1.0017911336035e-05, objCoords = vector3(234.9886, -1093.26, 36.26731)},
		{objHash = -739665083, objHeading = 179.99998474121, objCoords = vector3(237.5845, -1093.266, 36.26731)}
 },
	maxDistance = 2.5,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['judicial']=0, ['offjudicial']=0 },
	lockpick = false,
	doors = {
		{objHash = -739665083, objHeading = 1.0017911336035e-05, objCoords = vector3(234.9886, -1093.26, 29.42783)},
		{objHash = -739665083, objHeading = 179.99998474121, objCoords = vector3(237.5845, -1093.266, 29.42783)}
 },
	maxDistance = 2.5,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

--[[
--MANSION PESQUERO MONTAÑA
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	doors = {
		{objHash = -1249591818, objHeading = 60.65, objCoords = vector3(-2556.658, 1915.716, 169.0709)},
		{objHash = 546378757, objHeading = 62.63, objCoords = vector3(-2559.193, 1910.86, 169.0709)}
 },
	maxDistance = 8.5,
	audioRemote = false,
	slides = false,
	mafia = 'mafia2',	
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})
]]--

table.insert(Config.DoorList, {
	lockpick = false,
	authorizedJobs = { ['seguridad']=0 },
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	slides = false,
	doors = {
		{objHash = -1821777087, objHeading = 117.5, objCoords = vector3(-1048.285, -236.8171, 44.171)},
		{objHash = -1821777087, objHeading = 297.50003051758, objCoords = vector3(-1047.084, -239.1246, 44.171)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

--MALIBU MANSION

--[[
table.insert(Config.DoorList, {
	objHeading = 122.50592803955,
	mafia = 'banda8',
	locked = true,
	slides = true,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1286535678,
	fixText = false,
	objCoords = vector3(-3137.585, 798.9524, 16.35332),
	maxDistance = 10.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	locked = true,
	mafia = 'banda8',
	lockpick = false,
	maxDistance = 2.5,
	slides = false,
	doors = {
		{objHash = -222270721, objHeading = 32.513065338135, objCoords = vector3(-3199.076, 763.3195, 9.081808)},
		{objHash = -222270721, objHeading = 212.28471374512, objCoords = vector3(-3197.211, 764.5151, 9.081808)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	locked = true,
	mafia = 'banda8',
	lockpick = false,
	maxDistance = 2.5,
	slides = false,
	doors = {
		{objHash = -222270721, objHeading = 32.504173278809, objCoords = vector3(-3221.664, 837.3599, 9.08498)},
		{objHash = -222270721, objHeading = 212.41435241699, objCoords = vector3(-3219.797, 838.5515, 9.08498)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})
]]--
-- termino malibu

-- 
table.insert(Config.DoorList, {
	objHash = 725274945,
	objCoords = vector3(963.0151, -141.7224, 73.47428),
	garage = false,
	lockpick = false,
	locked = true,
	objHeading = 328.0,
	mafia = 'banda12',
	slides = true,
	fixText = false,
	audioRemote = false,
	maxDistance = 10.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	mafia = 'banda5',
	slides = true,
	garage = false,
	objHash = 725274945,
	lockpick = false,
	objHeading = 68.0,
	audioRemote = false,
	maxDistance = 10.0,
	objCoords = vector3(2393.348, 2527.497, 45.67577),
	fixText = false,
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mansion brofx_3
table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	slides = false,
	mafia = 'banda13',
	maxDistance = 8.5,
	doors = {
		{objHash = 546378757, objHeading = 180.3116220, objCoords = vector3(-102.194, 849.0049, 235.828)},
		{objHash = -1249591818, objHeading = 180.3116220, objCoords = vector3(-107.1934, 851.2832, 235.828)}
 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	locked = true,
	garage = false,
	lockpick = false,
	maxDistance = 2.0,
	--authorizedJobs = { ['flia4']=0 },
	mafia = 'banda13',
	audioRemote = false,
	fixText = false,
	objHeading = 99.198059082031,
	objHash = 110411286,
	objCoords = vector3(-85.0163, 834.1377, 236.0421),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})
-- termino brofx_3
-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	fixText = false,
	objCoords = vector3(127.9552, -1298.503, 29.41962),
	slides = false,
	garage = false,
	audioRemote = false,
	objHeading = 29.999988555908,
	authorizedJobs = { ['vanilla']=0 },
	objHash = -1116041313,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	fixText = false,
	objCoords = vector3(113.9822, -1297.43, 29.41868),
	slides = false,
	garage = false,
	audioRemote = false,
	objHeading = 300.0,
	authorizedJobs = { ['vanilla']=0 },
	objHash = -495720969,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	fixText = false,
	objCoords = vector3(99.08321, -1293.701, 29.41868),
	slides = false,
	garage = false,
	audioRemote = false,
	objHeading = 29.999988555908,
	authorizedJobs = { ['vanilla']=0 },
	objHash = -626684119,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	fixText = false,
	objCoords = vector3(96.09197, -1284.854, 29.43878),
	slides = false,
	garage = false,
	audioRemote = false,
	objHeading = 210.0,
	authorizedJobs = { ['vanilla']=0 },
	objHash = 668467214,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Ingreso
table.insert(Config.DoorList, {
	doors = {
		{objHash = -1119680854, objHeading = 33.4186668396, objCoords = vector3(-1389.234, -587.9568, 30.51987)},
		{objHash = -1119680854, objHeading = 212.48086547852, objCoords = vector3(-1387.07, -586.5471, 30.51987)}
 },
	audioRemote = false,
	locked = true,
	maxDistance = 2.5,
	slides = false,
	lockpick = false,
	steam = 'steam:11000014e866f7f',
	authorizedJobs = { ['bahamas']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Ingreso
table.insert(Config.DoorList, {
	audioRemote = false,
	locked = true,
	maxDistance = 2.0,
	garage = false,
	objHash = 401003935,
	steam = 'steam:11000014e866f7f',
	authorizedJobs = { ['bahamas']=0 },
	fixText = false,
	objHeading = 256.30111694336,
	objCoords = vector3(-1371.195, -607.1619, 30.86444),
	lockpick = false,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Ingreso
table.insert(Config.DoorList, {
	audioRemote = false,
	locked = true,
	maxDistance = 6.0,
	garage = true,
	objHash = -822900180,
	steam = 'steam:11000014e866f7f',
	authorizedJobs = { ['bahamas']=0 },
	fixText = false,
	objHeading = 302.79895019531,
	objCoords = vector3(-1394.165, -635.7523, 29.57242),
	lockpick = false,
	slides = 6.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Ingreso
table.insert(Config.DoorList, {
	audioRemote = false,
	locked = true,
	maxDistance = 2.0,
	garage = false,
	objHash = -2003105485,
	steam = 'steam:11000014e866f7f',
	authorizedJobs = { ['bahamas']=0 },
	fixText = false,
	objHeading = 122.99993896484,
	objCoords = vector3(-1391.636, -640.3448, 28.87561),
	lockpick = false,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHash = -1989765534,
	locked = true,
	authorizedJobs = { ['galaxy']=0 },
	objCoords = vector3(355.6923, 301.0186, 104.2022),
	audioRemote = false,
	garage = false,
	slides = false,
	lockpick = false,
	objHeading = 165.6577911377,
	maxDistance = 2.0,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['galaxy']=0 },
	maxDistance = 2.0,
	locked = true,
	objCoords = vector3(377.781, 267.7672, 95.13993),
	audioRemote = false,
	fixText = false,
	lockpick = false,
	slides = false,
	objHash = -1555108147,
	garage = false,
	objHeading = 74.592529296875,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['galaxy']=0 },
	maxDistance = 2.0,
	locked = true,
	objCoords = vector3(380.1554, 266.635, 91.35513),
	audioRemote = false,
	fixText = false,
	lockpick = false,
	slides = false,
	objHash = 1695461688,
	garage = false,
	objHeading = 344.59246826172,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['galaxy']=0 },
	maxDistance = 2.0,
	locked = true,
	objCoords = vector3(354.45, 273.7086, 94.35609),
	audioRemote = false,
	fixText = false,
	lockpick = false,
	slides = false,
	objHash = 1695461688,
	garage = false,
	objHeading = 74.592529296875,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHash = -1765048490,
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['gendarme']=0, ['offgendarme']=0 },
	locked = true,
	maxDistance = 2.0,
	lockpick = false,
	garage = false,
	objHeading = 29.999988555908,
	objCoords = vector3(1855.685, 3683.93, 34.59282),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	audioRemote = false,
	locked = true,
	slides = true,
	objHash = -1603817716,
	fixText = false,
	garage = false,
	objHeading = 90.499992370605,
	authorizedJobs = { ['mechanic3']=0,  ['offmechanic3']=0 },
	objCoords = vector3(-244.0589, -1302.753, 30.30171),
	maxDistance = 10.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHash = 161378502,
	objHeading = 0.0,
	audioRemote = false,
	maxDistance = 6.0,
	lockpick = false,
	fixText = false,
	garage = false,
	objCoords = vector3(-205.2324, -1328.007, 29.84439),
	locked = true,
	slides = true,
	authorizedJobs = { ['mechanic3']=0, ['offmechanic3']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHash = 161378502,
	objHeading = 0.0,
	audioRemote = false,
	maxDistance = 6.0,
	lockpick = false,
	fixText = false,
	garage = false,
	objCoords = vector3(-205.2324, -1328.007, 29.84439),
	locked = true,
	slides = true,
	authorizedJobs = { ['mechanic3']=0, ['offmechanic3']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHash = -1320876379,
	objHeading = 270.00003051758,
	audioRemote = false,
	maxDistance = 2.0,
	lockpick = false,
	fixText = false,
	garage = false,
	objCoords = vector3(-202.8535, -1335.839, 34.9894),
	locked = true,
	slides = false,
	authorizedJobs = { ['mechanic3']=0, ['offmechanic3']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 340.36096191406,
	locked = true,
	maxDistance = 2.0,
	slides = false,
	objCoords = vector3(230.9451, -437.1604, 48.05954),
	authorizedJobs = { ['judicial']=0, ['offjudicial']=0 },
	audioRemote = false,
	garage = false,
	lockpick = false,
	objHash = 110411286,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	authorizedJobs = { ['judicial']=0, ['offjudicial']=0 },
	locked = true,
	doors = {
		{objHash = 110411286, objHeading = 340.36096191406, objCoords = vector3(231.7556, -418.3281, 48.05875)},
		{objHash = 110411286, objHeading = 160.36096191406, objCoords = vector3(234.2069, -419.2029, 48.05875)}
 },
	maxDistance = 2.5,
	lockpick = false,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objCoords = vector3(1844.186, 3687.988, 30.61173),
	lockpick = false,
	objHeading = 209.7043762207,
	slides = false,
	audioRemote = false,
	fixText = false,
	authorizedJobs = { ['gendarme']=0, ['offgendarme']=0 },
	maxDistance = 2.0,
	objHash = 631614199,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

--[[
table.insert(Config.DoorList, {
	doors = {
		{objHash = -1747016523, objHeading = 299.99996948242, objCoords = vector3(5002.537, -4926.006, 9.454555)},
		{objHash = -23367131, objHeading = 299.99996948242, objCoords = vector3(5005.271, -4930.745, 9.451701)}
 },
	maxDistance = 2.5,
	locked = true,
	lockpick = false,
	slides = false,
	authorizedJobs = { ['perico']=0, ['offperico']=0 },
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	doors = {
		{objHash = -23367131, objHeading = 0.0, objCoords = vector3(4964.22, -4830.154, 5.741167)},
		{objHash = -1747016523, objHeading = 0.0, objCoords = vector3(4958.748, -4830.153, 5.74402)}
 },
	maxDistance = 2.5,
	locked = true,
	lockpick = false,
	slides = false,
	authorizedJobs = { ['perico']=0, ['offperico']=0 },
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})
]]--

-- 
table.insert(Config.DoorList, {
	objHeading = 70.000030517578,
	locked = true,
	maxDistance = 2.0,
	objHash = -2051651622,
	objCoords = vector3(-33.80989, -1107.579, 26.57225),
	audioRemote = false,
	authorizedJobs = { ['cardealer']=0 },
	lockpick = false,
	fixText = false,
	slides = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 70.000030517578,
	locked = true,
	maxDistance = 2.0,
	objHash = -2051651622,
	objCoords = vector3(-31.72353, -1101.847, 26.57225),
	audioRemote = false,
	authorizedJobs = { ['cardealer']=0 },
	lockpick = false,
	fixText = false,
	slides = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	authorizedJobs = { ['police2']=0, ['offpolice2']=0 },
	lockpick = false,
	slides = false,
	locked = true,
	maxDistance = 2.5,
	doors = {
		{objHash = -1501157055, objHeading = 315.00006103516, objCoords = vector3(-442.66, 6015.222, 31.86633)},
		{objHash = -1501157055, objHeading = 135.00006103516, objCoords = vector3(-444.4985, 6017.06, 31.86633)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 315.33602905273,
	authorizedJobs = { ['police2']=0, ['offpolice2']=0 },
	lockpick = false,
	objHash = 452874391,
	locked = true,
	garage = false,
	objCoords = vector3(-450.9787, 6006.075, 31.99417),
	fixText = false,
	audioRemote = false,
	maxDistance = 2.0,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 134.83694458008,
	authorizedJobs = { ['police2']=0, ['offpolice2']=0 },
	lockpick = false,
	objHash = 452874391,
	locked = true,
	garage = false,
	objCoords = vector3(-447.2263, 6002.329, 31.83943),
	fixText = false,
	audioRemote = false,
	maxDistance = 2.0,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	garage = false,
	objCoords = vector3(-428.0646, 5996.672, 31.87312),
	authorizedJobs = { ['police2']=0, ['offpolice2']=0 },
	lockpick = false,
	audioRemote = false,
	objHash = 631614199,
	fixText = false,
	objHeading = 315.51544189453,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	garage = false,
	objCoords = vector3(-431.1921, 5999.742, 31.87312),
	authorizedJobs = { ['police2']=0, ['offpolice2']=0 },
	lockpick = false,
	audioRemote = false,
	objHash = 631614199,
	fixText = false,
	objHeading = 315.51544189453,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	audioRemote = false,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = -435821409, objHeading = 109.98393249512, objCoords = vector3(-96.74586, 989.6261, 235.8943)},
		{objHash = -435821409, objHeading = 289.98397827148, objCoords = vector3(-98.78287, 988.8587, 235.8943)}
 },
	maxDistance = 2.5,
	--authorizedJobs = { ['flia13']=0 },	
	mafia = 'flia13',
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	audioRemote = false,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = -435821409, objHeading = 199.98397827148, objCoords = vector3(-103.0371, 1012.285, 235.8778)},
		{objHash = -435821409, objHeading = 19.984001159668, objCoords = vector3(-102.27, 1010.245, 235.8778)}
 },
	maxDistance = 2.5,
	mafia = 'flia13',
	--authorizedJobs = { ['flia13']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	audioRemote = false,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = -435821409, objHeading = 109.98398590088, objCoords = vector3(-110.1531, 999.5685, 235.8778)},
		{objHash = -435821409, objHeading = 289.98400878906, objCoords = vector3(-112.1911, 998.7998, 235.8778)}
 },
	maxDistance = 2.5,
	mafia = 'flia13',
	--authorizedJobs = { ['flia13']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	audioRemote = false,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = -2146494197, objHeading = 19.983999252319, objCoords = vector3(-112.3048, 985.4119, 236.3505)},
		{objHash = -2146494197, objHeading = 199.98399353027, objCoords = vector3(-112.7981, 986.7715, 236.3505)}
 },
	maxDistance = 2.5,
	mafia = 'flia13',
	--authorizedJobs = { ['flia13']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	audioRemote = false,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = -435821409, objHeading = 289.98397827148, objCoords = vector3(-105.7796, 976.3494, 235.8943)},
		{objHash = -435821409, objHeading = 109.9839553833, objCoords = vector3(-103.7409, 977.12, 235.8943)}
 },
	maxDistance = 2.5,
	mafia = 'flia13',
	--authorizedJobs = { ['flia13']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	audioRemote = false,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = -435821409, objHeading = 229.98399353027, objCoords = vector3(-68.35663, 988.3166, 234.5232)},
		{objHash = -435821409, objHeading = 49.983966827393, objCoords = vector3(-66.67601, 986.9324, 234.5232)}
 },
	maxDistance = 2.5,
	mafia = 'flia13',
	--authorizedJobs = { ['flia13']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	audioRemote = false,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = -2146494197, objHeading = 49.983966827393, objCoords = vector3(-61.68702, 998.0019, 234.9928)},
		{objHash = -2146494197, objHeading = 229.98397827148, objCoords = vector3(-62.79199, 998.9296, 234.9928)}
 },
	maxDistance = 2.5,
	mafia = 'flia13',
	--authorizedJobs = { ['flia13']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	audioRemote = false,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = -435821409, objHeading = 49.983966827393, objCoords = vector3(-69.96351, 1008.098, 234.5199)},
		{objHash = -435821409, objHeading = 229.9839630127, objCoords = vector3(-71.65341, 1009.482, 234.5199)}
 },
	maxDistance = 2.5,
	mafia = 'flia13',
	--authorizedJobs = { ['flia13']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = true,
	locked = true,
	objHash = 1286535678,
	fixText = false,
	garage = false,
	authorizedJobs = { ['transito']=0, ['offtransito']=0 },
	lockpick = false,
	maxDistance = 6.0,
	audioRemote = false,
	objHeading = 140.00001525879,
	objCoords = vector3(397.8851, -1607.386, 28.34166),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = true,
	locked = true,
	objHash = 1286535678,
	fixText = false,
	garage = false,
	authorizedJobs = { ['transito']=0, ['offtransito']=0 },
	lockpick = false,
	maxDistance = 6.0,
	audioRemote = false,
	objHeading = 140.00001525879,
	objCoords = vector3(397.8851, -1607.386, 28.34166),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	locked = true,
	objHash = -1156020871,
	fixText = false,
	garage = false,
	authorizedJobs = { ['transito']=0, ['offtransito']=0 },
	lockpick = false,
	maxDistance = 2.0,
	audioRemote = false,
	objHeading = 49.99995803833,
	objCoords = vector3(391.8602, -1636.07, 29.97438),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	garage = false,
	audioRemote = false,
	locked = true,
	mafia = 'flia13',
	objHash = 1286535678,
	lockpick = false,
	fixText = false,
	slides = true,
	objHeading = 200.65000915527,
	maxDistance = 6.0,
	objCoords = vector3(175.5773, 1676.798, 229.0479),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	garage = true,
	audioRemote = false,
	locked = true,
	mafia = 'flia13',
	objHash = 2052512905,
	lockpick = false,
	fixText = false,
	slides = 6.0,
	objHeading = 0.00079098995774984,
	maxDistance = 6.0,
	objCoords = vector3(169.4399, 1695.128, 227.7045),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	garage = false,
	audioRemote = false,
	locked = true,
	mafia = 'flia13',
	objHash = 1901183774,
	lockpick = false,
	fixText = false,
	slides = false,
	objHeading = 180.00001525879,
	maxDistance = 2.0,
	objCoords = vector3(176.985, 1701.16, 227.5),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	--authorizedJobs = { ['leitop']=0 },
	mafia = "banda10",
	slides = 6.0,
	garage = true,
	locked = true,
	maxDistance = 8.0,
	objHeading = 135.0,
	objHash = 1991494706,
	objCoords = vector3(2948.402, 4659.474, 48.87787),
	audioRemote = false,
	fixText = false,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	slides = false,
	maxDistance = 2.5,
	doors = {
		{objHash = -1700911976, objHeading = 320.0, objCoords = vector3(-814.7822, -1224.137, 7.487189)},
		{objHash = -434783486, objHeading = 320.0, objCoords = vector3(-816.7538, -1222.482, 7.487189)}
 },
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	slides = false,
	maxDistance = 2.5,
	doors = {
		{objHash = -1700911976, objHeading = 320.0, objCoords = vector3(-797.3099, -1238.798, 7.487189)},
		{objHash = -434783486, objHeading = 320.0, objCoords = vector3(-799.2818, -1237.143, 7.487189)}
 },
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 139.99998474121,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },
	garage = false,
	lockpick = false,
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-816.3891, -1239.989, 7.487189),
	objHash = 854291622,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 229.9826965332,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },
	garage = false,
	lockpick = false,
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-811.5206, -1239.321, 7.487189),
	objHash = 854291622,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	slides = false,
	maxDistance = 2.5,
	doors = {
		{objHash = -1700911976, objHeading = 320.0, objCoords = vector3(-802.686, -1217.808, 7.487189)},
		{objHash = -434783486, objHeading = 320.0, objCoords = vector3(-804.658, -1216.154, 7.487189)}
 },
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	slides = false,
	maxDistance = 2.5,
	doors = {
		{objHash = -1700911976, objHeading = 320.0, objCoords = vector3(-797.9274, -1221.802, 7.487189)},
		{objHash = -434783486, objHeading = 320.0, objCoords = vector3(-799.8994, -1220.147, 7.487189)}
 },
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	slides = false,
	maxDistance = 2.5,
	doors = {
		{objHash = -1700911976, objHeading = 320.0, objCoords = vector3(-793.5293, -1225.492, 7.487189)},
		{objHash = -434783486, objHeading = 320.0, objCoords = vector3(-795.5013, -1223.837, 7.487189)}
 },
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	slides = false,
	maxDistance = 2.5,
	doors = {
		{objHash = -1700911976, objHeading = 139.99998474121, objCoords = vector3(-803.2387, -1224.126, 7.487189)},
		{objHash = -434783486, objHeading = 139.99998474121, objCoords = vector3(-801.2667, -1225.781, 7.487189)}
 },
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 320.0,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },
	garage = false,
	lockpick = false,
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-784.5406, -1239.824, 7.487189),
	objHash = 854291622,		
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 320.0,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },
	garage = false,
	lockpick = false,
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-776.3165, -1239.943, 7.487189),
	objHash = 854291622,		
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 320.0,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },
	garage = false,
	lockpick = false,
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-781.2013, -1235.844, 7.487189),
	objHash = 854291622,		
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 320.0,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },
	garage = false,
	lockpick = false,
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-784.9667, -1232.685, 7.487189),
	objHash = 854291622,		
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 320.0,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['ambulance']=6, ['offambulance']=6 },
	garage = false,
	lockpick = false,
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-788.5598, -1244.614, 7.487189),
	objHash = 854291622,		
})

-- Tequila
table.insert(Config.DoorList, {
	objCoords = vector3(-565.1712, 276.6259, 83.28626),
	authorizedJobs = { ['tequila']=0 },
	slides = false,
	audioRemote = false,
	objHash = 993120320,
	garage = false,
	locked = true,
	fixText = false,
	objHeading = 355.00003051758,
	maxDistance = 2.0,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Tequila
table.insert(Config.DoorList, {
	objCoords = vector3(-561.2866, 293.5044, 87.77851),
	authorizedJobs = { ['tequila']=0 },
	slides = false,
	audioRemote = false,
	objHash = 993120320,
	garage = false,
	locked = true,
	fixText = false,
	objHeading = 175.00003051758,
	maxDistance = 2.0,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	authorizedJobs = { ['rockford']=3 },
	steam = 'steam:110000106e6d6fc',
	maxDistance = 2.5,
	lockpick = false,
	doors = {
		{objHash = -513161094, objHeading = 355.00140380859, objCoords = vector3(-214.19, -369.8767, 57.80485)},
		{objHash = -513161094, objHeading = 174.99998474121, objCoords = vector3(-216.2212, -369.7051, 57.80405)}
 },
	locked = true,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	lockpick = false,
	garage = false,
	objHeading = 265.0,
	authorizedJobs = { ['rockford']=0 },
	steam = 'steam:110000106e6d6fc',
	slides = false,
	audioRemote = false,
	objCoords = vector3(-210.0421, -364.5209, 58.95134),
	fixText = false,
	locked = true,
	objHash = 736699661,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	lockpick = false,
	garage = false,
	objHeading = 336.00006103516,
	authorizedJobs = { ['rockford']=0 },
	steam = 'steam:110000106e6d6fc',
	slides = false,
	audioRemote = false,
	objCoords = vector3(-190.1672, -346.701, 58.96188),
	fixText = false,
	locked = true,
	objHash = -1989765534,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	authorizedJobs = { ['rockford']=3 },
	steam = 'steam:110000106e6d6fc',
	maxDistance = 2.5,
	lockpick = false,
	doors = {
		{objHash = -513161094, objHeading = 335.0007019043, objCoords = vector3(-185.0549, -337.8533, 57.80722)},
		{objHash = -513161094, objHeading = 154.99998474121, objCoords = vector3(-186.9003, -337.0003, 57.80373)}
 },
	locked = true,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	lockpick = false,
	garage = false,
	objHeading = 65.0,
	authorizedJobs = { ['rockford']=0 },
	steam = 'steam:110000106e6d6fc',
	slides = false,
	audioRemote = false,
	objCoords = vector3(-185.3025, -344.4835, 58.96827),
	fixText = false,
	locked = true,
	objHash = -1989765534,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	authorizedJobs = { ['rockford']=0 },
	steam = 'steam:110000106e6d6fc',
	maxDistance = 2.5,
	lockpick = false,
	doors = {
		{objHash = 942404643, objHeading = 69.999992370605, objCoords = vector3(-173.49, -310.562, 55.1996)},
		{objHash = 942404643, objHeading = 250.00003051758, objCoords = vector3(-174.4733, -313.2596, 55.20012)}
 },
	locked = true,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	lockpick = false,
	garage = false,
	objHeading = 339.00009155273,
	authorizedJobs = { ['rockford']=0 },
	steam = 'steam:110000106e6d6fc',
	slides = false,
	audioRemote = false,
	objCoords = vector3(-183.659, -313.4135, 55.3124),
	fixText = false,
	locked = true,
	objHash = -1989765534,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(-308.6505, -716.1362, 28.339),
	garage = true,
	--authorizedJobs = { ['chambersz']=0 },
	steam = 'steam:110000106e6d6fc',
	mafia = 'banda8',
	fixText = false,
	lockpick = false,
	objHeading = 160.0,
	locked = true,
	slides = 6.0,
	maxDistance = 6.0,
	objHash = 1879668795,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 0.0,
	garage = true,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 6.0,
	objHash = -1195127879,
	lockpick = false,
	objCoords = vector3(433.8151, -999.9205, 26.11558),
	slides = 6.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 0.0,
	garage = true,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 6.0,
	objHash = -1195127879,
	lockpick = false,
	objCoords = vector3(449.8978, -999.9032, 26.11424),
	slides = 6.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	locked = true,
	maxDistance = 2.5,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = -688443112, objHeading = 0.0, objCoords = vector3(440.1143, -998.5844, 31.11814)},
		{objHash = 1847320387, objHeading = 360.0, objCoords = vector3(442.7509, -998.5838, 31.1186)}
 },
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	locked = true,
	maxDistance = 2.5,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = 320433149, objHeading = 201.24345397949, objCoords = vector3(434.3175, -983.2251, 30.87842)},
		{objHash = 320433149, objHeading = 90.0, objCoords = vector3(434.3175, -980.6257, 30.87842)}
 },
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	locked = true,
	maxDistance = 2.5,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = -1481015543, objHeading = 179.99998474121, objCoords = vector3(434.5266, -989.4918, 30.87343)},
		{objHash = 952639784, objHeading = 180.00001525879, objCoords = vector3(437.1244, -989.4918, 30.87343)}
 },
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	locked = true,
	maxDistance = 2.5,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = 952639784, objHeading = 89.999977111816, objCoords = vector3(449.5224, -982.9584, 30.87445)},
		{objHash = -1481015543, objHeading = 89.999977111816, objCoords = vector3(449.5224, -980.361, 30.87445)}
 },
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 90.0,
	garage = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 2.0,
	objHash = -824920418,
	lockpick = false,
	objCoords = vector3(437.51, -997.9866, 30.87343),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	locked = true,
	maxDistance = 2.5,
	slides = false,
	lockpick = false,
	doors = {
		{objHash = 952639784, objHeading = 270.00003051758, objCoords = vector3(445.9185, -992.4366, 30.8742)},
		{objHash = -1481015543, objHeading = 270.00003051758, objCoords = vector3(445.9185, -995.0313, 30.8742)}
 },
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 89.999961853027,
	garage = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 2.0,
	objHash = -1036090959,
	lockpick = false,
	objCoords = vector3(484.0831, -1006.736, 30.61248),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 89.999961853027,
	garage = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 2.0,
	objHash = -1036090959,
	lockpick = false,
	objCoords = vector3(484.0831, -1010.843, 30.61248),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 89.999961853027,
	garage = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 2.0,
	objHash = -1036090959,
	lockpick = false,
	objCoords = vector3(484.0831, -1014.943, 30.61248),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 89.999961853027,
	garage = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 2.0,
	objHash = -1036090959,
	lockpick = false,
	objCoords = vector3(480.8173, -1014.957, 30.61248),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 89.999961853027,
	garage = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 2.0,
	objHash = -1036090959,
	lockpick = false,
	objCoords = vector3(480.8173, -1010.842, 30.61248),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 89.999961853027,
	garage = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 2.0,
	objHash = -1036090959,
	lockpick = false,
	objCoords = vector3(480.8173, -1010.842, 30.61248),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 89.999961853027,
	garage = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 2.0,
	objHash = -1036090959,
	lockpick = false,
	objCoords = vector3(480.8174, -1006.746, 30.61248),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 89.999961853027,
	garage = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 2.0,
	objHash = -1036090959,
	lockpick = false,
	objCoords = vector3(480.8174, -1006.746, 30.61248),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 90.000022888184,
	garage = true,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['offpolice']=0 },
	steam = 'steam:110000106e6d6fc',
	fixText = false,
	maxDistance = 6.0,
	objHash = -1195127879,
	lockpick = false,
	objCoords = vector3(488.7676, -1021.413, 28.89811),
	slides = 6.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	slides = 6.0,
	maxDistance = 6.0,
	authorizedJobs = { ['mechanic']=0, ['offmechanic4']=0 },
	audioRemote = false,
	objHash = 1542392972,
	garage = true,
	objHeading = 70.015243530273,
	locked = true,
	fixText = false,
	objCoords = vector3(-349.7954, -117.2953, 38.02348),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	slides = 6.0,
	maxDistance = 6.0,
	authorizedJobs = { ['mechanic']=0, ['offmechanic4']=0 },
	audioRemote = false,
	objHash = 1542392972,
	garage = true,
	objHeading = 70.0,
	locked = true,
	fixText = false,
	objCoords = vector3(-356.137, -134.796, 38.01285),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	slides = 6.0,
	maxDistance = 6.0,
	authorizedJobs = { ['mechanic']=0, ['offmechanic4']=0 },
	audioRemote = false,
	objHash = 260701421,
	garage = true,
	objHeading = 30.000005722046,
	locked = true,
	fixText = false,
	objCoords = vector3(-360.2168, -154.9366, 37.7263),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	slides = 6.0,
	maxDistance = 6.0,
	authorizedJobs = { ['mechanic']=0, ['offmechanic4']=0 },
	audioRemote = false,
	objHash = 260701421,
	garage = true,
	objHeading = 30.000005722046,
	locked = true,
	fixText = false,
	objCoords = vector3(-360.2168, -154.9366, 37.7263),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	slides = 6.0,
	maxDistance = 6.0,
	authorizedJobs = { ['mechanic']=0, ['offmechanic']=0 },
	audioRemote = false,
	objHash = 260701421,
	garage = true,
	objHeading = 340.00003051758,
	locked = true,
	fixText = false,
	objCoords = vector3(-364.97, -102.1295, 38.00655),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	slides = 6.0,
	maxDistance = 6.0,
	authorizedJobs = { ['mechanic']=0, ['offmechanic']=0 },
	audioRemote = false,
	objHash = 260701421,
	garage = true,
	objHeading = 340.00003051758,
	locked = true,
	fixText = false,
	objCoords = vector3(-371.9531, -99.5879, 38.01236),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	maxDistance = 2.0,
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },
	locked = true,
	audioRemote = false,
	objHash = -1726331785,
	objHeading = 119.99932861328,
	objCoords = vector3(1830.968, 3690.396, 34.43084),
	fixText = false,
	slides = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(127.9937, -1298.556, 29.41796),
	objHeading = 29.959999084473,
	slides = false,
	--authorizedJobs = { ['banda8']=0 },
	mafia = 'banda8',
	garage = false,
	fixText = false,
	objHash = 401003935,
	audioRemote = false,
	maxDistance = 2.0,
	locked = true,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(125.108, -1299.685, 29.48203),
	objHeading = 119.95996856689,
	slides = false,
	--authorizedJobs = { ['banda8']=0 },
	mafia = 'banda8',
	garage = false,
	fixText = false,
	objHash = -884268790,
	audioRemote = false,
	maxDistance = 2.0,
	locked = true,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(120.3614, -1294.495, 21.28732),
	objHeading = 29.959999084473,
	slides = false,
	--authorizedJobs = { ['banda8']=0 },
	mafia = 'banda8',
	garage = false,
	fixText = false,
	objHash = 401003935,
	audioRemote = false,
	maxDistance = 2.0,
	locked = true,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(100.877, -1305.759, 21.2669),
	objHeading = 29.959999084473,
	slides = false,
	--authorizedJobs = { ['banda8']=0 },
	mafia = 'banda8',
	garage = false,
	fixText = false,
	objHash = 401003935,
	audioRemote = false,
	maxDistance = 2.0,
	locked = true,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(116.809, -1305.312, 29.48757),
	objHeading = 29.959999084473,
	slides = false,
	--authorizedJobs = { ['banda8']=0 },
	mafia = 'banda8',
	garage = false,
	fixText = false,
	objHash = 488457389,
	audioRemote = false,
	maxDistance = 2.0,
	locked = true,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(99.99823, -1296.193, 29.48703),
	objHeading = 119.95996856689,
	slides = false,
	--authorizedJobs = { ['banda8']=0 },
	mafia = 'banda8',
	garage = false,
	fixText = false,
	objHash = 401003935,
	audioRemote = false,
	maxDistance = 2.0,
	locked = true,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(95.02094, -1285.566, 29.45547),
	objHeading = 29.959999084473,
	slides = false,
	--authorizedJobs = { ['banda8']=0 },
	mafia = 'banda8',
	garage = false,
	fixText = false,
	objHash = 401003935,
	audioRemote = false,
	maxDistance = 2.0,
	locked = true,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})