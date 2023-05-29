Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 191, b = 255, a = 100, rotate = false}

Config.ReviveReward               = 25000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'es'

Config.EarlyRespawnTimer          = 60000 * 10  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 25 -- time til the player bleeds out

Config.EnablePlayerManagement     = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           =  true
Config.EarlyRespawnFineAmount     = 50000

Config.RespawnPoint = {coords = vector3(298.72, -584.44, 43.28), heading = 48.5}

Config.Hospitals = {

 CentralLosSantos = {

        Blip = {
            coords = vector3(302.84, -586.043, 28),
            sprite = 61,
            scale = 1,
            color = 0
        },

        AmbulanceActions = {vector3(301.56, -599.12, 42.28)},

        Pharmacies = {vector3(306.4, -601.24, 42.28)},

        Vehicles = {
            {
                Spawner = vector3(294.16, -601.4, 1243.16),
                InsideShop = vector3(294.03, -605.14, 1243.21),
                Marker = {
                    type = 36,
                    x = 1.0,
                    y = 1.0,
                    z = 1.0,
                    r = 0,
                    g = 255,
                    b = 0,
                    a = 100,
                    rotate = true
                },
                SpawnPoints = {
                    {
                        coords = vector3(293.48, -605.88, 1243.2),
                        heading = 227.6,
                        radius = 4.0
                    },
                    {
                        coords = vector3(285.58, -570.77, 1243.14),
                        heading = 227.6,
                        radius = 4.0
                    },
                    {
                        coords = vector3(285.58, -570.77, 1243.14),
                        heading = 227.6,
                        radius = 6.0
                    }
                }
            }
        },

        Helicopters = {
            {
                Spawner = vector3(349.32, -594.92, 974.16),
                InsideShop = vector3(351.04, -588.64, 974.16),
                Marker = {
                    type = 34,
                    x = 1.5,
                    y = 1.5,
                    z = 1.5,
                    r = 0,
                    g = 255,
                    b = 0,
                    a = 100,
                    rotate = true
                },
                SpawnPoints = {
                    {
                        coords = vector3(351.04, -588.64, 974.16),
                        heading = 142.7,
                        radius = 10.0
                    },
                    {
                        coords = vector3(299.5, -1453.2, 946.5),
                        heading = 142.7,
                        radius = 10.0
                    }
                }
            }
        },

        FastTravels = {
            {
                From = vector3(331.64, -595.68, 42.25),
                To = {coords = vector3(339.12, -584.0, 74.16), heading = 0.0},
                Marker = {
                    type = 1,
                    x = 2.0,
                    y = 2.0,
                    z = 0.5,
                    r = 0,
                    g = 191,
                    b = 255,
                    a = 100,
                    rotate = false
                }
            }, {
                From = vector3(346.28, -582.56, 27.75),
                To = {coords = vector3(329.88, -601.04, 43.28), heading = 0.0},
                Marker = {
                    type = 1,
                    x = 2.0,
                    y = 2.0,
                    z = 0.5,
                    r = 0,
                    g = 191,
                    b = 255,
                    a = 100,
                    rotate = false
                }
            }, {
                From = vector3(338.64, -588.12, 73.16),
                To = {coords = vector3(329.44, -600.76, 43.28), heading = 138.6},
                Marker = {
                    type = 1,
                    x = 1.5,
                    y = 1.5,
                    z = 0.5,
                    r = 0,
                    g = 191,
                    b = 255,
                    a = 100,
                    rotate = false
                }
            }, {
                From = vector3(335.5, -1432.0, 45.50),
                To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
                Marker = {
                    type = 1,
                    x = 2.0,
                    y = 2.0,
                    z = 0.5,
                    r = 102,
                    g = 0,
                    b = 102,
                    a = 100,
                    rotate = false
                }
            }, {
                From = vector3(234.5, -1373.7, 20.9),
                To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
                Marker = {
                    type = 1,
                    x = 1.5,
                    y = 1.5,
                    z = 1.0,
                    r = 102,
                    g = 0,
                    b = 102,
                    a = 100,
                    rotate = false
                }
            }, {
                From = vector3(317.9, -1476.1, 28.9),
                To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
                Marker = {
                    type = 1,
                    x = 1.5,
                    y = 1.5,
                    z = 1.0,
                    r = 102,
                    g = 0,
                    b = 102,
                    a = 100,
                    rotate = false
                }
            }
        },

        FastTravelsPrompt = {
            {
                From = vector3(237.4, -1373.8, 26.0),
                To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
                Marker = {
                    type = 1,
                    x = 1.5,
                    y = 1.5,
                    z = 0.5,
                    r = 102,
                    g = 0,
                    b = 102,
                    a = 100,
                    rotate = false
                },
                Prompt = _U('fast_travel')
            }, {
                From = vector3(256.5, -1357.7, 36.0),
                To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
                Marker = {
                    type = 1,
                    x = 1.5,
                    y = 1.5,
                    z = 0.5,
                    r = 102,
                    g = 0,
                    b = 102,
                    a = 100,
                    rotate = false
                },
                Prompt = _U('fast_travel')
            }
        }

    }
}

Config.AuthorizedVehicles = {
    car = {
        ambulance = {
            {model = 'ambulance', price = 1},
            {model = 'sorento19', price = 1},
            {model = 'motobm', price = 1},
        },

        doctor = {
            {model = 'ambulance', price = 1},
            {model = 'sorento19', price = 1},
            {model = 'motobm', price = 1},
        },

        chief_doctor = {
            {model = 'ambulance', price = 1},
            {model = 'motobm', price = 1},
            {model = 'sorento19', price = 1},
            {model = 'ghispo2', price = 1},
        },

        boss = {
            {model = 'ambulance', price = 1},
            {model = 'motobm', price = 1},
            {model = 'sorento19', price = 1},
            {model = 'ghispo2', price = 1},
        },
    },

    helicopter = {
        ambulance = {},

        doctor = {{model = 'as350', price = 1}},

        chief_doctor = {{model = 'as350', price = 1}},

        boss = {{model = 'as350', price = 1}},
    }
}

