Config = {}

Config.UpdateFrequency = 3600 -- Segundos que pasan para borrar un stat. (Por defecto 1 hora)
Config.Notifications = true
Config.Precio = 5000

Config.Skills = {
    ["Stamina"] = { -- Nombre del skill
        ["Current"] = 0, -- Valor por defecto
        ["RemoveAmount"] = -0.3, -- % a remover en caso de que Config.DeleteStats sea = true
        ["Stat"] = "MP0_STAMINA" -- Nombre del stat (nativo)
    }
}
