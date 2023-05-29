DATA = {}

DATA.Doors = {
	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vector3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vector3(434.7, -983.2, 30.8)
			}
		}
	},

	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 90.0,
		objCoords  = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objYaw = 90.0,
		objCoords  = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 90.0,
		objCoords  = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -90.0,
		objCoords  = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = -180.0,
		objCoords  = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vector3(443.9, -989.0, 30.6)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vector3(445.3, -988.7, 30.6)
			}
		}
	},



	--
	-- Mission Row Cells
	--

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -90.0,
		objCoords  = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 3
    {
        objName = 'v_ilev_ph_cellgate',
        objYaw = 90.0,
        objCoords  = vector3(461.7, -1001.9, 24.9),
        textCoords = vector3(461.6, -1002.4, 25.0),
        authorizedJobs = { 'police' },
        locked = true
    },
	-- Cell 4 -- NUEVA 1 
    {
        objName = 'v_ilev_ph_cellgate',
        objYaw = 180.0,
        objCoords  = vector3(468.15, -999.306, 25.06443),
        textCoords = vector3(468.15, -999.306, 25.06443),
        authorizedJobs = { 'police' },
        locked = true
    },

	-- Cell 5 -- NUEVA 2
    {
        objName = 'v_ilev_ph_cellgate',
        objYaw = 180.0,
        objCoords  = vector3(471.72, -999.4084, 25.06443),
        textCoords = vector3(471.72, -999.4084, 25.06443),
        authorizedJobs = { 'police' },
        locked = true
    },

	-- Cell 6 -- FONDO 1 NUEVA
    {
        objName = 'v_ilev_ph_cellgate',
        objYaw = 180.0,
        objCoords  = vector3(475.99, -1007.5142, 24.1754),
        textCoords = vector3(475.99, -1007.5142, 24.1754),
        authorizedJobs = { 'police' },
        locked = true
    },

	-- Cell 7 -- FONDO 2 NUEVA
    {
        objName = 'v_ilev_ph_cellgate',
        objYaw = 180.0,
        objCoords  = vector3(479.737, -1007.7237, 24.1754),
        textCoords = vector3(479.737, -1007.7237, 24.1754),
        authorizedJobs = { 'police' },
        locked = true
    },
	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = { 'police' },
		locked = true
	},


	-- INTERROGATORIO FONDO
    {
        objName = 'v_ilev_ph_gendoor005',
        objYaw = 180.0,
        objCoords  = vector3(490.947, -999.7237, 24.1754),
        textCoords = vector3(490.947, -999.7237, 24.1754),
        authorizedJobs = { 'police' },
        locked = true
    },

	-- INTERROGATORIO FONDO2
    {
        objName = 'v_ilev_ph_gendoor005',
        objYaw = 180.0,
        objCoords  = vector3(484.17, -999.7237, 24.1754),
        textCoords = vector3(484.17, -999.7237, 24.1754),
        authorizedJobs = { 'police' },
        locked = true
    },

	-- INTERROGATORIO FONDO ENFRENTE 1
    {
        objName = 'v_ilev_ph_gendoor006',
        objYaw = 180.0,
        objCoords  = vector3(485.17, -996.0237, 24.1754),
        textCoords = vector3(485.17, -996.0237, 24.1754),
        authorizedJobs = { 'police' },
        locked = true
    },

	-- INTERROGATORIO FONDO ENFRENTE 1
    {
        objName = 'v_ilev_ph_gendoor006',
        objYaw = 180.0,
        objCoords  = vector3(490.17, -995.4337, 24.1754),
        textCoords = vector3(490.17, -995.4337, 24.1754),
        authorizedJobs = { 'police' },
        locked = true
    },





-- MECANICOS



----------------------------

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 0.0,
				objCoords  = vector3(467.3, -1014.4, 26.5)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 180.0,
				objCoords  = vector3(469.9, -1014.4, 26.5)
			}
		}
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objYaw = 90.0,
		objCoords  = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	},

	-- principal bank
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vector3(261.99899291992,221.50576782227,106.68346405029),
		textCoords = vector3(261.99899291992,221.50576782227,106.68346405029),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	--
	-- Sandy Shores - COMISARIA
	--
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 120.0,
		objCoords  = vector3(1850.96, 3682.89, 34.29),
		textCoords = vector3(1850.96, 3682.89, 34.29),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1
	},
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 30.0,
		objCoords  = vector3(1856.71, 3689.69, 34.29),
		textCoords = vector3(1856.71, 3689.69, 34.29),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1
	},
		{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 30.0,
		objCoords  = vector3(1848.71, 3690.49, 34.29),
		textCoords = vector3(1848.71, 3690.49, 34.29),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1
	},
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 120.0,
		objCoords  = vector3(1848.37, 3681.49, 34.29),
		textCoords = vector3(1848.37, 3681.49, 34.29),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -60.0,
		objCoords  = vector3(1845.93, 3685.26, 34.29),
		textCoords = vector3(1845.93, 3685.26, 34.29),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	}
}