Config = {}

Config.DrawDistance = 20.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker = {
    type = 1,
    x = 1.5,
    y = 1.5,
    z = 0.5,
    r = 102,
    g = 0,
    b = 102,
    a = 100,
    rotate = false
}

Config.ReviveReward = 28000
Config.AntiCombatLog = true
Config.LoadIpl = false

Config.Locale = 'es'

Config.EarlyRespawnTimer = 15000 * 10
Config.BleedoutTimer = 35000 * 10

Config.EnablePlayerManagement = false

Config.RemoveWeaponsAfterRPDeath = true
Config.RemoveCashAfterRPDeath = true
Config.RemoveItemsAfterRPDeath = true

Config.EarlyRespawnFine = false
Config.EarlyRespawnFineAmount = 3000

Config.RespawnPoint = {coords = vector3(318.2338, -591.360, 43.284), heading = 65.57}

Config.Hospitals = {

    CentralLosSantos = {

        Blip = {
            coords = vector3(-804.23, -1239.22, 6.70),
            sprite = 61,
            scale = 0.7,
            color = 2
        },

        AmbulanceActions = {vector3(-819.24, -1238.85, 6.70)},

        Pharmacies = {vector3(-813.54, -1240.91, 6.70)},

        Vehicles = {
            {
                Spawner = vector3(-821.46, -1216.58, 6.70),
                InsideShop = vector3(-816.12, -1200.54, 6.70),
                Marker = {
                    type = 3,
                    x = 1.0,
                    y = 1.0,
                    z = 1.0,
                    r = 100,
                    g = 50,
                    b = 200,
                    a = 100,
                    rotate = true
                },
                SpawnPoints = {
                    {
                        coords = vector3(-819.09, -1198.08, 6.60),
                        heading = 142.18,
                        radius = 4.0
                    },
                    {
                        coords = vector3(-819.09, -1198.08, 6.60),
                        heading = 142.18,
                        radius = 4.0
                    },
                    {
                        coords = vector3(-819.09, -1198.08, 6.60),
                        heading = 142.18,
                        radius = 4.0
                    }
                }
            }
        },

        Helicopters = {
            {
                Spawner = vector3(-854.03, -1233.83, 14.60),
                InsideShop = vector3(-854.03, -1233.83, 14.60),
                Marker = {
                    type = 34,
                    x = 1.5,
                    y = 1.5,
                    z = 1.5,
                    r = 100,
                    g = 150,
                    b = 150,
                    a = 100,
                    rotate = true
                },
                SpawnPoints = {
                    {
                        coords = vector3(-845.25, -1242.81, 14.60),
                        heading = 226.2,
                        radius = 10.0
                    },
                    {
                        coords = vector3(-845.25, -1242.81, 14.60),
                        heading = 226.2,
                        radius = 10.0
                    }
                }
            }
        },

        FastTravels = {
            {
                From = vector3(294.7, -1448.1, 29.0),
                To = {coords = vector3(272.8, -1358.8, 23.0), heading = 0.0},
                Marker = {
                    type = 3,
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
                From = vector3(275.3, -1361, 23.0),
                To = {coords = vector3(295.8, -1446.5, 28.9), heading = 0.0},
                Marker = {
                    type = 3,
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
                From = vector3(247.3, -1371.5, 23.5),
                To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
                Marker = {
                    type = 3,
                    x = 1.5,
                    y = 1.5,
                    z = 0.5,
                    r = 102,
                    g = 0,
                    b = 102,
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
                From = vector3(330.17, -600.86, 43.28),
                To = {coords = vector3(338.67, -585.37, 74.16), heading = 0.0},
                Marker = {
                    type = 3,
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
                From = vector3(338.99, -583.52, 74.16),
                To = {coords = vector3(331.54, -595.5, 43.28), heading = 0.0},
                Marker = {
                    type = 3,
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
        ambulance = {{model = 'vittalcamioneta', price = 1}},


        doctor = {{model = 'vittalcamioneta', price = 1}},


        chief_doctor = {{model = 'vittalcamioneta', price = 1}},


        boss = {{model = 'vittalcamioneta', price = 1}},
    },

    helicopter = {
        ambulance = {},

        doctor = {{model = 'buzzard2', price = 1}},

        chief_doctor = {
            {model = 'buzzard2', price = 1},
            {model = 'seasparrow', price = 1},
        },

        boss = {
            {model = 'buzzard2', price = 1},
            {model = 'seasparrow', price = 1},
        }
    }
}

