Zones = {

    [1] = { -- Spawn (Plaza cubos)
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 200.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(192.9, -942.4, 30.69)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    deslimitoVelocidad(self)
                    ExitSafezone(self)
                end,
                inside = function(self)
                    limitoVelocidad(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },
    [2] = { -- Hospital Ciudad
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 100.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(311.9, -587.17, 43.78)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },
    [3] = { -- Garage taller
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 50.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-463.18667602539, -796.08837890625, 32.280166625977)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },
    [4] = { -- Garage Norte
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 50.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-341.82168579102, 290.17959594727, 85.80152130127)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [5] = { -- Garage Playa
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 40.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-2182.7404785156, -385.27191162109, 14.160321235657)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [6] = { -- Garage Aeropuerto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 30.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-938.28314208984, -2445.0222167969, 13.830642700195)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [7] = { -- Garage Taller Davis
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 30.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(721.12286376953, -2124.9020996094, 29.219350814819)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [8] = { -- Garage Casino
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 35.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(898.40991210938, -59.706588745117, 78.764022827148)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [9] = { -- Garage Sandy
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 25.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(1696.7888183594, 3604.5126953125, 35.464935302734)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [10] = { -- Hospital Sandy
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(1839.0543212891, 3680.8505859375, 33.493835449219)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [11] = { -- Hospital Paleto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 40.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-253.21891784668, 6319.853515625, 33.555011749268)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [12] = { -- Tienda ropa Paleto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(8.9088258743286, 6513.4853515625, 31.972654342651)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },



    [16] = { -- Tienda ropa Paleto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(1190.5500488281, 2713.4409179688, 39.0)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [17] = { -- Tienda ropa Paleto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-3172.49609375, 1048.1330566406, 21.0)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },


    [19] = { -- Tienda ropa Paleto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-703.77600097656, -152.25799560547, 37.998672485352)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [20] = { -- Tienda ropa Paleto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-167.8630065918, -298.96899414063, 40.0)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [21] = { -- Tienda ropa Paleto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(123.64600372314, -219.44000244141, 54.999240875244)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [22] = { -- Tienda ropa Paleto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-1193.4176025391, -772.26275634766, 18.0)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },


    [24] = { -- Tienda ropa Paleto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(428.69400024414, -800.10601806641, 30.0)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [25] = { -- Tienda ropa Paleto
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(72.26091003418, -1399.1020507813, 30.0)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [26] = { -- Tienda Máscaras playa
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-1337.9569091797, -1277.2727050781, 4.8841147422791)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [27] = { -- Central Basura
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 35.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-339.5451965332, -1528.9000244141, 28.754190444946)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },


    [29] = { -- Conce normal
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 30.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-40.656505584717, -1097.0021972656, 26.999307632446)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [30] = { -- Conce VIP
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 30.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-1995.4990234375, -330.46575927734, 45.0)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [34] = { -- Barbería
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(1931.4976806641, 3729.6999511719, 33.0)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },


    [36] = { -- Barbería
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 15.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-32.901256561279, -152.29878234863, 58.0)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },


    [38] = { -- Motel Patera
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 24.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(305.33950805664, -1090.3929443359, 29.419519424438)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [39] = { -- Motel Rico
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 40.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(-613.56805419922, 46.037227630615, 45.660587310791)},
            ['action'] = {
                onEnter = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    ExitSafezone(self)
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [40] = { -- ZONA ROJA PUERTO
        ['zone'] = {
            ['type'] = 'sphere', -- avaiable types: box, sphere, poly
            ['thickness'] = 2,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 360.0,
            -- if a box zone
            ['size'] = vec3(150, 165, 100),
            ['rotation'] = 38.0,
            ['coords'] = {vec3(1078.84, -3169.87, 5.9)},
            ['action'] = {
                onEnter = function(self)
                    --exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    --exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    salgoZonaRoja(self)
                end,
                inside = function(self)
                    entroZonaRoja(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = -348.789551,
                    ['Y'] = -874.373169,
                    ['Z'] = 31.318018
                },
                ['color'] = 80,
                ['radius'] = 70.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 255.250198,
                    ['Y'] = 226.070358,
                    ['Z'] = 101.882225
                },
                ['color'] = 0,
                ['scale'] = 1.0,
                ['display'] = 1,
                ['sprite'] = 108,
                ['text'] = 'Safezone'
            }
        }
    },

    [42] = { -- Zona roja motel sandy
        ['zone'] = {
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(1544.9185791016, 3745.5727539063, 34.440093994141), vec3(1317.2794189453, 3648.5205078125, 33.091625213623), 
                          vec3(1348.2758789063, 3561.1193847656, 34.972846984863), vec3(1467.8963623047, 3603.748046875, 34.778839111328),
                          vec3(1523.3354492188, 3496.7648925781, 36.388084411621), vec3(1631.4663085938, 3549.470703125, 35.660934448242),
                          vec3(1577.8297119141, 3648.3881835938, 34.337596893311), vec3(1591.7296142578, 3674.5346679688, 34.372486114502)},
            ['action'] = {
                onEnter = function(self)
                    --exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
                end,
                onExit = function(self)
                    --exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                    salgoZonaRoja(self)
                end,
                inside = function(self)
                    entroZonaRoja(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 961.608521,
                    ['Y'] = 47.366985,
                    ['Z'] = 95.833252
                },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 961.608521,
                    ['Y'] = 47.366985,
                    ['Z'] = 95.833252
                },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Casino'
            }
        }
    },

    [43] = { -- PEPA
    ['zone'] = {
        ['type'] = 'sphere', -- avaiable types: box, sphere, poly
        ['thickness'] = 2,
        ['debug'] = false,
        -- if a sphere zone
        ['radius'] = 100.0,
        -- if a box zone
        ['size'] = vec3(1, 1, 1),
        ['rotation'] = 45.0,
        ['coords'] = {vec3(58.164058685303, 3701.3884277344, 39.754978179932)},
        ['action'] = {
            onEnter = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
            end,
            onExit = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                salgoZonaRoja(self)
            end,
            inside = function(self)
                entroZonaRoja(self)
            end
        }
    },
    ['blip'] = {
        ['blip_radius'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = -348.789551,
                ['Y'] = -874.373169,
                ['Z'] = 31.318018
            },
            ['color'] = 80,
            ['radius'] = 70.0,
            ['alpha'] = 70
        },
        ['blip_marker'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = 255.250198,
                ['Y'] = 226.070358,
                ['Z'] = 101.882225
            },
            ['color'] = 0,
            ['scale'] = 1.0,
            ['display'] = 1,
            ['sprite'] = 108,
            ['text'] = 'Safezone'
        }
    }
    },

    [44] = { -- PROCESO COCA
    ['zone'] = {
        ['type'] = 'sphere', -- avaiable types: box, sphere, poly
        ['thickness'] = 2,
        ['debug'] = false,
        -- if a sphere zone
        ['radius'] = 35.0,
        -- if a box zone
        ['size'] = vec3(1, 1, 1),
        ['rotation'] = 45.0,
        ['coords'] = {vec3(1689.1466064453, 3290.7463378906, 41.146503448486)},
        ['action'] = {
            onEnter = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
            end,
            onExit = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                salgoZonaRoja(self)
            end,
            inside = function(self)
                entroZonaRoja(self)
            end
        }
    },
    ['blip'] = {
        ['blip_radius'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = -348.789551,
                ['Y'] = -874.373169,
                ['Z'] = 31.318018
            },
            ['color'] = 80,
            ['radius'] = 70.0,
            ['alpha'] = 70
        },
        ['blip_marker'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = 255.250198,
                ['Y'] = 226.070358,
                ['Z'] = 101.882225
            },
            ['color'] = 0,
            ['scale'] = 1.0,
            ['display'] = 1,
            ['sprite'] = 108,
            ['text'] = 'Safezone'
        }
    }
    },

    [45] = { -- FARM COCA
    ['zone'] = {
        ['type'] = 'sphere', -- avaiable types: box, sphere, poly
        ['thickness'] = 2,
        ['debug'] = false,
        -- if a sphere zone
        ['radius'] = 50.0,
        -- if a box zone
        ['size'] = vec3(1, 1, 1),
        ['rotation'] = 45.0,
        ['coords'] = {vec3(-289.05963134766, 2509.7905273438, 74.313873291016)},
        ['action'] = {
            onEnter = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
            end,
            onExit = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                salgoZonaRoja(self)
            end,
            inside = function(self)
                entroZonaRoja(self)
            end
        }
    },
    ['blip'] = {
        ['blip_radius'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = -348.789551,
                ['Y'] = -874.373169,
                ['Z'] = 31.318018
            },
            ['color'] = 80,
            ['radius'] = 70.0,
            ['alpha'] = 70
        },
        ['blip_marker'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = 255.250198,
                ['Y'] = 226.070358,
                ['Z'] = 101.882225
            },
            ['color'] = 0,
            ['scale'] = 1.0,
            ['display'] = 1,
            ['sprite'] = 108,
            ['text'] = 'Safezone'
        }
    }
    },

    [46] = { -- PROCESO HEROINA
    ['zone'] = {
        ['type'] = 'sphere', -- avaiable types: box, sphere, poly
        ['thickness'] = 2,
        ['debug'] = false,
        -- if a sphere zone
        ['radius'] = 40.0,
        -- if a box zone
        ['size'] = vec3(1, 1, 1),
        ['rotation'] = 45.0,
        ['coords'] = {vec3(1451.5161132813, 6353.052734375, 23.808963775635)},
        ['action'] = {
            onEnter = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
            end,
            onExit = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                salgoZonaRoja(self)
            end,
            inside = function(self)
                entroZonaRoja(self)
            end
        }
    },
    ['blip'] = {
        ['blip_radius'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = -348.789551,
                ['Y'] = -874.373169,
                ['Z'] = 31.318018
            },
            ['color'] = 80,
            ['radius'] = 70.0,
            ['alpha'] = 70
        },
        ['blip_marker'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = 255.250198,
                ['Y'] = 226.070358,
                ['Z'] = 101.882225
            },
            ['color'] = 0,
            ['scale'] = 1.0,
            ['display'] = 1,
            ['sprite'] = 108,
            ['text'] = 'Safezone'
        }
    }
    },

    [47] = { -- FARM HEROINA
    ['zone'] = {
        ['type'] = 'sphere', -- avaiable types: box, sphere, poly
        ['thickness'] = 2,
        ['debug'] = false,
        -- if a sphere zone
        ['radius'] = 150.0,
        -- if a box zone
        ['size'] = vec3(1, 1, 1),
        ['rotation'] = 45.0,
        ['coords'] = {vec3(314.80505371094, 4385.7543945313, 59.492698669434)},
        ['action'] = {
            onEnter = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
            end,
            onExit = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                salgoZonaRoja(self)
            end,
            inside = function(self)
                entroZonaRoja(self)
            end
        }
    },
    ['blip'] = {
        ['blip_radius'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = -348.789551,
                ['Y'] = -874.373169,
                ['Z'] = 31.318018
            },
            ['color'] = 80,
            ['radius'] = 70.0,
            ['alpha'] = 70
        },
        ['blip_marker'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = 255.250198,
                ['Y'] = 226.070358,
                ['Z'] = 101.882225
            },
            ['color'] = 0,
            ['scale'] = 1.0,
            ['display'] = 1,
            ['sprite'] = 108,
            ['text'] = 'Safezone'
        }
    }
    },

    [48] = { -- PROCESO MARIHUANA
    ['zone'] = {
        ['type'] = 'sphere', -- avaiable types: box, sphere, poly
        ['thickness'] = 2,
        ['debug'] = false,
        -- if a sphere zone
        ['radius'] = 60.0,
        -- if a box zone
        ['size'] = vec3(1, 1, 1),
        ['rotation'] = 45.0,
        ['coords'] = {vec3(2344.974609375, 2564.9233398438, 46.6676902771)},
        ['action'] = {
            onEnter = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
            end,
            onExit = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                salgoZonaRoja(self)
            end,
            inside = function(self)
                entroZonaRoja(self)
            end
        }
    },
    ['blip'] = {
        ['blip_radius'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = -348.789551,
                ['Y'] = -874.373169,
                ['Z'] = 31.318018
            },
            ['color'] = 80,
            ['radius'] = 70.0,
            ['alpha'] = 70
        },
        ['blip_marker'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = 255.250198,
                ['Y'] = 226.070358,
                ['Z'] = 101.882225
            },
            ['color'] = 0,
            ['scale'] = 1.0,
            ['display'] = 1,
            ['sprite'] = 108,
            ['text'] = 'Safezone'
        }
    }
    },

    [49] = { -- FARMEO MARIHUANA
    ['zone'] = {
        ['type'] = 'sphere', -- avaiable types: box, sphere, poly
        ['thickness'] = 2,
        ['debug'] = false,
        -- if a sphere zone
        ['radius'] = 60.0,
        -- if a box zone
        ['size'] = vec3(1, 1, 1),
        ['rotation'] = 45.0,
        ['coords'] = {vec3(2215.9458007813, 5593.3999023438, 53.879577636719)},
        ['action'] = {
            onEnter = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
            end,
            onExit = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                salgoZonaRoja(self)
            end,
            inside = function(self)
                entroZonaRoja(self)
            end
        }
    },
    ['blip'] = {
        ['blip_radius'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = -348.789551,
                ['Y'] = -874.373169,
                ['Z'] = 31.318018
            },
            ['color'] = 80,
            ['radius'] = 70.0,
            ['alpha'] = 70
        },
        ['blip_marker'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = 255.250198,
                ['Y'] = 226.070358,
                ['Z'] = 101.882225
            },
            ['color'] = 0,
            ['scale'] = 1.0,
            ['display'] = 1,
            ['sprite'] = 108,
            ['text'] = 'Safezone'
        }
    }
    },
    [50] = { -- Meca RED LINE
    ['zone'] = {
        ['type'] = 'sphere', -- avaiable types: box, sphere, poly
        ['thickness'] = 2,
        ['debug'] = false,
        -- if a sphere zone
        ['radius'] = 50.0,
        -- if a box zone
        ['size'] = vec3(1, 1, 1),
        ['rotation'] = 45.0,
        ['coords'] = {vec3(274.01, -178.83, 54.06)},
        ['action'] = {
            onEnter = function(self)
                exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
            end,
            onExit = function(self)
                exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                ExitSafezone(self)
            end,
            inside = function(self)
                InsideSafeZone(self)
            end
        }
    },
    ['blip'] = {
        ['blip_radius'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = -348.789551,
                ['Y'] = -874.373169,
                ['Z'] = 31.318018
            },
            ['color'] = 80,
            ['radius'] = 70.0,
            ['alpha'] = 70
        },
        ['blip_marker'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = 255.250198,
                ['Y'] = 226.070358,
                ['Z'] = 101.882225
            },
            ['color'] = 0,
            ['scale'] = 1.0,
            ['display'] = 1,
            ['sprite'] = 108,
            ['text'] = 'Safezone'
        }
    }
},



[52] = { -- Armería
['zone'] = {
    ['type'] = 'sphere', -- avaiable types: box, sphere, poly
    ['thickness'] = 2,
    ['debug'] = false,
    -- if a sphere zone
    ['radius'] = 80.0,
    -- if a box zone
    ['size'] = vec3(1, 1, 1),
    ['rotation'] = 45.0,
    ['coords'] = {vec3(65.51, -1120.99, 29.29)}, 
    ['action'] = {
        onEnter = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
        end,
        onExit = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
            ExitSafezone(self)
        end,
        inside = function(self)
            InsideSafeZone(self)
        end
    }
},
['blip'] = {
    ['blip_radius'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = -348.789551,
            ['Y'] = -874.373169,
            ['Z'] = 31.318018
        },
        ['color'] = 80,
        ['radius'] = 70.0,
        ['alpha'] = 70
    },
    ['blip_marker'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = 255.250198,
            ['Y'] = 226.070358,
            ['Z'] = 101.882225
        },
        ['color'] = 0,
        ['scale'] = 1.0,
        ['display'] = 1,
        ['sprite'] = 108,
        ['text'] = 'Safezone'
    }
}
},


[54] = { -- POLLE
    ['zone'] = {
        ['type'] = 'poly', -- avaiable types: box, sphere, poly
        ['thickness'] = 64,
        ['debug'] = false,
        -- if a sphere zone
        ['radius'] = 60.0,
        -- if a box zone
        ['size'] = vec3(1, 1, 1),
        ['rotation'] = 45.0,
        ['coords'] = {vec3(-272.21966552734, 6080.2016601563, 32.095085144043), vec3(-168.33456420898, 5991.205078125, 40.625591278076), 
                      vec3(61.192283630371, 6214.8286132813, 34.841117858887), vec3(-23.293487548828, 6325.61328125, 31.375940322876)},
        ['action'] = {
            onEnter = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
            end,
            onExit = function(self)
                --exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
                salgoZonaRoja(self)
            end,
            inside = function(self)
                entroZonaRoja(self)
            end
        }
    },
    ['blip'] = {
        ['blip_radius'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = 961.608521,
                ['Y'] = 47.366985,
                ['Z'] = 95.833252
            },
            ['color'] = 80,
            ['radius'] = 60.0,
            ['alpha'] = 70
        },
        ['blip_marker'] = {
            ['enabled'] = false,
            ['coords'] = {
                ['X'] = 961.608521,
                ['Y'] = 47.366985,
                ['Z'] = 95.833252
            },
            ['color'] = 0,
            ['scale'] = 0.8,
            ['display'] = 4,
            ['sprite'] = 680,
            ['text'] = 'Casino'
        }
    }
},

[55] = { -- Meca los santos (bennys)
['zone'] = {
    ['type'] = 'sphere', -- avaiable types: box, sphere, poly
    ['thickness'] = 2,
    ['debug'] = false,
    -- if a sphere zone
    ['radius'] = 40.0,
    -- if a box zone
    ['size'] = vec3(1, 1, 1),
    ['rotation'] = 45.0,
    ['coords'] = {vec3(-216.83,  -1326.97, 30.91)}, 
    ['action'] = {
        onEnter = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
        end,
        onExit = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
            ExitSafezone(self)
        end,
        inside = function(self)
            InsideSafeZone(self)
        end
    }
},
['blip'] = {
    ['blip_radius'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = -348.789551,
            ['Y'] = -874.373169,
            ['Z'] = 31.318018
        },
        ['color'] = 80,
        ['radius'] = 70.0,
        ['alpha'] = 70
    },
    ['blip_marker'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = 255.250198,
            ['Y'] = 226.070358,
            ['Z'] = 101.882225
        },
        ['color'] = 0,
        ['scale'] = 1.0,
        ['display'] = 1,
        ['sprite'] = 108,
        ['text'] = 'Safezone'
    }
}
},

[56] = { -- Casino adentro
['zone'] = {
    ['type'] = 'sphere', -- avaiable types: box, sphere, poly
    ['thickness'] = 2,
    ['debug'] = false,
    -- if a sphere zone
    ['radius'] = 60.0,
    -- if a box zone
    ['size'] = vec3(1, 1, 1),
    ['rotation'] = 45.0,
    ['coords'] = {vec3(1131.6385498047, 250.03073120117, -49.768218994141)}, 
    ['action'] = {
        onEnter = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
        end,
        onExit = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
            ExitSafezone(self)
        end,
        inside = function(self)
            InsideSafeZone(self)
        end
    }
},
['blip'] = {
    ['blip_radius'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = -348.789551,
            ['Y'] = -874.373169,
            ['Z'] = 31.318018
        },
        ['color'] = 80,
        ['radius'] = 70.0,
        ['alpha'] = 70
    },
    ['blip_marker'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = 255.250198,
            ['Y'] = 226.070358,
            ['Z'] = 101.882225
        },
        ['color'] = 0,
        ['scale'] = 1.0,
        ['display'] = 1,
        ['sprite'] = 108,
        ['text'] = 'Safezone'
    }
}
},

[58] = { -- Meca los santos
['zone'] = {
    ['type'] = 'sphere', -- avaiable types: box, sphere, poly
    ['thickness'] = 2,
    ['debug'] = false,
    -- if a sphere zone
    ['radius'] = 80.0,
    -- if a box zone
    ['size'] = vec3(1, 1, 1),
    ['rotation'] = 45.0,
    ['coords'] = {vec3(-378.79,  -118.97, 38.69)},
    ['action'] = {
        onEnter = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
        end,
        onExit = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
            ExitSafezone(self)
        end,
        inside = function(self)
            InsideSafeZone(self)
        end
    }
},
['blip'] = {
    ['blip_radius'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = -348.789551,
            ['Y'] = -874.373169,
            ['Z'] = 31.318018
        },
        ['color'] = 80,
        ['radius'] = 70.0,
        ['alpha'] = 70
    },
    ['blip_marker'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = 255.250198,
            ['Y'] = 226.070358,
            ['Z'] = 101.882225
        },
        ['color'] = 0,
        ['scale'] = 1.0,
        ['display'] = 1,
        ['sprite'] = 108,
        ['text'] = 'Safezone'
    }
}
},
[59] = { -- Carcel.
['zone'] = {
    ['type'] = 'sphere', -- avaiable types: box, sphere, poly
    ['thickness'] = 2,
    ['debug'] = false,
    -- if a sphere zone
    ['radius'] = 160.0,
    -- if a box zone
    ['size'] = vec3(1, 1, 1),
    ['rotation'] = 45.0,
    ['coords'] = {vec3(1700.93,  2601.77, 45.56)},
    ['action'] = {
        onEnter = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
        end,
        onExit = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
            ExitSafezone(self)
        end,
        inside = function(self)
            InsideSafeZone(self)
        end
    }
},
['blip'] = {
    ['blip_radius'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = -348.789551,
            ['Y'] = -874.373169,
            ['Z'] = 31.318018
        },
        ['color'] = 80,
        ['radius'] = 70.0,
        ['alpha'] = 70
    },
    ['blip_marker'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = 255.250198,
            ['Y'] = 226.070358,
            ['Z'] = 101.882225
        },
        ['color'] = 0,
        ['scale'] = 1.0,
        ['display'] = 1,
        ['sprite'] = 108,
        ['text'] = 'Safezone'
    }
}
},

[60] = { -- Mineria
['zone'] = {
    ['type'] = 'sphere', -- avaiable types: box, sphere, poly
    ['thickness'] = 2,
    ['debug'] = false,
    -- if a sphere zone
    ['radius'] = 100.0,
    -- if a box zone
    ['size'] = vec3(1, 1, 1),
    ['rotation'] = 45.0,
    ['coords'] = {vec3(2952.05, 2752.41, 43.42)}, 
    ['action'] = {
        onEnter = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
        end,
        onExit = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
            ExitSafezone(self)
        end,
        inside = function(self)
            InsideSafeZone(self)
        end
    }
},
['blip'] = {
    ['blip_radius'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = -348.789551,
            ['Y'] = -874.373169,
            ['Z'] = 31.318018
        },
        ['color'] = 80,
        ['radius'] = 70.0,
        ['alpha'] = 70
    },
    ['blip_marker'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = 255.250198,
            ['Y'] = 226.070358,
            ['Z'] = 101.882225
        },
        ['color'] = 0,
        ['scale'] = 1.0,
        ['display'] = 1,
        ['sprite'] = 108,
        ['text'] = 'Safezone'
    }
}
},

[57] = { -- Casino adentro
['zone'] = {
    ['type'] = 'sphere', -- avaiable types: box, sphere, poly
    ['thickness'] = 2,
    ['debug'] = false,
    -- if a sphere zone
    ['radius'] = 50.0,
    -- if a box zone
    ['size'] = vec3(1, 1, 1),
    ['rotation'] = 45.0,
    ['coords'] = {vec3(-225.64, 6232.3, 37.34)},
    ['action'] = {
        onEnter = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Estás en una zona segura', 3500, 'info')
        end,
        onExit = function(self)
            exports['okokNotify']:Alert("SERVIDOR", 'Saliste de la zona segura', 3500, 'info')
            ExitSafezone(self)
        end,
        inside = function(self)
            InsideSafeZone(self)
        end
    }
},
['blip'] = {
    ['blip_radius'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = -348.789551,
            ['Y'] = -874.373169,
            ['Z'] = 31.318018
        },
        ['color'] = 80,
        ['radius'] = 70.0,
        ['alpha'] = 70
    },
    ['blip_marker'] = {
        ['enabled'] = false,
        ['coords'] = {
            ['X'] = 255.250198,
            ['Y'] = 226.070358,
            ['Z'] = 101.882225
        },
        ['color'] = 0,
        ['scale'] = 1.0,
        ['display'] = 1,
        ['sprite'] = 108,
        ['text'] = 'Safezone'
    }
}
}


    --[[ Casino using Poly
    [100] = {
        ['zone'] = {
            ['type'] = 'poly', -- avaiable types: box, sphere, poly
            ['thickness'] = 64,
            ['debug'] = false,
            -- if a sphere zone
            ['radius'] = 60.0,
            -- if a box zone
            ['size'] = vec3(1, 1, 1),
            ['rotation'] = 45.0,
            ['coords'] = {vec3(926.0, 80.0, 79.0), vec3(949.34997558594, 108.65000152588, 79.0),
                          vec3(1021.650024414, 63.0, 79.0), vec3(964.95001220704, -26.5, 79.0),
                          vec3(968.65002441406, -28.75, 79.0), vec3(962.65002441406, -38.849998474122, 79.0),
                          vec3(872.5, 17.85000038147, 79.0)},
            ['action'] = {
                onEnter = function(self)
                    print('[DEBUG] Entered casino.')
                    SwitchDimension(16000) -- Switch to custom dimension
                end,
                onExit = function(self)
                    print('[DEBUG]: Exiting casino')
                    SwitchDimension(1) -- Switch to default dimension
                end,
                inside = function(self)
                    InsideSafeZone(self)
                end
            }
        },
        ['blip'] = {
            ['blip_radius'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 961.608521,
                    ['Y'] = 47.366985,
                    ['Z'] = 95.833252
                },
                ['color'] = 80,
                ['radius'] = 60.0,
                ['alpha'] = 70
            },
            ['blip_marker'] = {
                ['enabled'] = false,
                ['coords'] = {
                    ['X'] = 961.608521,
                    ['Y'] = 47.366985,
                    ['Z'] = 95.833252
                },
                ['color'] = 0,
                ['scale'] = 0.8,
                ['display'] = 4,
                ['sprite'] = 680,
                ['text'] = 'Casino'
            }
        }
    }]]
}
