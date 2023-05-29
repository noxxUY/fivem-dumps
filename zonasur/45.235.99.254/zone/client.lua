ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local zones = {
	{ ['x'] = 340.1596, ['y'] = -1395.93, ['z'] = 32.509, ['dis'] = 20.0}, --SPAWN HOSPITAL DE CENTRO CERCA DE DEPOSITO
	{ ['x'] = -1038.73, ['y'] = -2739.50, ['z'] = 13.842, ['dis'] = 20.0 }, --AEROPUERTO
	{ ['x'] = -316.248, ['y'] = -904.191, ['z'] = 31.198, ['dis'] = 70.0 }, --GC
	{ ['x'] = -820.437, ['y'] = -1224.83, ['z'] = 7.3374, ['dis'] = 30.0 }, --HOSPITAL
	{ ['x'] = 404.7329, ['y'] = -1638.35, ['z'] = 29.291, ['dis'] = 20.0}, --DEPOSITO
	{ ['x'] = 324.8862, ['y'] = -212.595, ['z'] = 54.086, ['dis'] = 30.0}, --MOTEL CIUDAD 
}


local notifIn = false
local notifOut = false
local closestZone = 1

function Segura()
	return notifIn
end


local count = false


local armas_bypass = {
	'WEAPON_NIGHTSTICK',
	'WEAPON_STUNGUN',
}

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		Citizen.Wait(0)
		local player = PlayerPedId()
		local vehList = GetGamePool('CVehicle')
		
		if notifIn then	
			drawTxt('ZONA SEGURA',2, 1, 0.500, 0.925, 0.50, 0, 255, 0,255)
			if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_UNARMED') or GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_PETROLCAN') then
				DisablePlayerFiring(player,true)
				DisableControlAction(0, 106, true)
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
				SetPlayerCanDoDriveBy(PlayerId(), false)							
			elseif GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('WEAPON_NIGHTSTICK') and GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('WEAPON_STUNGUN') then
				DisablePlayerFiring(player,true)
				--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
				--DisableControlAction(0, 1, true) 				-- Disable pan
			--DisableControlAction(0, 2, true) 				-- Disable tilt
			DisableControlAction(0, 24, true) 				-- Attack
			DisableControlAction(0, 257, true) 				-- Attack 2
			DisableControlAction(0, 25, true) 				-- Aim
			DisableControlAction(0, 263, true) 				-- Melee Attack 1
			
			--DisableControlAction(0, 47, true)  				-- Disable weapon
			DisableControlAction(0, 264, true) 				-- Disable melee
			DisableControlAction(0, 257, true) 				-- Disable melee
			DisableControlAction(0, 140, true) 				-- Disable melee
			DisableControlAction(0, 141, true) 				-- Disable melee
			DisableControlAction(0, 142, true) 				-- Disable melee
			DisableControlAction(0, 143, true) 				-- Disable melee
			DisableControlAction(0, 45, true) 				-- Disable melee
			end				
			
			for k,v in pairs(vehList) do
                local distance = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(v), false) 
                if distance < 10 then
                    SetEntityNoCollisionEntity(v, player, true)
                end
            end
		end
		
		if notifOut then
			drawTxt('ZONA SEGURA',2, 1, 0.500, 0.925, 0.50, 0, 255, 0,255)
			if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_UNARMED') or GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_PETROLCAN') then
				DisablePlayerFiring(player,true)
				DisableControlAction(1, 106, true)
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
				SetPlayerCanDoDriveBy(PlayerId(), false)							
			elseif GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('WEAPON_NIGHTSTICK') and GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('WEAPON_STUNGUN') then
				DisablePlayerFiring(player,true)
				--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			end
		end
	end
end)

exports["bt-polyzone"]:AddPolyzone("META", {
		vector2(-379.14990234375, 6472.9497070313),
		vector2(-563.4345703125, 6366.1767578125),
		vector2(-418.81298828125, 6269.9565429688),
		vector2(-310.32705688477, 6360.9008789063)
	}, {
	name="META",
	debugPoly=false,
	--minZ = 20.678188323975,
	--maxZ = 83.071952819824
})

exports["bt-polyzone"]:AddPolyzone("EFEDRINA", {
		vector2(1404.7309570313, 6415.9692382813),
		vector2(1393.2873535156, 6296.8110351563),
		vector2(1564.6075439453, 6276.8178710938),
		vector2(1618.6411132813, 6357.1225585938)
	}, {
	name="EFEDRINA",
	debugPoly=false,
	--minZ = 20.678188323975,
	--maxZ = 83.071952819824
})

--[[
exports["bt-polyzone"]:AddPolyzone("pillbox", {
		vector2(296.63055419922, -535.25885009766),
		vector2(265.57678222656, -611.11804199219),
		vector2(350.75314331055, -641.77978515625),
		vector2(415.09741210938, -542.90661621094)
	}, {
	name="pillbox",
	debugPoly=false,
	--minZ = 20.678188323975,
	--maxZ = 83.071952819824
})
]]--

--[[
--Name: hospitalpillbox | 2023-01-11T21:10:51Z
PolyZone:Create({
  vector2(346.23721313477, -648.50115966797),
  vector2(417.01416015625, -540.01422119141),
  vector2(296.94934082031, -536.05261230469),
  vector2(265.40786743164, -612.3193359375)
}, {
  name="hospitalpillbox",
  --minZ = 28.676445007324,
  --maxZ = 43.074810028076
})

]]--

exports["bt-polyzone"]:AddPolyzone("pillbox", {
		vector2(346.23721313477, -648.50115966797),
		vector2(417.01416015625, -540.01422119141),
		vector2(296.94934082031, -536.05261230469),
		vector2(265.40786743164, -612.3193359375)
	}, {
	name="pillbox",
	debugPoly=false,
	--minZ = 20.678188323975,
	--maxZ = 83.071952819824
})

exports["bt-polyzone"]:AddPolyzone("gcsandy", {
		vector2(1743.6916503906, 3739.3132324219),
		vector2(1760.6470947266, 3707.9821777344),
		vector2(1711.0128173828, 3720.3024902344),
		vector2(1723.5367431641, 3693.068359375)
	}, {
	name="gcsandy",
	debugPoly=false,
	minZ = 29.854473114014,
	maxZ = 37.854473114014
})

exports["bt-polyzone"]:AddPolyzone("deposandy", {
		vector2(1665.619140625, 3833.779296875),
		vector2(1684.5904541016, 3807.1577148438),
		vector2(1607.3608398438, 3749.5307617188),
		vector2(1592.9610595703, 3775.3349609375)
	}, {
	name="deposandy",
	debugPoly=false,
	minZ = 30.895118713379,
	maxZ = 38.898056030273
})

exports["bt-polyzone"]:AddPolyzone("mineros3", {
		vector2(1949.5313720703, 456.54797363281),
		vector2(1902.6448974609, 234.48684692383),
		vector2(1839.3446044922, 203.6399230957),
		vector2(1805.2106933594, 399.19277954102)
	}, {
	name="mineros3",
	debugPoly=false,
	minZ = 50.081531524658,
	maxZ = 58.081531524658
})

exports["bt-polyzone"]:AddPolyzone("motel2", {
		vector2(267.50918579102, -215.62217712402),
		vector2(348.04788208008, -245.61853027344),
		vector2(334.10195922852, -278.26181030273),
		vector2(255.53359985352, -248.3289642334)
	}, {
	name="motel2",
	debugPoly=false,
	minZ = 50.081531524658,
	maxZ = 58.081531524658
})

exports["bt-polyzone"]:AddPolyzone("mlibre", {
		vector2(157.76921081543, 88.82088470459),
		vector2(152.18356323242, 75.40357208252),
		vector2(35.731864929199, 16.879180908203),
		vector2(-1.9012570381165, 28.158452987671),
		vector2(4.7185955047607, 136.03450012207)
	}, {
	name="mlibre",
	debugPoly=false,
	minZ = 65.49983215332,
	maxZ = 93.700271606445
})

exports["bt-polyzone"]:AddPolyzone("ventamari1", {
		vector2(1174.224609375, -3208.2817382813),
		vector2(1250.2222900391, -3208.4948730469),
		vector2(1249.7550048828, -3081.0600585938),
		vector2(1174.8674316406, -3081.5971679688)
	}, {
	name="ventamari1",
	debugPoly=false,
	minZ = 4.9433259963989,
	maxZ = 6.9433259963989
})

--[[
exports["bt-polyzone"]:AddPolyzone("mansiongrapeseed", {
		vector2(2435.9270019531, 4925.4106445313),
		vector2(2395.9821777344, 4954.3022460938),
		vector2(2463.0854492188, 5018.9282226563),
		vector2(2492.4826660156, 4985.7041015625)
	}, {
	name="mansiongrapeseed",
	debugPoly=false,
	minZ = 40.457836151123,
	maxZ = 50.548835754395
})
]]--

exports["bt-polyzone"]:AddPolyzone("cocaprocesado1", {
		vector2(1405.9676513672, 3638.5693359375),
		vector2(1344.7233886719, 3620.4221191406),
		vector2(1356.0181884766, 3578.6354980469),
		vector2(1421.8625488281, 3599.830078125)
	}, {
	name="cocaprocesado1",
	debugPoly=false,
	minZ = 33.576858520508,
	maxZ = 35.690742492676
})

--[[
exports["bt-polyzone"]:AddPolyzone("cocahojas1", {
		vector2(3234.0, 5132.8969726563),
		vector2(3361.10546875, 5149.2934570313),
		vector2(3373.9611816406, 5235.2387695313),
		vector2(3245.6098632813, 5251.0966796875)
	}, {
  name="cocahojas1",
  debugPoly=false,
  minZ = 17.427925109863,
  maxZ = 19.427925109863
})
]]--

exports["bt-polyzone"]:AddPolyzone("secadomari1", {
		vector2(1233.2727050781, -2562.5026855469),
		vector2(1331.16015625, -2513.0522460938),
		vector2(1381.23046875, -2562.669921875),
		vector2(1269.8660888672, -2649.3332519531)
	}, {
	name="secadomari1",
	debugPoly=false,
	minZ = 35.302852630615,
	maxZ = 48.580223083496
})

exports["bt-polyzone"]:AddPolyzone("marifarmeo1", {
		vector2(2275.2355957031, 5536.2377929688),
		vector2(2114.1589355469, 5512.4208984375),
		vector2(2111.6342773438, 5636.9360351563),
		vector2(2281.0659179688, 5645.9829101563)
	}, {
  name="marifarmeo1",
  debugPoly=false,
  minZ = 50.108703613281,
  maxZ = 62.427955627441
})

exports["bt-polyzone"]:AddPolyzone("EMPAQUETADO", {
		vector2(1415.8327636719, 3655.8095703125),
		vector2(1387.0452880859, 3642.0986328125),
		vector2(1375.787109375, 3667.43359375),
		vector2(1431.8463134766, 3687.1281738281),
		vector2(1439.5981445313, 3664.9545898438)
	}, {
	name="EMPAQUETADO",
	debugPoly=false,
	minZ = 32.41077041626,
	maxZ = 35.377696990967
})

exports["bt-polyzone"]:AddPolyzone("INICIO", {
		vector2(-1055.091796875, -2740.1840820313),
		vector2(-1031.4246826172, -2753.7333984375),
		vector2(-1001.7391357422, -2742.8254394531),
		vector2(-1060.8477783203, -2709.9475097656)
	}, {
	name="INICIO",
	debugPoly=false,
	minZ = 12.752095222473,
	maxZ = 14.597829818726
})


exports["bt-polyzone"]:AddPolyzone("GALAXY", {
		vector2(406.8151550293, 293.14935302734),
		vector2(405.61154174805, 295.34506225586),
		vector2(404.04998779297, 295.93728637695),
		vector2(395.48696899414, 299.60983276367),
		vector2(388.03314208984, 302.10614013672),
		vector2(338.81225585938, 314.25784301758),
		vector2(322.84576416016, 317.22567749023),
		vector2(306.11181640625, 266.59408569336),
		vector2(349.59378051758, 270.39874267578),
		vector2(394.66226196289, 254.49716186523)
	}, {
	name="GALAXY",
	debugPoly=false,
	minZ = 90.84580993652,
	maxZ = 106.36177062988
})

exports["bt-polyzone"]:AddPolyzone("BROYALE", {
		vector2(5297.0493164063, -4794.1655273438),
		vector2(5307.8286132813, -4807.3286132813),
		vector2(5240.6010742188, -4864.81640625),
		vector2(5225.6552734375, -4849.31640625)
	}, {
	name="BROYALE",
	debugPoly=false,
	minZ = 1280.8751220703,
	maxZ = 1320.8751220703
})

exports["bt-polyzone"]:AddPolyzone("VANILLA", {
		vector2(140.20820617676, -1272.7149658203),
		vector2(150.3963470459, -1291.8371582031),
		vector2(150.0666809082, -1295.6018066406),
		vector2(102.80250549316, -1324.1689453125),
		vector2(98.10277557373, -1324.6613769531),
		vector2(96.206115722656, -1323.0213623047),
		vector2(77.037406921387, -1291.0793457031),
		vector2(91.752990722656, -1281.7907714844)
	}, {
	name="VANILLA",
	debugPoly=false,
	minZ = 24.147762298584,
	maxZ = 34.276920318604
})

exports["bt-polyzone"]:AddPolyzone("DEPO_CIUDAD", {
		vector2(396.10440063477, -1596.0093994141),
		vector2(425.64611816406, -1621.1457519531),
		vector2(429.06646728516, -1630.3050537109),
		vector2(429.62197875977, -1638.8277587891),
		vector2(428.42715454102, -1646.6563720703),
		vector2(425.84664916992, -1653.0841064453),
		vector2(415.41375732422, -1665.7270507813),
		vector2(369.55905151367, -1626.4809570313)
	}, {
	name="DEPO_CIUDAD",
	debugPoly=false,
	minZ=28.080,
	maxZ=40.080
})

exports["bt-polyzone"]:AddPolyzone("SPAWN_HOSPITAL", {
		vector2(337.2160949707, -1405.9337158203),
		vector2(349.54122924805, -1391.236328125),
		vector2(321.34729003906, -1366.8126220703),
		vector2(308.62213134766, -1382.1171875)
	}, {
	name="SPAWN_HOSPITAL",
	debugPoly=false,
	minZ = 30.878009796143,
	maxZ = 40.509281158447
})

exports["bt-polyzone"]:AddPolyzone("HOTEL_CIUDAD", {
		vector2(294.5178527832, -224.37377929688),
		vector2(343.73303222656, -244.04447937012),
		vector2(358.40209960938, -199.81806945801),
		vector2(309.03814697266, -180.57118225098)
	}, {
	name="HOTEL_CIUDAD",
	debugPoly=false,
	minZ = 51.978336334229,
	maxZ = 61.702590942383
})

exports["bt-polyzone"]:AddPolyzone("BAHAMAS", {
		vector2(-1415.6873779297, -602.84912109375),
		vector2(-1383.1140136719, -584.26971435547),
		vector2(-1357.2189941406, -622.56768798828),
		vector2(-1389.9897460938, -643.91455078125),
		vector2(-1425.3997802734, -666.74774169922),
		vector2(-1457.5074462891, -627.62591552734)
	}, {
	name="BAHAMAS",
	debugPoly=false,
	minZ = 27.281805038452,
	maxZ = 40.759635925293
})

--[[
exports["bt-polyzone"]:AddPolyzone("GC_CIUDAD", {
		vector2(-363.94815063477, -970.00775146484),
		vector2(-364.22485351563, -857.28436279297),
		vector2(-365.30294799805, -856.20166015625),
		vector2(-361.67919921875, -857.09033203125),
		vector2(-356.23165893555, -858.85339355469),
		vector2(-350.53234863281, -860.52239990234),
		vector2(-344.04415893555, -861.90747070313),
		vector2(-337.77093505859, -862.93731689453),
		vector2(-331.84255981445, -863.71453857422),
		vector2(-325.68572998047, -864.61730957031),
		vector2(-319.80120849609, -865.564453125),
		vector2(-313.99453735352, -866.43389892578),
		vector2(-307.74948120117, -867.47161865234),
		vector2(-302.69525146484, -868.66284179688),
		vector2(-297.93368530273, -870.01928710938),
		vector2(-293.03314208984, -871.30523681641),
		vector2(-286.94445800781, -873.08355712891),
		vector2(-281.20184326172, -874.64947509766),
		vector2(-275.31240844727, -876.78155517578),
		vector2(-265.93557739258, -879.96832275391),
		vector2(-259.27603149414, -882.06762695313),
		vector2(-236.63726806641, -889.74957275391),
		vector2(-218.98672485352, -895.72113037109),
		vector2(-211.07974243164, -898.62738037109),
		vector2(-208.39251708984, -900.56579589844),
		vector2(-207.42034912109, -901.59979248047),
		vector2(-206.96310424805, -904.57397460938),
		vector2(-207.45095825195, -906.80004882813),
		vector2(-208.48699951172, -909.85870361328),
		vector2(-211.11004638672, -916.42559814453),
		vector2(-224.24690246582, -952.37951660156),
		vector2(-234.27793884277, -980.15087890625),
		vector2(-239.46308898926, -994.02807617188),
		vector2(-246.43766784668, -1013.4917602539)
	}, {
	name="GC_CIUDAD",
	debugPoly=false,
	minZ = 26.796945571899,
	maxZ = 40.714157104492
})

exports["bt-polyzone"]:AddPolyzone("GC_PLAYA", {
	vector2(-2023.9569091797, -553.90875244141),
	vector2(-1956.4991455078, -480.56430053711),
	vector2(-2044.1488037109, -408.16485595703),
	vector2(-2117.1647949219, -462.15914916992)
	}, {
	name="GC_PLAYA",
	debugPoly=false,
	minZ = 10.039999961853,
	maxZ = 15.539999008179
})
]]--

--gc grande

exports["bt-polyzone"]:AddPolyzone("gc_grande", {
	vector2(-370.83001708984, -849.77697753906),
	vector2(-201.2981262207, -894.03961181641),
	vector2(-246.6072845459, -1019.1712036133),
	vector2(-375.31307983398, -974.58990478516)
	}, {
	name="gc_grande",
	--minZ = 29.3876953125,
	--maxZ = 33.067687988281
})
--viceroy

exports["bt-polyzone"]:AddPolyzone("VICEROY", {
		vector2(-888.20715332031, -1202.572265625),
  vector2(-871.00146484375, -1232.8825683594),
  vector2(-871.71441650391, -1233.7268066406),
  vector2(-837.51080322266, -1262.8824462891),
  vector2(-824.83129882813, -1270.0452880859),
  vector2(-756.90277099609, -1281.9350585938),
  vector2(-748.63256835938, -1277.5322265625),
  vector2(-743.73565673828, -1274.5874023438),
  vector2(-738.63305664063, -1270.5528564453),
  vector2(-734.56524658203, -1266.2778320313),
  vector2(-730.87670898438, -1261.3842773438),
  vector2(-727.37438964844, -1256.6274414063),
  vector2(-723.96276855469, -1252.1719970703),
  vector2(-719.36077880859, -1247.0125732422),
  vector2(-715.27545166016, -1242.7667236328),
  vector2(-711.54278564453, -1239.6739501953),
  vector2(-708.87872314453, -1237.720703125),
  vector2(-707.01605224609, -1236.4326171875),
  vector2(-705.88885498047, -1235.4592285156),
  vector2(-704.95330810547, -1234.3503417969),
  vector2(-704.16278076172, -1232.9033203125),
  vector2(-704.39544677734, -1230.4815673828),
  vector2(-705.37408447266, -1228.763671875),
  vector2(-706.61737060547, -1226.9117431641),
  vector2(-708.46215820313, -1224.3151855469),
  vector2(-710.51971435547, -1221.4422607422),
  vector2(-712.90307617188, -1218.2310791016),
  vector2(-716.49072265625, -1213.7950439453),
  vector2(-720.14971923828, -1209.4125976563),
  vector2(-723.31561279297, -1205.8673095703),
  vector2(-727.67547607422, -1201.0817871094),
  vector2(-731.67022705078, -1196.6844482422),
  vector2(-735.43780517578, -1192.3887939453),
  vector2(-739.79858398438, -1187.3601074219),
  vector2(-744.30200195313, -1182.025390625),
  vector2(-747.30572509766, -1178.2048339844),
  vector2(-750.98541259766, -1173.4212646484),
  vector2(-754.05230712891, -1169.1127929688),
  vector2(-756.95880126953, -1165.1563720703),
  vector2(-759.97430419922, -1160.7032470703),
  vector2(-763.40783691406, -1156.02734375),
  vector2(-766.89007568359, -1150.6901855469),
  vector2(-768.38946533203, -1148.5346679688),
  vector2(-770.51159667969, -1144.6533203125),
  vector2(-772.90191650391, -1140.3929443359),
  vector2(-774.56225585938, -1137.6649169922),
  vector2(-775.73059082031, -1136.6938476563),
  vector2(-776.66394042969, -1136.0068359375),
  vector2(-777.96234130859, -1135.3463134766),
  vector2(-779.67608642578, -1135.1853027344),
  vector2(-781.71020507813, -1135.5797119141),
  vector2(-782.97241210938, -1136.3218994141),
  vector2(-786.6845703125, -1138.4854736328),
  vector2(-789.42565917969, -1139.9487304688),
  vector2(-792.41955566406, -1141.2717285156),
  vector2(-795.31201171875, -1142.6904296875),
  vector2(-798.82214355469, -1144.5126953125),
  vector2(-802.37878417969, -1146.5272216797),
  vector2(-804.98034667969, -1147.9255371094),
  vector2(-807.28955078125, -1149.1943359375),
  vector2(-813.52795410156, -1152.5946044922),
  vector2(-840.85327148438, -1168.2637939453),
  vector2(-844.82836914063, -1174.8778076172),
  vector2(-889.22613525391, -1200.3771972656)
	}, {
	name="VICEROY",
	debugPoly=false,
	minZ = 3.8502993583679,
	maxZ = 20.732741355896
})

--[[
exports["bt-polyzone"]:AddPolyzone("CUBOS", {
		vector2(242.24336242676, -829.12701416016),
		vector2(190.24459838867, -809.29144287109),
		vector2(222.41804504395, -720.56616210938),
		vector2(277.53112792969, -738.57861328125)
	}, {
	name="CUBOS",
	debugPoly=false,
	minZ = 27.605861663818,
	maxZ = 37.685863494873
})
]]--

exports["bt-polyzone"]:AddPolyzone("Minero_picar", {
		vector2(2895.3430175781, 2801.8090820313),
		vector2(2895.3430175781, 2801.8090820313),
		vector2(2943.4213867188, 2842.7282714844),
		vector2(2990.1960449219, 2781.37890625),
		vector2(2958.2717285156, 2753.8735351563)
	}, {
	name="Minero_picar",
	debugPoly=false,
	minZ = 40.668354034424,
	maxZ = 57.816333770752
})

exports["bt-polyzone"]:AddPolyzone("mineros_fundicion", {
		vector2(1073.8159179688, -1959.4412841797),
		vector2(1136.5925292969, -1998.5802001953),
		vector2(1117.4921875, -2036.9903564453),
		vector2(1054.7039794922, -1988.9289550781)
	}, {
	name="mineros_fundicion",
	debugPoly=false,
	minZ = 27.989891052246,
	maxZ = 34.018175125122
})

exports["bt-polyzone"]:AddPolyzone("meca", {
		vector2(162.04824829102, -3050.3708496094),
		vector2(117.49035644531, -3046.6574707031),
		vector2(115.59405517578, -3007.6794433594),
		vector2(160.13700866699, -3005.7365722656)
	}, {
	name="meca",
	debugPoly=false,
	minZ = 2.9582433700562,
	maxZ = 9.0175151824951
})

exports["bt-polyzone"]:AddPolyzone("consce", {
		vector2(-39.302051544189, -1112.423828125),
		vector2(-64.547706604004, -1104.5344238281),
		vector2(-54.900775909424, -1075.6690673828),
		vector2(-9.7524070739746, -1089.6317138672),
		vector2(-20.023893356323, -1121.2785644531)
	}, {
	name="consce",
	debugPoly=false,
	minZ = 23.437669754028,
	maxZ = 29.437669754028
})

exports["bt-polyzone"]:AddPolyzone("sandy", {
		vector2(1872.6706542969, 3689.4650878906),
		vector2(1823.4227294922, 3661.7326660156),
		vector2(1811.4803466797, 3685.0090332031),
		vector2(1860.8211669922, 3708.9106445313)
	}, {
	name="sandy",
	debugPoly=false,
	minZ = 31.040000915527,
	maxZ = 38.959999084473
})

exports["bt-polyzone"]:AddPolyzone("camioneros", {
		vector2(168.0470123291, -3093.7124023438),
		vector2(170.35423278809, -3226.5390625),
		vector2(113.64902496338, -3223.0895996094),
		vector2(112.27600097656, -3094.5593261719)
	}, {
	name="camioneros",
	debugPoly=false,
	minZ = 2.878915309906,
	maxZ = 9.3389148712158
})

exports["bt-polyzone"]:AddPolyzone("jobs", {
		vector2(-222.55015563965, -958.576171875),
		vector2(-238.81687927246, -998.48608398438),
		vector2(-304.7815246582, -975.62054443359),
		vector2(-284.08013916016, -934.05871582031)
	}, {
	name="jobs",
	debugPoly=false,
	minZ = 26.284116744995,
	maxZ = 41.484100341797
})

exports["bt-polyzone"]:AddPolyzone("comunitarias", {
		vector2(746.22015380859, 610.21124267578),
		vector2(805.5498046875, 569.34405517578),
		vector2(798.36181640625, 553.71807861328),
		vector2(742.32373046875, 587.48175048828)
	}, {
	name="comunitarias",
	debugPoly=false,
	minZ = 123.44348144531,
	maxZ = 131.16348266602
})

exports["bt-polyzone"]:AddPolyzone("motelhab", {
		vector2(355.80599975586, -93.007881164551),
		vector2(355.73123168945, -85.508186340332),
		vector2(352.14920043945, -85.583030700684),
		vector2(351.39910888672, -92.948585510254)
	}, {
	name="motelhab",
	debugPoly=false,
	minZ = 17.939151763916,
	maxZ = 23.939151763916
})

RegisterNetEvent('bt-polyzone:enter')
AddEventHandler('bt-polyzone:enter', function(name)
	if name == "GC_PLAYA" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "gc_grande" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "VICEROY" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "DEPO_CIUDAD" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "SPAWN_HOSPITAL" then
		ClearPlayerWantedLevel(PlayerId())
		--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
		notifIn = true
	elseif name == "HOTEL_CIUDAD" then
		ClearPlayerWantedLevel(PlayerId())
		--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
		notifIn = true
	elseif name == "BAHAMAS" then
		ClearPlayerWantedLevel(PlayerId())
		--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
		notifIn = true
	elseif name == "VANILLA" then
		ClearPlayerWantedLevel(PlayerId())
		--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
		notifIn = true
	elseif name == "BROYALE" then
		ClearPlayerWantedLevel(PlayerId())
		--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
		notifOut = true
	elseif name == "GALAXY" then
		ClearPlayerWantedLevel(PlayerId())
		--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
		notifIn = true
	elseif name == "INICIO" then
		ClearPlayerWantedLevel(PlayerId())
		--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
		notifIn = true
	elseif name == "EMPAQUETADO" then
		TriggerServerEvent('esx_ambulancejob:farmeo', true)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		--TriggerEvent('esx_thief:zroja', true)
	elseif name == "ventamari1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', true)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		--TriggerEvent('esx_thief:zroja', true)
	elseif name == "mansiongrapeseed" then
		TriggerServerEvent('esx_ambulancejob:farmeo', true)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		--TriggerEvent('esx_thief:zroja', true)
	elseif name == "cocaprocesado1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', true)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		--TriggerEvent('esx_thief:zroja', true)
	elseif name == "META" then
		TriggerServerEvent('esx_ambulancejob:farmeo', true)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		--TriggerEvent('esx_thief:zroja', true)
	elseif name == "EFEDRINA" then
		TriggerServerEvent('esx_ambulancejob:farmeo', true)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		--TriggerEvent('esx_thief:zroja', true)
	--[[
	elseif name == "cocahojas1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', true)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		TriggerEvent('esx_thief:zroja', true)
	]]--
	elseif name == "marifarmeo1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', true)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		--TriggerEvent('esx_thief:zroja', true)
	elseif name == "secadomari1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', true)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		--TriggerEvent('esx_thief:zroja', true)
	elseif name == "secadomari1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', true)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
		--TriggerEvent('esx_thief:zroja', true)
	elseif name == "Minero_picar" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "mineros_fundicion" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "meca" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "consce" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "sandy" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "camioneros" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "jobs" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "comunitarias" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "motelhab" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "gcsandy" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "deposandy" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "mineros3" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "motel2" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	elseif name == "mlibre" then
		if not notifIn then																			  
			ClearPlayerWantedLevel(PlayerId())
			--SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
			notifIn = true
		end
	end
end)

RegisterNetEvent('bt-polyzone:exit')
AddEventHandler('bt-polyzone:exit', function(name)
	local vehList = GetGamePool('CVehicle')
    for k,v in pairs(vehList) do
		SetEntityCollision(v, true)
    end
	if name == "GC_PLAYA" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "gc_grande" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "VICEROY" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "DEPO_CIUDAD" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "SPAWN_HOSPITAL" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "HOTEL_CIUDAD" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "BAHAMAS" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "VANILLA" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "BROYALE" then
		notifOut = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "GALAXY" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "INICIO" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "EMPAQUETADO" then
		TriggerServerEvent('esx_ambulancejob:farmeo', false)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		--TriggerEvent('esx_thief:zroja', false)
	elseif name == "ventamari1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', false)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		--TriggerEvent('esx_thief:zroja', false)
	elseif name == "mansiongrapeseed" then
		TriggerServerEvent('esx_ambulancejob:farmeo', false)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		--TriggerEvent('esx_thief:zroja', false)
	elseif name == "cocaprocesado1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', false)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		--TriggerEvent('esx_thief:zroja', false)
	elseif name == "cocahojas1" then
	--[[
		TriggerServerEvent('esx_ambulancejob:farmeo', false)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		TriggerEvent('esx_thief:zroja', false)
	]]--
	elseif name == "marifarmeo1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', false)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		--TriggerEvent('esx_thief:zroja', false)
	elseif name == "secadomari1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', false)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		--TriggerEvent('esx_thief:zroja', false)
	elseif name == "secadomari1" then
		TriggerServerEvent('esx_ambulancejob:farmeo', false)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		--TriggerEvent('esx_thief:zroja', false)
	elseif name == "META" then
		TriggerServerEvent('esx_ambulancejob:farmeo', false)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		--TriggerEvent('esx_thief:zroja', false)
	elseif name == "EFEDRINA" then
		TriggerServerEvent('esx_ambulancejob:farmeo', false)
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		--TriggerEvent('esx_thief:zroja', false)
	elseif name == "Minero_picar" then																		  
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "mineros_fundicion" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "meca" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "consce" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "sandy" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "camioneros" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "jobs" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "comunitarias" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "motelhab" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "gcsandy" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "deposandy" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "mineros3" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "motel2" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	elseif name == "mlibre" then
		notifIn = false
		SetPlayerCanDoDriveBy(PlayerId(), true)
	end
end)

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end