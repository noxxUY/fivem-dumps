Cfg = {}

Cfg.DuracionTiroreo = 15 -- duracion en segundos de la zona de tiroteo. Mientras esta este activa no van a llegar mas llamados de tiroteo, pero si de otros tipos de llamdos

Cfg.DuracionAlertas = 40 -- Tiempo en minutos, durante los cuales la alerta se va a mostrar. una vez pasado este tiempo la alerta va a desaparecer del menu, pero va a seguir en el /registro



--[[
Tutorial:
El evento a ejecutar para mandar mensajes es el siguiente: 
    TriggerServerEvent('p_alert:msg', 
        trabajo,
        mensaje,
        cords,
        respuesta
    )
aclaracion: En la parte de respuesta va el mensaje que le llega al que mando la alerta, cuando esta es respondida por la faccion a la cual se le envio. en caso de dejarlo vacio no te va a aparecer ninguna notificacion.
]]
