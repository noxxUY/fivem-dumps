--[[
	Borrar puertas [Central]
--]]
local coordsBank = vector3(244.55,218.59,106.29)
local DoorsBank = {
	list = {
		{ coords = vector3(258.46, 213.06, 106.29) , dist = 3.0 , hash = 'hei_prop_hei_bankdoor_new' },
		{ coords = vector3(259.67, 215.7, 106.29) , dist = 3.0 , hash = 'hei_prop_hei_bankdoor_new' },
		{ coords = vector3(258.28, 203.55, 106.28) , dist = 3.0 , hash = 'hei_prop_hei_bankdoor_new' },
		{ coords = vector3(260.21, 202.76, 106.28) , dist = 3.0 , hash = 'hei_prop_hei_bankdoor_new' },
		{ coords = vector3(232.36, 213.42, 106.29) , dist = 3.0 , hash = 'hei_prop_hei_bankdoor_new' },
		{ coords = vector3(230.81, 216.67, 106.29) , dist = 3.0 , hash = 'hei_prop_hei_bankdoor_new' },
		{ coords = vector3(256.84,220.31,106.29) , dist = 3.0 , hash = 'hei_v_ilev_bk_gate_pris' },
		{ coords = vector3(237.06,228.04,106.29) , dist = 3.0 , hash = 'v_ilev_bk_door' },
		{ coords = vector3(237.48,228.04,110.29) , dist = 3.0 , hash = 'v_ilev_bk_door' },
		{ coords = vector3(256.85,206.89,110.29) , dist = 3.0 , hash = 'v_ilev_bk_door' },
		{ coords = vector3(265.63,217.53,110.29) , dist = 3.0 , hash = 'v_ilev_bk_door' },
		{ coords = vector3(262.1981, 222.5188, 106.4296) , dist = 3.0 , hash = 'hei_v_ilev_bk_gate2_pris' },
		{ coords = vector3(251.8576, 221.0655, 101.8324) , dist = 3.0 , hash = 'hei_v_ilev_bk_safegate_pris' },
		{ coords = vector3(262.5366, 215.0576, 110.4328) , dist = 3.0 , hash = 'v_ilev_bk_door2' },
		{ coords = vector3(260.8578, 210.4453, 110.4328) , dist = 3.0 , hash = 'v_ilev_bk_door2' },
		{ coords = vector3(255.2283, 223.976, 102.3932) , dist = 3.0 , hash = 'v_ilev_bk_vaultdoor' },
		{ coords = vector3(238.2898, 224.5779, 109.7805) , dist = 70.0 , hash = 'prop_ld_balastrude' }, -- Las barreras de arriba 
		{ coords = vector3(253.56, 207.74, 105.29) , dist = 10.0 , hash = 'prop_off_chair_01' }, -- Sillas
		{ coords = vector3(244.15, 200.69, 105.28) , dist = 50.0 , hash = 'prop_plant_int_01a' }, -- Sillas
	}
}

--[[
	Borrar puertas [MiniBanco]
--]]
local coordsMiniBanco = vector3(-107.38, 6465.95, 31.63)
local DoorsMiniBanco = {
	list = {
		{ coords = vector3(-111.48, 6463.94, 31.98499) , dist = 2.0 , hash = 'v_ilev_bank4door02' },
		{ coords = vector3(-109.65, 6462.11, 31.98499) , dist = 2.0 , hash = 'v_ilev_bank4door01' },
	}
}

--[[
	Borrar puertas [Fleeca Costa]
--]]
local coordsFleecaC = vector3(-2957.82, 481.48, 15.7)
local DoordsFleecaC = {
	list = {
		{ coords = vector3(-2965.71, 484.2195, 16.0481) , dist = 2.0 , hash = 'v_ilev_genbankdoor2' },
		{ coords = vector3(-2965.821, 481.6297, 16.04816) , dist = 2.0 , hash = 'v_ilev_genbankdoor1' },
		{ coords = vector3(-2960.176, 479.0105, 15.97156) , dist = 2.0 , hash = 'v_ilev_gb_teldr' },
		{ coords = vector3(-2958.538, 482.2705, 15.83594) , dist = 2.0 , hash = 'v_ilev_gb_vauldr' },
		{ coords = vector3(-2956.116, 485.4206, 15.99531) , dist = 2.0 , hash = 'v_ilev_gb_vaubar' },
		{ coords = vector3(-2965.385, 476.9357, 14.69766) , dist = 2.0 , hash = 'prop_plant_int_01a' }, -- Planta
		{ coords = vector3(-2958.539, 482.2706, 15.83594) , dist = 2.0 , hash = 'hei_prop_heist_sec_door' }, -- Fleeca de la Costa (Boveda)
	}
}

--[[
	Borrar puertas [Fleeca Sandy]
--]]
local coordsFleecaS = vector3(1176.19, 2711.69, 38.09)
local DoordsFleecaS = {
	list = {
		{ coords = vector3(1188.995, 2652.316, 37.19326) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(1189.465, 2652.42, 37.19326) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(1112.701, 2625.333, 36.98785) , dist = 2.0 , hash = 'prop_gas_tank_01a' },
		{ coords = vector3(1173.179, 2699.196, 36.95933) , dist = 2.0 , hash = 'prop_bollard_02c' },
		{ coords = vector3(1174.202, 2699.062, 37.00983) , dist = 2.0 , hash = 'prop_bollard_02a' },
		{ coords = vector3(1177.34, 2699.049, 37.00835) , dist = 2.0 , hash = 'prop_bollard_02a' },
		{ coords = vector3(1173.182, 2702.865, 37.1464) , dist = 2.0 , hash = 'prop_bin_02a' },
	}
}

--[[
	Borrar puertas [Cerveceria PSG]
--]]
local coordsCerveceriaPSG = vector3(1392.44, 3604.9, 34.98)
local DoordsCerveceriaPSG = {
	list = {
		{ coords = vector3(1388.139, 3605.707, 35.14375) , dist = 2.0 , hash = 'v_ilev_mldoor02' },
		{ coords = vector3(1388.499, 3614.828, 39.09187) , dist = 2.0 , hash = 'v_ilev_ss_doorext' },
		{ coords = vector3(1399.7, 3607.763, 39.09187) , dist = 2.0 , hash = 'v_ilev_ss_doorext' },
		{ coords = vector3(1392.74, 3611.367, 39.09187) , dist = 2.0 , hash = 'v_ilev_methdoorscuff' },
		{ coords = vector3(1390.767, 3606.963, 38.30414) , dist = 2.0 , hash = 'prop_gascyl_01a' }, -- Tanques de nafta
		{ coords = vector3(1391.344, 3606.271, 38.15295) , dist = 2.0 , hash = 'prop_oilcan_01a' }, -- Tanques de nafta
		{ coords = vector3(1393.238, 3611.96, 38.30414) , dist = 2.0 , hash = 'prop_gascyl_01a' }, -- Tanques de nafta
		{ coords = vector3(1382.986, 3610.022, 33.89798) , dist = 2.0 , hash = 'prop_gas_tank_01a' }, -- Tanques de nafta
	}
}

--[[
	Borrar puertas [Rancho]
--]]
local coordsRanchoPSG = vector3(2457.69, 4968.14, 47.02)
local DoordsRanchoPSG = {
	list = {
		{ coords = vector3(2487.042, 4952.005, 44.46195) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2486.22, 4952.478, 44.80429) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2486.636, 4952.418, 44.80429) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2479.612, 4958.407, 44.16655) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2480.014, 4958.845, 44.30183) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2480.494, 4958.855, 44.30183) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2498.402, 4966.137, 44.01082) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2498.566, 4965.581, 44.49153) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2498.906, 4965.333, 44.49153) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2519.85, 4952.766, 44.58057) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2519.51, 4953.014, 44.58957) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2519.109, 4953.228, 44.16788) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2522.923, 4961.421, 44.17989) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2523.087, 4960.864, 44.66061) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2523.427, 4960.616, 44.66061) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2530.479, 4980.292, 44.74883) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2530.827, 4979.907, 44.73678) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2531.345, 4980.196, 44.73832) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2533.71, 4983.384, 44.14397) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2535.418, 4984.411, 44.31657) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2535.141, 4984.876, 44.31657) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2531.863, 4985.813, 44.36446) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2527.958, 4988.078, 44.31657) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2527.754, 4988.579, 44.69276) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2453.184, 4969.372, 46.90218) , dist = 2.0 , hash = 'v_ilev_fh_frntdoor' },
		{ coords = vector3(2448.641, 4988.778, 46.90218) , dist = 2.0 , hash = 'v_ilev_fh_frntdoor' },
		{ coords = vector3(2435.429, 4975.025, 46.90218) , dist = 2.0 , hash = 'v_ilev_fh_frntdoor' },
		{ coords = vector3(2442.242, 4980.021, 46.9029) , dist = 2.0 , hash = 'prop_ret_door_02' },
		{ coords = vector3(2440.04, 4973.29, 46.9029) , dist = 2.0 , hash = 'prop_ret_door_02' },
		{ coords = vector3(2442.188, 4966.004, 46.9029) , dist = 2.0 , hash = 'prop_ret_door_02' },
		{ coords = vector3(2448.034, 4974.67, 51.65736) , dist = 2.0 , hash = 'prop_ret_door_02' },
		{ coords = vector3(2450.959, 4976.352, 51.65736) , dist = 2.0 , hash = 'prop_ret_door_02' },
		{ coords = vector3(2444.207, 4978.464, 51.65736) , dist = 2.0 , hash = 'prop_ret_door_02' },
		{ coords = vector3(2429.875, 4966.574, 44.16233) , dist = 2.0 , hash = 'v_8_cloth002' },
		{ coords = vector3(2441.01, 4981.73, 46.90218) , dist = 2.0 , hash = 'v_ilev_fh_frntdoor' },
		{ coords = vector3(2443.061, 4979.706, 51.8163) , dist = 2.0 , hash = 'v_ilev_fh_door03' },
		{ coords = vector3(2441.465, 4981.301, 51.8163) , dist = 2.0 , hash = 'v_ilev_fh_door03' },
		{ coords = vector3(2455.443, 4986.106, 46.9029) , dist = 2.0 , hash = 'prop_ret_door_02' },
		{ coords = vector3(2438.635, 4967.682, 46.90218) , dist = 2.0 , hash = 'v_ilev_fh_door4' },
		{ coords = vector3(2436.798, 4969.516, 46.90218) , dist = 2.0 , hash = 'v_ilev_fh_door4' },
		{ coords = vector3(2428.859, 4992.354, 45.88771) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2328.044, 4888.855, 40.80635) , dist = 2.0 , hash = 'prop_gas_tank_02a' },
		{ coords = vector3(2334.168, 4882.68, 40.80635) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2428.392, 4992.19, 45.88789) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2413.449, 5045.722, 45.79817) , dist = 2.0 , hash = 'prop_gas_tank_02a' },
		{ coords = vector3(2330.588, 4888.28, 41.18613) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2330.965, 4887.542, 41.18806) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2321.147, 4894.49, 41.59708) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2344.258, 4877.575, 41.60485) , dist = 2.0 , hash = 'prop_gascyl_04a' },
		{ coords = vector3(2344.04, 4876.29, 41.17097) , dist = 2.0 , hash = 'prop_gascyl_01a' },
		{ coords = vector3(2344.18, 4875.808, 41.17097) , dist = 2.0 , hash = 'prop_gascyl_01a' },
	}
}

local coordsChickenPSG = vector3(-102.7753, 6198.007, 31.17485)
local DoordsChickenPSG = {
	list = {
		{ coords = vector3(-70.3437, 6241.089, 31.61165) , dist = 2.0 , hash = 'v_34_strips003' },
		{ coords = vector3(-91.70095, 6213.187, 31.63407) , dist = 2.0 , hash = 'v_34_strips' },
		{ coords = vector3(-78.36523, 6235.9, 31.64327) , dist = 2.0 , hash = 'v_34_strips002' },
		{ coords = vector3(-82.79638, 6218.072, 31.67706) , dist = 2.0 , hash = 'v_34_strips001' },
	}
}

local coordsMazePSG = vector3(-1304.7504, -823.9157, 17.1482)
local DoordsMazePSG = {
	list = {
		{ coords = vector3(-1317.954, -831.1037, 16.8832) , dist = 5.0 , hash = 1347919902 }, -- Puerta cristal fija
		{ coords = vector3(-1316.755, -832.1277, 17.0325) , dist = 5.0 , hash = 852936996 }, -- Puerta cristal fija
		{ coords = vector3(-1307.471, -832.0272, 17.4950) , dist = 5.0 , hash = -1738361206 }, -- Puerta cristal fija
		{ coords = vector3(-1309.067, -833.2381, 17.2983) , dist = 5.0 , hash = 1585070778 }, -- Puerta cristal fija
		{ coords = vector3(-1298.600, -822.4338, 17.5233) , dist = 5.0 , hash = 736699661 }, -- Puerta Madera

		{ coords = vector3(-1297.700, -830.8935, 17.1944) , dist = 5.0 , hash = -1821777087 }, -- Puerta Vidrio
		{ coords = vector3(-1294.105, -830.1863, 17.0675) , dist = 5.0 , hash = -1821777087 }, -- Puerta Vidrio
		{ coords = vector3(-1291.755, -834.4243, 17.3723) , dist = 5.0 , hash = -1821777087 }, -- Puerta Vidrio
		

		
	}
}

local coordsHuman = vector3(3578.8926, 3712.6895, 32.7239)
local DoordsHuman = {
	list = {
		{ coords = vector3(3624.5420, 3749.9968, 28.5157) , dist = 5.0 , hash = -1081024910 }, -- Puerta Frente

		{ coords = vector3(3602.085, 3718.6240, 29.9305) , dist = 5.0 , hash = 1282049587 }, -- Puerta Vidrio
		{ coords = vector3(3602.085, 3718.6240, 29.9305) , dist = 5.0 , hash = -421709054 }, -- Puerta Vidrio


		{ coords = vector3(3584.158, 3700.9465, 28.9714) , dist = 5.0 , hash = -421709054 }, -- Puerta Vidrio
		{ coords = vector3(3584.158, 3700.9465, 28.9714) , dist = 5.0 , hash = 1282049587 }, -- Puerta Vidrio

		
		{ coords = vector3(3568.767, 3693.9318, 28.0166) , dist = 5.0 , hash = 1282049587 }, -- Puerta Vidrio
		{ coords = vector3(3568.767, 3693.9318, 28.0166) , dist = 5.0 , hash = -421709054 }, -- Puerta Vidrio

		
		{ coords = vector3(3598.511, 3688.9765, 28.9716) , dist = 5.0 , hash = 1282049587 }, -- Puerta Vidrio
		{ coords = vector3(3598.511, 3688.9765, 28.9716) , dist = 5.0 , hash = -421709054 }, -- Puerta Vidrio

		
		{ coords = vector3(3566.805, 3684.4460, 28.6236) , dist = 5.0 , hash = 161378502 }, -- Puerta Vidrio
		{ coords = vector3(3566.805, 3684.4460, 28.6236) , dist = 5.0 , hash = -1572101598 }, -- Puerta Vidrio
		
	}
}

local coordsLife = vector3(-1061.8505, -240.5426, 39.7332)
local DoordsLife = {
	list = {
		{ coords = vector3(-1081.618, -259.7056, 38.1119) , dist = 5.0 , hash = -1045015371 }, -- Puerta Frente
		{ coords = vector3(-1081.618, -259.7056, 38.1119) , dist = 5.0 , hash = -1679881977 }, -- Puerta Frente

		{ coords = vector3(-1046.516, -229.3580, 39.4379) , dist = 5.0 , hash = -1425071302 }, -- Puerta Atras
		{ coords = vector3(-1046.516, -229.3580, 39.4379) , dist = 5.0 , hash = 1104171198 }, -- Puerta Atras

		{ coords = vector3(-1051.723, -237.0023, 40.0716) , dist = 5.0 , hash = -1881825907 }, -- Puerta amarilla
		{ coords = vector3(-1063.482, -241.3971, 39.7937) , dist = 5.0 , hash = -1881825907 }, -- Puerta amarilla

		{ coords = vector3(-1054.881, -235.9218, 44.3890) , dist = 5.0 , hash = -495720969 }, -- Puerta amarilla

		{ coords = vector3(-1047.88, -237.9326, 44.0045) , dist = 5.0 , hash = -1821777087 }, -- Puerta Vidrio
		
	}
}

local coordsCarni = vector3(966.1185, -2110.3423, 31.4701)
local DoordsCarni = {
	list = {
		{ coords = vector3(962.879, -2105.4179, 33.2131) , dist = 5.0 , hash = 'prop_abat_slide' }, -- Puerta Frente

	--	{ coords = vector3(962.2411, -2184.7739, 30.4742) , dist = 5.0 , hash = 'v_ilev_abbmaindoor' }, -- Puerta atras
		
		{ coords = vector3(997.2703, -2121.1257, 30.4757) , dist = 155.0 , hash = 'v_ind_coo_quarter' }, -- Puerta atras
		{ coords = vector3(997.2703, -2121.1257, 30.4757) , dist = 155.0 , hash = 'v_ind_coo_half' }, -- Puerta atras
		{ coords = vector3(997.2703, -2121.1257, 30.4757) , dist = 155.0 , hash = 'v_11_abbtops3' }, -- Puerta atras
		{ coords = vector3(997.2703, -2121.1257, 30.4757) , dist = 155.0 , hash = 'v_ind_cftable' }, -- Puerta atras
		{ coords = vector3(997.2703, -2121.1257, 30.4757) , dist = 155.0 , hash = 'prop_bin_03a' }, -- Puerta atras
		
		
	}
}

local coordsJoye = vector3(-632.2932, -238.5512, 38.0813)
local DoordsJoye = {
	list = {
		{ coords = vector3(-631.4709, -237.4917, 38.0734) , dist = 5.0 , hash = 1425919976 }, -- Puerta Frente
		{ coords = vector3(-631.4709, -237.4917, 38.0734) , dist = 5.0 , hash = 9467943 }, -- Puerta Frente

		{ coords = vector3(-631.4709, -237.4917, 38.0734) , dist = 5.0 , hash = -1672244062 }, -- Plantas
		{ coords = vector3(-628.3882, -230.1127, 38.0570) , dist = 5.0 , hash = 1335309163 }, -- Plantas

		
	}
}

local coordsMichael = vector3(-802.6835, 167.0602, 76.5313)
local DoordsMichael = {
	list = {
		{ coords = vector3(-802.6835, 167.0602, 76.5313) , dist = 5.0 , hash = 1019527301 }, -- Puerta Frente

		{ coords = vector3(-815.2001, 178.6193, 72.1531) , dist = 5.0 , hash = 159994461 }, -- 
		{ coords = vector3(-815.2001, 178.6193, 72.1531) , dist = 5.0 , hash = -1686014385 }, -- 

		{ coords = vector3(-794.5889, 181.6300, 72.8348) , dist = 5.0 , hash = 1245831483 }, -- 
		{ coords = vector3(-794.5889, 181.6300, 72.8348) , dist = 5.0 , hash = -1454760130 }, -- 

		{ coords = vector3(-795.0729, 178.2045, 72.8348) , dist = 5.0 , hash = 1245831483 }, -- 
		{ coords = vector3(-795.3902, 178.0800, 72.8348) , dist = 5.0 , hash = -1454760130 }, -- 

		{ coords = vector3(-807.3742, 186.0364, 72.4751) , dist = 5.0 , hash = -1563640173 }, -- 
		{ coords = vector3(-815.7001, 185.5604, 72.4588) , dist = 5.0 , hash = 30769481 }, -- 

		{ coords = vector3(-804.3312, 172.4844, 76.7407) , dist = 5.0 , hash = -384976104 }, -- 
		{ coords = vector3(-804.3312, 172.4844, 76.7407) , dist = 5.0 , hash = -794543736 }, -- 

		{ coords = vector3(-803.1896, 176.4351, 76.7408) , dist = 5.0 , hash = 1204471037 }, -- 

		{ coords = vector3(-810.0934, 178.2706, 76.7408) , dist = 5.0 , hash = -384976104 }, -- 



		
	}
}




Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1800)

		if GetDistanceBetweenCoords(coordsBank, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoorsBank['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end

		if GetDistanceBetweenCoords(coordsMiniBanco, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoorsMiniBanco['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end

		if GetDistanceBetweenCoords(coordsFleecaC, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoordsFleecaC['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end

		if GetDistanceBetweenCoords(coordsFleecaS, GetEntityCoords(PlayerPedId())) < 500.0 then
			for k, doors in ipairs(DoordsFleecaS['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end
		
		if GetDistanceBetweenCoords(coordsCerveceriaPSG, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoordsCerveceriaPSG['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end

		if GetDistanceBetweenCoords(coordsRanchoPSG, GetEntityCoords(PlayerPedId())) < 500.0 then
			for k, doors in ipairs(DoordsRanchoPSG['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end

		if GetDistanceBetweenCoords(coordsChickenPSG, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoordsChickenPSG['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end

		if GetDistanceBetweenCoords(coordsMazePSG, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoordsMazePSG['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, doors.hash, false, false, false)
				deleteObject(object)
			end
		end
		if GetDistanceBetweenCoords(coordsHuman, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoordsHuman['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, doors.hash, false, false, false)
				deleteObject(object)
			end
		end
		if GetDistanceBetweenCoords(coordsLife, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoordsLife['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, doors.hash, false, false, false)
				deleteObject(object)
			end
		end
		if GetDistanceBetweenCoords(coordsCarni, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoordsCarni['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end
		if GetDistanceBetweenCoords(coordsJoye, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoordsJoye['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, doors.hash, false, false, false)
				deleteObject(object)
			end
		end
		if GetDistanceBetweenCoords(coordsMichael, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoordsMichael['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, doors.hash, false, false, false)
				deleteObject(object)
			end
		end
	end
end)

function deleteObject(object)
	if DoesEntityExist(object) then
		SetEntityVisible(object,false,0)

        SetEntityAsMissionEntity(object, true, true)
		-- SetEntityAsMissionEntity(object) 
		DeleteEntity(object)
	end
end