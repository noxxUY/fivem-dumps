-- IMPORTANT --
-- If you input a new weapon don't forget the hash keys, you can't find hash keys on https://gtahash.ru/weapons/
-- If you not input hash keys, recoil not effect!

Config = {}
Config.DisplayAmmo = false
Config.DisplayCrosshair = true
Config.IsDriverDisableWeapon = true

Config.Weapons = {
  -- [[ MALE ]] --
  [`WEAPON_UNARMED`] = {
    model = `WEAPON_UNARMED`,
    hash = nil,
    damage = 0.25, 
    disableCritical = true,
    recoil = 0.1
  },

  [`WEAPON_NIGHTSTICK`] = {
    model = `WEAPON_NIGHTSTICK`,
    hash = 1737195953,
    damage = 0.25,
    disableCritical = true,
    recoil = 0.001
  },

  [`WEAPON_FLASHLIGHT`] = {
    model = `WEAPON_FLASHLIGHT`,
    hash = -1951375401,
    damage = 0.15, 
    disableCritical = true,
    recoil = 0.001
  },

  [`WEAPON_KNIFE`] = {
    model = `WEAPON_KNIFE`,
    hash = -1716189206,
    damage = 0.35, 
    disableCritical = true,
    recoil = 0.001
  },

  [`WEAPON_KNUCKLE`] = {
    model = `WEAPON_KNUCKLE`,
    hash = -656458692,
    damage = 0.25, 
    disableCritical = true,
    recoil = 0.001
  },

  [`WEAPON_BAT`] = {
    model = `WEAPON_BAT`,
    hash = -1786099057,
    damage = 0.3, 
    disableCritical = true,
    recoil = 0.001
  },

  [`WEAPON_HATCHET`] = {
    model = `WEAPON_HATCHET`,
    hash = -102973651,
    damage = 0.25, 
    disableCritical = true,
    recoil = 0.001
  },

  [`WEAPON_MACHETE`] = {
    model = `WEAPON_MACHETE`,
    hash = -581044007,
    damage = 0.5, 
    disableCritical = true,
    recoil = 0.001
  },
  [`WEAPON_SWITCHBLADE`] = {
    model = `WEAPON_SWITCHBLADE`,
    hash = -538741184,
    damage = 0.35, 
    disableCritical = true,
    recoil = 0.001
  },
  [`WEAPON_WRENCH`] = {
    model = `WEAPON_WRENCH`,
    hash = 419712736,
    damage = 0.35, 
    disableCritical = true,
    recoil = 0.001
  },

  -- [[ PISTOL ]] --
  [`WEAPON_REVOLVER`] = { -- POLICE
    model = `WEAPON_REVOLVER`,
    hash = -1045183535,
    damage = 0.35, 
    disableCritical = true,
    recoil = 0.85
  },

  [`WEAPON_APPISTOL`] = { -- POLICE
    model = `WEAPON_APPISTOL`, 
    hash, 584646201,
    damage = 0.45, 
    disableCritical = true,
    recoil = 0.1
  },

  [`WEAPON_CERAMICPISTOL`] = { -- POLICE
    model = `WEAPON_CERAMICPISTOL`, 
    hash, 727643628,
    damage = 0.75, 
    disableCritical = true,
    recoil = 0.1
  },

  [`WEAPON_REVOLVER_MK2`] = { -- BADSIDE
    model = `WEAPON_REVOLVER_MK2`,
    hash = -879347409,
    damage = 0.25, 
    disableCritical = true,
    recoil = 0.85
  },

  [`WEAPON_PISTOL50`] = { -- BADSIDE
    model = `WEAPON_PISTOL50`,
    hash = -1716589765,
    damage = 0.65, 
    disableCritical = true,
    recoil = 0.18
  },

  [`WEAPON_MACHINEPISTOL`] = { -- BADSIDE
    model = `WEAPON_MACHINEPISTOL`,
    hash = -619010992,
    damage = 0.39, 
    disableCritical = true,
    recoil = 0.1
  },

  -- [[ SMG ]] --
  [`WEAPON_MINISMG`] = { -- BADSIDE
    model = `WEAPON_MINISMG`,
    hash = -1121678507,
    damage = 0.75, 
    disableCritical = true,
    recoil = 0.18
  },
  [`WEAPON_SMG`] = { -- POLICE
    model = `WEAPON_SMG`,
    hash = 736523883,
    damage = 0.55, 
    disableCritical = true,
    recoil = 0.1
  },

  -- [[ RIFLE ]] --

  [`WEAPON_CARBINERIFLE`] = {
    model = `WEAPON_CARBINERIFLE`,
    hash = -2084633992,
    damage = 0.50, 
    disableCritical = true,
    recoil = 0.06
  },

  [`WEAPON_CARBINERIFLE_MK2`] = {
    model = `WEAPON_CARBINERIFLE_MK2`,
    hash = -2084633992,
    damage = 0.65, 
    disableCritical = true,
    recoil = 0.08
  },

  [`WEAPON_ASSAULTRIFLE`] = {
    model = `WEAPON_ASSAULTRIFLE`,
    hash = -1074790547,
    damage = 0.50, 
    disableCritical = true,
    recoil = 0.13
  },

  -- [[ SHOUTGUN ]] --

  [`WEAPON_BULLPUPSHOTGUN`] = {
    model = `WEAPON_BULLPUPSHOTGUN`, 
    hash = 	-1654528753,
    damage = 0.8,
    disableCritical = true,
    recoil = 0.8
  },

  [`WEAPON_PUMPSHOTGUN`] = {
    model = `WEAPON_PUMPSHOTGUN`, 
    hash = 	487013001,
    damage = 0.27,
    disableCritical = true,
    recoil = 0.8
  },

  -- [[ SNIPER ]] --
  [`WEAPON_HEAVYSNIPER`] = {
    model = `WEAPON_HEAVYSNIPER`,
    hash = 205991906,
    damage = 2.0, 
    disableCritical = true,
    recoil = 0.5
  },

  [`WEAPON_SNIPERRIFLE`] = { -- 
    model = `WEAPON_SNIPERRIFLE`,
    hash = 100416529,
    damage = 2.0, 
    disableCritical = true,
    recoil = 0.5
  },
}