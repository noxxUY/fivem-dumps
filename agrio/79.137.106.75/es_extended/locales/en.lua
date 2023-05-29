Locales['en'] = {
  -- Inventory
  ['inventory'] = 'inventory %s / %s',
  ['use'] = 'usar',
  ['give'] = 'dar',
  ['remove'] = 'tirar',
  ['return'] = 'atras',
  ['give_to'] = 'dar a',
  ['amount'] = 'cantidad',
  ['giveammo'] = 'dar munición',
  ['amountammo'] = 'cantidad de munición',
  ['noammo'] = 'no tienes suficiente munición!',
  ['gave_item'] = 'diste ~y~%sx~s~ ~b~%s~s~ a ~y~%s~s~',
  ['received_item'] = 'recibiste ~y~%sx~s~ ~b~%s~s~ de ~b~%s~s~',
 -- ['gave_weapon'] = 'diste ~b~%s~s~ a ~y~%s~s~',
  --['gave_weapon_ammo'] = 'Recibiste ~o~%sx %s~s~ para ~b~%s~s~ de ~y~%s~s~',
 ---- ['gave_weapon_withammo'] = 'Recibiste ~b~%s~s~ con ~o~%sx %s~s~ de ~y~%s~s~',
 -- ['gave_weapon_hasalready'] = '~y~%s~s~ ya tiene ~y~%s~s~',
 -- ['gave_weapon_noweapon'] = '~y~%s~s~ no tienes ese arma',
  --['received_weapon'] = 'Has recibido ~b~%s~s~ de ~b~%s~s~',
 -- ['received_weapon_ammo'] = 'you received ~o~%sx %s~s~ for your ~b~%s~s~ from ~b~%s~s~',
 -- ['received_weapon_withammo'] = 'you received ~b~%s~s~ with ~o~%sx %s~s~ from ~b~%s~s~',
 -- ['received_weapon_hasalready'] = '~b~%s~s~ attempted to give you a ~y~%s~s~, but you already have one',
 -- ['received_weapon_noweapon'] = '~b~%s~s~ attempted to give you ammo for a ~y~%s~s~, but you dont have one',
 ['gave_weapon'] = 'Has dado ~y~1x~s~ ~b~%s~s~ a ~y~%s~s~.',
 ['gave_weapon_ammo'] = 'Has dado ~y~1x~s~ ~b~%s~s~ con ~o~%sx~s~ balas a ~y~%s~s~.',
 ['gave_weapon_hasalready'] = '~y~%s~s~ ya tiene ~y~%s~s~',
 ['received_weapon'] = 'Has recibido ~y~1x~s~ ~b~%s~s~ de ~b~%s~s~.',
 ['received_weapon_ammo'] = 'Has recibido ~y~1x~s~ ~b~%s~s~ con ~o~%sx~s~ balas de ~b~%s~s~.',
 ['received_weapon_hasalready'] = '~b~%s~s~ ha tratado de darte~y~%s~s~, pero ya tenias una.',
 ['gave_ammo'] = 'Ha dado ~o~%sx~s~ municion a ~y~%s~s~.',
 ['received_ammo'] = 'Has recibido ~o~%sx~s~ municion de ~b~%s~s~.',
  ['gave_account_money'] = 'Has dado  ~g~$%s~s~ (%s) a  ~y~%s~s~',
  ['received_account_money'] = 'Has recibido ~g~$%s~s~ (%s) de ~b~%s~s~',
  ['amount_invalid'] = 'Cantidad invalida',
  ['players_nearby'] = 'Ningún jugador cerca',
  ['ex_inv_lim'] = 'Accion imposible, excede el límite de inventario de ~y~%s~s~',
  ['imp_invalid_quantity'] = 'Acción inválida cantidad inválida',
  ['imp_invalid_amount'] = 'Acción imposible',
  ['threw_standard'] = 'Has tirado ~y~%sx~s~ ~b~%s~s~',
  ['threw_account'] = 'Has tirado ~g~$%s~s~ ~b~%s~s~',
  ['threw_weapon'] = 'Has tirado ~b~%s~s~',
  ['threw_weapon_ammo'] = 'Has tirado ~b~%s~s~ with ~o~%sx %s~s~',
  ['threw_weapon_already'] = 'you already carry the same weapon',
  ['threw_cannot_pickup'] = 'you cannot pickup that because your inventory is full!',
  ['threw_pickup_prompt'] = 'press ~y~E~s~ to pickup',

  -- Key mapping
  ['keymap_showinventory'] = 'show Inventory',

  -- Salary related
  ['received_salary'] = 'Recibiste tu salario: ~g~€%s~s~',
  ['received_help'] = 'Recibiste tu cheque: ~g~$%s~s~',
  ['company_nomoney'] = 'Tu empresa no tiene suficiente dinero para poder pagar tu salario.',
  ['received_paycheck'] = 'Recibo de sueldo',
  ['bank'] = 'Banco',
  ['account_bank'] = 'banco',
  ['account_black_money'] = 'Dinero Negro',
  ['account_money'] = 'efectivo',

  ['act_imp'] = 'acción imposible',
  ['in_vehicle'] = 'no puedes darle nada a alguien en un vehículo',

  -- Commands
  ['command_car'] = 'spawn a vehicle',
  ['command_car_car'] = 'vehicle spawn name or hash',
  ['command_cardel'] = 'delete vehicle in proximity',
  ['command_cardel_radius'] = 'optional, delete every vehicle within the specified radius',
  ['command_clear'] = 'clear chat',
  ['command_clearall'] = 'clear chat for all players',
  ['command_clearinventory'] = 'clear player inventory',
  ['command_clearloadout'] = 'clear a player loadout',
  ['command_giveaccountmoney'] = 'give account money',
  ['command_giveaccountmoney_account'] = 'valid account name',
  ['command_giveaccountmoney_amount'] = 'amount to add',
  ['command_giveaccountmoney_invalid'] = 'invalid account name',
  ['command_giveitem'] = 'give an item to a player',
  ['command_giveitem_item'] = 'item name',
  ['command_giveitem_count'] = 'item count',
  ['command_giveweapon'] = 'give a weapon to a player',
  ['command_giveweapon_weapon'] = 'weapon name',
  ['command_giveweapon_ammo'] = 'ammo count',
  ['command_giveweapon_hasalready'] = 'player already has that weapon',
  ['command_giveweaponcomponent'] = 'give weapon component',
  ['command_giveweaponcomponent_component'] = 'component name',
  ['command_giveweaponcomponent_invalid'] = 'invalid weapon component',
  ['command_giveweaponcomponent_hasalready'] = 'player already has that weapon component',
  ['command_giveweaponcomponent_missingweapon'] = 'player does not have that weapon',
  ['command_save'] = 'save a player to database',
  ['command_saveall'] = 'save all players to database',
  ['command_setaccountmoney'] = 'set account money for a player',
  ['command_setaccountmoney_amount'] = 'amount of money to set',
  ['command_setcoords'] = 'teleport to coordinates',
  ['command_setcoords_x'] = 'x axis',
  ['command_setcoords_y'] = 'y axis',
  ['command_setcoords_z'] = 'z axis',
  ['command_setjob'] = 'set job for a player',
  ['command_setjob_job'] = 'job name',
  ['command_setjob_grade'] = 'job grade',
  ['command_setjob_invalid'] = 'the job, grade or both are invalid',
  ['command_setgroup'] = 'set player group',
  ['command_setgroup_group'] = 'group name',
  ['commanderror_argumentmismatch'] = 'argument count mismatch (passed %s, wanted %s)',
  ['commanderror_argumentmismatch_number'] = 'argument #%s type mismatch (passed string, wanted number)',
  ['commanderror_invaliditem'] = 'invalid item name',
  ['commanderror_invalidweapon'] = 'invalid weapon',
  ['commanderror_console'] = 'that command cannot be run from console',
  ['commanderror_invalidcommand'] = '^3%s^0 is not a valid command!',
  ['commanderror_invalidplayerid'] = 'there is no player online matching that server id',
  ['commandgeneric_playerid'] = 'player id',

  -- Locale settings
  ['locale_digit_grouping_symbol'] = ',',
  ['locale_currency'] = '$%s',

  -- Weapons
 --[[ ['weapon_knife'] = 'knife',
  ['weapon_nightstick'] = 'nightstick',
  ['weapon_hammer'] = 'hammer',
  ['weapon_bat'] = 'bat',
  ['weapon_golfclub'] = 'golf club',
  ['weapon_crowbar'] = 'crow bar',
  ['weapon_pistol'] = 'pistol',
  ['weapon_combatpistol'] = 'combat pistol',
  ['weapon_appistol'] = 'AP pistol',
  ['weapon_pistol50'] = 'pistol .50',
  ['weapon_microsmg'] = 'micro SMG',
  ['weapon_smg'] = 'SMG',
  ['weapon_assaultsmg'] = 'assault SMG',
  ['weapon_assaultrifle'] = 'assault rifle',
  ['weapon_carbinerifle'] = 'carbine rifle',
  ['weapon_advancedrifle'] = 'advanced rifle',
  ['weapon_mg'] = 'MG',
  ['weapon_combatmg'] = 'combat MG',
  ['weapon_pumpshotgun'] = 'pump shotgun',
  ['weapon_sawnoffshotgun'] = 'sawed off shotgun',
  ['weapon_assaultshotgun'] = 'assault shotgun',
  ['weapon_bullpupshotgun'] = 'bullpup shotgun',
  ['weapon_stungun'] = 'taser',
  ['weapon_sniperrifle'] = 'sniper rifle',
  ['weapon_heavysniper'] = 'heavy sniper',
  ['weapon_grenadelauncher'] = 'grenade launcher',
  ['weapon_rpg'] = 'rocket launcher',
  ['weapon_minigun'] = 'minigun',
  ['weapon_grenade'] = 'grenade',
  ['weapon_stickybomb'] = 'sticky bomb',
  ['weapon_smokegrenade'] = 'smoke grenade',
  ['weapon_bzgas'] = 'bz gas',
  ['weapon_molotov'] = 'molotov cocktail',
  ['weapon_fireextinguisher'] = 'fire extinguisher',
  ['weapon_petrolcan'] = 'jerrycan',
  ['weapon_ball'] = 'ball',
  ['weapon_snspistol'] = 'sns pistol',
  ['weapon_bottle'] = 'bottle',
  ['weapon_gusenberg'] = 'gusenberg sweeper',
  ['weapon_specialcarbine'] = 'special carbine',
  ['weapon_heavypistol'] = 'heavy pistol',
  ['weapon_bullpuprifle'] = 'bullpup rifle',
  ['weapon_dagger'] = 'dagger',
  ['weapon_vintagepistol'] = 'vintage pistol',
  ['weapon_firework'] = 'firework',
  ['weapon_musket'] = 'musket',
  ['weapon_heavyshotgun'] = 'heavy shotgun',
  ['weapon_marksmanrifle'] = 'marksman rifle',
  ['weapon_hominglauncher'] = 'homing launcher',
  ['weapon_proxmine'] = 'proximity mine',
  ['weapon_snowball'] = 'snow ball',
  ['weapon_flaregun'] = 'flaregun',
  ['weapon_combatpdw'] = 'combat pdw',
  ['weapon_marksmanpistol'] = 'marksman pistol',
  ['weapon_knuckle'] = 'knuckledusters',
  ['weapon_hatchet'] = 'hatchet',
  ['weapon_railgun'] = 'railgun',
  ['weapon_machete'] = 'machete',
  ['weapon_machinepistol'] = 'machine pistol',
  ['weapon_switchblade'] = 'switchblade',
  ['weapon_revolver'] = 'heavy revolver',
  ['weapon_dbshotgun'] = 'double barrel shotgun',
  ['weapon_compactrifle'] = 'compact rifle',
  ['weapon_autoshotgun'] = 'auto shotgun',
  ['weapon_battleaxe'] = 'battle axe',
  ['weapon_compactlauncher'] = 'compact launcher',
  ['weapon_minismg'] = 'mini smg',
  ['weapon_pipebomb'] = 'pipe bomb',
  ['weapon_poolcue'] = 'pool cue',
  ['weapon_wrench'] = 'pipe wrench',
  ['weapon_flashlight'] = 'flashlight',
  ['gadget_parachute'] = 'parachute',
  ['weapon_flare'] = 'flare',
  ['weapon_doubleaction'] = 'double-Action Revolver',

  -- Weapon Components
  ['component_clip_default'] = 'default Clip',
  ['component_clip_extended'] = 'extended Clip',
  ['component_clip_drum'] = 'drum Magazine',
  ['component_clip_box'] = 'box Magazine',
  ['component_flashlight'] = 'flashlight',
  ['component_scope'] = 'scope',
  ['component_scope_advanced'] = 'advanced Scope',
  ['component_suppressor'] = 'suppressor',
  ['component_grip'] = 'grip',
  ['component_luxary_finish'] = 'luxary Weapon Finish',--]]
  ['weapon_knife'] = 'Cuchillo',
  ['weapon_nightstick'] = 'Porra',
  ['weapon_hammer'] = 'Martillo',
  ['weapon_bat'] = 'Bate',
  ['weapon_golfclub'] = 'Palo de golf',
  ['weapon_crowbar'] = 'palanca',
  ['weapon_pistol'] = 'pistola',
  ['weapon_combatpistol'] = 'G17',
  ['weapon_appistol'] = 'pistola automatica',
  ['weapon_pistol50'] = 'pistola calibre 50',
  ['weapon_microsmg'] = 'micro smg',
  ['weapon_smg'] = 'MP5',
  ['weapon_assaultsmg'] = 'smg de asalto',
  ['weapon_assaultrifle'] = 'fusil de asalto',
  ['weapon_carbinerifle'] = 'M4A1',
  ['weapon_advancedrifle'] = 'fusil avanzado',
  ['weapon_mg'] = 'Ametralladora',
  ['weapon_combatmg'] = 'Ametralladora de combate',
  ['weapon_pumpshotgun'] = 'Escopeta',
  ['weapon_sawnoffshotgun'] = 'Escopeta recortada',
  ['weapon_assaultshotgun'] = 'carabina de asalto',
  ['weapon_bullpupshotgun'] = 'carabina bullup',
  ['weapon_stungun'] = 'Tazer X26',
  ['weapon_sniperrifle'] = 'Francotirador',
  ['weapon_heavysniper'] = 'Francotirador pesado',
  ['weapon_grenadelauncher'] = 'Lanza granadas',
  ['weapon_rpg'] = 'Lanza-cohetes',
  ['weapon_stinger'] = 'Lanza misiles',
  ['weapon_minigun'] = 'minigun',
  ['weapon_grenade'] = 'Granada',
  ['weapon_stickybomb'] = 'Bomba adhesiva',
  ['weapon_smokegrenade'] = 'Granada de humo',
  ['weapon_bzgas'] = 'Granada gas lacrimogeno',
  ['weapon_molotov'] = 'Coctel molotov',
  ['weapon_fireextinguisher'] = 'Extintor',
  ['weapon_petrolcan'] = 'Bidon de gasolina',
  ['weapon_digiscanner'] = 'Radar',
  ['weapon_ball'] = 'Pelota',
  ['weapon_snspistol'] = 'pistola SNS',
  ['weapon_bottle'] = 'Botella',
  ['weapon_gusenberg'] = 'Ametralladora Gusenberg',
  ['weapon_specialcarbine'] = 'carabina especial',
  ['weapon_heavypistol'] = 'Arma pesada',
  ['weapon_bullpuprifle'] = 'fusil bullpup',
  ['weapon_dagger'] = 'Daga',
  ['weapon_vintagepistol'] = 'pistola vintage',
  ['weapon_firework'] = 'Fuego artificiales',
  ['weapon_musket'] = 'Mosquete',
  ['weapon_heavyshotgun'] = 'escopeta pesada',
  ['weapon_marksmanrifle'] = 'fusil de tirador',
  ['weapon_hominglauncher'] = 'lanza cazador de cabezas',
  ['weapon_proxmine'] = 'Mina de proximidad',
  ['weapon_snowball'] = 'bola de nieve',
  ['weapon_flaregun'] = 'lanza cohete de socorro',
  ['weapon_garbagebag'] = 'bolsa de basura',
  ['weapon_handcuffs'] = 'esposas',
  ['weapon_combatpdw'] = 'UMP45',
  ['weapon_marksmanpistol'] = 'pistola de tirador',
  ['weapon_knuckle'] = 'puño americano',
  ['weapon_hatchet'] = 'hacha',
  ['weapon_railgun'] = 'cañon',
  ['weapon_machete'] = 'Machete',
  ['weapon_machinepistol'] = 'TEC-9',
  ['weapon_switchblade'] = 'Cuchillo mariposa',
  ['weapon_revolver'] = 'revolver',
  ['weapon_dbshotgun'] = 'escopeta de doble cañon',
  ['weapon_compactrifle'] = 'rifle compacto',
  ['weapon_autoshotgun'] = 'Ametralladora corta',
  ['weapon_battleaxe'] = 'Hacha de combate',
  ['weapon_compactlauncher'] = 'lanzador compacto',
  ['weapon_minismg'] = 'mini smg',
  ['weapon_pipebomb'] = 'Bomba "pipe"',
  ['weapon_poolcue'] = 'taco de billar',
  ['weapon_wrench'] = 'clave',
  ['weapon_flashlight'] = 'Linterna',
  ['gadget_nightvision'] = 'vision nocturna',
  ['gadget_parachute'] = 'paracaidas',
  ['weapon_flare'] = 'Bengalas',
  ['weapon_doubleaction'] = 'Revolver doble accion',

  -- Weapon Components
  ['component_clip_default'] = 'Empuñadura por defecto',
  ['component_clip_extended'] = 'Empuñadura extendida',
  ['component_clip_drum'] = 'drum Magazine',
  ['component_clip_box'] = 'box Magazine',
  ['component_flashlight'] = 'Linterna',
  ['component_scope'] = 'mira',
  ['component_scope_advanced'] = 'mira avanzada',
  ['component_suppressor'] = 'supresor',
  ['component_grip'] = 'empuñadora',
  ['component_luxary_finish'] = 'acabado lujoso',

  -- Weapon Ammo
  ['ammo_rounds'] = 'round(s)',
  ['ammo_shells'] = 'shell(s)',
  ['ammo_charge'] = 'charge',
  ['ammo_petrol'] = 'gallons of fuel',
  ['ammo_firework'] = 'firework(s)',
  ['ammo_rockets'] = 'rocket(s)',
  ['ammo_grenadelauncher'] = 'grenade(s)',
  ['ammo_grenade'] = 'grenade(s)',
  ['ammo_stickybomb'] = 'bomb(s)',
  ['ammo_pipebomb'] = 'bomb(s)',
  ['ammo_smokebomb'] = 'bomb(s)',
  ['ammo_molotov'] = 'cocktail(s)',
  ['ammo_proxmine'] = 'mine(s)',
  ['ammo_bzgas'] = 'can(s)',
  ['ammo_ball'] = 'ball(s)',
  ['ammo_snowball'] = 'snowball(s)',
  ['ammo_flare'] = 'flare(s)',
  ['ammo_flaregun'] = 'flare(s)',

  -- Weapon Tints
  ['tint_default'] = 'default skin',
  ['tint_green'] = 'green skin',
  ['tint_gold'] = 'gold skin',
  ['tint_pink'] = 'pink skin',
  ['tint_army'] = 'army skin',
  ['tint_lspd'] = 'blue skin',
  ['tint_orange'] = 'orange skin',
  ['tint_platinum'] = 'platinum skin',
}
