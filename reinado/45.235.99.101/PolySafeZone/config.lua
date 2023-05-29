Zones = {
    -- Start safezones
    -- Central Garage using sphere system
    [1] = {
        ['zone'] = { -- PlazamasGarage
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
					vector3(362.9019, -1170.5668,25.6582), 
					vector3(39.1177, -1155.1301, 25.6582),
					vector3(69.1698, -1051.4187, 25.6582),
					vector3(1.0388, -1033.1471, 25.6582),
					vector3(-28.7895, -1121.0452, 25.6582),
					vector3(-125.7502, -1159.0785, 25.6582),
					vector3(-297.2772, -1156.5138, 25.6582),
					vector3(-366.7524, -1096.6553, 25.6582),
					vector3(-364.5914, -973.3667, 25.6582),
					vector3(-362.4866, -826.0776, 25.6582),
					vector3(-186.1114, -858.5161, 25.6582),
					vector3(1.5811, -924.3300, 25.6582),
					vector3(142.8542, -829.4875, 25.6582),
					vector3(248.6769, -547.4374, 25.6582),
					vector3(412.6945, -546.6857, 25.6582),
					vector3(321.8615, -834.3168, 25.6582),
					vector3(318.3115, -1067.3658, 25.6582)
            },
            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [2] = {
        ['zone'] = { -- minado
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
					vector3(2922.73, 2835.61, 50),
					vector3(2838.26, 2760.98, 50),
					vector3(2921.97, 2642.42, 50),
					vector3(2960.98, 2636.74, 50),
					vector3(3064.77, 2690.53, 50),
					vector3(3085.61, 2747.73, 50),
					vector3(2953.41, 2860.61, 50)
            },
            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [3] = { -- Spawn Pelados
        ['zone'] = { -- minado
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
				  vector3(255.8165, -994.4130, -100), -- Depa
				  vector3(266.9864, -994.2953, -100),
				  vector3(266.9794, -1008.8244, -100),
				  vector3(253.2693, -1010.1592, -100)
            },
            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [4] = { -- Fundicion
        ['zone'] = { -- minado
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
					vector3(1031.46, -1985.79, 20),
					vector3(1039.3916, -1917.26, 20),
					vector3(1110.61, -1959.85, 20),
					vector3(1133.71, -2002.27, 20),
					vector3(1106.82, -2038.64, 20)
            },
            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [5] = {  -- Carcel
        ['zone'] = { -- minado
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
					 vector3(1856.44, 2697.35, 45.5649),
					 vector3(1778.03, 2765.91, 45.5649),
					 vector3(1634.47, 2760.61, 45.5649),
					 vector3(1551.89, 2676.14, 45.5649),
					 vector3(1512.88, 2577.27, 45.5649),
					 vector3(1524.62, 2455.30, 45.5649),
					 vector3(1650.00, 2363.64, 45.5649),
					 vector3(1775.76, 2387.88, 45.5649),
					 vector3(1857.58, 2498.48, 45.5649)
            },
            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [6] = { -- Casino
        ['zone'] = { -- minado
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
                  vector3(817.80, -43.94, 65),
                  vector3(923.11, -114.39, 65),
                  vector3(953.03, -85.61, 65),
                  vector3(1053.03, 48.48, 65),
                  vector3(945.83, 105.68, 65)
            },
            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
               --     SwitchDimension(16000) -- Switch to custom dimension
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
--                    SwitchDimension(1) -- Switch to default dimension
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [7] = { -- Hospital
        ['zone'] = {
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
				 vector3(-726.89, 370.45, 70.00),
				 vector3(-736.74, 275.38, 70.00),
				 vector3(-638.64, 243.94, 70.00),
				 vector3(-541.67, 237.12, 70.00),
				 vector3(-522.35, 268.18, 70.00),
				 vector3(-518.56, 347.73, 70.00)
				 
            },
            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
             --       SwitchDimension(16000) -- Switch to custom dimension
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                --    SwitchDimension(1) -- Switch to default dimension
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [8] = { -- Lavado Nuevo
        ['zone'] = {
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
                 vector3(1867.80, 390.53, 160.27),
                 vector3(1817.42, 380.30, 160.27),
                 vector3(1806.82, 358.71, 160.27),
                 vector3(1800.00, 250.76, 160.27),
                 vector3(1832.58, 210.23, 160.27),
                 vector3(1883.33, 205.68, 160.27),
                 vector3(1964.02, 329.55, 160.27)
				 
            },
            ['action'] = {
                onEnter = function(self)
                --    -- print('[DEBUG] Entered .')				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
             --       SwitchDimension(16000) -- Switch to custom dimension
                end,
                onExit = function(self)
                --    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                --    SwitchDimension(1) -- Switch to default dimension
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [9] = { -- Bennys
        ['zone'] = {
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
				 vector3(-248.7286, -1351.3837, 29.9549),
				 vector3(-247.73, -1253.79, 29.9549),
				 vector3(-121.59, -1254.17, 29.9549),
				 vector3(-119.32, -1318.94, 29.9549),
				 vector3(-122.73, -1345.83, 29.9549)	
            },
            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
             --       SwitchDimension(16000) -- Switch to custom dimension
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                --    SwitchDimension(1) -- Switch to default dimension
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [10] = { -- Aserradero
        ['zone'] = {
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
                 vector3(-556.06, 5404.17, 50.44),
                 vector3(-622.35, 5353.41, 50.44),
                 vector3(-612.12, 5265.15, 50.44),
                 vector3(-579.92, 5210.98, 50.44),
                 vector3(-478.79, 5192.80, 50.44),
                 vector3(-428.03, 5370.45, 50.44)	
            },
            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
             --       SwitchDimension(16000) -- Switch to custom dimension
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                --    SwitchDimension(1) -- Switch to default dimension
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [11] = { -- Aserradero base
        ['zone'] = {
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {

                vector3(1233.33, -1222.73, 30.00),
                vector3(1176.89, -1227.65, 30.00),
                vector3(1117.05, -1278.41, 30.00),
                vector3(1105.68, -1373.86, 30.00),
                vector3(1108.71, -1415.15, 30.00),
                vector3(1207.95, -1418.56, 30.00),
                vector3(1225.00, -1391.67, 30.00)
            },
            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
             --       SwitchDimension(16000) -- Switch to custom dimension
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                --    SwitchDimension(1) -- Switch to default dimension
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [12] = { -- AEM Mecanicos
        ['zone'] = {
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
                vector3(796.59, -926.52, 22.00),
                vector3(796.21, -998.48, 22.00),
                vector3(849.24, -999.24, 22.00),
                vector3(850.00, -923.11, 22.00)
            },

            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
             --       SwitchDimension(16000) -- Switch to custom dimension
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                --    SwitchDimension(1) -- Switch to default dimension
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [13] = { -- Departamento
        ['zone'] = {
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
                vector3(258.9068, -1021.4022, -98.4328),
                vector3(209.5385, -1016.9783, -98.4328),
                vector3(208.7677, -955.4124, -98.4328),
                vector3(280.5800, -926.2546, -98.4328)
            },

            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
             --       SwitchDimension(16000) -- Switch to custom dimension
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                --    SwitchDimension(1) -- Switch to default dimension
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
    [14] = { -- Sandy Hospital GC y Deposito
        ['zone'] = {
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {
                vector3(1885.6033, 3675.4534, 32.4286),
                vector3(1753.1426, 3598.5112, 32.4286),
                vector3(1658.1814, 3771.9780, 32.4286),
                vector3(1779.4932, 3851.0027, 32.4286)
            },

            ['action'] = {
                onEnter = function(self)
                    -- print('[DEBUG] Entered .')
				 exports['mythic_notify']:PersistentAlert('start', 'safezoneAlert', 'success', 'Estas en zona segura')
             --       SwitchDimension(16000) -- Switch to custom dimension
                end,
                onExit = function(self)
                    -- print('[DEBUG]: Exiting ')
				exports['mythic_notify']:PersistentAlert('end', 'safezoneAlert')
				exports['mythic_notify']:DoCustomHudText('error', 'Saliste de zona segura', 3500)
                    ExitSafezone(self)
                --    SwitchDimension(1) -- Switch to default dimension
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end,
            },
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70,
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {['X'] = 1,  ['Y'] = 1, ['Z'] = 1, },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Null',
            },
        },
    },
	
	
----------


	
	
}