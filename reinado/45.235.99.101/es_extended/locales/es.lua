Locales['es'] = {
  -- Inventory
  ['inventory'] = 'Inventario %s / %s',
  ['use'] = 'Usar',
  ['give'] = 'Dar',
  ['remove'] = 'Tirar',
  ['return'] = 'Volver',
  ['give_to'] = 'Dar a',
  ['amount'] = 'Cantidad',
  ['giveammo'] = 'Dar munición',
  ['amountammo'] = 'Cantidad de munición',
  ['noammo'] = 'No tienes suficiente munición!',
  ['gave_item'] = 'Has dado %sx %s a %s',
  ['received_item'] = 'Has recibido %sx %s de %s ',
  ['gave_weapon'] = 'Has dado %s a %s',
  ['gave_weapon_ammo'] = 'Has dado %sx %s para %s a %s',
  ['gave_weapon_withammo'] = 'Has dado %s con %sx %s a %s',
  ['gave_weapon_hasalready'] = '%s ya tiene un/a %s',
  ['gave_weapon_noweapon'] = '%s no tiene ese arma',
  ['received_weapon'] = 'Has recibido %s de %s',
  ['received_weapon_ammo'] = 'Has recibido %sx %s para su %s de %s',
  ['received_weapon_withammo'] = 'Has recibido %s con %sx %s de %s',
  ['received_weapon_hasalready'] = '%s intentó darle un/a %s, pero ya tienes uno',
  ['received_weapon_noweapon'] = '%s intentó darles munición para un %s, pero no tiene uno',
  ['gave_account_money'] = 'Has dado $%s (%s) a %s',
  ['received_account_money'] = 'Has recibido $%s (%s) de %s',
  ['amount_invalid'] = 'Cantidad inválida',
  ['players_nearby'] = 'No hay jugadores cerca',
  ['ex_inv_lim'] = 'Acción no posible, excediendo el límite de inventario para %s',
  ['imp_invalid_quantity'] = 'Acción imposible, cantidad inválida',
  ['imp_invalid_amount'] = 'Acción imposible, cantidad inválida',
  ['threw_standard'] = 'Has tirado  %sx %s',
  ['threw_account'] = 'Has tirado $%s %s',
  ['threw_weapon'] = 'Has tirado %s',
  ['threw_weapon_ammo'] = 'Has tirado %s con %sx %s',
  ['threw_weapon_already'] = 'Ya llevas el mismo arma',
  ['threw_cannot_pickup'] = 'No puedes recogerlo porque tu inventario está lleno!',
  ['threw_pickup_prompt'] = 'Pulsa E para recoger',

  -- Key mapping
  ['keymap_showinventory'] = 'Ver Inventario',

  -- Salary related
  ['received_salary'] = 'Has recibido tu sueldo: $%s',
  ['received_help'] = 'Has recibido su cheque de bienestar: $%s',
  ['company_nomoney'] = 'La empresa en la que trabajas no tiene dinero para pagar tu sueldo',
  ['received_paycheck'] = 'Recibió su paga',
  ['bank'] = 'Banco',
  ['account_bank'] = 'Banco',
  ['account_bitcoin'] = 'Bitcoin',
  ['account_black_money'] = 'Dinero Negro',
  ['account_money'] = 'Efectivo',

  ['act_imp'] = 'Acción imposible',
  ['in_vehicle'] = 'No se puede dar nada a alguien en un vehículo',

  -- Commands
  ['command_car'] = 'Generar un vehiculo',
  ['command_car_car'] = 'Nombre o hash del vehículo',
  ['command_cardel'] = 'Eliminar vehículos cercanos',
  ['command_cardel_radius'] = 'Opcional, eliminar todos los vehículos en el radio especificado',
  ['command_clear'] = 'Limpiar chat',
  ['command_clearall'] = 'Limpiar chat para todos los jugadores',
  ['command_clearinventory'] = 'Limpiar el inventario del jugador',
  ['command_clearloadout'] = 'Limpiar inventario de un jugador',
  ['command_giveaccountmoney'] = 'Dar dinero',
  ['command_giveaccountmoney_account'] = 'Nombre de cuenta válido',
  ['command_giveaccountmoney_amount'] = 'Cantidad a añadir',
  ['command_giveaccountmoney_invalid'] = 'Nombre de cuenta inválido',
  ['command_giveitem'] = 'Dar un objeto a un jugador',
  ['command_giveitem_item'] = 'Nombre del artículo',
  ['command_giveitem_count'] = 'Cantidad de articulos',
  ['command_giveweapon'] = 'Dar un arma a un jugador',
  ['command_giveweapon_weapon'] = 'Nombre del arma',
  ['command_giveweapon_ammo'] = 'Cantidad de municion',
  ['command_giveweapon_hasalready'] = 'El jugador ya tiene esa arma',
  ['command_giveweaponcomponent'] = 'Dar el componente del arma',
  ['command_giveweaponcomponent_component'] = 'Nombre del componente',
  ['command_giveweaponcomponent_invalid'] = 'Componente del arma no válido',
  ['command_giveweaponcomponent_hasalready'] = 'El jugador ya tiene ese componente del arma',
  ['command_giveweaponcomponent_missingweapon'] = 'El jugador no tiene esa arma',
  ['command_save'] = 'Guardar un jugador en la base de datos',
  ['command_saveall'] = 'Guardar todos los jugadores en la base de datos',
  ['command_setaccountmoney'] = 'Establecer el dinero de la cuenta para un jugador',
  ['command_setaccountmoney_amount'] = 'Cantidad de dinero para fijar',
  ['command_setcoords'] = 'Teletransporte a coordenadas',
  ['command_setcoords_x'] = 'Eje X',
  ['command_setcoords_y'] = 'Eje Y',
  ['command_setcoords_z'] = 'Eje Z',
  ['command_setjob'] = 'Dar un trabajo a un jugador',
  ['command_setjob_job'] = 'Nombre del trabajo',
  ['command_setjob_grade'] = 'Rango del trabajo',
  ['command_setjob_invalid'] = 'El trabajo, el rango o ambos no son válidos',
  ['command_setgroup'] = 'Establecer el grupo de un jugador',
  ['command_setgroup_group'] = 'Nombre del grupo',
  ['commanderror_argumentmismatch'] = 'error en el recuento de argumentos (pasado %s, deseado %s)',
  ['commanderror_argumentmismatch_number'] = 'argumento #%s tipo no coincide (cadena pasada, número deseado)',
  ['commanderror_invaliditem'] = 'Nombre del artículo no válido',
  ['commanderror_invalidweapon'] = 'Arma inválida',
  ['commanderror_console'] = 'Ese comando no se puede ejecutar desde la consola',
  ['commanderror_invalidcommand'] = '/%s ¡No es un comando válido!',
  ['commanderror_invalidplayerid'] = 'No hay ningún jugador en línea que coincida con la ID del servidor',
  ['commandgeneric_playerid'] = 'ID del jugador',

  -- Locale settings
  ['locale_digit_grouping_symbol'] = ',',
  ['locale_currency'] = '$%s',

  -- Weapons
  ['weapon_knife']                              = 'Cuchillo',
	['weapon_nightstick']                         = 'Porra',
	['weapon_hammer']                             = 'Martillo',
	['weapon_bat']                                = 'Bate',
	['weapon_golfclub']                           = 'Palo de golf',
	['weapon_crowbar']                            = 'Palanca',
	['weapon_pistol']                             = 'Pistola',
	['weapon_pistol_mk2']                         = 'Pistola MK2',
	['weapon_ceramicpistol']                      = 'Pistola de ceramica',
	['weapon_combatpistol']                       = 'Pistola de combate',
	['weapon_appistol']                           = 'Pistola AP',
	['weapon_pistol50']                           = 'Pistola .50',
	['weapon_microsmg']                           = 'Micro SMG',
	['weapon_smg']                                = 'SMG',
	['weapon_assaultsmg']                         = 'SMG de asalto',
	['weapon_assaultrifle']                       = 'Rifle de asalto',
	['weapon_assaultrifle_mk2']                   = 'Rifle de asalto MK2',
	['weapon_carbinerifle']                       = 'Rifle de Carabina',
	['weapon_carbinerifle_mk2']                   = 'Rifle de Carabina MK2',
	['weapon_advancedrifle']                      = 'Rifle avanzado',
	['weapon_mg']                                 = 'MG',
	['weapon_combatmg']                           = 'MG de combate',
	['weapon_pumpshotgun']                        = 'Escopeta',
	['weapon_pumpshotgun_mk2']                    = 'Escopeta MK2',
	['weapon_sawnoffshotgun']                     = 'Escopeta recortada',
	['weapon_assaultshotgun']                     = 'Escopeta de asalto',
	['weapon_bullpupshotgun']                     = 'Escopeta bullpup',
	['weapon_stungun']                            = 'Taser',
	['weapon_sniperrifle']                        = 'Francotirador',
	['weapon_heavysniper']                        = 'Francotirador pesado',
	['weapon_grenadelauncher']                    = 'grenade launcher',
	['weapon_grenadelauncher_smoke']                    = 'Lanzagranadas de humo',
	['weapon_rpg']                                = 'Lanzamisiles',
	['weapon_minigun']                            = 'minigun',
	['weapon_grenade']                            = 'grenade',
	['weapon_stickybomb']                         = 'sticky bomb',
	['weapon_smokegrenade']                       = 'Granada de humo',
	['weapon_bzgas']                              = 'Gas BZ',
	['weapon_molotov']                            = 'molotov cocktail',
	['weapon_fireextinguisher']                   = 'fire extinguisher',
	['weapon_petrolcan']                          = 'Bidón de nafta',
	['weapon_ball']                               = 'ball',
	['weapon_snspistol']                          = 'Pistola SNS',
	['weapon_bottle']                             = 'bottle',
	['weapon_gusenberg']                          = 'gusenberg sweeper',
	['weapon_specialcarbine']                     = 'Carabina especial',
	['weapon_specialcarbine_mk2']                 = 'Carabina especial MK2',
	['weapon_heavypistol']                        = 'Pistola pesada',
	['weapon_bullpuprifle']                       = 'Rifle bullpup',
	['weapon_bullpuprifle_mk2']                   = 'Rifle bullpup MK2',
	['weapon_dagger']                             = 'Dagas',
	['weapon_vintagepistol']                      = 'Pistola vintage',
	['weapon_firework']                           = 'firework',
	['weapon_musket']                             = 'musket',
	['weapon_heavyshotgun']                       = 'Escopeta pesada',
	['weapon_marksmanrifle']                      = 'marksman rifle',
	['weapon_hominglauncher']                     = 'homing launcher',
	['weapon_proxmine']                           = 'proximity mine',
	['weapon_snowball']                           = 'snow ball',
	['weapon_flaregun']                           = 'flaregun',
	['weapon_combatpdw']                          = 'PDW de combate',
	['weapon_marksmanpistol']                     = 'marksman pistol',
	['weapon_knuckle']                            = 'Nudillos',
	['weapon_hatchet']                            = 'hatchet',
	['weapon_railgun']                            = 'railgun',
	['weapon_machete']                            = 'Machete',
	['weapon_machinepistol']                      = 'TEC-9', 
	['weapon_switchblade']                        = 'switchblade',
	['weapon_revolver']                           = 'Revolver',
	['weapon_dbshotgun']                          = 'double barrel shotgun',
	['weapon_compactrifle']                       = 'Rifle compacto',
	['weapon_autoshotgun']                        = 'auto shotgun',
	['weapon_battleaxe']                          = 'battle axe',
	['weapon_compactlauncher']                    = 'compact launcher',
	['weapon_minismg']                            = 'Mini SMG',
	['weapon_pipebomb']                           = 'pipe bomb',
	['weapon_poolcue']                            = 'pool cue',
	['weapon_wrench']                             = 'pipe wrench',
	['weapon_flashlight']                         = 'Linterna',
	['gadget_parachute']                          = 'Paracaídas',
	['weapon_flare']                              = 'flare',
	['weapon_doubleaction']                       = 'Revolver de doble-acción',
	['weapon_megaphone']                          = 'Megafono',

  -- Weapon Components
  ['component_knuckle_base'] = 'Modelo Basico',
  ['component_knuckle_pimp'] = 'el Proxeneta',
  ['component_knuckle_ballas'] = 'los Ballas',
  ['component_knuckle_dollar'] = 'el Buscavidas',
  ['component_knuckle_diamond'] = 'la Roca',
  ['component_knuckle_hate'] = 'el Hater',
  ['component_knuckle_love'] = 'el Amante',
  ['component_knuckle_player'] = 'el Jugador',
  ['component_knuckle_king'] = 'el Rey',
  ['component_knuckle_vagos'] = 'los Vagos',

  ['component_luxary_finish'] = 'Acabado de Armas de Lujo',

  ['component_handle_default'] = 'Mango Default',
  ['component_handle_vip'] = 'Mango VIP',
  ['component_handle_bodyguard'] = 'Mango de Guardaespaldas',

  ['component_vip_finish'] = 'Acabado VIP',
  ['component_bodyguard_finish'] = 'Acabado Guardaespaldas',

  ['component_camo_finish'] = 'Camuflaje Digital',
  ['component_camo_finish2'] = 'Camuflaje Pincelada',
  ['component_camo_finish3'] = 'Camuflaje Bosque',
  ['component_camo_finish4'] = 'Camuflaje Calavera',
  ['component_camo_finish5'] = 'Camuflaje Sessanta Nove',
  ['component_camo_finish6'] = 'Camuflaje Perseo',
  ['component_camo_finish7'] = 'Camuflaje Leopardo',
  ['component_camo_finish8'] = 'Camuflaje Zebra',
  ['component_camo_finish9'] = 'Camuflaje Geométrico',
  ['component_camo_finish10'] = 'Camuflaje Boom',
  ['component_camo_finish11'] = 'Camuflaje Patriotico',

  ['component_camo_slide_finish'] = 'Camuflaje Digital Deslizante',
  ['component_camo_slide_finish2'] = 'Camuflaje Pincelada Deslizante',
  ['component_camo_slide_finish3'] = 'Camuflaje Bosque Deslizante',
  ['component_camo_slide_finish4'] = 'Camuflaje Calavera Deslizante',
  ['component_camo_slide_finish5'] = 'Camuflaje Sessanta Nove Deslizante',
  ['component_camo_slide_finish6'] = 'Camuflaje Perseo Deslizante',
  ['component_camo_slide_finish7'] = 'Camuflaje Leopardo Deslizante',
  ['component_camo_slide_finish8'] = 'Camuflaje Zebra Deslizante',
  ['component_camo_slide_finish9'] = 'Camuflaje Geométrico Deslizante',
  ['component_camo_slide_finish10'] = 'Camuflaje Boom Deslizante',
  ['component_camo_slide_finish11'] = 'Camuflaje Patriotico Deslizante',

  ['component_clip_default'] = 'Cargador Default',
  ['component_clip_extended'] = 'Cargador Extendido',
  ['component_clip_drum'] = 'Cargador Barril',
  ['component_clip_box'] = 'Caja de Cargador',

  ['component_scope_holo'] = 'Mira Holográfico',
  ['component_scope_small'] = 'Mira Pequeña',
  ['component_scope_medium'] = 'Mira Mediana',
  ['component_scope_large'] = 'Mira Larga',
  ['component_scope'] = 'Mira',
  ['component_scope_advanced'] = 'Mira Avanzada',
  ['component_ironsights'] = 'Mira de Hierro',

  ['component_suppressor'] = 'Supresor',
  ['component_compensator'] = 'Compensador',

  ['component_muzzle_flat'] = 'Boquilla de Freno Plana',
  ['component_muzzle_tactical'] = 'Boquilla de Freno Tactica',
  ['component_muzzle_fat'] = 'Boquilla de Freno Punta Gorda',
  ['component_muzzle_precision'] = 'Boquilla de Freno de Precision',
  ['component_muzzle_heavy'] = 'Boquilla de Freno Pesada',
  ['component_muzzle_slanted'] = 'Boquilla de Freno inclinada',
  ['component_muzzle_split'] = 'Boquilla de Freno de Puntas Abiertas',
  ['component_muzzle_squared'] = 'Boquilla de Freno Cuadrada',

  ['component_flashlight'] = 'Linterna',
  ['component_grip'] = 'Agarre',

  ['component_barrel_default'] = 'Barril Por Defecto',
  ['component_barrel_heavy'] = 'Barril Pesado',

  ['component_ammo_tracer'] = 'Munición de Rastreo',
  ['component_ammo_incendiary'] = 'Munición Incendiaria',
  ['component_ammo_hollowpoint'] = 'Munición de Punta Hueca',
  ['component_ammo_fmj'] = 'Munición fMJ',
  ['component_ammo_armor'] = 'Munición Perforante para Blindaje',
  ['component_ammo_explosive'] = 'Munición Incendiaria Perforadora de Blindajes',

  ['component_shells_default'] = 'Casquillos Por Defecto',
  ['component_shells_incendiary'] = 'Casquillos Aliento de Dragón',
  ['component_shells_armor'] = 'Casquillos Perdigones de Acero',
  ['component_shells_hollowpoint'] = 'Casquillos Punta Hueca',
  ['component_shells_explosive'] = 'Casquillos Posta Explosiva',

  -- Weapon Ammo
  ['ammo_rounds'] = 'Redonda/s',
  ['ammo_shells'] = 'Casquillo/s',
  ['ammo_charge'] = 'Carga',
  ['ammo_petrol'] = 'Galones de Combustible',
  ['ammo_firework'] = 'Fuegos Artificiale/s',
  ['ammo_rockets'] = 'Cohete/s',
  ['ammo_grenadelauncher'] = 'Granada/s',
  ['ammo_grenade'] = 'Granada/s',
  ['ammo_stickybomb'] = 'Bomba/s',
  ['ammo_pipebomb'] = 'Bomba/s',
  ['ammo_smokebomb'] = 'Bomba/s',
  ['ammo_molotov'] = 'Molotov/s',
  ['ammo_proxmine'] = 'Mina(s)',
  ['ammo_bzgas'] = 'Lata(s)',
  ['ammo_ball'] = 'Bola(s)',
  ['ammo_snowball'] = 'Bola(s)',
  ['ammo_flare'] = 'Bengala(s)',
  ['ammo_flaregun'] = 'Bengala(s)',

  -- Weapon Tints
  ['tint_default'] = 'Skin Por Defecto',
  ['tint_green'] = 'Skin Verde',
  ['tint_gold'] = 'Skin Oro',
  ['tint_pink'] = 'Skin Rosa',
  ['tint_army'] = 'Skin Militar',
  ['tint_lspd'] = 'Skin Azul',
  ['tint_orange'] = 'Skin Naranja',
  ['tint_platinum'] = 'Skin Plata',
}
