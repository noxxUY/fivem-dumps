Config = {}

Config.RequiredCops = 0 -- How many cops are required to drop a gun? -- test this, if not working, join https://discord.gg/6CpQn6EnD5
Config.PoliceJobs = {'police'}

Config.ModelsToLoad = {'w_am_flare', 'p_cargo_chute_s', 'ex_prop_adv_case_sm', 'bombushka', 's_m_m_pilot_02'}

Config.Models = {
    ['FlareName']       = 'weapon_flare',
    ['FlareModel']      = 'w_am_flare', 
    ['PlaneModel']      = 'bombushka',
    ['PlanePilotModel'] = 's_m_m_pilot_02',
    ['ParachuteModel']  = 'p_cargo_chute_s',
    ['CrateModel']      = 'ex_prop_adv_case_sm'
} 

Config.ItemDrops = {
    ['sim_card'] = { -- add this to your database // this is the item to start the airdrop // restart server after adding others
        {name = 'WEAPON_COMBATPISTOL', amount = 1, type = 'weapon'},
        {name = 'water', amount = 1, type = 'item'},
    }, 
--     ['flare_green'] = { -- add as many items you want 
--         {name = 'WEAPON_COMBATPISTOL', amount = 1, type = 'weapon'},
--         {name = 'water', amount = 1, type = 'item'},
--     }, 
}

Config.Lang = { 
    ['contact_mafia'] = 'Ha contactado con la mafia rusa',
    ['pilot_contact'] = 'en unos minutos el piloto se pondrá en contacto con usted',
    ['no_cops'] = 'no hay suficientes policías de servicio',
    ['pilot_dropping_soon'] = 'piloto: estamos preparando el lootdrop y lo soltaremos pronto',
    ['pilot_crashed'] = 'El avión se ha estrellado',
    ['crate_dropping'] = 'Piloto: mira en el cielo el lootdrop está en camino',
    ['item_recieved'] = 'Has recibido tu botín',
    ['cant_carry'] = 'No puedes llevar esto',
    ['already_thrown'] = 'Ya has lanzado una bengala'
}
