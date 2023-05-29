if type(Config) ~= 'table' then
      Config = {}
end

Config.Locale = 'en'               -- Language of the bot | Locales folder

Config.BanCheckerDelay = 60 * 1000 -- ms |  Delay for the ban checker

--[[  Date format ]]
Config.DateLocale = {
      locale = 'en-US', --[[ Locale| Find yours: https://gist.github.com/jacobbubu/1836273 ]]
      options = {
            weekday = "long",
            year = "numeric",
            month = "long",
            day = "numeric",
            hour = "numeric",
            minute = "numeric",
      } --[[ Delete options you dont want, https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options ]]
}

Config.PersistentProps = true    -- Set to false to disable persistent props

Config.OneReportPerPlayer = true -- If set to true, players can only have one report active at a time

Config.LuxuDiscordBot = {
      enabled = false,
      resourceName = 'luxudiscord'
} -- Luxu Discord Bot

Config.Commands = {
      ["AdminMenu"] = {
            name = 'luxuadmin',
            key = 'F5',
      },
      ["Report"] = {
            name = 'report',
            key = false,
      },
      ["Noclip"] = {
            name = 'noclip',
            key = 'INSERT',
      },
      ["TPM"] = {
            name = 'tp',
            key = false,
      },
      ["Vector3"] = {
            name = 'vector3',
            key = false,
      },
      ["Vector4"] = {
            name = false,
            key = false,
      }
}


Config.Menus = {
      ['Reports'] = {
            enabled = true,
      },
      ['Banned'] = {
            enabled = true,
      }
}

Config.DiscordLogs = {
      enabled = true,
      bypass = { 'license:232432424', "discord:424242424", } -- users that will not be logged
}


Config.DisableNotifyLogs = false              -- If set to true will no longer print notifications in console.

Config.WarningStrikes = 3                     -- How many warnings until ban
Config.WarningBanTimeout = 24                 -- How many hours the warning ban should be
Config.WarnBanReason = "Has llegado a la mayor cantidad de WARNS permitidos" -- Reason for the warning ban

--[[ Notification Position - Interface only ]]
Config.NotifyX = 'end' -- start | center | end
Config.NotifyY = 'middle' -- top | middle | bottom


--[[ PERMISSIONS ]]
Config.IdentifiersAlwaysAllowed = { 'license:4e4ab2f627013ba30ee24affc9acc6f636e75d60', 'license:e04d775eb5fb193f05208597b5046a6f95f5b119', 'license:126e1b7e209ed4735e5e0848b152b3e0982a25d8', 'license:5ce7dbab132b76aa1c7e21639256f24d6ace4eb8'  } -- Identifiers that can always use the panel with ALL permissions (license,fivem,discord)
-- All the ace groups in your server

Config.TeleportEffect = {
      enable = false, -- Set to false to disable teleport effect
      effectLibrary = "scr_rcbarry1",
      effectName = "scr_alien_teleport",
      delay = 5000
}
