Config = {

    Locations = {
        [1] = {
            ["shelfs"] = {
                {["x"] = 256.8982, ["y"] = -705.1736, ["z"] = 44.6852, ["value"] = "checkout"},

                {["x"] = 259.5662, ["y"] = -706.4042, ["z"] = 44.6852, ["value"] = "vip"},
            },
            ["blip"] = {
                ["x"] = 257.5079, ["y"] = -706.1310, ["z"] = 44.6852
            },
            ["cashier"] = {
                ["x"] = 257.6118, ["y"] = -703.1505, ["z"] = 43.7852, ["h"] = 157.7308,
                ["hash"] = "ig_djtalaurelia"
            },
        },




    },

    --[[
    U can specify the hash of the cashier like this:
        ["cashier"] = {
            ["x"] = 0.0, ["y"] = 0.0, ["z"] = 0.0, ["h"] = 0.0,     (h = heading)
            ["hash"] = "mp_m_freemode_01"
        },
        or ["hash"] = 1885233650
    ]]--
    
    Locales = {
        ["checkout"] = "Caja Registradora",
        ["drinks"] = "Bebidas",
        ["snacks"] = "Snacks",
        ["readymeal"] = "Comida",
        ["diverse"] = "Variado",
        ["vip"] = "Tienda Vip",
    },

    Items = {
        ["vip"] = {
            {label = "08 en Blanco", item = "contract", price = 100},
            {label = "Fulbito", item = "fulbito", price = 5},
            {label = "Alfajor de Maizena", item = "maizena", price = 5},
            {label = "Placer", item = "placer", price = 5},
            {label = "Fernet", item = "fernet", price = 20},
            {label = "Chaleco Pesado", item = "nb-armourhigh", price = 20},
            {label = "Pintura Dorada", item = "tint_gold", price = 3},
            {label = "Pintura Verde", item = "tint_green", price = 3},
            {label = "Pintura Rosada", item = "tint_pink", price = 3},
            {label = "Pintura Camuflado", item = "tint_army", price = 3},
            {label = "Pintura LSPD", item = "tint_lspd", price = 3},
            {label = "Pintura Naranja", item = "tint_orange", price = 3},
            {label = "Pintura Plateado", item = "tint_platinum", price = 5},
            {label = "Pintura Luxury", item = "luxary_finish", price = 5},
            {label = "Mira", item = "scope", price = 10},
            {label = "Grip", item = "grip", price = 5},
            {label = "Linterna", item = "flashlight", price = 5},
            {label = "Cargador Extendido", item = "clip_extended", price = 5},
            {label = "Silenciador", item = "suppressor", price = 5},
            {label = "Removedor de Accesorios", item = "attachment_remover", price = 1},
			-- {label = "Soplete (Abre Cerraduras)", item = "blowpipe", price = 500},
			{label = "Kit de Reparacion", item = "fixkit", price = 1},
			{label = "Caja Bronce", item = "cajabronce", price = 180},
			{label = "Caja Plata", item = "cajaplata", price = 360},
			{label = "Caja Oro", item = "cajaoro", price = 550}
        },
    },
}