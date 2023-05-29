Config = {}

Config.Marker = {
    color = {r = 0, g = 0, b = 255},
    size = {x = 1.0, y = 1.0, z = 1.0},
    type = 1
}

Config.VehicleLicensesOnly = false -- this includes ["dmv", "drive", "drive_bike", "drive_truck", "drive...."] anything with drive..

Config.Locations = {
    LSPD = vector3(443.81, -975.75, 29.69),
    LSPD2 = vector3(461.88, -988.99, 23.91),
    SSPD = vector3(451.23, -973.81, 29.69),
}

Config.Discord = {
    WebhookUserName = "BorrachosRP BOT",
    Webhook = "https://discord.com/api/webhooks/898344370938449971/tCoN-EM1hxHo9H43Rs3Tu5TZtMBFSr2F0lbUNN2J3BM3-ctIh8KELfP5JVLa_BeUP0hc",
    ServerName = "BorrachosRP"
}

Language = {
    ['success_add'] = "Licencia creada satisfactoriamente",
    ['success_revoke'] = "Licencia revocada satisfactoriamente",
    ['add_license'] = 'Obtuviste una nueva licencia: %s!',
    ['remove_license'] = 'Tu licencia de %s fue revocada!',
    ['no_access'] = "No tienes permiso para acceder a eso!",
    ['open_menu_help'] = "Presiona ~INPUT_CONTEXT~ para acceder al administrador de licencias"
}