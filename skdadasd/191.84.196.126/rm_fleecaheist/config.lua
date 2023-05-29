
Config = {}

--Add gold, diamond item to database or change item names in bottom. (dont need add cash item)
Config['FleecaMain'] = {
    requiredPoliceCount = 3,
    requiredItems = {
        'drill', -- Add item to database
        'bag' -- Add item to database
    },
    rewardItems = {
        diamondTrolly = { 
            item = nil, -- cash
            count = 100000,
            multiGrabCount = 750000, -- middle main grab
        },
        goldTrolly = { 
            item = nil, -- cash
            count = 100000,
            multiGrabCount = 750000, -- middle main grab
        },
        cashTrolly = { 
            item = nil, -- cash
            count = 100000,
            multiGrabCount = 750000, -- middle main grab
        },
        lockbox = function()
            local items = {Config['FleecaMain']['rewardItems']['diamondTrolly'], Config['FleecaMain']['rewardItems']['goldTrolly']}
            local random = math.random(1, 1)
            local lockboxBag = { -- random diamond or gold for safety box drill reward
                item = items[random].item,
                count = 1
            }
            return lockboxBag
        end,
    },
    grabReward = function() -- dont change this
        local rewards, random = {'bread', 'cash'}, math.random(1,1)
        return rewards[random]
    end,
    trollyReward = function() -- dont change this
        local rewards, random = {'water', 'cash', 'diamond'}, math.random(1,1)
        return rewards[random]
    end,
    finishHeist = {
        buyerPos = vector3(1291.19, -3143.2, 4.90626)
    }
}

Config['FleecaHeist'] = {
    [1] = {
        scenePed = { model = 'csb_tomcasino', coords = vector3(313.973, -280.63, 53.16), heading = 340.04},
        scenePos = vector3(308.598, -281.3508, 53.16),
        sceneRot = vector3(0.0, 0.0, -200.1235),
        scenePedWalkCoords = vector3(315.079, -276.63, 54.1744),
        doorHeading = {200.0, 200.0},
        grab = {
            pos = vector3(313.9913, -283.895, 34.282),
            heading = 160.0,
            loot = false
        },
        drills = {
            {coords = vector3(310.867, -286.82, 54.4430), rotation = vector3(0.0, 0.0, 75.0), loot = false},
            {coords = vector3(312.411, -289.41, 54.4430), rotation = vector3(0.0, 0.0, 160.0), loot = false},
            {coords = vector3(315.230, -288.20, 54.4430), rotation = vector3(0.0, 0.0, 260.0), loot = false},
        },
        trollys = {
            {coords = vector3(313.9913, -283.895, 34.282), heading = 70.0, loot = false},
            {coords = vector3(313.9913, -283.895, 34.282), heading = 160.0, loot = false},
        },
        nextRob = 3600,

    }
}

Strings = {
    ['wait_nextheist'] = 'Tekrar soy için  beklemelin',
    ['minute'] = 'dakika.',
    ['need_item'] = 'Buna ihtiyacın var: ',
    ['police_alert'] = 'Fleeca banka soygunu alarmı! gps inizi kontrol edin.',
    ['drill'] = 'matkabı kullanmak için ~INPUT_CONTEXT~ Bas',
    ['grab_trolly'] = '~INPUT_CONTEXT~',
    ['grab'] = 'kapmak için ~INPUT_CONTEXT~ Bas ',
    ['deliver_to_buyer'] = 'Ganimetleri alıcıya teslim edin. gps i kontrol et.',
    ['buyer_blip'] = 'Alıcı',
    ['need_police'] = 'Şehirde yeterli polis yok.',
    ['total_money'] = 'Yapabilirsin: '
}

--Dont change cuzz those main and required things.
GrabCash = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'enter', 'enter_bag'},
        {'grab', 'grab_bag', 'grab_cash'},
        {'grab_idle', 'grab_idle_bag'},
        {'exit', 'exit_bag'},
    },
    ['scenes'] = {},
    ['scenesObjects'] = {}
}

LaserDrill = {
    ['animations'] = {
        {'intro', 'bag_intro', 'intro_drill_bit'},
        {'drill_straight_start', 'bag_drill_straight_start', 'drill_straight_start_drill_bit'},
        {'drill_straight_end_idle', 'bag_drill_straight_idle', 'drill_straight_idle_drill_bit'},
        {'drill_straight_fail', 'bag_drill_straight_fail', 'drill_straight_fail_drill_bit'},
        {'drill_straight_end', 'bag_drill_straight_end', 'drill_straight_end_drill_bit'},
        {'exit', 'bag_exit', 'exit_drill_bit'},
    },
    ['scenes'] = {}
}

Trolly = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'intro', 'bag_intro'},
        {'grab', 'bag_grab', 'cart_cash_dissapear'},
        {'exit', 'bag_exit'}
    },
    ['scenes'] = {}
}