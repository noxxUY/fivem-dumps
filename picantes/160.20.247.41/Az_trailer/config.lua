Config = {}

Config.RefoundPrice = 250
Config.FrameWork = "ESX" -- ESX or QBCore

Config.TrailerShop = {
    [1] ={
        npccoords = vector3(-99999.99, -99999.99, -99999.99), 
        heading = 120.0, 
        ped = 'a_f_m_downtown_01', 
        job = 'none',
        trailertobuy = {
            {label = 'Boat Trailer', name = 'boattrailer', price = 250, coordsspawn = vector3(-251.8, 6223.12, 31.49), heading = 311.34}, 
            {label = 'Car Trailer', name = 'trailersmall', price = 250, coordsspawn = vector3(-251.09, 6223.35, 32.49), heading =  311.34}
        }
    },
}

Config.VehicleCanTrail = {
    {name = 'GUARDIAN', class = {8}}, 
    {name = 'wildtrak', class = {8}}, 
    {name = 'velociraptor', class = {8}},
    {name = 'trx', class = {8}},
    {name = 'srt8', class = {8}},
    {name = 'nissantitan17', class = {8}},
    {name = 'jeepg', class = {8}},
    {name = 'GMCS', class = {8}},
    {name = 'g63amg6x6', class = {8}},
    {name = 'ford100', class = {8}},
    {name = 'durango', class = {8}},
    {name = 'demonhawk', class = {8}},
    {name = 'amarok', class = {8}},
    {name = 'RAPTOR150', class = {8}},
    {name = 'SQUADDIE', class = {8}},
    {name = 'BENSON', class = {8}},
    {name = 'EVERON', class = {8}},
    {name = 'TITAN', class = {8}},
    {name = 'SANDKING', class = {8}},
    {name = 'SANDKIN2', class = {8}},
    {name = 'DUBSTA3', class = {8}},
    {name = 'BOBCATXL', class = {8}},
    {name = 'BOATTRAILER', class = {14}},
    {name = 'TRAILER', class = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 18, 19, 20}},
    {name = 'WASTLNDR', class = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}},
    {name = 'TRAILER', class = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}}
}

Config.Lang = {    
    ["TrailerNotFind"] = 'Tráiler no encontrado',
    ["RampeAlreadySet"] = 'Ya hay una rampa adjunta',
    ["NoVehicleSet"] = 'No se encontró ningún vehículo adjunto',
    ["CantSetThisType"] = 'No puede adjuntar este tipo de vehículo a este remolque',
    ["NotGoodJob"] = 'No estás en el comercio objetivo',
    ["PressToOpen"] = 'Presiona E para abrir el menú',
    ["YouBuy"] = 'has alquilado: ',
    ["For"] = 'Para: ',
    ["CantBuy"] = 'no puedes comprar eso',
    ["BuyFor"] = 'Alquiler por: ',
    ["Blip"] = 'alquilar un remolque',
    ["TrailerNotFind"] = 'Tráiler no encontrado',
    ["NotInVehicle"] = 'no estas en un vehiculo',

    ["refoundTrailer"] = 'Reencontrar un tráiler'
}

Config.SendNotification = function(msg)
    if Config.FrameWork == "ESX" then
        ESX.ShowNotification(msg)
    elseif Config.FrameWork == "QBCore" then
        QBCore.Functions.Notify(msg, "error")
    end
end

Config.ShowHelpNotification = function(msg)
    if Config.FrameWork == "ESX" then
        ESX.ShowHelpNotification(msg)
    elseif Config.FrameWork == "QBCore" then
        print(msg)
    end
end

Config.GetJob = function()
    if Config.FrameWork == "ESX" then
        return ESX.PlayerData.job.name
    elseif Config.FrameWork == "QBCore" then
        return PlayerJob.name
    end
end

Config.Command = {
    ["attachtrailer"] = "attachtrailer",
    ["detachtrailer"] = "detachtrailer",

    -- TR2 TRAILER
    ["openrampetr2"] = "openrampetr2",
    ["opentrunktr2"] = "opentrunktr2",
    ["closerampetr2"] = "closerampetr2",
    ["closetrunktr2"] = "closetrunktr2",
}