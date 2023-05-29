Config = {}

Config.JobNeeded = true -- If this is true you will need to have the job specified under.
Config.JobName = "postman" -- This will be the job you would need to add to the "jobs" table.

Config.PlatePrefix = "POSTOP" .. math.random(10, 99) -- This is the plate, it will say this on the back of it.

Config.PackageModel = GetHashKey("prop_cs_cardbox_01") -- Changing this can make it seem wierd holding the package.

Config.StartJobSpot = { -- This will be the "headquarter" for the job, you will start your work here.
    ["coordinates"] = vector3(-232.1788482666, -914.97088623047, 32.31079864502)
}

Config.VehicleSpawn = { -- This is where the job-vehicle will spawn.
    ["coordinates"] = vector3(-225.85423278809, -894.51696777344, 29.676826477051),
    ["heading"] = 250.0
}

Config.PostDeliverySpots = { -- This is all the locations you will be able to drop packages too.
    {
        ["location"] = "La comisaria de policía",
        ["coordinates"] = vector3(429.15, -981.46, 30.71)
    },
    {
        ["location"] = "El hospital de Pillbox",
        ["coordinates"] = vector3(340.1, -586.41, 28.79)
    },
    {
        ["location"] = "Michelin",
        ["coordinates"] = vector3(-205.82, -1308.18, 31.29)
    },
    {
        ["location"] = "El concesionario",
        ["coordinates"] = vector3(-31.93, -1105.05, 26.42)
    },
    {
        ["location"] = "La universidad",
        ["coordinates"] = vector3(-543.34, -206.72, 37.72)
    },
    {
        ["location"] = "Los Santos Custom",
        ["coordinates"] = vector3(-357.5, -134.29, 38.90)
    },
    {
        ["location"] = "Crucial Fix",
        ["coordinates"] = vector3(273.92, -833.69, 29.26)
    },
    {
        ["location"] = "El Puti",
        ["coordinates"] = vector3(129.47, -1299.63, 29.25)
    }
}

Config.RandomPackageReward = { 100, 300 } -- This is the reward for each package dropped, will be randomized { value1 | value2 }