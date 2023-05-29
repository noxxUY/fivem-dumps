Config = {

-------------------------------------------------------------
-- IMPORTANT  
-- All parts need to be added to inventory
-- Custom vehicle sounds for engines (https://www.gta5-mods.com/vehicles/brabus-inspired-custom-engine-sound-add-on-sound)
-------------------------------------------------------------

WhitelistedJobs = { -- Put jobs you want to use mechanic_tools
    'mechanic',
    'michelin',
    'aca'
},
NewESX = true,

UsingCoreInventory = false, -- Enables part removal and gives back items with saved health

WearRate = 200000, -- The rate parts wear off (Higher the value less wear on the parts)
UseMiles = true, -- If set to false it will use kilometers
UseRelativeValues = true, -- If set to true cars performance wouldnt be affected with stock parts. Otherwise stock car parts will make the car slower
UseT1gerMechanic = false, -- If set to true Vehicles will use the CarJack (toolbox) and Lift (mechanic_toolbox) from the t1ger_mechanic script. Look at the Readme for using this
DetectDistance = 3.0, -- Distance where vehicles are being detected
OnlyOwnedVehicles = false, -- Script excludes not owned cars

--Times to repair/install certain parts in miliseconds
EngineRepairTime = 10000, 
EngineInstallTime = 15000,

TurboRepairTime = 10000, 
TurboInstallTime = 15000,

levaRepairTime = 10000, 
levaInstallTime = 15000,

tapaRepairTime = 10000, 
tapaInstallTime = 15000,

pistonRepairTime = 10000, 
pistonInstallTime = 15000,

inyectoresRepairTime = 10000, 
inyectoresInstallTime = 15000,

bobinaRepairTime = 10000, 
bobinaInstallTime = 15000,

embreagueRepairTime = 10000, 
embreagueInstallTime = 15000,

fulltechRepairTime = 10000, 
fulltechInstallTime = 15000,

NitroInstallTime = 10000,

OilInstallTime = 5000,

TransmissionInstallTime = 14000,
TransmissionRepairTime = 10000,

TireRepairTime = 3000,
TireInstallTime = 3000,

BreaksInstallTime = 4000,
BreaksRepairTime = 4000,

SuspensionInstallTime = 5000,
SuspensionRepairTime = 5000,


SparkPlugsInstallTime = 5000,
SparkPlugsRepairTime = 5000,

--Manual Transmition Keys
ShiftUp = 'LEFTSHIFT',
ShiftDown = 'LEFTCTRL',


MechanicWorkshop = { -- Mechanic Workshops where mechanics can use MechanicWorkshopAccess

{coords = vector3(-329.0872, -126.4948, 39.0144), radius = 100.0}, --lsc
{coords = vector3(-575.0706, -932.1710, 23.8773), radius = 100.0}, --michelin 
{coords = vector3(-203.6049, -1371.0366, 31.2679), radius = 100.0}   --aca


},

--Check engine, Low oil, Mileage location on screen
InfoBottom = 1,
InfoRight = 1,


-- Parts of vehicle certain condicions can access! For example with mechanic tool box you will be able to access parts mentioned in MechanicTools
-- PART LIST (engine, oil, brakes, suspension, turbo, nitro )

BearHandsAccessCommand = 'inspect',
BearHandsAccess = {
    ['oil'] = true
},

ToolBoxAccess = {
	['oil'] = true,
	['sparkplugs'] = true
},

MechanicToolsAccess = {
    ['oil'] = true,
    ['nitro'] = true,
    ['tires'] = true,
    ['brakes'] = true,
    ['suspension'] = true,
    ['engine'] = true,
    ['transmission'] = true,
    ['turbo'] = true,
	['sparkplugs'] = true,
    ['leva'] = true,
    ['tapa'] = true,
    ['piston'] = true,
    ['inyectores'] = true,
    ['bobina'] = true,
    ['embreague'] = true,
    ['fulltech'] = true
},

MechanicWorkshopAccess = {
    ['oil'] = true,
    ['nitro'] = true,
    ['tires'] = true,
    ['brakes'] = true,
    ['suspension'] = true,
    ['engine'] = true,
    ['transmission'] = true,
    ['turbo'] = true,
	['sparkplugs'] = true,
    ['leva'] = true,
    ['tapa'] = true,
    ['piston'] = true,
    ['inyectores'] = true,
    ['bobina'] = true,
    ['embreague'] = true,
    ['fulltech'] = true
},


-- Parts that your vehicle will be able to use to modify its performance on the road. These parts also need to be added to the item databse.
-- usability - is to exclude some parts to be used on some vehicles exclusive is usually car spawn code
-- power - depends if using relative values but it will increase vehicles power
-- durability - (IMPORTANT) Enter value from 0 to 100. 100 means that the part will never break
-- repair - enter ingrediants to fix up the part. If part is at 0 percent you will need to replace.

Turbos = { -- Turbos affect your car speed at higher rpm's. When turbos break you lose power

    ['turbo_lvl_1'] = {
        label = "Turbo Gol", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 10.0,
        durability = 100.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    },
    ['turbo_lvl_2'] = {
        label = "Turbo Bora", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 20.0,
        durability = 90.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    },
    ['turbo_lvl_3'] = {
        label = "Turbo Vento", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 30.0,
        durability = 80.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    },
    ['turbo_lvl_4'] = {
        label = "Turbo S50", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 40.0,
        durability = 70.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    },
    ['turbo_lvl_5'] = {
        label = "Turbo S60", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 50.0,
        durability = 60.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    },
    ['turbo_lvl_6'] = {
        label = "Turbo S70", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 60.0,
        durability = 50.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    },
    ['turbo_lvl_7'] = {
        label = "Turbo TopFuel", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 70.0,
        durability = 30.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    }
},

NitroKey = 'LEFTSHIFT', -- Key to use nitro when available

Nitros = { -- Nitro affect vehicle power and increases vehicle wear during usage

    ['nos'] = {
        label = "Nitro", 
        usability = {exclusive = {}, vehicletypes = {}},
        power = 100.0,
        durability = 30.0 -- Here enter seconds until nitro will run out
    }

},

Transmissions = {

['stock_transmission'] = {
    label = "Transmision Stock", 
    usability = {exclusive = {}, vehicletypes = {}},
    shiftingtime = 0.9,
    drivingwheels = 'DEFAULT',
    durability = 80.0,
    manual = false,
    repair = {
            ['iron'] = {amount = 5, label = "Iron", reusable = false}
        }
},

['race_transmission'] = {
    label = "Transmision Deportiva", 
    usability = {exclusive = {}, vehicletypes = {}},
    shiftingtime = 3.0,
    drivingwheels = 'RWD',
    durability = 50.0,
    manual = false,
    repair = {
            ['iron'] = {amount = 5, label = "Iron", reusable = false}
        }
},
['race_transmission_4wd'] = {
    label = "Transmision Interal", 
    usability = {exclusive = {}, vehicletypes = {}},
    shiftingtime = 3.0,
    drivingwheels = 'AWD', -- FWD RWD AWD
    durability = 50.0,
    manual = false, -- (ADVANCED ONLY!) You can define each gear's ratio. Example is only for vehicles with max 6 gears
    repair = {
            ['iron'] = {amount = 5, label = "Iron", reusable = false}
        }
},

['race_transmission_fwd'] = {
    label = "Transmision Trasera", 
    usability = {exclusive = {}, vehicletypes = {}},
    shiftingtime = 3.0,
    drivingwheels = 'FWD', -- FWD RWD 4WD
    durability = 50.0,
    manual = false,
    repair = {
            ['iron'] = {amount = 5, label = "Iron", reusable = false}
        }
}

},

Suspensions = { -- Suspension will affect handling and will look super cool. Decrease power to lower the vehicle and give better handling.

['stock_suspension'] = {
    label = "Suspension Stock", 
    usability = {exclusive = {}, vehicletypes = {}},
    height = 0,
    traction = 0,
    durability = 80.0,
    repair = {
            ['iron'] = {amount = 5, label = "Iron", reusable = false}
        }
},

['race_suspension'] = {
    label = "Suspension Deportiva", 
    usability = {exclusive = {}, vehicletypes = {}},
    height = -0.04,
    traction = 1.0,
    durability = 50.0,
    repair = {
            ['iron'] = {amount = 5, label = "Iron", reusable = false}
        }
}



},

Oils = { -- Oils keep your car cool and happy if oil runs out car parts will start to wear off fast.

['stock_oil'] = {
    label = "Aceite Stock", 
    usability = {exclusive = {}, vehicletypes = {}},
    durability = 10.0,
},

['shell_oil'] = {
    label = "Aceite Shell", 
    usability = {exclusive = {}, vehicletypes = {}},
    durability = 50.0,
}

},



Engines = { -- Engines will make your car faster and will give it a different sound. Increase power to make car faster. 

['stock_engine'] = {
        label = "STANDARD", 
        power = 0.0,
        durability = 100.0,
        usability = {exclusive = {}, vehicletypes = {}},
        sound = "DEFAULT",
        repair = {
            ['iron'] = {amount = 10, label = "Iron", reusable = false},
            ['piston'] = {amount = 6, label = "Piston", reusable = false}
        }
}, 

['v8engine'] = {
        label = "V8", 
        power = 30.0,
        durability = 90.0,
        usability = {exclusive = {}, vehicletypes = {}},
        sound = "brabus850", -- These sounds are not in by default download from (https://www.gta5-mods.com/vehicles/brabus-inspired-custom-engine-sound-add-on-sound)
        repair = {
            ['iron'] = {amount = 10, label = "Iron", reusable = false},
            ['piston'] = {amount = 6, label = "Piston", reusable = false}
        }
}, 

['2jzengine'] = {
        label = "2JZ", 
        power = 50.0,
        durability = 70.0,
        usability = {exclusive = {}, vehicletypes = {}},
        sound = "toysupmk4", -- These sounds are not in by default download from (https://www.gta5-mods.com/vehicles/brabus-inspired-custom-engine-sound-add-on-sound)
        repair = {
            ['iron'] = {amount = 10, label = "Iron", reusable = false},
            ['piston'] = {amount = 6, label = "Piston", reusable = false}
        }
} 

},
 
Tires = { -- Tires affect your cars handling when launching and in corners. Increase traction for better grip or decrease for more drift. When they wear off you will drive without tires lol
    
['stock_tires'] = {
    label = "Cubiertas Originales", 
    usability = {exclusive = {}, vehicletypes = {}},
    traction = -0.04,
    width = 0.0,
    size = 0.0,
    lowspeedtraction = 0.0,
    durability = 80.0,
    repair = {
            ['rubber'] = {amount = 5, label = "Rubber", reusable = false}
        }
},

['michelin_tires'] = {
    label = "Cubiertas Michelin", 
    usability = {exclusive = {}, vehicletypes = {}},
    traction = 1.0, -- Aumentar esto hará que el automóvil haga giros más cerrados
    width = 0.0, --ancho
    size = 0.0, --Talla
    lowspeedtraction = -1.0, -- Aumentar esto hará que el automóvil gire desde bajas velocidades.
    durability = 60.0,
    repair = {
            ['rubber'] = {amount = 5, label = "Rubber", reusable = false}
        }
},

['michelin_tires2'] = {
    label = "Cubiertas Black", 
    usability = {exclusive = {}, vehicletypes = {}},
    traction = 3.0, -- Increasing this will make car make sharper turns
    width = 0.0,
    size = 0.0,
    lowspeedtraction = -3.0, -- Increasing this will make the car spin out from low speeds
    durability = 30.0,
    repair = {
            ['rubber'] = {amount = 5, label = "Rubber", reusable = false}
        }
}


},

Brakes = { -- Brakes allow you to stop your car. Increase power to make brakes more affective. When brakes break you will lose ability to break 
    
['stock_brakes'] = {
    label = "Frenos De Calle", 
    usability = {exclusive = {}, vehicletypes = {}},
    power = 1.0,
    durability = 30.0,
    repair = {
            ['iron'] = {amount = 5, label = "Iron", reusable = false}
        }
},

['race_brakes'] = {
    label = "Frenos Deportivos", 
    usability = {exclusive = {}, vehicletypes = {}},
    power = 15.0,
    durability = 30.0,
    repair = {
            ['iron'] = {amount = 5, label = "Iron", reusable = false}
        }
},

['race_brakes2'] = {
    label = "Frenos Competicion", 
    usability = {exclusive = {}, vehicletypes = {}},
    power = 22.0,
    durability = 30.0,
    repair = {
            ['iron'] = {amount = 5, label = "Iron", reusable = false}
        }
},

},

SparkPlugs = { -- Spark Plugs affect your car ignition. This will cause the vehicle to switch the engine off randomly

    ['stock_sparkplugs'] = {
        label = "Bujias Stock", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        durability = 50.0, -- (IMPORTANT) Enter value from 0 to 100. 100 means that the part will never break
		startbreak = 25.0, -- the health set when the engine starts to switch of random. At < 1 health the engine wont start again. Values from 1-100 are allowed
		minfail = 10000, -- min time when engine turns off in ms
		maxfail = 50000, -- max time when engine turns off in ms
    },
	['ngk_sparkplugs'] = {
        label = "Bujias Ngk", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        durability = 90.0, -- (IMPORTANT) Enter value from 0 to 100. 100 means that the part will never break
		startbreak = 15.0, -- the health set when the engine starts to switch of random. At < 1 health the engine wont start again. Values from 1-100 are allowed
		minfail = 20000, -- min time when engine turns off in ms
		maxfail = 60000, -- max time when engine turns off in ms
    }

},

leva = { -- leva affect your car speed at higher rpm's. When leva break you lose power

['stock_leva'] = {
    label = "Leva Stock", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 00.0,
    durability = 100.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_leva2'] = {
    label = "15 HP", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 30.0,
    durability = 80.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_leva3'] = {
    label = "50HP", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 50.0,
    durability = 60.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_leva4'] = {
    label = "10HP", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 60.0,
    durability = 50.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_leva4'] = {
    label = "125HP", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 70.0,
    durability = 40.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
}
},

    tapa = { -- tapa affect your car speed at higher rpm's. When tapa break you lose power

    ['stock_tapa'] = {
        label = "Tapa Stock", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 00.0,
        durability = 100.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    },
    ['stock_tapa2'] = {
        label = "Tapa 50HP", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 30.0,
        durability = 80.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    },
    ['stock_tapa3'] = {
        label = "Tapa 100HP", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 50.0,
        durability = 80.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    },
    ['stock_tapa4'] = {
        label = "Tapa 125HP", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 60.0,
        durability = 50.0,
        repair = {
            ['iron'] = {amount = 5, label = "Eisen", reusable = false}
        }
    }
},

piston = { -- piston affect your car speed at higher rpm's. When piston break you lose power

['stock_piston'] = {
    label = "Piston Stock", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 00.0,
    durability = 100.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_piston2'] = {
    label = "Piston Lapel 15HP", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 30.0,
    durability = 90.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_piston3'] = {
    label = "Piston Lapel 30HP", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 40.0,
    durability = 80.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_piston4'] = {
    label = "Piston Lapel 50HP", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 50.0,
    durability = 70.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_piston5'] = {
    label = "Piston Lapel ForjadoHP", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 60.0,
    durability = 50.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
}
},

inyectores = { -- inyectores affect your car speed at higher rpm's. When inyectores break you lose power

['stock_inyectores'] = {
    label = "Inyectores Stock", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 00.0,
    durability = 100.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_inyectores2'] = {
    label = "Inyectores De Calle", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 20.0,
    durability = 100.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_inyectores3'] = {
    label = "Inyectores Deportivos", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 30.0,
    durability = 90.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_inyectores4'] = {
    label = "Inyectores Competicion", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 40.0,
    durability = 80.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
}
},

bobina = { -- bobina affect your car speed at higher rpm's. When bobina break you lose power

['stock_bobina'] = {
    label = "Bobina Stock", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 00.0,
    durability = 100.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_bobina2'] = {
    label = "Bobina Red", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 25.0,
    durability = 90.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_bobina3'] = {
    label = "Bobina FuellTech", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 60.0,
    durability = 50.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_bobina4'] = {
    label = "Bobina AEM", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 50.0,
    durability = 70.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
}
},

embreague = { -- embreague affect your car speed at higher rpm's. When embreague break you lose power

['stock_embreague'] = {
    label = "Embreague Stock", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 00.0,
    durability = 100.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_embreague2'] = {
    label = "Embreague 250HP", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 25.0,
    durability = 100.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_embreague3'] = {
    label = "Embreague 400HP", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 60.0,
    durability = 50.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
}
},

fulltech = { -- motor affect your car speed at higher rpm's. When motor break you lose power

['stock_fulltech'] = {
    label = "Fueltech Stock", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 00.0,
    durability = 100.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_fulltech2'] = {
    label = "Fueltech 400", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 70.0,
    durability = 90.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_fulltech3'] = {
    label = "Fueltech 550", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 85.0,
    durability = 80.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
},
['stock_fulltech4'] = {
    label = "Fueltech 600", 
    usability = {exclusive = {}, vehicletypes = {}}, 
    power = 85.0,
    durability = 80.0,
    repair = {
        ['iron'] = {amount = 5, label = "Eisen", reusable = false}
    }
}
},

--en
Text = {

        ['hood_closed'] = 'capó cerrado!',
    ['mechanic_action_complete'] = 'reparacion terminada',
    ['mechanic_action_started'] = 'reparacion iniciada',
    ['wrong_job'] = 'trabajo equivocado',
    ['not_enough'] = 'no hay suficientes elementos',
	
	--Added
	['vehicle_locked'] = 'vehiculo bloqueado!',
	['vehicle_nearby'] = 'ningún vehículo cerca!',
	['vehicle_notonlift'] = 'vehículo no en el ascensor!',
	['vehicle_notoncarjack'] = 'vehículo no en el carjack!',
	
	--Parts Stuff
	['install_engine'] = '[~r~E~w~] instalar FuellTech',
	['repair_engine'] = '[~r~E~w~] Reparar FuellTech',
	['installing_engine'] = '~r~ La FuellTech está siendo instalado',
	['repairing_engine'] = '~r~e La FuellTech esta siendo reparado',
	['install_turbo'] = '[~r~E~w~] Instalando Turbo',
	['repair_turbo'] = '[~r~E~w~] Reparando Turbo',
	['installing_turbo'] = '~r~se instala turbo',
	['repairing_turbo'] = '~r~turbo Esta siendo reparado',
	['install_nitro'] = '[~r~E~w~] Instalando Nitro',
	['repair_nitro'] = '[~r~E~w~] reparando nitro',
	['installing_nitro'] = '~r~se esta instalando nitro',
	['repairing_nitro'] = '~r~nitro esta siendo reparado',
	['exchange_oil'] = '[~r~E~w~] cambio de aceite',
	['refill_oil'] = '[~r~E~w~] rellenar aceite',
	['refilling_oil'] = '~r~el aceite se esta rellenando',
	['exchanging_oil'] = '~r~se esta cambiando el aceite',
	['install_transmission'] = '[~r~E~w~] instalar transmisión',
	['repair_transmission'] = '[~r~E~w~] reparación de transmisión',
	['installing_transmission'] = '~r~se esta instalando la transmision',
	['repairing_transmission'] = '~r~se esta reparando la transmision',
	['install_tire'] = '[~r~E~w~] instalar neumático',
	['install_brakes'] = '[~r~E~w~] instalar freno',
	['install_suspension'] = '[~r~E~w~] nstalar suspensión',
	
		
	--New
	['install_sparkplugs'] = '[~r~E~w~] instalar Bujias',
    ['install_tapa'] = '[~r~E~w~] instalar tapa',
    ['install_leva'] = '[~r~E~w~] instalar leva',
    ['install_piston'] = '[~r~E~w~] instalar Piston',
    ['install_inyectores'] = '[~r~E~w~] instalar Inyectores',
    ['install_bobina'] = '[~r~E~w~] instalar Bobina',
    ['install_embreague'] = '[~r~E~w~] instalar Embreague',
    ['install_motor'] = '[~r~E~w~] instalar Motor',
}

}



function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
