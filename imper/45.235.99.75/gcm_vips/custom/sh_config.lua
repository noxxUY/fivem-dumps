Config = {}

-- Here you must enter the license granted via Discord
Config.License                  = '' -- No need
Config.Language                 = 'es' -- es | en
Config.MenuAlign                = 'right'

-- Discord Webhook
Config.DiscordLog               = true
Config.Webhook                  = 'https://discord.com/api/webhooks/1021485708973723688/g1VoezoDqMhDwO7kzyxsdQfM1kwKTi1YiE_PBCQSYOI9aOxwug_yUPIh2msJnpDWOmVq'

-- Here you can set the number of types of vips you want
Config.Vips = {
    ["imperial"] = { dinero = 1500000000, cantidadveh = 4, points = 2000000, priority = 1 },
    ["dragon"] = { dinero = 900000000, cantidadveh = 3, points = 1200000, priority = 1 },
    ["diamante"] = { dinero = 200000000, cantidadveh = 1, points = 400000, priority = 1 },
    ["monster"] = { dinero = 500000000, cantidadveh = 2, points = 800000, priority = 1 },
}

Config.Commands = {
    ['darvip']          = { 'superadmin', 'admin' }, -- Only change groups
    ['quitarvip']       = { 'superadmin', 'admin' }, -- Only change groups
    ['actualizarvips']  = { 'superadmin', 'admin' }, -- Only change groups
    ['listavips']       = { 'superadmin', 'admin' }, -- Only change groups
    ['gencode']       = { 'superadmin', 'admin' }, -- Only change groups
    ['ruleta']       = { 'superadmin' }, -- Only change groups
}

-- Points System
Config.PointsSystem             = true -- Activate points system
Config.PointsName               = 'bank' -- Name of the added account in the es_extended
Config.PointsNameNotify         = 'Dinero al banco' -- Name of the VIP currency
Config.PointsWithoutVip         = false -- Pay users no VIP
Config.PointWithoutVipQuantity  = 1 -- Number of points to users no VIP
Config.PaycheckInterval         = 7 -- Minutes

-- TEBEX
Config.TebexEnable              = true -- Enable Tebex module
Config.TebexLog                 = true
Config.TebexWebhook             = 'https://discord.com/api/webhooks/1021485708973723688/g1VoezoDqMhDwO7kzyxsdQfM1kwKTi1YiE_PBCQSYOI9aOxwug_yUPIh2msJnpDWOmVq'


-- NOTIFICACION
function notificacionsh(msg)
	exports['mythic_notify']:SendAlert('inform', msg, 2500, { ['background-color'] = '#D4FF00', ['color'] = '#000000' })
end

Config.Vehicles = {
    'virtus2020',
    'tuviejaevo',
    'rmodx6',
    'mustangrtrx',
	'lw458s',
	'gt86trust',
	'golf8gti',
	'durango',
	'22m5',
	'20blazer',
	'lariat',
	'hilux1dnx',
	'fuknking',
	'benicio',
	'19ramoffroad',
	'regera',
	'mache',
	'q60',
	'huralbcamber',
	'boricua',
	'can',
	'm13fortwo',
	'cox2013',
    'amarokk2',
	'918',
}