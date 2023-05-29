Config = {}
Config.Locale = 'en'

Config.MenuAlign = 'top-left'
Config.DrawDistance = 100

Config.HospMarker = {Type = 21, r = 224, g = 50, b = 50, x = 1.5, y = 1.5, z = 1.0}-- Hospital Marker | Blue w/Normal Size
Config.BlipHospital = {Sprite = 586, Color = 2, Display = 2, Scale = 1.0}
Config.SurgMarker = {Type = 21, r = 224, g = 50, b = 50, x = 1.5, y = 1.5, z = 1.0} -- Surgery Marker | Blue w/Normal Size
Config.BlipSurgery = {Sprite = 403, Color = 0, Display = 2, Scale = 1.0}

Config.UseHospital = false -- Allows players to Heal Themselves
Config.UseHospitalBlips = true -- true = Uses Hospital Blips
Config.HealingPrice = 2000

Config.UseSurgeon = true -- Allows players to edit their Character
Config.UseSurgeonBlips = false -- true = Uses Surgery Blips
Config.SurgeryPrice = 100000

Config.Healer = {
	Locations = {
		Coords = {

		}
	}
}

Config.Surgery = {
	Locations = {
		Coords = {
			vector3(313.9912, -568.9187, 43.2821) -- esx_ambulancejob Inside
		}
	}
}
