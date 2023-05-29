Config = {}

Config.WeaponAsItem = false

Config.Zones = {
    {
        license = nil, -- You can put the license here, or nil if you don't need it.
        categories = {
            {label = 'Pistolas', name = 'pistol'},
            {label = 'Arrogadisas', name = 'grenade'}
        },
        Weapons = {
            {name = 'weapon_snspistol', price = 100000, category = 'pistol'}, 
            {name = 'weapon_wrench', price = 80000, category = 'pistol'},
            {name = 'weapon_bat', price = 80000, category = 'pistol'},
            {name = 'weapon_vintagepistol', price = 120000, category = 'pistol'},
            {name = 'weapon_ball', price = 1000, category = 'grenade'},
        },
        coords = {
            vector3(-3172.0601, 1087.2197, 19.8387),
			vector3(810.3024, -2157.0671, 28.6190),
			vector3(22.1393, -1106.8175, 29.7971),
		--	vector3(127.4853, -756.8967, 262.8398)
        }
    },
    {
        
        license = 'weapon', -- You can put the license here, or nil if you don't need it.
        categories = {
            {label = 'Armas Negras', name = 'pistol'},
          --  {label = 'Arrogadisas', name = 'grenade'},
        },
        Weapons = {
           {name = 'WEAPON_SMG', price = 220000, category = 'pistol'},
           {name = 'WEAPON_SAWNOFFSHOTGUN', price = 250000, category = 'pistol'},
           {name = 'WEAPON_ASSAULTRIFLE', price = 420000, category = 'pistol'},
           {name = 'WEAPON_MOLOTOV', price = 1000000, category = 'pistol'},
          -- {name = 'WEAPON_GUSENBERG', price = 520000, category = 'pistol'},
        },
        coords = {
            vector3(2879.3132, 4489.3911, 48.2066),
        --[[    vector3(-662.1, -935.3, 20.8),
			vector3(810.2, -2157.3, 28.6),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.2, 6083.8, 30.4),
			vector3(252.3, -50.0, 68.9),
			vector3(22.0, -1107.2, 28.8),
			vector3(2567.6, 294.3, 107.7),
			vector3(-1117.5, 2698.6, 17.5),
			vector3(842.4, -1033.4, 27.1) ]]
        }
    }
}
