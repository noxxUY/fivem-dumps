CodeStudio = {}


CodeStudio.useTaxi = true          --Use AI Taxi or Not?
CodeStudio.SpawnPedLoc = vector3(-1044.91, -2750.2, 21.36)    --If not using AI Taxi then set player spawn location 

CodeStudio.Taxi = `taxi`                                     --Taxi Model
CodeStudio.TaxiPlate = 'P4RKZ'                              --Taxi Number Plate
CodeStudio.TaxiModded = true
CodeStudio.TaxiSpawn = vector4(-1058.48, -2713.28, 20.17, 240.05)       --Taxi First Spawn Location   
CodeStudio.TaxiDestination = vector4(181.96, -844.80, 30.53, 338.15)         --Taxi Destination Lcoation 
CodeStudio.SkipToNearestLoc = vector4(133.07, -963.26, 29.01, 341.20)       --Taxi Skip Nearest Location to destination



CodeStudio.WelcomeMessage = 'Bienvenido a ParkZ RP'
CodeStudio.ReachedMessage = "Llegamos a nuestro destino"




function Notify(msg)
    SetNotificationTextEntry('STRING') --- DELETE ME IF YOU ARE USING ANOTHER SYSTEM
    AddTextComponentString(msg)  --- DELETE ME IF YOU ARE USING ANOTHER SYSTEM
    DrawNotification(0,1)  --- DELETE ME IF YOU ARE USING ANOTHER SYSTEM
end