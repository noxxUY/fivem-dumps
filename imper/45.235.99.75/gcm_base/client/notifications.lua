function Notify(text, type)
    exports.gcm_notifications:SendNotification({
        text = text,
        type = type,    -- Por Defecto info (Posibles: info, success y error)
        timeout = 5000, -- Por Defecto 5000
        sonido = true -- Por Default false
    })
end