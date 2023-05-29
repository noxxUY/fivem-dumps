Config = {}

--[[
    General
]]
Config.chatSuggestions = true --[[ Add chat suggestions to help players with using the command ]]
Config.statistics = true --[[ Either enable or disable statistics command(s) for people with the right permissions ]]
Config.checkForUpdates = true --[[ You can either enable or disable auto update checking ]]

--[[ Delivery type ]]
Config.disableChat = true --[[ Either enable or disable messages that are being sent to chat ]]
Config.screenMessages = false --[[ Either enable or disable messages being shown on screen ]]

--[[ Logging ]]
Config.logging = true --[[ If you want logs to be sent to your discord set this as true ]]
Config.webhook = 'https://discord.com/api/webhooks/1062854726955303003/fKWIxzkyZRbiMc_hm8YlvB2CaWpnLp9fI47ro6-IZxSnHMvdcOvmlsVPo9_DlUezi9yj' --[[ Set the webhook you want messages to be sent to ]]

--[[
    INFO:
    Config.disableChat = true - Messages wont be sent to chat
    Config.disableChat = false - Messages will be sent to chat
    Config.screenMessages = true - Show messages on the screen
    Config.screenMessages = false - Show messages on the screen
]]