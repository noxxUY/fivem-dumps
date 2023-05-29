Config = {}

Config.Bag = {44, 45, 48} -- Add the bags that u need to use rifles, etc
Config.UseAnimations = true -- use animations when holstering and unholstering
Config.Weapons = { -- weapons that u need a bag to use
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_CARBINERIFLE',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
}

function Notify()
    SetNotificationTextEntry('STRING')
    AddTextComponentString('Necesitas un bolso para usar este arma')
    DrawNotification(false, false)
end