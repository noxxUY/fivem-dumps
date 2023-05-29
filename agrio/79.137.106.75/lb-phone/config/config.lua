Config = {}
Config.Debug = false -- Set to true to enable debug mode

--[[ FRAMEWORK OPTIONS ]] --
Config.Framework = "esx"
--[[
    Supported frameworks:
        * esx: es_extended, https://github.com/esx-framework/esx-legacy
        * qb: qb-core, https://github.com/qbcore-framework/qb-core
        * ox: ox_core, https://github.com/overextended/ox_core
        * standalone: no framework, note that framework specific apps will not work unless you implement the functions
]]
Config.CustomFramework = false -- if set to true and you use standalone, you will be able to use framework specific apps

Config.Item = {}
Config.Item.Require = true -- require a phone item to use the phone
Config.Item.Name = "phone" -- name of the phone item

Config.Item.Unique = false -- should each phone be unique? https://docs.lbphone.com/phone/configuration#unique-phones
Config.Item.Inventory = "ox_inventory" --[[
    The inventory you use
    Supported:
        * ox_inventory - https://github.com/overextended/ox_inventory
        * qb-inventory - https://github.com/qbcore-framework/qb-inventory
        * core_inventory - https://www.c8re.store/package/5121548
        * mf-inventory - https://modit.store/products/mf-inventory?variant=39985142268087
        * qs-inventory - https://buy.quasar-store.com/package/4770732
]]

Config.DynamicIsland = true -- if enabled, the phone will have a Iphone 14 Pro inspired Dynamic Island.
Config.SetupScreen = true -- if enabled, the phone will have a setup screen when the player first uses the phone.

Config.WhitelistApps = {
    -- ["test-app"] = {"police", "ambulance"}
}

Config.BlacklistApps = {
    -- ["DarkChat"] = {"police"}
}

Config.Companies = {}
Config.Companies.Enabled = false -- allow players to call companies?
Config.Companies.Services = {
    --[[{
        job = "ambulance",
        name = "SAMS",
        icon = "",
        canCall = false, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        
    },
    {
        job = "mechanic",
        name = "Mecanicos",
        icon = "",
        canCall = false, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        
    },

    {
        job = "taxi",
        name = "Taxistas",
        icon = "",
        canCall = false, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company

    },]]--
}

Config.Companies.Contacts = { -- not needed if you use the services app
     ["police"] = {
         name = "LSPD / SC",
         photo = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png"
     },
     ["sheriff"] = {
        name = "Sheriffs",
        photo = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png"
    },
    ["ambulance"] = {
        name = "SAMS",
        photo = ""
    },
    ["taxi"] = {
        name = "Taxistas",
        photo = ""
    },
    ["mechanic"] = {
        name = "Mecanicos",
        photo = ""
    },
}

Config.Companies.Management = {
    Enabled = true, -- if true, employees & the boss can manage the company

    Duty = true, -- if true, employees can go on/off duty
    -- Boss actions
    Deposit = true, -- if true, the boss can deposit money into the company
    Withdraw = true, -- if true, the boss can withdraw money from the company
    Hire = true, -- if true, the boss can hire employees
    Fire = true, -- if true, the boss can fire employees
    Promote = true, -- if true, the boss can promote employees
}

Config.CustomApps = { -- https://docs.lbphone.com/phone/custom-apps

}

Config.Valet = {}
Config.Valet.Enabled = true -- allow players to get their vehicles from the phone
Config.Valet.Price = 100 -- price to get your vehicle

Config.HouseScript = "loaf_housing" --[[
    The housing script you use on your server
    Supported:
        * loaf_housing - https://store.loaf-scripts.com/package/4310850
]]

--[[ VOICE OPTIONS ]] --
Config.Voice = {}
Config.Voice.System = "mumble"
--[[
    Supported voice systems:
        * pma: pma-voice - HIGHLY RECOMMENDED
        * mumble: mumble-voip - Not recommended, update to pma-voice
        * salty: saltychat - Not recommended, change to pma-voice
        * toko: tokovoip - Not recommended, change to pma-voice
]]

Config.Voice.HearNearby = false --[[
    Only works with pma-voice
    
    If true, players will be heard on instagram live if they are nearby
    If false, only the person who is live will be heard

    If true, allow nearby players to listen to phone calls if speaker is enabled
    If false, only the people in the call will be able to hear each other

    This feature is a work in progress and may not work as intended. It may have an impact on performance.
]]

--[[ PHONE OPTIONS ]] --
Config.Locations = { -- Locations that'll appear in the maps app.
    {
        position = vector2(428.9, -984.5),
        name = "LSPD",
        description = "Los Santos Police Department",
        icon = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png",
    }
}

Config.Locales = { -- languages that the player can choose from when setting up a phone [Check the docs to see which languages the phone supports]
    {
        locale = "en",
        name = "English"
    },
    {
        locale = "de",
        name = "Deutsch"
    },
    {
        locale = "fr",
        name = "Français"
    },
    {
        locale = "es",
        name = "Español"
    },
    {
        locale = "nl",
        name = "Nederlands"
    },
    {
        locale = "dk",
        name = "Dansk"
    },
    {
        locale = "no",
        name = "Norsk"
    },
    {
        locale = "th",
        name = "ไทย"
    },
    {
        locale = "ar",
        name = "عربي"
    },
    {
        locale = "ru",
        name = "Русский"
    },
    {
        locale = "cs",
        name = "Czech"
    },
    {
        locale = "sv",
        name = "Svenska"
    },
    {
        locale = "pl",
        name = "Polski"
    },
    {
        locale = "hu",
        name = "Magyar"
    },
}


Config.DefaultLocale = "es"
Config.DateLocale = "es-ES" -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat

Config.PhoneNumber = {}
Config.PhoneNumber.Format = "({3}) {3}-{4}" -- Don't touch unless you know what you're doing. IMPORTANT: The sum of the numbers needs to be equal to the phone number length
Config.PhoneNumber.Length = 4
Config.PhoneNumber.Prefixes = {
    "205",
    "907",
    "480",
    "520",
    "602"
}

Config.Battery = {}
Config.Battery.Enabled = false -- Enable battery on the phone, you'll need to use the exports to charge it.
Config.Battery.ChargeInterval = { 5, 10 } -- How much battery
Config.Battery.DischargeInterval = { 50, 60 } -- How many seconds for each percent to be removed from the battery
Config.Battery.DischargeWhenInactiveInterval = { 80, 120 } -- How many seconds for each percent to be removed from the battery when the phone is inactive
Config.Battery.DischargeWhenInactive = true -- Should the phone remove battery when the phone is closed?
-- WITH THESE SETTINGS, A FULL CHARGE WILL LAST AROUND 2 HOURS.


Config.CurrencyFormat = "$%s" -- ($100) Choose the formatting of the currency. %s will be replaced with the amount.
Config.MaxTransferAmount = 1000000 -- The maximum amount of money that can be transferred at once via wallet / messages.

Config.CityName = "Los Santos" -- The name that's being used in the weather app etc.
Config.RealTime = true -- if true, the time will use real life time depending on where the user lives, if false, the time will be the ingame time.

Config.EmailDomain = "agriophone.com"

Config.DeleteMessages = true -- allow players to delete messages?

Config.SyncFlash = true -- should flashlights be synced across all players? May have an impact on performance
Config.EndLiveClose = false -- should IG live end when you close the phone?
Config.AllowExternal = false -- allow people to upload external images? (note: this means they can upload nsfw / gore etc)
Config.AutoBackup = true -- should the phone automatically create a backup when you get a new phone?

Config.PhoneModel = `lb_phone_prop` -- the prop of the phone, if you want to use a custom phone model, you can change this here
Config.PhoneRotation = vector3(0.0, 0.0, 180.0) -- the rotation of the phone when attached to a player
Config.PhoneOffset = vector3(0.0, -0.005, 0.0) -- the offset of the phone when attached to a player

Config.Post = {} -- What apps should send posts to discord? You can set your webhooks in server/webhooks.lua
Config.Post.Twitter = true -- New tweets
Config.Post.Instagram = true -- New posts

Config.TwitterTrending = {}
Config.TwitterTrending.Enabled = true -- show trending hashtags?
Config.TwitterTrending.Reset = 7 * 24 -- How often should trending hashtags be reset on twitter? (in hours)

Config.TwitterNotifications = false -- should everyone get a notification when someone tweets?

Config.PromoteTwitter = {}
Config.PromoteTwitter.Enabled = true -- should you be able to promote tweets?
Config.PromoteTwitter.Cost = 2500 -- how much does it cost to promote a tweet?
Config.PromoteTwitter.Views = 100 -- how many views does a promoted tweet get?

Config.ICEServers = false -- ICE Servers for WebRTC (ig live, facetim). If you don't know what you're doing, leave this as false.

Config.Crypto = {}
Config.Crypto.Coins = {"bitcoin","ethereum","tether","binancecoin","usd-coin","ripple","binance-usd","cardano","dogecoin","solana","shiba-inu","polkadot","litecoin","bitcoin-cash"}
Config.Crypto.Currency = "usd" -- currency to use for crypto prices. https://api.coingecko.com/api/v3/simple/supported_vs_currencies
Config.Crypto.Refresh = 5 * 60 * 1000 -- how often should the crypto prices be refreshed (client cache)? (Default 5 minutes)

Config.KeyBinds = {
    -- Find keybinds here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Open = { -- toggle the phone
        Command = "phone",
        Bind = "F1",
        Description = "Abre tu telefono"
    },
    Focus = { -- keybind to toggle the mouse cursor.
        Command = "togglePhoneFocus",
        Bind = "LMENU",
        Description = "Cambia el cursor en tu teléfono"
    },
    StopSounds = { -- in case the sound would bug out, you can use this command to stop all sounds.
        Command = "stopSounds",
        Bind = false,
        Description = "Detener todos los sonidos del teléfono"
    },

    FlipCamera = {
        Command = "flipCam",
        Bind = "UP",
        Description = "Dale la vuelta a la camara de tu telefono"
    },
    TakePhoto = {
        Command = "takePhoto",
        Bind = "RETURN",
        Description = "Hacer foto / video"
    },
    ToggleFlash = {
        Command = "toggleCameraFlash",
        Bind = "E",
        Description = "Alternar flash"
    },
    LeftMode = {
        Command = "leftMode",
        Bind = "LEFT",
        Description = "Cambiar modo"
    },
    RightMode = {
        Command = "rightMode",
        Bind = "RIGHT",
        Description = "Cambiar modo"
    },

    AnswerCall = {
        Command = "answerCall",
        Bind = "RETURN",
        Description = "Responder llamada entrante"
    },
    DeclineCall = {
        Command = "declineCall",
        Bind = "BACK",
        Description = "Rechazar llamada entrante"
    },
}

Config.KeepInput = true -- keep input when nui is focused (meaning you can walk around etc)

--[[ PHOTO / VIDEO OPTIONS ]] --
-- Set your api keys in lb-phone/server/apiKeys.lua
Config.UploadMethod = {}
-- You can edit the upload methods in lb-phone/shared/upload.lua
Config.UploadMethod.Video = "Discord" -- or "Imgur" or "Custom"
Config.UploadMethod.Image = "Discord" -- or "Imgur" or "Custom
Config.UploadMethod.Audio = "Discord" -- or "Custom"
