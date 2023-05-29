-- Menu configuration, array of menus to display
menuConfigs = {
    ['emotes'] = {                                  -- Example menu for emotes when player is on foot
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = GetPlayerPed(-1)
            return IsPedOnFoot(player)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "M",                         -- Wheel keybind to use
            style = {                               -- Wheel style settings
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#f07e22', ['stroke'] = '#0dffe3', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#f07e22', ['stroke'] = '#0dffe3', ['stroke-width'] = 2, ['opacity'] = 1.00 },
                    selected = { ['fill'] = '#f07e22', ['stroke'] = '#0dffe3', ['stroke-width'] = 2, ['opacity'] = 0.60 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Verdana', ['font-size'] = 12 },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Verdana', ['font-size'] = 12 },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Verdana', ['font-size'] = 12 }
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.3,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.6,         -- Maximum radius of wheel in percentage
                    labels = {"CANCELAR", "NO", "ANIMAR", "APLAUDIR", "CRUZAR BRAZOS", "APOYARSE"},
                    commands = {"ee cancel", "ee no", "ee cheer", "ee slowclap", "ee foldarms", "ee leanwall"}
                },
                {
                    navAngle = 285,                 -- Oritentation of wheel
                    minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"SALUDO", "JODETE", "PAZ Y AMOR", "¡AY, DIOS MIO!", "JODER", "FAIL", "MUERTO", "MONGOLO 1", "MONGOLO 2", "PURO", "DESENFUNDAR", "TRANQUILO"},
                    commands = {"ee salute", "ee finger", "ee peace", "ee palm", "ee damn", "ee fail", "ee dead", "ee gang1", "ee gang2", "ee cigar", "ee holster", "ee copcrowd2"}
                }
            }
        }
    },

    ['vehicl es'] = {                                -- Example menu for emotes when player is in a vehicle
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = GetPlayerPed(-1)
            return IsPedInAnyVehicle(player, false)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "F10",                         -- Wheel keybind to use
            style = {                               -- Wheel style settings
                sizePx = 400,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#f07e22', ['stroke'] = '#aaaaaa', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#f07e22', ['stroke'] = '#aaaaaa', ['stroke-width'] = 3, ['opacity'] = 1.00 },
                    selected = { ['fill'] = '#f07e22', ['stroke'] = '#aaaaaa', ['stroke-width'] = 3, ['opacity'] = 0.60 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Verdana', ['font-size'] = 16 },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Verdana', ['font-size'] = 16 },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Verdana', ['font-size'] = 16 }
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.4,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.8,         -- Maximum radius of wheel in percentage
                    labels = {"MOTOR", "CERRAR", "PUERTAS", "MALETERO", "CAPO"},
                    commands = {"engine", "lock", "rdoors", "trunk", "hood"}
                }
            }
        }
    }
}
