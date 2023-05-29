main = {
    spawnBikeInDistance = 20.0, -- The distance to spawn in bikes in available slots (to optimise performance)
    machineUsageDistance = 2.0, -- The distance away from the machine to hire a bike
    machineKey = {0, 191},
    returnKey = {0, 191},
    bikesAvailable = 100.0, -- This is the % of bikes available at each dock. eg, 50% would mean 2/4 bikes at each dock when server starts
    enableBlips = true, -- This enables blips
    blipName = "Alquiler de bicis", -- This shows how many bikes available at each dock
    blip = 376,
    blipShortRange = true,
    blipScale = 0.5,
    blipColour = 0,
    blipDisplay = 4,
    returnDetectionDistance = 1.0,
    enableAnimation = true,
    animDict = "amb@prop_human_atm@male@enter",
    animName = "enter",
    hireCooldown = true,
    hireCooldownTime = 5, -- 5 min cooldown before player can hire another
    enableResetBike = true, -- This toggles automatic reset on/off, best for public servers to keep it on
    time = 10, -- Reset a bike to a dock after 10 minutes automatically
}

model = {
    dock = `prop_bike_dock`,
    machine = `prop_cycle_terminal`,
    bike = `cruiser`,
}

translations = {
    press = "Clic",
    machineKey = "INPUT_FRONTEND_RDOWN",
    toHire = "Para alquilar una bicicleta",
    toReturn = "Para devolver la bicicleta",
    noFree = "~y~Alarma~w~: No hay paradas para devolver esta bicicleta!",
    noneLeft = "~y~Alarma~w~: No hay bicicletas!",
    bikeHired = "~g~Conseguido~w~: Pediste prestada una bicicleta, ahora está desbloqueada y puedes seguir adelante",
    returnKey = "INPUT_FRONTEND_RDOWN",
    cooldown = "~y~Alarma~w~: Tienes que esperar hasta poder alquilar de nuevo!",
}

locations = {
    {
        machine = {coords = vector3(168.95793151855, -784.54144287109, 30.56356048584), heading = 251.42901611328},
        docks = {
            {coords = vector3(167.29733276367, -789.31994628906, 30.372360229492), heading = 159.71754455566},
			{coords = vector3(167.62568664551, -788.44274902344, 30.41223526001), heading = 157.4613494873},
			{coords = vector3(167.93762207031, -787.60205078125, 30.449226379395), heading = 158.15132141113},
			{coords = vector3(168.26489257813, -786.67681884766, 30.489252090454), heading = 160.17166137695},
			{coords = vector3(168.63510131836, -785.70965576172, 30.531480789185), heading = 160.65245056152},
        },
    },
	{
        machine = {coords = vector3(-326.59655761719, -865.53662109375, 30.628652572632), heading = 353.15005493164},
        docks = {
            {coords = vector3(-328.11584472656, -865.11114501953, 30.64564704895), heading = 262.78735351563},
			{coords = vector3(-329.29116821289, -864.93615722656, 30.642578125), heading = 260.74234008789},
			{coords = vector3(-330.43615722656, -864.73687744141, 30.639659881592), heading = 261.95458984375},
			{coords = vector3(-331.46649169922, -864.57318115234, 30.639862060547), heading = 261.54830932617},
			{coords = vector3(-332.57510375977, -864.37927246094, 30.63814163208), heading = 263.46557617188},
        },
    },
	{
        machine = {coords = vector3(-818.43664550781, -1052.1641845703, 11.864109992981), heading = 300.60357666016},
        docks = {
            {coords = vector3(-819.00213623047, -1050.9406738281, 11.931547164917), heading = 209.94709777832},
			{coords = vector3(-819.55743408203, -1049.9575195313, 11.971593856812), heading = 209.77626037598},
			{coords = vector3(-820.05078125, -1048.9847412109, 12.009950637817), heading = 208.94453430176},
			{coords = vector3(-820.54235839844, -1048.0483398438, 12.047245979309), heading = 209.57325744629},
        },
    },
	{
        machine = {coords = vector3(-73.736305236816, -529.67749023438, 39.279010772705), heading = 251.19369506836},
        docks = {
            {coords = vector3(-73.221633911133, -528.33605957031, 39.297206878662), heading = 163.74099731445},
			{coords = vector3(-72.869140625, -527.28173828125, 39.295459747314), heading = 164.25453186035},
			{coords = vector3(-72.52042388916, -526.29046630859, 39.296894073486), heading = 163.48394775391},
			{coords = vector3(-72.201591491699, -525.22991943359, 39.309619903564), heading = 164.55236816406},
			{coords = vector3(-71.817565917969, -524.12670898438, 39.323047637939), heading = 162.62355041504},
        },
    },
	{
        machine = {coords = vector3(-1554.4866943359, -481.42150878906, 34.491672515869), heading = 212.60423278809},
        docks = {
            {coords = vector3(-1553.1840820313, -480.76593017578, 34.504787445068), heading = 123.22536468506},
			{coords = vector3(-1552.2464599609, -480.18643188477, 34.500469207764), heading = 121.87652587891},
			{coords = vector3(-1551.2437744141, -479.55444335938, 34.49568939209), heading = 123.14986419678},
			{coords = vector3(-1550.4049072266, -479.04135131836, 34.495574951172), heading = 124.29611968994},
        },
    },
	{
        machine = {coords = vector3(-530.71240234375, 279.20489501953, 82.022033691406), heading = 84.700218200684},
        docks = {
            {coords = vector3(-530.57611083984, 280.52288818359, 82.039237976074), heading = 356.14862060547},
			{coords = vector3(-530.50231933594, 281.47766113281, 82.039237976074), heading = 356.16564941406},
			{coords = vector3(-530.39184570313, 282.48779296875, 82.039237976074), heading = 358.51721191406},
			{coords = vector3(-530.29595947266, 283.55160522461, 82.039237976074), heading = 356.07971191406},
        },
    },
	{
        machine = {coords = vector3(-1326.4405517578, -1345.0222167969, 3.5712778568268), heading = 110.19537353516},
        docks = {
            {coords = vector3(-1326.0064697266, -1346.2373046875, 3.5900869369507), heading = 20.297428131104},
			{coords = vector3(-1325.6273193359, -1347.2141113281, 3.5906138420105), heading = 18.772245407104},
			{coords = vector3(-1325.2719726563, -1348.3060302734, 3.5901596546173), heading = 20.721179962158},
			{coords = vector3(-1324.8991699219, -1349.3482666016, 3.589052438736), heading = 19.152864456177},
        },
    },
	{
        machine = {coords = vector3(-293.24383544922, 6253.521484375, 30.451107025146), heading = 224.58767700195},
        docks = {
            {coords = vector3(-294.10119628906, 6252.642578125, 30.465246200562), heading = 134.33166503906},
			{coords = vector3(-294.78833007813, 6251.9116210938, 30.462554931641), heading = 135.7053527832},
			{coords = vector3(-295.46377563477, 6251.1987304688, 30.459959030151), heading = 137.55137634277},
			{coords = vector3(-296.22406005859, 6250.4194335938, 30.465709686279), heading = 135.95179748535},
        },
    },
}