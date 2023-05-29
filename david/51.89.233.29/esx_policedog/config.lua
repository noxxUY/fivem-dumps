-- TriggerEvent('esx_policedog:openMenu') to open menu

Config = {
    Job = 'police',
    Command = 'perro', -- set to false if you dont want to have a command
    Model = 1126154828,
    TpDistance = 50.0,
    Sit = {
        dict = 'creatures@rottweiler@amb@world_dog_sitting@base',
        anim = 'base'
    },
    Drugs = {'weed', 'coke', 'meth', 'opium', 'weed_pooch', 'coke_pooch', 'opium_pooch', 'coke_pooch'}, -- add all drugs here for the dog to detect
}

Strings = {
    ['not_police'] = '¡No ~r~eres ~s~policía!',
    ['menu_title'] = 'Perro policia',
    ['take_out_remove'] = 'llamar/echar al perro de policia',
    ['deleted_dog'] = 'Retirado el perro policía',
    ['spawned_dog'] = 'El perro de policía ha llegado',
    ['sit_stand'] = 'Hacer que el perro se siente/se levante',
    ['no_dog'] = "¡No tienes ningun perro!",
    ['dog_dead'] = 'Tu perro ha muerto :/',
    ['search_drugs'] = 'Buscar drogas cerca del jugador',
    ['no_drugs'] = 'No tiene drogas.', 
    ['drugs_found'] = 'Tiene drogas',
    ['dog_too_far'] = '¡El perro esta lejos!',
    ['attack_closest'] = 'Atacar al jugador mas cercano',
    ['toofarfromcar'] = '~r~¡El perro esta muy lejos del vehiculo!~s~',
    ['youneedtobeincar'] = '¡Tienes que estar dentro del vehiculo!',
    ['yourstillinacar'] = 'todavía estás en un vehículo',
    ['get_ped_inside'] = 'Decir al perro que se suba al vehiculo',
    ['get_ped_down'] = 'Decir al perro que se baje del vehiculo'
}