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
	Borrar puertas [Life Invader]
--]]
local coordsLifeInvader = vector3(-1045.70, -230.71, 39.01)
local DoorsLifeInvader = {
	list = {
		{ coords = vector3(-1045.70, -230.71, 39.01) , dist = 2.0 , hash = 'v_ilev_fb_doorshortl' },
		{ coords = vector3(-1045.70, -230.71, 39.01) , dist = 2.0 , hash = 'v_ilev_fb_doorshortr' },
		{ coords = vector3(-1083.62, -260.4166, 38.1867) , dist = 2.0 , hash = 'v_ilev_fb_door01' },
		{ coords = vector3(-1080.974, -259.0203, 38.1867) , dist = 2.0 , hash = 'v_ilev_fb_door02' },
		{ coords = vector3(-1063.804, -240.8321, 39.88301) , dist = 2.0 , hash = 'v_ilev_door_orange' },
		{ coords = vector3(-1050.967, -236.6299, 39.88301) , dist = 2.0 , hash = 'v_ilev_door_orange' },
		{ coords = vector3(-1055.958, -236.4251, 44.171) , dist = 2.0 , hash = 'v_ilev_door_orangesolid' },

		{ coords = vector3(-1063.842, -240.6464, 43.021) , dist = 10.0 , hash = 'v_ilev_fb_sl_door01' }, -- Las puertas de sillones adentro

		{ coords = vector3(-1048.285, -236.8256, 44.19453) , dist = 10.0 , hash = 'v_ilev_fib_door2' },  
		{ coords = vector3(-1047.754, -237.8365, 44.08802) , dist = 10.0 , hash = 'v_9_partitions04' },  

		{ coords = vector3(-1045.896, -234.217, 43.02295) , dist = 50.0 , hash = 'prop_off_chair_01' },  -- Sillas del fondo
		{ coords = vector3(-1039.208, -235.6465, 43.0064) , dist = 50.0 , hash = 'prop_wait_bench_01' },  -- Sillones
		{ coords = vector3(-1037.822, -237.5716, 43.021) , dist = 50.0 , hash = 'prop_plant_int_03c' },  -- Florero
		{ coords = vector3(-1040.333, -232.9759, 43.021) , dist = 50.0 , hash = 'prop_plant_int_01b' },  -- Florero2


		{ coords = vector3(-1088.923, -260.2587, 36.75917) , dist = 2.0 , hash = 'prop_waiting_seat_01' }, -- Sillones
		{ coords = vector3(-1092.57, -258.5918, 36.75917) , dist = 2.0 , hash = 'prop_waiting_seat_01' }, -- Sillones
		{ coords = vector3(-1093.26, -258.0015, 36.76302) , dist = 2.0 , hash = 'prop_plant_int_03b' }, -- Jarron
		{ coords = vector3(-1093.26, -258.0015, 36.76302) , dist = 3.0 , hash = 'prop_plant_int_03b' }, -- Jarron

		{ coords = vector3(-1063.351, -243.149, 38.72897) , dist = 3.0 , hash = 'prop_vend_water_01' }, -- Maquina de Agua
		{ coords = vector3(-1062.962, -244.0246, 39.69569) , dist = 3.0 , hash = 'prop_vend_soda_01' }, -- Maquina de Coca
		{ coords = vector3(-1065, -239.9997, 39.64922) , dist = 3.0 , hash = 'prop_vend_snak_01' }, -- Maquina de Snak
		{ coords = vector3(-1079.667, -244.2563, 43.95742) , dist = 3.0 , hash = 'prop_arcade_01' }, -- Maquina de Snak
	}
}

--[[
	Borrar puertas [Humane]
--]]

local coordsHumane = vector3(3620.83, 3751.52, 27.69)
local DoorsHumane = {
	list = {
        { coords = vector3(3620.83, 3751.52, 27.69) , dist = 2.0 , hash = 'v_ilev_bl_shutter2' },
        { coords = vector3(3627.71, 3746.71, 27.69) , dist = 2.0 , hash = 'v_ilev_bl_shutter2' },
        { coords = vector3(3599.869, 3719.375, 29.83962) , dist = 2.0 , hash = 'v_ilev_bl_door_l' },
        { coords = vector3(3602, 3717.884, 29.83962) , dist = 2.0 , hash = 'v_ilev_bl_door_r' },
        { coords = vector3(3584.159, 3700.947, 28.97144) , dist = 2.0 , hash = 'v_ilev_bl_door_l' },
        { coords = vector3(3598.511, 3688.977, 28.97162) , dist = 2.0 , hash = 'v_ilev_bl_door_r' },
        { coords = vector3(3596.381, 3690.469, 28.97162) , dist = 2.0 , hash = 'v_ilev_bl_door_l' },
        { coords = vector3(3568.709, 3693.309, 28.27155) , dist = 2.0 , hash = 'v_ilev_bl_door_r' },
        { coords = vector3(3569.161, 3695.87, 28.27155) , dist = 2.0 , hash = 'v_ilev_bl_door_l' },
        { coords = vector3(3567.635, 3684.289, 27.1214) , dist = 2.0 , hash = 'v_ilev_bl_doorsl_r' },
        { coords = vector3(3586.29, 3699.455, 28.97144) , dist = 2.0 , hash = 'v_ilev_bl_door_r' },
        { coords = vector3(3565.074, 3684.74, 27.1214) , dist = 2.0 , hash = 'v_ilev_bl_doorsl_l' },
        { coords = vector3(3555.746, 3681.54, 27.1214) , dist = 2.0 , hash = 'v_ilev_bl_doorsl_l' },
        { coords = vector3(3558.307, 3681.088, 27.1214) , dist = 2.0 , hash = 'v_ilev_bl_doorsl_r' },
        { coords = vector3(3557.553, 3669.194, 27.12158) , dist = 2.0 , hash = 'v_ilev_bl_doorsl_r' },
        { coords = vector3(3555.435, 3664.802, 27.1214) , dist = 2.0 , hash = 'v_ilev_bl_doorsl_r' },
        { coords = vector3(3552.874, 3665.254, 27.1214) , dist = 2.0 , hash = 'v_ilev_bl_doorsl_l' },
	}
}

--[[
	Borrar puertas [Michael]
--]]
local coordsMichael = vector3(-796.5657, 177.2214, 73.04045)
local DoorsMichael = {
	list = {
		{ coords = vector3(-796.5657, 177.2214, 73.04045) , dist = 20.0 , hash = 'prop_bh1_48_backdoor_l' },
		{ coords = vector3(-794.1853, 182.568, 73.04045) , dist = 20.0 , hash = 'prop_bh1_48_backdoor_r' },
		{ coords = vector3(-816.1068, 177.5109, 72.82738) , dist = 20.0 , hash = 'v_ilev_mm_doorm_r' },
		{ coords = vector3(-816.716, 179.098, 72.82738) , dist = 20.0 , hash = 'v_ilev_mm_doorm_l' },
		{ coords = vector3(-802.7333, 167.5041, 77.58243) , dist = 20.0 , hash = 'v_ilev_mm_windowwc' },
		{ coords = vector3(-804.9543, 171.8626, 76.89033) , dist = 20.0 , hash = 'v_ilev_mm_doorw' },
		{ coords = vector3(-806.7717, 174.0235, 76.89033) , dist = 20.0 , hash = 'v_ilev_mm_doorson' },
		{ coords = vector3(-802.7017, 176.1755, 76.89033) , dist = 20.0 , hash = 'v_ilev_mm_doordaughter' },
		{ coords = vector3(-806.2817, 186.0246, 72.62405) , dist = 20.0 , hash = 'v_ilev_mm_door' },

		{ coords = vector3(-814.4891, 186.2793, 74.50242) , dist = 20.0 , hash = 'prop_ld_garaged_01' }, -- Garage
	}
}

--[[
	Borrar puertas [Chicken]
--]]
local coordsPolleria = vector3(-102.7753, 6198.007, 31.17485)
local DoorsPolleria = {
	list = {
		{ coords = vector3(-102.7753, 6198.007, 31.17485) , dist = 2.0 , hash = 'v_ilev_staffdoor' },
		{ coords = vector3(-100.9329, 6199.843, 31.17485) , dist = 2.0 , hash = 'v_ilev_staffdoor' },
		{ coords = vector3(-70.3437, 6241.089, 31.61165) , dist = 2.0 , hash = 'v_34_strips003' },
		{ coords = vector3(-91.70095, 6213.187, 31.63407) , dist = 2.0 , hash = 'v_34_strips' },
		{ coords = vector3(-78.36523, 6235.9, 31.64327) , dist = 2.0 , hash = 'v_34_strips002' },
		{ coords = vector3(-82.79638, 6218.072, 31.67706) , dist = 2.0 , hash = 'v_34_strips001' },
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

		if GetDistanceBetweenCoords(coordsLifeInvader, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoorsLifeInvader['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end

		if GetDistanceBetweenCoords(coordsHumane, GetEntityCoords(PlayerPedId())) < 500.0 then
			for k, doors in ipairs(DoorsHumane['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end

		if GetDistanceBetweenCoords(coordsMichael, GetEntityCoords(PlayerPedId())) < 500.0 then
			for k, doors in ipairs(DoorsMichael['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end

				
		if GetDistanceBetweenCoords(coordsPolleria, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(DoorsPolleria['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end

	end
end)

function deleteObject(object)
	if DoesEntityExist(object) then
		SetEntityVisible(object,false,0)

		SetEntityAsMissionEntity(object) 
		DeleteEntity(object)
	end
end