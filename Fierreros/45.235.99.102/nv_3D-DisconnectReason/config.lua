Config = {}

Config.Translation = function(source, name, reason)
    return 'El Jugador ~b~[~y~'..source..'~b~] ~b~'..name..'~s~ se fue del servidor\n~o~razon~s~: ~r~'..reason;
end

Config.Reasons = {
    ['timed out'] = 'Timed Out',
    ['crash'] = 'Crashed',
    ['Exiting'] = 'Quitted',
    ['Disconnected.'] = 'Disconnected',
}
