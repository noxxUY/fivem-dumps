Config = {}

Config.DiscordMiningLogs = true --Set true to enable discord logs for mined ore. (Can set webhooks in wasabi_mining/server/discordwebhook.lua)
Config.DiscordCheatLogs = true --Set true to enable possible cheater logs. (Can set webhooks in wasabi_mining/server/discordwebhook.lua)

Config.Axe = `prop_tool_pickaxe` --Default: `prop_tool_pickaxe`

Config.AxeBreakPercent = 10 --When failing to mine rock, this is the percentage of a chance that your pickaxe will 'break'

Config.Rocks = { -- Items obtained from mining rocks
    'emerald',
    'copper',
    'iron',
    'steel'
}

Config.RockPrices = { -- Items sell ranges. Ex: [item_name] = {price(lowest), price(highest)}
    ['emerald'] = {50, 100},
    ['copper'] = {30, 60},
    ['iron'] = {20, 50},
    ['steel'] = {10, 40}
}

Config.MiningAreas = {
    vector3(2977.45, 2741.62, 44.62), -- vector3 of locations for mining stones
    vector3(2982.64, 2750.89, 42.99),
    vector3(2994.92, 2750.43, 44.04),
    vector3(2958.21, 2725.44, 50.16),
    vector3(2946.3, 2725.36, 47.94),
    vector3(3004.01, 2763.27, 43.56),
    vector3(3001.79, 2791.01, 44.82)
}

Config.SellShop = vector3(122.1, 6405.69, 31.36) -- X, Y, Z Coords of where 

Language = {
    --Blips
    ['mining_blips'] = 'Mina',
    ['sell_shop_blip'] = 'Venta de minerales',
    --Help Text
    ['intro_instruction'] = '~INPUT_ATTACK~ para minar rocas, ~INPUT_FRONTEND_RRIGHT~ para cancelar.',
    --3D Text
    ['mine_rock'] = '[~g~E~s~] para minar roca',
    ['sell_material'] = '[~g~E~s~] para vender materiales',
    --Notifications(Success)
    ['rewarded'] = 'Ganaste 1x',
    ['sold_for'] = 'Vendiste',
    ['sold_for'] = 'Vendiste',
    ['sold_for2'] = 'por $',
    --Notifications(Failed)
    ['failed_mine'] = 'Fallaste, no salio nada!',
    ['no_pickaxe'] = 'No tenes pico!',
    ['axe_broke'] = 'Le pegaste mal y tu pico se rompio!',
    ['cantcarry'] = 'No podes cargar mas 1x',
    ['possible_cheater'] = 'Fuiste reportado al staff.',
    --Kicked Message
    ['kicked'] = 'Fuiste kickeado y reportado por posible cheater.'
}

RegisterNetEvent('wasabi_mining:notify')
AddEventHandler('wasabi_mining:notify', function(message)	
	
-- Place notification system info here, ex: exports['mythic_notify']:SendAlert('inform', message)
    ESX.ShowNotification(message)


end)