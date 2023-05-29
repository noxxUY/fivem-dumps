Config = {}
Config.Debug = false
Config.DebugLevel = {
    'INFO',
    'CRITICAL',
    'SUCCESS',
    'ERROR',
    'DEBUG',
}

Config.Locale = 'en'
Config.HelpCommand = 'ayuda'
Config.SendHelpCommand = 'sendhelp'
Config.AdminCommand = 'helpadmin'
Config.NavigateCommand = 'pointgps' --/pointgps [pointKey]

--If false script will not register any key if not it will try register inserted key
Config.RegisterOpenKey = 'F9'

Config.LicenseType = 'license'
Config.NearPointDistance = 50

--Open point marker help
Config.OpenKey = Keys.E

Config.MarkerOffset = {
    ['default'] = vector3(0.0, 0.0, -1.0), --you can also customize per point key
}

-- Needed only first time for people who updated from version older than 1.1.0
-- More info in `server/api/common.lua`
Config.UpdateDatabaseStructure = false -- default `false`
