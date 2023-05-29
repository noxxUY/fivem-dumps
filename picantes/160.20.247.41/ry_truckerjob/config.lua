--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- SCRIPT BY REDYY#0449
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

Config = {}

--- Options ---
Config.MoneyPerDelivery = 7500 -- Money per Delivery
Config.DeliveryFinalMoney = 30000 -- Final Money
Config.ActivateDamage = true -- if true will depend on the life of the truck and will be deaccountanted from the Final Money.
Config.DeleteTruckWhenFinish = false -- Will truck be deleted when finish the job?

Config.AddDeliveryTruck = true -- Will the player have Para entregar the truck when finish the job?
Config.DeliveryTruckNotification = 'Lleva el camión de vuelta al marcador..'
Config.CoordDeliveryTruck = vector3(477.5867, -3044.5798, 6.0945) 
Config.MarkerDeliveryTruck = '[ ~g~E ~w~] Camión de regreso'
Config.VehicleDelivered = 'Has completado tu recorrido, ¡buen trabajo!'

Config.SpawnPointtrucker2 = { x = 487.0364, y = -3033.2969, z = 6.0708 } -- Where trucker2 will Spawn? 487.0364, -3033.2969, 6.0708, 266.8768
Config.TeleportPlayerToTruck = true -- Teleport Player to truck when spawn?
----

--- Messages ---
Config.ReceiveMoney = 'has recibido ' .. Config.MoneyPerDelivery .. '$ Para entrega.'
Config.ReceiveFinalMoney = 'Ganaste ' .. Config.DeliveryFinalMoney .. '$ para entrega final.'
Config.ALittleBroken = 'Parece que el camión está un poco desordenado, ganarás menos.'
Config.Broken = '¡Parece que el camión apenas no funciona! Vas a tener que pagar por eso.'
Config.NeedDeliveryFirst = '~r~Necesitas Para entregar la otra ubicación primero.'
---

--- Progress Bar ---
Config.Duration = 5000 -- In MS
Config.Label = 'Deliverying'
Config.DisableMouse = false
----

Config.Menus = {
    ['start'] = {
        name = 'Camionero',
        label = 'Iniciar un recorrido'
    },
    ['trucks'] = {
        name = 'Elige un camión',
        options = {"phantom","phantom3"}
    },
    ['trailers'] = {
        name = 'Elige una ruta',
        options = {
            ['trailers2'] = { -- Name of trailer model, can add/remove more trailers.
                name = 'Trailers2',
                route = 'route1' -- can change to route1/2/3/4.
            },
            ['trailers4'] = {  
                name = 'trailer4',
                route = 'route2' 
            },
            ['trailers3'] = {
                name = 'Trailer 3',
                route = 'route3' 
            },
            ['tanker2'] = {
                name = 'Tanker 2',
                route = 'route4' 
            }
        }
    },
    ['confirm'] = {
        name = '¿Comenzar el Trabajo?',
        yes = {label = 'si'},
        no = {label = 'No'}
    }
}

Config.Markers = {
    ['start_job'] = {
        name = 'Empezar',
        cancel = 'Cancelar',
        event = 'ry_trucker2job:start_job',
        coord = vector3(484.3574, -3050.8459, 6.2270),
        marker = {
            type = 2, -- can found in https://docs.fivem.net/docs/game-references/markers/
            size  = {x = 0.5, y = 0.5, z = 0.5},
            color = {r = 204, g = 204, b = 0}
        },
        blip = {
            Name = 'Camionero',
            Sprite = 67,
            Scale = 0.8,
            Colour = 5
        }
    },
}

Config.Routes = {
    -- Route1
    ['route1'] = {
        ['locations'] = {
            [1] = {
                active = false, -- don't change
                delivered = false, -- don't change
                event = 'ry_trucker2job:delivery', 
                coord = vector3(178.31,-3304.8,5.99),
                marker = {
                    type = 21,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            },
            [2] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:delivery', 
                coord = vector3(178.49,-3205.1,5.63),
                marker = {
                    type = 2,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            }, 
            [3] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:delivery', 
                coord = vector3(190.12,-3049.49,5.81),
                marker = {
                    type = 21,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            },
            [4] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:last_delivery', 
                coord = vector3(228.02,-2904.35,5.96),
                marker = {
                    type = 2,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            } 
        }
    },
    ['route2'] = {
        ['locations'] = {
            [1] = {
                active = false, -- don't change
                delivered = false, -- don't change
                event = 'ry_trucker2job:delivery', 
                coord = vector3(646.33,-2800.74,6.0),
                marker = {
                    type = 21,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            },
            [2] = {
                active = false, -- don't change
                delivered = false, -- don't change
                event = 'ry_trucker2job:delivery', 
                coord = vector3(188.73,-3203.74,5.79),
                marker = {
                    type = 21,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            },
            [3] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:delivery', 
                coord = vector3(2942.02,2800.73,40.99),
                marker = {
                    type = 21,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            },
            [4] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:last_delivery', 
                coord = vector3(-494.19,-940.17,23.96),
                marker = {
                    type = 2,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            } 
        }
    },
    ['route3'] = {
        ['locations'] = {
            [1] = {
                active = false, -- don't change
                delivered = false, -- don't change
                event = 'ry_trucker2job:delivery', 
                coord = vector3(178.31,-3304.8,6.5),
                marker = {
                    type = 21,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            },
            [2] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:delivery', 
                coord = vector3(178.49,-3205.1,5.63),
                marker = {
                    type = 2,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            }, 
            [3] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:delivery', 
                coord = vector3(190.12,-3049.49,5.81),
                marker = {
                    type = 21,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            },
            [4] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:last_delivery', 
                coord = vector3(228.02,-2904.35,5.96),
                marker = {
                    type = 2,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            } 
        }
    },
    ['route4'] = {
        ['locations'] = {
            [1] = {
                active = false, -- don't change
                delivered = false, -- don't change
                event = 'ry_trucker2job:delivery', 
                coord = vector3(178.31,-3304.8,5.99),
                marker = {
                    type = 21,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            },
            [2] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:delivery', 
                coord = vector3(178.49,-3205.1,5.63),
                marker = {
                    type = 2,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            }, 
            [3] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:delivery', 
                coord = vector3(190.12,-3049.49,5.81),
                marker = {
                    type = 21,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            },
            [4] = {
                active = false,
                delivered = false,
                event = 'ry_trucker2job:last_delivery', 
                coord = vector3(228.02,-2904.35,5.96),
                marker = {
                    type = 2,
                    text = "[ ~g~E ~w~] ~w~Para entregar",
                    text_delivered = "~y~Entregado, Ir al siguiente punto",
                    size  = {x = 0.5, y = 0.5, z = 0.5},
                    color = {r = 204, g = 204, b = 0}
                },
            } 
        }
    },

    -- Don't add more
}