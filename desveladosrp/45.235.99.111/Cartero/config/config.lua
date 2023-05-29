Config = {}
Config['Version'] = 1.0 -- DON'T TOUCH THIS

Config['EnableWebhook'] = false
Config['Webhook'] = "" -- Change me compulsory
Config['CommunityName'] = "Nekix Delivery Job Logs" -- Change me if you want
Config['CommunityLogo'] = 'https://cdn.discordapp.com/icons/838115320597446677/a96dc72395659c8d3921bece0ac2039d?size=256' -- Change me if you want
Config['Avatar'] = 'https://cdn.discordapp.com/icons/838115320597446677/a96dc72395659c8d3921bece0ac2039d?size=256' -- Change me if you want

Config['Delivery'] = {
    ['JobName'] = 'delivery',
    ['ActionKey'] = 38, -- E
    ['FinalPayout'] = {
        ['Min'] = 8000,
        ['Max'] = 10000
    },
    ['Blips'] = {
        {
            ['x'] = 72.68,
            ['y'] = 114.32,
            ['z'] = 78.28,
            ['sprite'] = 445,
            ['color'] = 0,
            ['scale'] = 0.75,
            ['label'] = "Andreani",
        }
    },
    ['Uniforms'] = { 
        ['Female'] = {
            ["tshirt_1"] = 2,         ["tshirt_2"]= 0,
			["torso_1"]= 198,         ["torso_2"] = 2,
			["arms"]= 0,
			["pants_1"]= 81,         ["pants_2"]= 0,
			["helmet_1"]= -1,         ["helmet_2"]= 0,
			["hair_color_1"]= 0,     ["hair_color_2"]= 0,
			["glasses_1"]= 14,         ["glasses_2"]= 0,
			["shoes_1"] = 64,         ["shoes_2"] = 0,
			["hair_1"] = 0,         ["hair_2"] = 0,
			["decals_1"] = 0,         ["decals_2"] = 0,
        },
        ['Male'] = { -- Edit female clothes, i can't find good clothes for females peds
            ['tshirt_1'] = 7,  ['tshirt_2'] = 0,
            ['torso_1'] = 14,   ['torso_2'] = 5,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 14,
            ['pants_1'] = 187,   ['pants_2'] = 3,
            ['shoes_1'] = 48,   ['shoes_2'] = 0,
            ['helmet_1'] = .1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0
        },
    },
    ['Base'] = {
        {
            ['coords'] = vec3(78.56, 112.04, 81.20),
        }
    },
    ['Prop'] = {
        ['Model'] = 'prop_cs_cardbox_01',
        ['x'] = 83.32,
        ['y'] = 110.16,
        ['z'] = 78.2, 
    },
    ['Vehicles'] = {
        ['Spawner'] = {
            ['coords'] = {
                vec3(67.04, 119.68, 79.12),
            },
            ['rotation'] = 339.2133,
        },
        ['Deleter'] = vec3(73.76, 122.84, 79.2),
        ['Plate'] = "DELIVERY",
        ['Cars'] = {
            'rumpo',
        },
    },
    ['Destinations'] = { -- Add more Destinations writing more vec3(x, y, z)
        vec3(-284.3353, -601.2335, 33.5532),
        vec3(809.5350, -2024.2238, 28.0),
        vec3(-1064.7435, -553.4235, 32.5),
        vec3(-1129.4438, -1607.2420, 3.9),
        vec3(451.4836, -899.0954, 27.5),

    },
}