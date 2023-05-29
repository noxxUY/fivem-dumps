Config = Config or {}

-- Misc

Config.UseDiscordImages = true -- Only set this to false if you are using a different image hosting service

-- Mugshot

Config.Mugshot = {
    Enabled = true,
    Name = 'police_mugshot',
    Title = 'ARRESTED',
    Label = 'Los Santos Police Department',
    Level = 1
}

-- Notifications Messages

Config.Messages = {
    ['player:fine'] = 'Tienes una multa de ${{amount}} !',
    ['not_allowed'] = 'No puedes abrir la PDA!'
}