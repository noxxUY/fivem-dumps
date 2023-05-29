Config = {
    JobCenter = vector3(941.16, -2168.12, 29.55),
    ReAdd = 1, -- seconds after a job is finished until its shown again
    Job = {
        ['jobRequired'] = true, -- if true: only players with the specified job can work, false everyone can work
        ['jobName'] = 'truck',
    },
    Jobs = {
        -- {title = 'title', payment = reward, vehicles = {'truck', 'trailer'}, start = {vector3(x, y, z), heading}, trailer = {vector3(x, y, z), heading}, arrive = vector3(x, y, z)}
        {title = 'Transportar mercaderia a Ikea', payment = 20000, vehicles = {'actros', 'trailers'}, start = {vector3(954.77, -2188.86, 29.63), 84.99}, trailer = {vector3(939.0, -1799.2, 30.1), 175.78}, arrive = vector3(2671.0, 3530.35, 51.26)},
        {title = 'Transportar mercaderia a Chile', payment = 30000, vehicles = {'hauler', 'trailers2'}, start = {vector3(943.8, -2181.24, 30.56), 84.76}, trailer = {vector3(946.29, -2111.86, 29.64), 86.76}, arrive = vector3(73.88, 6552.44, 31.44)}
    },
}

Strings = {
    ['not_job'] = "No tienes el trabajo de camionero!",
    ['somebody_doing'] = 'Alguien ya está haciendo este trabajo, por favor seleccione otro!',
    ['menu_title'] = 'Camionero - Elije tu trabajo',
    ['e_browse_jobs'] = 'Presiona ~INPUT_CONTEXT~ para ver los trabajos disponibles',
    ['start_job'] = '.Trabajo Camionero',
    ['truck'] = 'Camion',
    ['trailer'] = 'Trailer',
    ['get_to_truck'] = 'Ve hasta el ~y~Camion~w~!',
    ['get_to_trailer'] = 'Ve hasta el ~y~trailer~w~ y enganchalo!',
    ['destination'] = 'Destino',
    ['get_out'] = 'Sal del ~y~Camion~w~!',
    ['park'] = 'Estaciona el ~y~trailer~w~ en el destino.',
    ['park_truck'] = 'Estaciona el ~y~camion~w~ en el destino.',
    ['drive_destination'] = 'Maneja hasta el ~b~Destino~w~.',
    ['reward'] = 'Buen trabajo! Recibiste ~g~$~w~%s',
    ['paid_damages'] = 'Conduce mejor la proxima vez! Tu pago es ~r~$~w~%s por los daños causados!',
    ['drive_back'] = 'LLeva el ~y~camion ~w~ al deposito!.', 
    ['detach'] = 'Presiona ~b~H~w~ Para desengancha el trailer.'
}