Config = {}
Config.Locale = 'en'
Config.Desarmadero = {x=480.47,y=-1317.87,z=29.2}

-- Edit to your Liking | true = It will remove that item when used | false = Does opposite of true
Config.Removeables = {
	BulletProofVest = true,
	Drill = true,
	FirstAidKit = true,
	LockPick = false,
	OxygenMask = true,
	RepairKit = true,
	TireKit = true,
	WeaponBox = true,
	WeaponClip = true
}

Config.RequiredPolices = 1

-- Item Scenario Wait Times in MS
Config.Wait = {
	Drill = 10000,
	LockPick = 10000,
	RepairKit = 10000,
	TireKit = 10000
}

-- Binoculars
Config.BinocularsPutAway = 177 -- Backspace Key

-- Weapon Ammos
Config.WeaponBoxAmmo = 150 -- Will give this many buillets to player
Config.WeaponClipAmmo = 27 -- Will give this many buillets to player

-- Vehicle GPS
Config.UseVehicleGPS = false -- Set to true to use Vehicle GPS.
Config.LimitedVehicles = true -- Set to true to only allow Aircrafts, Boats, & Cars to use GPS.
Config.OnlyFrontSeats = true -- Set to true to only allow the front 2 seats to be able to see Radar if they used it.
