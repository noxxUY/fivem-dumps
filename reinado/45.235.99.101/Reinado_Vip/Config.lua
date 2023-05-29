Config = {}

Config.TiempoToGiveReward = 15 -- Tiempo en minutos para dar el sueldo



Config.Vips = {
    {
       rolId = 929261872593637386, -- vip bronce
       SueldoBanco = 2000,  -- Sueldo en el Banco 
       SueldoBitcoin = 0, -- Sueldo en Bitcoin    
       SueldoBlack = 0, -- Sueldo en Negro
       BattlePass = false,  -- Acceso al BattlePass (DoitDigital Battlepass)


       pedInfo = {
            usePed = true, 
            pedSpawnPoint = vec3(429.7320, -811.3019, 29.4911), 
            texto = "Presiona ~r~E~w~ para cambiar de ped", 
            menuTitle = 'Menu de peds', 
            tipo = 'pedmenu',
            items = {
               {name = 'normal', label = 'Volver a la normalidad'},
               {name = 'ig_priest', label = 'Cura'},
               {name = 'ig_mrs_thornhill', label = 'Vieja'},
               {name = 'a_m_m_afriamer_01', label = '24 Nigga'},
               {name = 'A_M_M_Taco_Kid', label = 'Enano'},
               {name = 'AndersonPAAK', label = 'Anderson'},
               {name = 'chamber', label = 'Chamber'},
               {name = 'Constantine', label = 'Constantine'},
               {name = 'elmo', label = 'Elmo'},
               {name = 'IG_speedy', label = 'Speedy'},
               {name = 'ninja', label = 'Ninja'},
               {name = 'S_M_M_Snow', label = 'Astronauta'},
               {name = 'shifu', label = 'Shifu'},
               {name = 'SpidermanClassic', label = 'Spiderman Classic'},
               {name = 'tigresa', label = 'Tigresa'},
               {name = 'TravisScott', label = 'TravisScott'},
               {name = 'walter', label = 'Walter'},
               {name = 'LEGO_Ant Man', label = 'Lego Ant Man'},
               {name = 'LEGO_Batman', label = 'Lego Batman'},
               {name = 'LEGO_Bizarro Superboy', label = 'Lego Bizarro SuperBoy'},
               {name = 'LEGO_Darth Maul', label = 'Lego Darth Maul'},
               {name = 'LEGO_Deadpool', label = 'Lego Deadpool'},
               {name = 'LEGO_IronMan', label = 'Lego IronMan'},
               {name = 'LEGO_Misterio', label = 'Lego Misterio'},
               {name = 'LEGO_PowerGirl', label = 'Lego PowerGirl'},
               {name = 'LEGO_Proxima Midnight', label = 'Lego Proxima Midnight'},
               {name = 'LEGO_Wasp', label = 'Lego Wasp'},

            }
       },
       carsInfo = {
            useCars = false, 
            carSpawnPoint = vec3(215.0356, -805.8745, 30.8106), 
            SpawnVehiclePoint = vec3(238.8932, -773.8156, 30.7152), 
            texto = "~r~E~w~ para acceder al Garage Vip", 
            menuTitle = 'Menu de Autos', 
            tipo = 'carmenu',
            items = {
                'adder',
            }
       },
       helicopterInfo = {
            useHelicopter = false, 
            helicopterSpawnPoint = vec3(-724.5752, -1444.1830, 5.0005), 
            texto = "Presiona ~r~E~w~ para abrir el menu de helicoptero", 
            menuTitle = 'Menu de Helicopteros', 
            tipo = 'helicoptermenu',
            items = {
                 'frogger',
            }
       },
       weaponsInfo = {
            useWeapons = false, 
            weaponsSpawnPoint = vec3(254.0093, -704.4333, 44.6852), 
            texto = "Abrir tienda de armas ~r~E~w~", 
            menuTitle = 'Menu de Armas', 
            tipo = 'weaponmenu',
            items = {
                {label = 'Pistola', name = 'WEAPON_PISTOL', price = 1000, ammo = 100},
            }
       }
    },
    --- ADD MORE
     {
          rolId = 929262023907373077, -- Vip Plata
            SueldoBanco = 3000,  -- Sueldo en el Banco 
            SueldoBitcoin = 0, -- Sueldo en Bitcoin    
            SueldoBlack = 0, -- Sueldo en Negro
            BattlePass = false,  -- Acceso al BattlePass (DoitDigital Battlepass)
          pedInfo = {
               usePed = true, 
               pedSpawnPoint = vec3(429.7320, -811.3019, 29.4911), 
               texto = "Presiona ~r~E~w~ para cambiar de ped", 
               menuTitle = 'Menu de peds', 
               tipo = 'pedmenu',
               items = {
                    {name = 'normal', label = 'Volver a la normalidad'},
                    {name = 'ig_priest', label = 'Cura'},
                    {name = 'ig_mrs_thornhill', label = 'Vieja'},
                    {name = 'a_m_m_afriamer_01', label = '24 Nigga'},
                    {name = 'A_M_M_Taco_Kid', label = 'Enano'},
                    {name = 'AndersonPAAK', label = 'Anderson'},
                    {name = 'chamber', label = 'Chamber'},
                    {name = 'Constantine', label = 'Constantine'},
                    {name = 'elmo', label = 'Elmo'},
                    {name = 'IG_speedy', label = 'Speedy'},
                    {name = 'ninja', label = 'Ninja'},
                    {name = 'S_M_M_Snow', label = 'Astronauta'},
                    {name = 'shifu', label = 'Shifu'},
                    {name = 'SpidermanClassic', label = 'Spiderman Classic'},
                    {name = 'tigresa', label = 'Tigresa'},
                    {name = 'TravisScott', label = 'TravisScott'},
                    {name = 'walter', label = 'Walter'},
                    {name = 'LEGO_Ant Man', label = 'Lego Ant Man'},
                    {name = 'LEGO_Batman', label = 'Lego Batman'},
                    {name = 'LEGO_Bizarro Superboy', label = 'Lego Bizarro SuperBoy'},
                    {name = 'LEGO_Darth Maul', label = 'Lego Darth Maul'},
                    {name = 'LEGO_Deadpool', label = 'Lego Deadpool'},
                    {name = 'LEGO_IronMan', label = 'Lego IronMan'},
                    {name = 'LEGO_Misterio', label = 'Lego Misterio'},
                    {name = 'LEGO_PowerGirl', label = 'Lego PowerGirl'},
                    {name = 'LEGO_Proxima Midnight', label = 'Lego Proxima Midnight'},
                    {name = 'LEGO_Wasp', label = 'Lego Wasp'},
               }
          },
          carsInfo = {
               useCars = false, 
               carSpawnPoint = vec3(215.0356, -805.8745, 30.8106), 
               SpawnVehiclePoint = vec3(238.8932, -773.8156, 30.7152), 
               texto = "~r~E~w~ para acceder al Garage Vip", 
               menuTitle = 'Menu de Autos', 
               tipo = 'carmenu',
               items = {
                    'adder',
                    'banshee',
                    'bullet',
               }
          },
          helicopterInfo = {
               useHelicopter = false, 
               helicopterSpawnPoint = vec3(-724.5752, -1444.1830, 5.0005), 
               texto = "Presiona ~r~E~w~ para abrir el menu de helicoptero", 
               menuTitle = 'Menu de Helicopteros', 
               tipo = 'helicoptermenu',
               items = {
                    'frogger',
               }
          },
          weaponsInfo = {
               useWeapons = true, 
               weaponsSpawnPoint = vec3(254.0093, -704.4333, 44.6852), 
               texto = "Abrir tienda de armas ~r~E~w~", 
               menuTitle = 'Menu de Armas', 
               tipo = 'weaponmenu',
               items = {
                    {label = 'Machine Pistol', name = 'WEAPON_MACHINEPISTOL', price = 300000, ammo = 100},
                    {label = 'SMG de Asalto', name = 'WEAPON_ASSAULTSMG', price = 450000, ammo = 100},
                    {label = 'Gusenberg', name = 'WEAPON_GUSENBERG', price = 350000, ammo = 100},
                    {label = 'Bengala', name = 'WEAPON_FLARE', price = 50000, ammo = 10},
                    {label = 'Botella de Vidrio', name = 'WEAPON_BOTTLE', price = 50000, ammo = 1},
               }
          }
     },
     --- ADD MORE
     {
          rolId = 929262040177070080, -- Vip Oro
            SueldoBanco = 5000,  -- Sueldo en el Banco 
            SueldoBitcoin = 0, -- Sueldo en Bitcoin    
            SueldoBlack = 2000, -- Sueldo en Negro
            BattlePass = false,  -- Acceso al BattlePass (DoitDigital Battlepass)
          pedInfo = {
               usePed = true, 
               pedSpawnPoint = vec3(429.7320, -811.3019, 29.4911), 
               texto = "Presiona ~r~E~w~ para cambiar de ped", 
               menuTitle = 'Menu de peds', 
               tipo = 'pedmenu',
               items = {
                    {name = 'normal', label = 'Volver a la normalidad'},
                    {name = 'ig_priest', label = 'Cura'},
                    {name = 'ig_mrs_thornhill', label = 'Vieja'},
                    {name = 'a_m_m_afriamer_01', label = '24 Nigga'},
                    {name = 'A_M_M_Taco_Kid', label = 'Enano'},
                    {name = 'AndersonPAAK', label = 'Anderson'},
                    {name = 'chamber', label = 'Chamber'},
                    {name = 'Constantine', label = 'Constantine'},
                    {name = 'elmo', label = 'Elmo'},
                    {name = 'IG_speedy', label = 'Speedy'},
                    {name = 'ninja', label = 'Ninja'},
                    {name = 'S_M_M_Snow', label = 'Astronauta'},
                    {name = 'shifu', label = 'Shifu'},
                    {name = 'SpidermanClassic', label = 'Spiderman Classic'},
                    {name = 'tigresa', label = 'Tigresa'},
                    {name = 'TravisScott', label = 'TravisScott'},
                    {name = 'walter', label = 'Walter'},
                    {name = 'LEGO_Ant Man', label = 'Lego Ant Man'},
                    {name = 'LEGO_Batman', label = 'Lego Batman'},
                    {name = 'LEGO_Bizarro Superboy', label = 'Lego Bizarro SuperBoy'},
                    {name = 'LEGO_Darth Maul', label = 'Lego Darth Maul'},
                    {name = 'LEGO_Deadpool', label = 'Lego Deadpool'},
                    {name = 'LEGO_IronMan', label = 'Lego IronMan'},
                    {name = 'LEGO_Misterio', label = 'Lego Misterio'},
                    {name = 'LEGO_PowerGirl', label = 'Lego PowerGirl'},
                    {name = 'LEGO_Proxima Midnight', label = 'Lego Proxima Midnight'},
                    {name = 'LEGO_Wasp', label = 'Lego Wasp'},
               }
          },
          carsInfo = {
               useCars = true, 
               carSpawnPoint = vec3(215.0356, -805.8745, 30.8106), 
               SpawnVehiclePoint = vec3(238.8932, -773.8156, 30.7152), 
               texto = "~r~E~w~ para acceder al Garage Vip", 
               menuTitle = 'Menu de Autos', 
               tipo = 'carmenu',
               items = {
                    'SRT8',
                    'S1000RR',
                    'RS62',
                    'RMODMUSTANG',
                    '718CAYMANS',
               }
          },
          helicopterInfo = {
               useHelicopter = false, 
               helicopterSpawnPoint = vec3(-724.5752, -1444.1830, 5.0005), 
               texto = "Presiona ~r~E~w~ para abrir el menu de helicoptero", 
               menuTitle = 'Menu de Helicopteros', 
               tipo = 'helicoptermenu',
               items = {
                    'frogger',
               }
          },
          weaponsInfo = {
               useWeapons = true, 
               weaponsSpawnPoint = vec3(254.0093, -704.4333, 44.6852), 
               texto = "Abrir tienda de armas ~r~E~w~", 
               menuTitle = 'Menu de Armas', 
               tipo = 'weaponmenu',
               items = {
			{label = 'Machine Pistol', name = 'WEAPON_MACHINEPISTOL', price = 300000, ammo = 100},
			{label = 'SMG de Asalto', name = 'WEAPON_ASSAULTSMG', price = 450000, ammo = 100},
			{label = 'Gusenberg', name = 'WEAPON_GUSENBERG', price = 350000, ammo = 100},
			{label = 'Bengala', name = 'WEAPON_FLARE', price = 50000, ammo = 10},
			{label = 'Botella de Vidrio', name = 'WEAPON_BOTTLE', price = 50000, ammo = 1},
			{label = 'Ap Pistol', name = 'WEAPON_APPISTOL', price = 6000000, ammo = 250},
               }
          }
     },
     --- ADD MORE
     {
          rolId = 998349941015576627, -- Vip Platino
            SueldoBanco = 7000,  -- Sueldo en el Banco 
            SueldoBitcoin = 1, -- Sueldo en Bitcoin    
            SueldoBlack = 2000, -- Sueldo en Negro
            BattlePass = false,  -- Acceso al BattlePass (DoitDigital Battlepass)
          pedInfo = {
               usePed = true, 
               pedSpawnPoint = vec3(429.7320, -811.3019, 29.4911), 
               texto = "Presiona ~r~E~w~ para cambiar de ped", 
               menuTitle = 'Menu de peds', 
               tipo = 'pedmenu',
               items = {
                    {name = 'normal', label = 'Volver a la normalidad'},
                    {name = 'ig_priest', label = 'Cura'},
                    {name = 'ig_mrs_thornhill', label = 'Vieja'},
                    {name = 'a_m_m_afriamer_01', label = '24 Nigga'},
                    {name = 'A_M_M_Taco_Kid', label = 'Enano'},
                    {name = 'AndersonPAAK', label = 'Anderson'},
                    {name = 'chamber', label = 'Chamber'},
                    {name = 'Constantine', label = 'Constantine'},
                    {name = 'elmo', label = 'Elmo'},
                    {name = 'IG_speedy', label = 'Speedy'},
                    {name = 'ninja', label = 'Ninja'},
                    {name = 'S_M_M_Snow', label = 'Astronauta'},
                    {name = 'shifu', label = 'Shifu'},
                    {name = 'SpidermanClassic', label = 'Spiderman Classic'},
                    {name = 'tigresa', label = 'Tigresa'},
                    {name = 'TravisScott', label = 'TravisScott'},
                    {name = 'walter', label = 'Walter'},
                    {name = 'LEGO_Ant Man', label = 'Lego Ant Man'},
                    {name = 'LEGO_Batman', label = 'Lego Batman'},
                    {name = 'LEGO_Bizarro Superboy', label = 'Lego Bizarro SuperBoy'},
                    {name = 'LEGO_Darth Maul', label = 'Lego Darth Maul'},
                    {name = 'LEGO_Deadpool', label = 'Lego Deadpool'},
                    {name = 'LEGO_IronMan', label = 'Lego IronMan'},
                    {name = 'LEGO_Misterio', label = 'Lego Misterio'},
                    {name = 'LEGO_PowerGirl', label = 'Lego PowerGirl'},
                    {name = 'LEGO_Proxima Midnight', label = 'Lego Proxima Midnight'},
                    {name = 'LEGO_Wasp', label = 'Lego Wasp'},
               }
          },
          carsInfo = {
               useCars = true, 
               carSpawnPoint = vec3(215.0356, -805.8745, 30.8106), 
               SpawnVehiclePoint = vec3(238.8932, -773.8156, 30.7152), 
               texto = "~r~E~w~ para acceder al Garage Vip", 
               menuTitle = 'Menu de Autos', 
               tipo = 'carmenu',
               items = {
                    'SRT8',
                    'S1000RR',
                    'RS62',
                    'RMODMUSTANG',
                    '718CAYMANS',
                    'HURPERNOV',
                    'JESKO2020',
                    'LP700R',
               }
          },
          helicopterInfo = {
               useHelicopter = false, 
               helicopterSpawnPoint = vec3(-724.5752, -1444.1830, 5.0005), 
               texto = "Presiona ~r~E~w~ para abrir el menu de helicoptero", 
               menuTitle = 'Menu de Helicopteros', 
               tipo = 'helicoptermenu',
               items = {
                    'frogger',
               }
          },
          weaponsInfo = {
               useWeapons = true, 
               weaponsSpawnPoint = vec3(254.0093, -704.4333, 44.6852), 
               texto = "Abrir tienda de armas ~r~E~w~", 
               menuTitle = 'Menu de Armas', 
               tipo = 'weaponmenu',
               items = {
                    {label = 'Machine Pistol', name = 'WEAPON_MACHINEPISTOL', price = 300000, ammo = 100},
                    {label = 'SMG de Asalto', name = 'WEAPON_ASSAULTSMG', price = 450000, ammo = 100},
                    {label = 'Gusenberg', name = 'WEAPON_GUSENBERG', price = 350000, ammo = 100},
                    {label = 'Bengala', name = 'WEAPON_FLARE', price = 50000, ammo = 10},
                    {label = 'Botella de Vidrio', name = 'WEAPON_BOTTLE', price = 50000, ammo = 1},
                    {label = 'Ap Pistol', name = 'WEAPON_APPISTOL', price = 6000000, ammo = 250},
               }
          }
     },
     --- ADD MORE
     {
          rolId = 998350146226114580, -- Vip Diamante
            SueldoBanco = 10000,  -- Sueldo en el Banco 
            SueldoBitcoin = 3, -- Sueldo en Bitcoin    
            SueldoBlack = 10000, -- Sueldo en Negro
            BattlePass = false,  -- Acceso al BattlePass (DoitDigital Battlepass)
          pedInfo = {
               usePed = true, 
               pedSpawnPoint = vec3(429.7320, -811.3019, 29.4911), 
               texto = "Presiona ~r~E~w~ para cambiar de ped", 
               menuTitle = 'Menu de peds', 
               tipo = 'pedmenu',
               items = {
                    {name = 'normal', label = 'Volver a la normalidad'},
                    {name = 'ig_priest', label = 'Cura'},
                    {name = 'ig_mrs_thornhill', label = 'Vieja'},
                    {name = 'a_m_m_afriamer_01', label = '24 Nigga'},
                    {name = 'A_M_M_Taco_Kid', label = 'Enano'},
                    {name = 'AndersonPAAK', label = 'Anderson'},
                    {name = 'chamber', label = 'Chamber'},
                    {name = 'Constantine', label = 'Constantine'},
                    {name = 'elmo', label = 'Elmo'},
                    {name = 'IG_speedy', label = 'Speedy'},
                    {name = 'ninja', label = 'Ninja'},
                    {name = 'S_M_M_Snow', label = 'Astronauta'},
                    {name = 'shifu', label = 'Shifu'},
                    {name = 'SpidermanClassic', label = 'Spiderman Classic'},
                    {name = 'tigresa', label = 'Tigresa'},
                    {name = 'TravisScott', label = 'TravisScott'},
                    {name = 'walter', label = 'Walter'},
                    {name = 'LEGO_Ant Man', label = 'Lego Ant Man'},
                    {name = 'LEGO_Batman', label = 'Lego Batman'},
                    {name = 'LEGO_Bizarro Superboy', label = 'Lego Bizarro SuperBoy'},
                    {name = 'LEGO_Darth Maul', label = 'Lego Darth Maul'},
                    {name = 'LEGO_Deadpool', label = 'Lego Deadpool'},
                    {name = 'LEGO_IronMan', label = 'Lego IronMan'},
                    {name = 'LEGO_Misterio', label = 'Lego Misterio'},
                    {name = 'LEGO_PowerGirl', label = 'Lego PowerGirl'},
                    {name = 'LEGO_Proxima Midnight', label = 'Lego Proxima Midnight'},
                    {name = 'LEGO_Wasp', label = 'Lego Wasp'},
               }
          },
          carsInfo = {
               useCars = true, 
               carSpawnPoint = vec3(215.0356, -805.8745, 30.8106), 
               SpawnVehiclePoint = vec3(238.8932, -773.8156, 30.7152), 
               texto = "~r~E~w~ para acceder al Garage Vip", 
               menuTitle = 'Menu de Autos', 
               tipo = 'carmenu',
               items = {
                    'SRT8',
                    'S1000RR',
                    'RS62',
                    'RMODMUSTANG',
                    '718CAYMANS',
                    'HURPERNOV',
                    'JESKO2020',
                    'LP700R',
                    'TAMPA4',
                    'TRX', 
                    'NISSANTITAN17',
               }
          },
          helicopterInfo = {
               useHelicopter = false, 
               helicopterSpawnPoint = vec3(-724.5752, -1444.1830, 5.0005), 
               texto = "Presiona ~r~E~w~ para abrir el menu de helicoptero", 
               menuTitle = 'Menu de Helicopteros', 
               tipo = 'helicoptermenu',
               items = {
                    'frogger',
               }
          },
          weaponsInfo = {
               useWeapons = true, 
               weaponsSpawnPoint = vec3(254.0093, -704.4333, 44.6852), 
               texto = "Abrir tienda de armas ~r~E~w~", 
               menuTitle = 'Menu de Armas', 
               tipo = 'weaponmenu',
               items = {
                    {label = 'Machine Pistol', name = 'WEAPON_MACHINEPISTOL', price = 300000, ammo = 100},
                    {label = 'SMG de Asalto', name = 'WEAPON_ASSAULTSMG', price = 450000, ammo = 100},
                    {label = 'Gusenberg', name = 'WEAPON_GUSENBERG', price = 350000, ammo = 100},
                    {label = 'Bengala', name = 'WEAPON_FLARE', price = 50000, ammo = 10},
                    {label = 'Botella de Vidrio', name = 'WEAPON_BOTTLE', price = 50000, ammo = 1},
                    {label = 'Ap Pistol', name = 'WEAPON_APPISTOL', price = 6000000, ammo = 250},
               }
          }
     },
     --- ADD MORE
     {
          rolId = 998351246626926642, -- Vip Black
            SueldoBanco = 15000,  -- Sueldo en el Banco 
            SueldoBitcoin = 5, -- Sueldo en Bitcoin    
            SueldoBlack = 20000, -- Sueldo en Negro
            BattlePass = true,  -- Acceso al BattlePass (DoitDigital Battlepass)
          pedInfo = {
               usePed = true, 
               pedSpawnPoint = vec3(429.7320, -811.3019, 29.4911), 
               texto = "Presiona ~r~E~w~ para cambiar de ped", 
               menuTitle = 'Menu de peds', 
               tipo = 'pedmenu',
               items = {
                    {name = 'normal', label = 'Volver a la normalidad'},
                    {name = 'ig_priest', label = 'Cura'},
                    {name = 'ig_mrs_thornhill', label = 'Vieja'},
                    {name = 'a_m_m_afriamer_01', label = '24 Nigga'},
                    {name = 'A_M_M_Taco_Kid', label = 'Enano'},
                    {name = 'AndersonPAAK', label = 'Anderson'},
                    {name = 'chamber', label = 'Chamber'},
                    {name = 'Constantine', label = 'Constantine'},
                    {name = 'elmo', label = 'Elmo'},
                    {name = 'IG_speedy', label = 'Speedy'},
                    {name = 'ninja', label = 'Ninja'},
                    {name = 'S_M_M_Snow', label = 'Astronauta'},
                    {name = 'shifu', label = 'Shifu'},
                    {name = 'SpidermanClassic', label = 'Spiderman Classic'},
                    {name = 'tigresa', label = 'Tigresa'},
                    {name = 'TravisScott', label = 'TravisScott'},
                    {name = 'walter', label = 'Walter'},
                    {name = 'LEGO_Ant Man', label = 'Lego Ant Man'},
                    {name = 'LEGO_Batman', label = 'Lego Batman'},
                    {name = 'LEGO_Bizarro Superboy', label = 'Lego Bizarro SuperBoy'},
                    {name = 'LEGO_Darth Maul', label = 'Lego Darth Maul'},
                    {name = 'LEGO_Deadpool', label = 'Lego Deadpool'},
                    {name = 'LEGO_IronMan', label = 'Lego IronMan'},
                    {name = 'LEGO_Misterio', label = 'Lego Misterio'},
                    {name = 'LEGO_PowerGirl', label = 'Lego PowerGirl'},
                    {name = 'LEGO_Proxima Midnight', label = 'Lego Proxima Midnight'},
                    {name = 'LEGO_Wasp', label = 'Lego Wasp'},
               }
          },
          carsInfo = {
               useCars = true, 
               carSpawnPoint = vec3(215.0356, -805.8745, 30.8106), 
               SpawnVehiclePoint = vec3(238.8932, -773.8156, 30.7152), 
               texto = "~r~E~w~ para acceder al Garage Vip", 
               menuTitle = 'Menu de Autos', 
               tipo = 'carmenu',
               items = {
                    'SRT8', 
                    'S1000RR',
                    'RS62',
                    'RMODMUSTANG',
                    '718CAYMANS',
                    'HURPERNOV',
                    'JESKO2020',
                    'LP700R',
                    'TAMPA4',
                    'TRX',
                    'NISSANTITAN17',
                    'OYCVAL',
                    'RMODGT63',
                    'C7',
                    'ABEXIGE12',
                    'AMGGTRLIGHT',
                    'URUSTC',
               }
          },
          helicopterInfo = {
               useHelicopter = true, 
               helicopterSpawnPoint = vec3(-724.5752, -1444.1830, 5.0005), 
               texto = "Presiona ~r~E~w~ para abrir el menu de helicoptero", 
               menuTitle = 'Menu de Helicopteros', 
               tipo = 'helicoptermenu',
               items = {             
                    'swift2',
                    'havok',
                    'seasparrow',
                    'volatus',
                    'seasparrow2',
               }
          },
          weaponsInfo = {
               useWeapons = true, 
               weaponsSpawnPoint = vec3(254.0093, -704.4333, 44.6852), 
               texto = "Abrir tienda de armas ~r~E~w~", 
               menuTitle = 'Menu de Armas', 
               tipo = 'weaponmenu',
               items = {
                    {label = 'Machine Pistol', name = 'WEAPON_MACHINEPISTOL', price = 300000, ammo = 100},
                    {label = 'SMG de Asalto', name = 'WEAPON_ASSAULTSMG', price = 450000, ammo = 100},
                    {label = 'Gusenberg', name = 'WEAPON_GUSENBERG', price = 350000, ammo = 100},
                    {label = 'Bengala', name = 'WEAPON_FLARE', price = 50000, ammo = 10},
                    {label = 'Botella de Vidrio', name = 'WEAPON_BOTTLE', price = 50000, ammo = 1},
                    {label = 'Ap Pistol', name = 'WEAPON_APPISTOL', price = 6000000, ammo = 250},
               }
          }
     },
     --- ADD MORE
     {
          rolId = 998351509941125141, -- Vip Reinado
            SueldoBanco = 17000,  -- Sueldo en el Banco 
            SueldoBitcoin = 7, -- Sueldo en Bitcoin    
            SueldoBlack = 30000, -- Sueldo en Negro
            BattlePass = true,  -- Acceso al BattlePass (DoitDigital Battlepass)
          pedInfo = {
               usePed = true, 
               pedSpawnPoint = vec3(429.7320, -811.3019, 29.4911), 
               texto = "Presiona ~r~E~w~ para cambiar de ped", 
               menuTitle = 'Menu de peds', 
               tipo = 'pedmenu',
               items = {
                    {name = 'normal', label = 'Volver a la normalidad'},
                    {name = 'ig_priest', label = 'Cura'},
                    {name = 'ig_mrs_thornhill', label = 'Vieja'},
                    {name = 'a_m_m_afriamer_01', label = '24 Nigga'},
                    {name = 'A_M_M_Taco_Kid', label = 'Enano'},
                    {name = 'AndersonPAAK', label = 'Anderson'},
                    {name = 'chamber', label = 'Chamber'},
                    {name = 'Constantine', label = 'Constantine'},
                    {name = 'elmo', label = 'Elmo'},
                    {name = 'IG_speedy', label = 'Speedy'},
                    {name = 'ninja', label = 'Ninja'},
                    {name = 'S_M_M_Snow', label = 'Astronauta'},
                    {name = 'shifu', label = 'Shifu'},
                    {name = 'SpidermanClassic', label = 'Spiderman Classic'},
                    {name = 'tigresa', label = 'Tigresa'},
                    {name = 'TravisScott', label = 'TravisScott'},
                    {name = 'walter', label = 'Walter'},
                    {name = 'LEGO_Ant Man', label = 'Lego Ant Man'},
                    {name = 'LEGO_Batman', label = 'Lego Batman'},
                    {name = 'LEGO_Bizarro Superboy', label = 'Lego Bizarro SuperBoy'},
                    {name = 'LEGO_Darth Maul', label = 'Lego Darth Maul'},
                    {name = 'LEGO_Deadpool', label = 'Lego Deadpool'},
                    {name = 'LEGO_IronMan', label = 'Lego IronMan'},
                    {name = 'LEGO_Misterio', label = 'Lego Misterio'},
                    {name = 'LEGO_PowerGirl', label = 'Lego PowerGirl'},
                    {name = 'LEGO_Proxima Midnight', label = 'Lego Proxima Midnight'},
                    {name = 'LEGO_Wasp', label = 'Lego Wasp'},
                    {name = 'Alex-baby', label = 'Alex Baby'},
               }
          },
          carsInfo = {
               useCars = true, 
               carSpawnPoint = vec3(215.0356, -805.8745, 30.8106), 
               SpawnVehiclePoint = vec3(238.8932, -773.8156, 30.7152), 
               texto = "~r~E~w~ para acceder al Garage Vip", 
               menuTitle = 'Menu de Autos', 
               tipo = 'carmenu',
               items = {
                    'SRT8',
                    'S1000RR',
                    'RS62',
                    'RMODMUSTANG',
                    '718CAYMANS',
                    'HURPERNOV',
                    'JESKO2020',
                    'LP700R',
                    'TAMPA4',
                    'TRX',
                    'NISSANTITAN17',
                    'OYCVAL',
                    'RMODGT63',
                    'C7',
                    'ABEXIGE12',
                    'AMGGTRLIGHT',
                    'URUSTC',
                    'rmodmi8lb',
                    'bmwm8',
                    '765ltmso',
                    'MG63PxxBK',
               }
          },
          helicopterInfo = {
               useHelicopter = true, 
               helicopterSpawnPoint = vec3(-724.5752, -1444.1830, 5.0005), 
               texto = "Presiona ~r~E~w~ para abrir el menu de helicoptero", 
               menuTitle = 'Menu de Helicopteros', 
               tipo = 'helicoptermenu',
               items = {         
                    'swift2',
                    'havok',
                    'seasparrow',
                    'volatus',
                    'seasparrow2',
               }
          },
          weaponsInfo = {
               useWeapons = true, 
               weaponsSpawnPoint = vec3(254.0093, -704.4333, 44.6852), 
               texto = "Abrir tienda de armas ~r~E~w~", 
               menuTitle = 'Menu de Armas', 
               tipo = 'weaponmenu',
               items = {
                    {label = 'Machine Pistol', name = 'WEAPON_MACHINEPISTOL', price = 300000, ammo = 100},
                    {label = 'SMG de Asalto', name = 'WEAPON_ASSAULTSMG', price = 450000, ammo = 100},
                    {label = 'Gusenberg', name = 'WEAPON_GUSENBERG', price = 350000, ammo = 100},
                    {label = 'Bengala', name = 'WEAPON_FLARE', price = 50000, ammo = 10},
                    {label = 'Botella de Vidrio', name = 'WEAPON_BOTTLE', price = 50000, ammo = 1},
                    {label = 'Ap Pistol', name = 'WEAPON_APPISTOL', price = 6000000, ammo = 250},
               }
          }
     },
     -- --- ADD MORE
     {
          rolId = 1107855568896528394, -- Los Ramax Trucha
            SueldoBanco = 0,  -- Sueldo en el Banco 
            SueldoBitcoin = 0, -- Sueldo en Bitcoin    
            SueldoBlack = 0, -- Sueldo en Negro
            BattlePass = false,  -- Acceso al BattlePass (DoitDigital Battlepass)
          pedInfo = {
               usePed = true, 
               pedSpawnPoint = vec3(429.7320, -811.3019, 29.4911), 
               texto = "Presiona ~r~E~w~ para cambiar de ped", 
               menuTitle = 'Menu de peds', 
               tipo = 'pedmenu',
               items = {
                    {name = 'normal', label = 'Volver a la normalidad'},
                    {name = 'g_m_m_chicold_01', label = 'Juan'},
                    {name = 'g_m_m_chigoon_01', label = 'Pedro'},
                    {name = 'g_m_y_salvagoon_02', label = 'Roberto'},
                    {name = 'ig_vagspeak', label = 'Carlos'},
               }
          },
          carsInfo = {
               useCars = false, 
               carSpawnPoint = vec3(215.0356, -805.8745, 30.8106), 
               SpawnVehiclePoint = vec3(238.8932, -773.8156, 30.7152), 
               texto = "~r~E~w~ para acceder al Garage Vip", 
               menuTitle = 'Menu de Autos', 
               tipo = 'carmenu',
               items = {
                    'adder',
                    'banshee',
                    'bullet',
               }
          },
          helicopterInfo = {
               useHelicopter = false, 
               helicopterSpawnPoint = vec3(-724.5752, -1444.1830, 5.0005), 
               texto = "Presiona ~r~E~w~ para abrir el menu de helicoptero", 
               menuTitle = 'Menu de Helicopteros', 
               tipo = 'helicoptermenu',
               items = {
                    'frogger',
               }
          },
          weaponsInfo = {
               useWeapons = false, 
               weaponsSpawnPoint = vec3(254.0093, -704.4333, 44.6852), 
               texto = "Abrir tienda de armas ~r~E~w~", 
               menuTitle = 'Menu de Armas', 
               tipo = 'weaponmenu',
               items = {
                    {label = 'Machine Pistol', name = 'WEAPON_MACHINEPISTOL', price = 300000, ammo = 100},
                    {label = 'SMG de Asalto', name = 'WEAPON_ASSAULTSMG', price = 450000, ammo = 100},
                    {label = 'Gusenberg', name = 'WEAPON_GUSENBERG', price = 350000, ammo = 100},
                    {label = 'Bengala', name = 'WEAPON_FLARE', price = 50000, ammo = 10},
                    {label = 'Botella de Vidrio', name = 'WEAPON_BOTTLE', price = 50000, ammo = 1},
                    {label = 'Ap Pistol', name = 'WEAPON_APPISTOL', price = 6000000, ammo = 250},
               }
          }
     },
     --- ADD MORE
     {
          rolId = 1067884691354550374, -- pase de batalla
            SueldoBanco = 0,  -- Sueldo en el Banco 
            SueldoBitcoin = 0, -- Sueldo en Bitcoin    
            SueldoBlack = 0, -- Sueldo en Negro
            BattlePass = true,  -- Acceso al BattlePass (DoitDigital Battlepass)
          pedInfo = {
               usePed = false, 
               pedSpawnPoint = vec3(429.7320, -811.3019, 29.4911), 
               texto = "Presiona ~r~E~w~ para cambiar de ped", 
               menuTitle = 'Menu de peds', 
               tipo = 'pedmenu',
               items = {
                    {name = 'normal', label = 'Volver a la normalidad'},
               }
          },
          carsInfo = {
               useCars = false, 
               carSpawnPoint = vec3(215.0356, -805.8745, 30.8106), 
               SpawnVehiclePoint = vec3(238.8932, -773.8156, 30.7152), 
               texto = "~r~E~w~ para acceder al Garage Vip", 
               menuTitle = 'Menu de Autos', 
               tipo = 'carmenu',
               items = {
                    'adder',
               }
          },
          helicopterInfo = {
               useHelicopter = false, 
               helicopterSpawnPoint = vec3(-724.5752, -1444.1830, 5.0005), 
               texto = "Presiona ~r~E~w~ para abrir el menu de helicoptero", 
               menuTitle = 'Menu de Helicopteros', 
               tipo = 'helicoptermenu',
               items = {
                    'frogger',
               }
          },
          weaponsInfo = {
               useWeapons = false, 
               weaponsSpawnPoint = vec3(254.0093, -704.4333, 44.6852), 
               texto = "Abrir tienda de armas ~r~E~w~", 
               menuTitle = 'Menu de Armas', 
               tipo = 'weaponmenu',
               items = {
                    {label = 'Machine Pistol', name = 'WEAPON_MACHINEPISTOL', price = 300000, ammo = 100},
               }
          }
     }
}




