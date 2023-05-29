Config              = {}

Config.Locale       = "en"

Config.UseKeyToOpen = false
Config.KeyToOpen    = 0

-- Checks if player received reward / not and day changed to update its data.
-- Default is every 10 minutes.
Config.ThreadRepeat = 10

-- If Config.MythicNotifyMessage is set to false, ESX Messages will be sent than mythic_notify.
Config.MythicNotifyMessage = false

Config.RewardPacks    = {
    ['clips'] = {
        rewards = {
            ['1'] = {name = "disc_ammo_pistol",  type = "item", amount = 5},
            ['2'] = {name = "disc_ammo_rifle",   type = "item", amount = 5},
            ['3'] = {name = "disc_ammo_smg",     type = "item", amount = 5},
        },
    },
    ['moneyrewards'] = {
        rewards = {
            ['1'] = {name = "",  type = "money", amount = 50},
            ['2'] = {name = "",  type = "black_money", amount = 500},
            ['3'] = {name = "",  type = "bank", amount = 5000},
        },
    },

    ['weaponpack'] = {
        rewards = {
            ['1'] = {name = "WEAPON_PISTOL",  type = "weapon", amount = 0},
            ['2'] = {name = "WEAPON_APPISTOL",  type = "weapon", amount = 0},
        },
    },
}

-- DO NOT touch WEEKS & DAYS if you don't have enough knowledge, if you do, it will break the rewards system.
-- Max days for getting daily rewards are 28 (4 Weeks).

-- For testing, you can do it manually from dailyrewards sql table, set day and received to 0

-- Default types: [item, weapon, money, black_money, bank].
-- If you want to give multiple items / money or anything in 1 daily reward, you can use Config.RewardPacks name,
-- for example, than using default types, you would use as type the custom pack, "clips" or anything else that you've made.
Config.DailyRewards = {
    ['WEEK_1'] = {
        {
            day = 1,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
        {
            day = 2,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 3,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
    
        {
            day = 4,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 5,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 6,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 7,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    },

    ['WEEK_2'] = {
        {
            day = 8,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
        {
            day = 9,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 10,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
    
        {
            day = 11,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 12,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 13,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 14,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    },

    ['WEEK_3'] = {
        {
            day = 15,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
        {
            day = 16,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 17,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
    
        {
            day = 18,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 19,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 20,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 21,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    },

    ['WEEK_4'] = {
        {
            day = 22,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
        {
            day = 23,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 24,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
    
        {
            day = 25,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 26,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 27,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    
        {
            day = 28,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 5000,
                title = 'DINERO EN MANO',
                description = '$5000 en efectivo',
                image = 'img/items/coins_rewardbox.png'
            },
        },
    },
}
