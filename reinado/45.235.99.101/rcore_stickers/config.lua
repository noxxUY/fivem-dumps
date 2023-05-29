Config = {}

Config.Language = 'EN' -- [ 'EN' ] Custom locales can be added to locale.lua
Config.Database = 'oxmysql' --[ 'mysql-async' / 'oxmysql' / 'ghmattimysql' ] Choose your sql driver (leave empty for standalone)
Config.Framework = 'esx' --[ 'esx' / 'qbcore' / 'other' ] Choose your framework (leave empty for standalone)

Config.FrameworkTriggers = {
    notify = 'esx:showNotification', -- [ ESX = 'esx:showNotification'    QBCore = 'QBCore:Notify' ] Set the notification event, if left blank, default will be used
    object = 'esx:getSharedObject', --[ ESX = 'esx:getSharedObject'    QBCore = 'QBCore:GetObject' ] Set the shared object event, if left blank, default will be used (deprecated for QBCore)
    resourceName = 'es_extended', -- [ ESX = 'es_extended'    QBCore = 'qb-core' ] Set the resource name, if left blank, automatic detection will be performed
}

Config.FrameworkSQLTables = {
    table = 'owned_vehicles', --[ ESX = 'owned_vehicles'    QBCore = 'player_vehicles' ] Set the name of the table where you store player vehicles, if left blank, default will be used
    identifier = 'owner', --[ ESX = 'owner'    QBCore = 'citizenid' ] Set the identifier used in that table, if left blank, default will be used
}

Config.Accessibility = {
    event = true, -- Enable this if you want to open the menu by triggering event (rcore_stickers:openMenu)

    restricted = false, -- Enable to restrict the whole script for certain players (IsPlayerAllowedScript function in framework/your_framework.lua)

    anyone = true, -- Everyone can use place and edit stickers
    owner = false, -- Only the owner of the vehicle can place and edit stickers
    jobs = true, -- Only players with certain job can place and edit stickers
}

-- Related to settings above
Config.AllowedJobs = {
    -- Example:
    reinados = true,
 --   mechanicvip = true,
}

Config.EditorOptions = {
    loadDistance = 50.0, -- The distance at which the stickers will start displaying
    maxDistance = 10.0, -- The maximum distance the player can go away from the vehicle when in editor mode
    maxStickers = 6, -- The maximum amount of stickers on a single vehicle, please do note that there cannot be more than 56 stickers rendered at the same time
    maxScale = 6.0, -- The maximum scale of the sticker in editor
    minScale = 0.1, -- The minimum scale of the sticker in editor
}

Config.Controls = {}

-- Controls used in the sticker editor, you can find the controls codes here https://docs.fivem.net/docs/game-references/controls/
Config.Controls['EDITOR_CONFIRM']      = 176 -- Enter
Config.Controls['EDITOR_CANCEL']       = 177 -- Backspace
Config.Controls['EDITOR_REMOVE']       = 178 -- Delete
Config.Controls['EDITOR_SPEED']        = 155 -- Left Shift
Config.Controls['EDITOR_LOCK']         = 171 -- Capslock
Config.Controls['EDITOR_MIRROR']       = 132 -- Left Ctrl
Config.Controls['EDITOR_SCALE_UP']     = 181 -- Scrollwheel Up
Config.Controls['EDITOR_SCALE_DOWN']   = 180 -- Scrollwheel Down
Config.Controls['EDITOR_ROTATE_LEFT']  = 174 -- Arrow Left
Config.Controls['EDITOR_ROTATE_RIGHT'] = 175 -- Arrow Right

Config.Text = {}

-- All text labels used in this script
Config.Text['EDITOR_PLACE']      = 'Lugar ($%s)'
Config.Text['EDITOR_SCALE']      = 'Escala (%sx)'
Config.Text['EDITOR_ROTATE']     = 'Rotar (%s°)'
Config.Text['EDITOR_SPEED']      = 'Velocidad (Mantener)'
Config.Text['EDITOR_LOCK_ON']    = 'Bloquear Posicion (On)'
Config.Text['EDITOR_LOCK_OFF']   = 'Bloquear Posicion (Off)'
Config.Text['EDITOR_MIRROR_ON']  = 'Espejo (On)'
Config.Text['EDITOR_MIRROR_OFF'] = 'Espejo (Off)'
Config.Text['EDITOR_REMOVE']     = 'Remover'
Config.Text['EDITOR_CANCEL']     = 'Cancelar'

Config.Text['ERROR_WRONG_ENTITY']    = 'Solo puede colocar calcomanías en los vehículos.'
Config.Text['ERROR_NO_ACCESS_PLACE'] = 'No puede colocar calcomanías en este vehículo.'
Config.Text['ERROR_NO_ACCESS_EDIT']  = 'No puede editar calcomanías en este vehículo.'
Config.Text['ERROR_NO_ENTITY']       = 'No estás mirando ningún vehículo.'
Config.Text['ERROR_OUT_OF_RANGE']    = 'Te alejaste demasiado del vehículo.'
Config.Text['ERROR_MAX_STICKERS']    = 'Este vehículo ya ha alcanzado la cantidad máxima de pegatinas.'
Config.Text['ERROR_NO_STICKERS']     = 'Este vehículo no tiene calcomanías.'
Config.Text['ERROR_NO_MONEY']        = 'No tienes suficiente dinero para esta pegatina.'
Config.Text['ERORR_NOT_ALLOWED']     = 'No está permitido colocar esta pegatina.'

Config.Text['SUCCESS_PLACED']  = 'La pegatina se ha colocado correctamente.'
Config.Text['SUCCESS_EDITED']  = 'La pegatina se ha editado correctamente.'
Config.Text['SUCCESS_REMOVED'] = 'La pegatina se ha eliminado correctamente.'

Config.Text['MENU_BUTTON_ADD']   = 'Agregar'
Config.Text['MENU_BUTTON_EDIT']  = 'Editar'
Config.Text['MENU_BUTTON_PRICE'] = '~g~$%s'
Config.Text['MENU_BUTTON_FREE']  = '~g~GRATIS'

Config.Text['MENU_MAIN_TITLE']        = 'STICKERS'
Config.Text['MENU_MAIN_SUBTITLE']     = 'Opciones'
Config.Text['MENU_EDIT_SUBTITLE']     = 'Pegatinas existentes' 
Config.Text['MENU_CATEGORY_SUBTITLE'] = 'Categorias' 

-- All available stickers
--[[
    You can add your own stickers, all you need is OpenIV and the stickers, let's look how to do that
        Stickers are sorted in categories which you can rename, add or remove
            category - name of the category
            stickers - list of all stickers in this category
        Stickers come with 2 different variants, either stickers that need to be flipped horizontally or text stickers which can stay as they are
        You can upload your own stickers to .ytd file (texture dictionary) using OpenIV
        A sticker needs these properties:
            name - name of the sticker in the .ytd file
            price - price of the sticker (can be set to 0)
            flip - whether or not the sticker has a horizontally flipped equivalent
            dict - name of the texture dictionary where the sticker is located at (without .ytd extension)
        There are two optional properties:
            name2 - name of the horizontally flipped equivalent in the .ytd file (is set only if flip is true)
            premium - this sticker is meant only for premium players, IsPlayerAllowed (located in framework folder) has to return true
]]
Config.Stickers = {
    {
        category = 'Marcas IC',
        stickers = {
            {
                name = 'Bean Machine Coffee',
                price = 150000,
                flip = false,
                dict = 'in_game_brands'
            },
            {
                name = 'Burger Shot',
                price = 150000,
                flip = false,
                dict = 'in_game_brands'
            },
            {
                name = 'Cherenkov Vodka',
                price = 150000,
                flip = false,
                dict = 'in_game_brands'
            },
            {
                name = 'Cluckin\' Bell',
                name2 = 'Cluckin\' Bell Flipped',
                price = 150000,
                flip = true,
                dict = 'in_game_brands'
            },
            {
                name = 'E-Cola',
                price = 150000,
                flip = false,
                dict = 'in_game_brands'
            },
            {
                name = 'Globe Oil',
                price = 150000,
                flip = false,
                dict = 'in_game_brands'
            },
            {
                name = 'Meteorite',
                price = 150000,
                flip = false,
                dict = 'in_game_brands'
            },
            {
                name = 'Pisswasser',
                price = 150000,
                flip = false,
                dict = 'in_game_brands'
            },
            {
                name = 'Sprunk',
                price = 150000,
                flip = false,
                dict = 'in_game_brands'
            },
            {
                name = 'Stronzo Beer',
                price = 150000,
                flip = false,
                dict = 'in_game_brands'
            },
        }
    },
    {
        category = 'Marcas OOC',
        stickers = {
            {
                name = '3M',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Audi',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'BMW',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Budweiser',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Burger King',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Castrol',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Caterpillar',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Chevrolet',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Coca Cola',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'FedEx',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Ferrari',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Ford',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Haas',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Lamborghini',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'McDonald\'s',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Mercedes-Benz',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Monster Energy',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Mountain Dew',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Pepsi',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Porsche',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Red Bull',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Shell',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Target',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'UPS',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
            {
                name = 'Volkswagen',
                price = 150000,
                flip = false,
                dict = 'real_life_brands'
            },
        }
    },
    {
        category = 'Japones',
        stickers = {
            {
                name = 'Akina Speed Stars',
                price = 150000,
                flip = false,
                dict = 'japanese'
            },
            {
                name = 'Fujiwara Tofu',
                price = 150000,
                flip = false,
                dict = 'japanese'
            },
            {
                name = 'Initial D',
                price = 150000,
                flip = false,
                dict = 'japanese'
            },
            {
                name = 'JDM Legends',
                price = 150000,
                flip = false,
                dict = 'japanese'
            },
            {
                name = 'JDM Turbo',
                price = 150000,
                flip = false,
                dict = 'japanese'
            },
            {
                name = 'Night Kids',
                price = 150000,
                flip = false,
                dict = 'japanese'
            },
            {
                name = 'Red Suns',
                price = 150000,
                flip = false,
                dict = 'japanese'
            },
            {
                name = 'Top Tier Japan',
                price = 150000,
                flip = false,
                dict = 'japanese'
            }, 
        }
    },
    {
        category = 'NASCAR',
        stickers = {
            {
                name = 'NASCAR Logo',
                price = 150000,
                flip = false,
                dict = 'nascar'
            },
            {
                name = 'Aric Almirola',
                price = 150000,
                flip = false,
                dict = 'nascar'
            },
            {
                name = 'Christopher Bell',
                price = 150000,
                flip = false,
                dict = 'nascar'
            },
            {
                name = 'Denny Hamlin',
                price = 150000,
                flip = false,
                dict = 'nascar'
            },
            {
                name = 'Erik Jones',
                price = 150000,
                flip = false,
                dict = 'nascar'
            },
            {
                name = 'Justin Haley',
                price = 150000,
                flip = false,
                dict = 'nascar'
            },
            {
                name = 'Kurt Busch',
                price = 150000,
                flip = false,
                dict = 'nascar'
            },
            {
                name = 'Kyle Busch',
                price = 150000,
                flip = false,
                dict = 'nascar'
            },
            {
                name = 'Martin Truex Jr',
                price = 150000,
                flip = false,
                dict = 'nascar'
            },
            {
                name = 'William Byron',
                price = 150000,
                flip = false,
                dict = 'nascar'
            },
        }
    },
    {
        category = 'Otros',
        stickers = {
            {
                name = 'Burning Horse',
                name2 = 'Burning Horse Flipped',
                price = 150000,
                flip = true,
                dict = 'others'
            },
            {
                name = 'Burning Skull',
                name2 = 'Burning Skull Flipped',
                price = 150000,
                flip = true,
                dict = 'others'
            },
            {
                name = 'Cowboy Skull',
                name2 = 'Cowboy Skull Flipped',
                price = 150000,
                flip = true,
                dict = 'others'
            },
            {
                name = 'Drift',
                price = 150000,
                flip = false,
                dict = 'others'
            },
            {
                name = 'HOONIGAN',
                price = 150000,
                flip = false,
                dict = 'others'
            },
            {
                name = 'Jesus',
                price = 150000,
                flip = false,
                dict = 'others'
            },
            {
                name = 'Mechanic Skull',
                price = 150000,
                flip = false,
                dict = 'others'
            },
            {
                name = 'Piston Skull',
                price = 150000,
                flip = false,
                dict = 'others'
            },
            {
                name = 'Pistons',
                price = 150000,
                flip = false,
                dict = 'others'
            },
            {
                name = 'Red Flame',
                name2 = 'Red Flame Flipped',
                price = 150000,
                flip = true,
                dict = 'others'
            },
            {
                name = 'Textured Skull',
                price = 150000,
                flip = false,
                dict = 'others'
            },
            {
                name = 'Turbo Slug',
                name2 = 'Turbo Slug Flipped',
                price = 150000,
                flip = true,
                dict = 'others'
            },
            {
                name = 'Umbrella Corporation',
                price = 150000,
                flip = false,
                dict = 'others'
            },
            {
                name = 'Yellow Flame',
                name2 = 'Yellow Flame Flipped',
                price = 150000,
                flip = true,
                dict = 'others'
            }
        }
    },
    {
        category = 'Equipos de Futbol',
        stickers = {
            {
                name = 'argentinos',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'arsenal',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'atleticotucuman',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'banfield',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'barracas',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'belgrano',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'boca',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'centralcordoba',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'colon',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'defensa',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'estudiantes',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'estudiantes2',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'gimnasia',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'godoycruz',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'huracan',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'independiente',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'independiente2',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'instituto',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'lanus',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'newells',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'platense',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'racing',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'racing2',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'river',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'rosariocentral',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'sanlorenzo',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'sarmiento',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'talleres',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'tigre',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'union',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
            {
                name = 'velez',
                price = 150000,
                flip = false,
                dict = 'equipos'
            },
        }
    },
    {
        category = 'Racing',
        stickers = {
            {
                name = '6SixtyStreet',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = '6Sixty_Street',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = '10HP',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = '1320Carbon',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = '1320Flashy',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = '1320Space',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = '1320Retro',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = '1320_Hood_Rat',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Bang_Tha_Light',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'BnB',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'BurnoutRivals',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Cash_into_Noise',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Champion',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Cragar',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'CSC',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Cyclone_Purple_Hornies',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Cyclone_Purple_Hornies_2',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'DewItForDale',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'DoItForDale',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Dipstick',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'DontCallItAPromod',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Drag_or_Die',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Edelbrock',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Frostbite',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Grant_Piston_Rings',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Hang_Ten_Hot_Rodder',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'High_Maintenance',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Holley_Efi_Logo',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'HonkToGetGapped',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Hooker_Headers',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Hoosier',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Hoosier_Gold',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Hurst_Shift_Knobs',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'ICT_Billet',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Im_Confused_By_Your_Tactics',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'ItsGotOil',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Jegs',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'KY_Bourban',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'KY_Hotwheels',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'KY_Kid',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'KY_Thing',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Lethal_Treat_V_Twin',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Line_it_up',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'LSFestUSABanner',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'McGurk_Buggy',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'motionraceworks',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Nightmare_on_your_street',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'nos-nitrous-oxide-048-11333-300x300',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'PRocharger',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Race_Part_Solutions',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Retro_MoPar_sticker',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Sniper_Effi',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'STP',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Stripper_Glitter',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Team_Chevy_1',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Texaco',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'TexasSP',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'texas_plate',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'GappleBees',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'NOS_Blue',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'NOS_Green',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'NOS_Pink',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'NOS_Yellow',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'NOS_Red',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'NOS_Black',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'vpracing',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'WL_Logo_1',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'YeeYee_Rebel_1',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'YoutubeCertified',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
            {
                name = 'Ziptied',
                price = 75000,
                flip = false,
                dict = 'racing'
            },
        }
    },
    
    {
        category = 'Dragon Ball',
        stickers = {
            {
                name = 'broly-dbs',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
            {
                name = 'broly-lssj',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
            {
                name = 'caulifla',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
            {
                name = 'caulifla-ssj',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
            {
                name = 'caulifla-ssj-2',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
            {
                name = 'goku-black',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
            {
                name = 'gokumini',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
            {
                name = 'goku-y-krillin',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
            {
                name = 'kefla',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
            {
                name = 'kefla-ssj',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
            {
                name = 'roshy-sangre',
                price = 170000,
                flip = false,
                dict = 'goku'
            },
        }
    }
}