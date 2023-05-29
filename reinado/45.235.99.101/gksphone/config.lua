-- PHONE SETTINGS --

Config = Config or {}
Config.KeyMapping       = true                 --## This setting is for those using slotted inventory. (Prevents key operation)
Config.OpenPhone        = 'f1'                 --## Phone open key ## https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.RegisterCommand  = "telefono"        --
Config.ItemName         = {
                            "phone",
                            "pink_phone",
                            "gold_phone"
                        }
Config.ChargeItemName       = "powerbank"      -- PowerBank Item Name
Config.PropActive           = true
Config.Locale               = 'es'
Config.Fahrenheit           = false
Config.DataUsersPhoneNumber = false            -- You can use it if there is phone_number in the users table in the database.
Config.UsableItem           = false             -- If you want to use without items set it to false
Config.AirDropID            = false
Config.AutoMessageDelete    = true             -- Automatically deletes messages (Messages,Mail,Group Messages,Tinder Messages,Yellow Pages)
Config.AutoDeleteTime       = 4                -- How many days ago you want to delete data
Config.TargetExport         = "qtarget"        -- exports["qtarget"]  -- Resource Name
Config.EyeTarget            = false            -- required qtarget
Config.WaitPhone            = 2                -- Cycle time when phone is on
Config.Signal               = false             -- Signal system (phone downtime in some areas)
-- PHONE SETTINGS --


-- ESX  --
Config.ESXVersion           = "Legacy"            -- ESX Version Legacy (+1.2) / OldLegacy (1.1)
Config.ESXResourceName      = "es_extended"       -- Filename of ESX Framework script
Config.ESXSharedObject      = "esx:getSharedObject"  -- ESX SharedObject Function
Config.ESXName              = "esx"            -- if you are using a different ESX name (you may need to change it)
Config.ESXLogout            = "esx:playerLogout"    --- ESX Logout trigger
Config.EsxAddonAcc          = 'esx_addonaccount:getSharedAccount'   -- if you are using a different ESX name (you may need to change it)
Config.ESXonPlayerDeath     = 'esx:onPlayerDeath'      -- Trigger to be used when the player dies
Config.ESXonPlayerSpawn     = 'esx:onPlayerSpawn'      --  The trigger that should be when the player gets revive
Config.ESXScoietyGetEmployes = "esx_society:getEmployees"   -- ESX Scoiety Adjust the triggers accordingly if they are different for you.
Config.ESXScoietySetJob      = "esx_society:setJob"         -- ESX Scoiety Adjust the triggers accordingly if they are different for you.
Config.ESXScoietyGetJob      = "esx_society:getJob"         -- ESX Scoiety Adjust the triggers accordingly if they are different for you.

-- ESX --


-- SETTINGS REQUIRED TO SPEAK VOICE --


Config.MumbleExport         = "mumble-voip"       -- exports["mumble-voip"]
Config.PMAVoiceExport       = "pma-voice"         -- exports["pma-voice"]
Config.PMAVoice         = true                   -- Use Pma-Voice Resource (Recomended!) https://github.com/AvarianKnight/pma-voice
Config.UseMumbleVoIP    = false                   -- Use Frazzle's Mumble-VoIP Resource https://github.com/FrazzIe/mumble-voip
Config.UseTokoVoIP      = false
Config.SaltyChat        = false                   -- SaltyChat (v2.6)


--- ## CALL COMMAND ### ---

Config.OnlineContactPlayers = true    -- Activate to see active players in the contacts

Config.CallAnswer = "responder"  -- quick answer (registercommand)
Config.EndCall = "finllamada"  -- to close call (registercommand)

Config.SpecificNumberOn = false  --- If you want the SpecificNumber function to work, enable it
 -- When this number is called the trigger on the doc page will work.
 -- server : https://docs.gkshop.org/gksphone/developers/server-event#specific-number
 -- client : https://docs.gkshop.org/gksphone/developers/client-event#specific-number
Config.SpecificNumber = {
    ["5555555"] = true
}

--- ### TEBEX - MUSIC - YOUTUBE  ### ---

Config.TebexTransactionID = "tbx-9349523a74484-303779" --- Required for Youtube and Music app. (example : tbx-5addc-555)

-- APP SETTINGS --

Config.TaxiPrice        = 500      -- Taxi Price ( 75$/KM )
Config.TaxiJobCode      = "taxi"  -- Job Code

-- ### BANK APP ### ---
Config.BankTransferCom  = 10     -- Bank transfer commission rate
Config.OfflineBankTransfer = true

---### Dispatch ### ---
Config.cdDispatch       = true  -- Activate if you are using Codesign Dispatch (https://codesign.pro/package/4206357)

-- ### VALE APP ### ---
Config.OwnedVehicles        = "owned_vehicles"    -- ## SQL TABLE NAME (VEHICLES)
Config.ValetOut             = "OUT"               -- ## GARAGE IN OUT OPTION
Config.ValePrice            = 15000                 -- Vale Price
Config.ValeNPC              = true                -- Activate if you want the valet to bring the car to you.
Config.ImpoundVale          = true                -- Set to true to not fetch impounded cars


Config.cdGarages            = false   -- Activate if you are using Codesign Garage (https://codesign.pro/package/4206352)
Config.loafGarages          = false   -- Activate if you are using Loaf Garage (https://store.loaf-scripts.com/package/4310876)

Config.ClassList = {
    [0] = "Compact",
    [1] = "Sedan",
    [2] = "SUV",
    [3] = "Coupe",
    [4] = "Muscle",
    [5] = "Sport Classic",
    [6] = "Sport",
    [7] = "Super",
    [8] = "Motorbike",
    [9] = "Off-Road",
    [10] = "Industrial",
    [11] = "Utility",
    [12] = "Van",
    [13] = "Bike",
    [14] = "Boat",
    [15] = "Helicopter",
    [16] = "Plane",
    [17] = "Service",
    [18] = "Emergency",
    [19] = "Military",
    [20] = "Commercial",
    [21] = "Train"
}

-- ## CAR SELLER ## --
Config.OfflineCarSeller = false
Config.DefaultGarage = "pillboxgarage"  -- The garage where the car will go when a car is purchased
Config.Carhashdebug = false  -- car hash (f8)
Config.CarsellerTax = 15
Config.CarsSellerBlacklist = {
    [-16948145] = false, -- car hash and true/false
    [-344943009] = true,
    
    
}

Config.CarSellerClassBlock = {
    ["Emergency"] = true
}

-- ### Business APP ### ---

Config.JobGrade           = { -- Business level (Invoice cancellation authorization)
    ["police"] = 1,
    ["ambulance"] = 2,
    ["mechanic"] = 2
}

-- ### House APP ### ---
Config.loafHouse          = false   -- Activate if you are using Loaf House (https://store.loaf-scripts.com/package/4310850)


-- ### YellowPages APP ### ---
Config.YellowpagesPrice = 300

-- ### Twitter APP ### ---
Config.TwitterVerifyCommand = "twitterverify"

-- ### Instagram APP ### ---
Config.InstagramVerifyCommand = "instagramverify"

-- ### Race APP ### ---
Config.RaceAutCommand = "raceaut"
Config.esxcoreaut = "admin"  --- esx 1.2 authorization system

-- ### Charge ### --- (/charge playerid charge(0-100))
Config.ChargeAutCommand = "charge"
Config.esxcorechargeaut = "admin"  ---  esx 1.2 authorization system

-- APP SETTINGS --


--## PHONE Box --##
Config.PhoneBox = true
Config.PhoneBoxKey = "E"
Config.PhoneBoxRegCom = "phonebox"
Config.PhoneBoothMoney = { actived = true, money = 500 }
Config.PhoneBoothModel = {
	[1281992692] = true,
    [1158960338] = true,
    [295857659] = true,
    [-78626473] = true,
    [-2103798695] = true,
    [1511539537] = true,
    [-1559354806] = true
}
Config.PhoneBootNumber = "22222"


--## Crypto ##--

Config.Crytos = {
    ["bitcoin"] = true,
    ["ethereum"] = true,
    ["tether"] = true,
    ["binance-usd"] = true,
    ["uniswap"] = true,
    ["binancecoi"] = true,
    ["terra-luna"] = true,
    ["avalanche-2"] = true,
    ["cardano"] = true,
    ["ripple"] = true,
    ["usd-coin"] = true,
    ["dogecoin"] = true,
    ["litecoin"] = true,
    ["chainlink"] = true,
    ["stellar"] = true,
    ["tron"] = true,
    ["eos"] = true,
    ["monero"] = true,
    ["iota"] = true
}

---##  Spam ## ---

Config.SpamLimit = 6  -- Default: 6
Config.SpamReset = 10  -- seconds
Config.SpamPlayerKick = true
Config.SpamDropPlayer = "Fuiste expulsado del servidor por enviar demasiado spam"



--- ### FREAMWORK ### ----


ESX = nil
ESX = exports[Config.ESXResourceName]:getSharedObject()
if ESX == nil then
    TriggerEvent(Config.ESXSharedObject, function(obj) ESX = obj end)
end

