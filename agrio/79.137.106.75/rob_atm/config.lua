language = {
    ["alreadyDrilled"] = "Este cajero automático ya se ha perforado, ahora puede colocar el gancho",
    ["drillingComplete"] = "Perforacion al cajero completado, ahora puede colocar el gancho.",
    ["nothingToDrill"] = "Nada que perforar",
    ["alreadyUsingRope"] = "Ya estás usando una cuerda.",
    ["tryAgain"] = "Error prueba de nuevo.",
    ["nothingToAttach"] = "Nada a lo que atar la cuerda..",
    ["vehicleFar"] = "El vehículo esta demasiado lejos.",
    ["copCheck"] = "No hay policias suficientes.",
    ["search"] = "Buscar",
    ["attach"] = "Poner cuerda",
    ["detach"] = "Soltar cuerda"
}

config = {
    framework = "esx", -- nd, esx, qb.
    drillTime = 15, -- 15 seconds to finish drilling the atm.
    interactKey = 47,
    copCheck = 1, -- there has to be 3 or more cops online.
    ox_inventory = false -- if you're using ox inventory then set to true, otherwise keep it false.
}

-- Notification, this can be changed to whatever you want, buy default it uses ox_lib notification.
function notify(notiTitle, notiDescription, notiType)
    exports.ox_lib:notify({
        title = notiTitle,
        description = notiDescription,
        type = notiType,
        position = "bottom"
    })
end