Config = {}
Config.Locale = 'en'

Config.DrawDistance = 10

Config.MarkerInfo = {Type = 1, r = 102, g = 102, b = 204, x = 2.0, y = 2.0, z = 1.0}
Config.BlipLicenseShop = {Sprite = 408, Color = 0, Display = 2, Scale = 1.0}

Config.UseBlips = false -- true = Use License Shop Blips
Config.RequireDMV = false -- If true then it will require players to have Drivers Permit to buy other Licenses | false does the Opposite.
Config.AdvancedVehicleShop = true -- Set to true if using esx_advancedvehicleshop
Config.AdvancedWeaponShop = false -- Set to true if using esx_advancedweaponshop
Config.DMVSchool = true -- Set to true if using esx_dmvschool
Config.SellDMV = false -- Set to true if Config.RequireDMV = false & you want players to be able to buy Drivers Permit
Config.Drugs = false -- Set to true if using esx_drugs
Config.WeaponShop = true -- Set to true if using esx_weaponshop

Config.Prices = {
	Aircraft = 10000,
	Boating = 50,
	Melee = 1,
	Handgun = 10,
	SMG = 100,
	Shotgun = 50,
	Assault = 250,
	LMG = 1000,
	Sniper = 1500,
	Commercial = 300,
	Drivers = 150,
	DriversP = 75,
	Motorcycle = 225,
	Weed = 10000,
	Weapon = 1000
}

Config.Zones = {
	LicenseShops = {
		Coords = {
			vector3(-152.91, -982.84, 179.125),
			vector3(-160.01, -988.58, 179.125)
		}
	}
}

