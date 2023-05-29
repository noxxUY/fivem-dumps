Config = {}
Translation = {}

Config.Locale = 'en'

Config.Debug = false

Config.useNewESX = false -- If you use ESX v.1.2 or newer enable this
Config.useOneSyncInfinity = false

Config.useESXCountSystem = true -- when you use item weights disable this
Config.useMyClothesAPI = false

Config.useRoutingBuckets = true

Config.ChangeDoorbellPrice = 500
Config.CalculateRentPrice = 50 -- This means: Buy price / YOURVALUE = Rent price
Config.CalculateSellPrice = 4 -- This means: The player will get Buy price / YOURVALUE back when he sells a property

Config.ShowAvailableBlips = true -- shows blips for each property, which is available
Config.ShowOnlyNearestProperty = false -- Only the blip of the nearest available property is visible

Config.useBlackMoney = true
Config.BlackMoneyName = 'black_money'

Config.LogDiscord = {
    enable = true,
    webhookInsertar = 'https://discord.com/api/webhooks/1097198243550601317/xuUgbzjK-YNzgtVr4qcGr4uYJwF0Saef6o7C1MUoafqBopq93SCfDYYZ0c0Ytv1tDPt8',
    webhookRetirar = 'https://discord.com/api/webhooks/1097198138101604462/hJh7u-KlbWxRq0rEf-jImfzC4eCkEq7HNK2L64bP8Cy8uI5OtnhRw3WDm2UhPmefAP2f',
}

Config.PayRent = {h= 20, m = 00} -- rents were paid at 20:00 -> 8 pm

Translation = {
    ['de'] = {
        ['blip_available_prop'] = 'Verfügbare Immobilie',
        ['blip_prop_owned'] = 'Immobilie in Besitz',
        ['blip_keyowner_unknown'] = 'Fremde Immobilie',
        ['blip_keyowner'] = 'Immobilie von ~g~',
        ['show_info'] = 'Drücke ~g~E~s~, um Infos anzuzeigen',
        ['leave_prop_infobar'] = 'Drücke ~g~E~s~, um die Immobilie zu verlassen',

        ['access_wardrobe'] = 'Drücke ~g~E~s~, um auf den Kleiderschrank zuzugreifen',
        ['prop'] = 'Immobilie',
        ['manage_keys'] = 'Schlüssel verwalten',
        ['remove_key_desc'] = 'Klicke, um den ~r~Schlüssel ~s~zu ~r~entziehen~s~',
        ['give_key'] = 'Schlüssel vergeben',
        ['give_key_desc'] = 'Klicke, um ~b~',
        ['give_key_desc2'] = ' ~s~einen Schlüssel weiterzugeben',
        ['wardrobe'] = 'Kleiderschrank',
        ['outfin_use'] = 'Outfit anziehen',
        ['outfit_remove'] = 'Outfit entfernen',
        ['outfit_removed'] = 'Das Outfit ~y~',
        ['outfit_removed2'] = ' ~s~wurde gelöscht.',
        ['store'] = 'Lager',
        ['weaponary'] = 'Waffenschrank',
        ['ammo'] = ' ~b~x ~s~Munition',
        ['insert_withdraw'] = 'Wie viel soll entnommen werden?',
        ['store_item'] = 'Gegenstand einlagern',
        ['insert_deposit'] = 'Wie viel soll weggelegt werden?',
        ['wallet'] = 'Konto',
        ['credit'] = 'Guthaben:',
        ['current_credit'] = 'Dein aktuelles Guthaben beträgt ~b~',
        ['money_deposit'] = 'Geld einzahlen',
        ['money_withdraw'] = 'Geld abheben',
        ['currency'] = '$',
        ['invite'] = 'Jemanden einladen',
        ['invite_player'] = 'Klicke, um ~b~',
        ['invite_player2'] = '~s~einzuladen',
        ['invited_player'] = 'Du hast ~g~',
        ['invited_player2'] = ' ~s~eingeladen.',
        ['lock_only_key'] = 'nur mit Schlüssel',
        ['lock_open'] = ' für jeden offen',
        ['doorlock'] = 'Türschloss',
        ['doorlock_desc'] = 'Entscheide, wer die Immobilie betreten darf',
        ['doorlock_changed'] = '~g~Türschloss-Status geändert auf: ~w~',
        ['doorbell'] = 'Klingelschild ändern',
        ['doorbell_desc'] = 'Ändere dein Klingelschild, sodass dich der Postbote immer findet.',
        ['leave_prop'] = ' verlassen',
        ['leave_prop_pre'] = '~s~',
        ['collector_propamount'] = ' Wohnungen',
        ['owned_prefix'] = '~y~In Besitz: ~s~',

        ['info_owned'] = 'In Besitz:',
        ['info_yes'] = '~g~Ja',
        ['info_no'] = '~r~Nein',
        ['info_type'] = 'Art:',
        ['info_name'] = 'Name:',
        ['info_adress'] = 'Adresse:',
        ['unique'] = 'Einzigartig:',
        ['enter_prop'] = 'Eigene Wohnung betreten',
        ['owner'] = 'Besitzer: ',
        ['enter_key_prop'] = 'Fremde Wohnungen betreten',
        ['prop_of'] = 'Wohnung von ',
        ['have_key'] = 'Du besitzt einen ~b~Schlüssel~s~!',
        ['open_for_everybody'] = 'Die Wohnung ist für ~g~jeden geöffnet~s~!',
        ['buy'] = 'Kaufen: ',
        ['rent'] = 'Mieten: ',
        ['rent_per_day'] = '$ / Tag',
        ['cancel_rent'] = 'Mietvertrag kündigen',
        ['rented'] = 'Gemietet:',
        ['cancel_prop'] = '[~r~!~s~] Kündigen',
        ['sell_prop'] = 'Immobilie verkaufen',
        ['confirm'] = '[~r~!~s~] Bestätigen',
        ['confirm_desc'] = '~s~Du erhältst ~g~',
        ['confirm_desc2'] = '$ ~s~zurück',
        ['invitation_expired'] = 'Die Einladung ist ~r~abgelaufen~s~!',

        ['has_entered_prop'] = ' hat die Wohnung ~g~betreten~s~!',
        ['doorbell_title'] = 'Türklingel',
        ['invite_msg'] = 'Du wurdest in ~y~',
        ['invite_msg2'] = ' ~s~eingeladen. Drücke ~g~E~s~, um die ~g~Einladung anzunehmen~s~.',
        ['got_key'] = 'Du hast einen ~g~Zweitschlüssel ~s~erhalten.',
        ['removed_key'] = 'Dir wurde ein ~y~Zweitschlüssel ~s~entzogen.',
        ['got_permission'] = 'Berechtigung erteilt',
        ['remove_permission'] = 'Berechtigung entzogen',
        ['remove_key'] = 'Du hast ~y~',
        ['remove_key2'] = ' ~s~den ~y~Zweitschlüssel ~s~entzogen.',
        ['give_key_msg'] = 'Du hast einen ~g~Zweitschlüssel ~s~an ~g~',
        ['give_key_msg2'] = ' ~s~weitergegeben.',
        ['too_heavy'] = 'Du kannst nicht so viel tragen!',
        ['not_enough_stored'] = 'Du hast nicht genügend davon gelagert.',
        ['need_restart_addoninventory'] = '~y~Häuserinventar wurde nicht korrekt geladen! Bitte verbinde dich erneut.',
        ['wrong_input'] = 'Falsche Einagbe!',
		['prop_successfully_rented'] = 'Du hast eine Wohnung für ~g~ ',
        ['prop_successfully_bought'] = 'Du hast eine Wohnung für ~g~ ',
        ['bought_2'] = '$ gekauft',
        ['rented_2'] = '$ gemietet',
        ['prop_canceled'] = 'Du hast eine Wohnung gekündigt!',
        ['not_enough_money'] = '~r~Nicht genügend Geld!',
        ['rent_paid'] = 'Miete i.H.v. ~g~',
        ['rent_paid2'] = '$ ~s~bezahlt',
        ['money_added_to_wallet'] = '$ ~g~in den Safe gelegt.',
        ['money_withdraw_from_safe'] = '$ ~g~aus dem Safe entnommen.',
        ['not_enough_money_in_wallet'] = '~r~Nicht genügend Geld in dem Haus liegen!',
        ['doorbell_changed'] = '~g~Klingelschild zu ~w~',
        ['doorbell_changed2'] = ' ~g~geändert.',
		['prop_not_available'] = 'Diese Wohnung ist nicht mehr verfügbar!'
    },

    ['en'] = {
        ['blip_available_prop'] = 'Propiedad disponible',
        ['blip_prop_owned'] = 'Propiedad propia',
        ['blip_keyowner_unknown'] = 'Propiedad de un amigo',
        ['blip_keyowner'] = 'Propiedad de ~g~',
        ['show_info'] = 'Presione ~g~E~s~, para mostrar información',
        ['leave_prop_infobar'] = 'Presione ~g~E~s~, salir de la propiedad',

        ['access_wardrobe'] = 'Presione ~g~E~s~, para acceder al armario',
        ['prop'] = 'Propiedad',
        ['manage_keys'] = 'Administrar claves',
        ['remove_key_desc'] = 'Haga clic para revocar ~r~acceso clave',
        ['give_key'] = 'Dar llaves',
        ['give_key_desc'] = 'Haga clic para dar ~b~',
        ['give_key_desc2'] = ' ~s~a Llaves',
        ['wardrobe'] = 'Armario',
        ['outfin_use'] = 'Póngase ropa',
        ['outfit_remove'] = 'Quitar la ropa',
        ['outfit_removed'] = 'El traje ~y~',
        ['outfit_removed2'] = ' ~s~lo que quitó.',
        ['store'] = 'Almacenamiento',
        ['weaponary'] = 'Arsenal',
        ['ammo'] = ' ~b~x ~s~Balas',
        ['insert_withdraw'] = 'Cuánto debe retirarse?',
        ['store_item'] = 'Tu bolso',
        ['insert_deposit'] = 'Cuánto se debe insertar?',
        ['wallet'] = 'Cartera',
        ['credit'] = 'Cartera:',
        ['current_credit'] = 'Tu Actualmente tienes ~b~',
        ['money_deposit'] = 'Depositar dinero',
        ['money_withdraw'] = 'Retirar dinero',
        ['currency'] = '$',
        ['invite'] = 'Invitar a alguien',
        ['invite_player'] = 'Haga clic para invitar ~b~',
        ['invite_player2'] = '~s~',
        ['invited_player'] = 'Has invitado ~g~',
        ['invited_player2'] = '~s~.',
        ['lock_only_key'] = 'solo con llave',
        ['lock_open'] = ' abierto para todos',
        ['doorlock'] = 'Cerradura de la puerta',
        ['doorlock_desc'] = 'Configurar, quién puede ingresar a la propiedad',
        ['doorlock_changed'] = '~g~El estado de la cerradura de la puerta cambió a: ~w~',
        ['doorbell'] = 'Cambiar la señal del timbre',
        ['doorbell_desc'] = 'Cambia el letrero de tu timbre.',
        ['leave_prop'] = '~s~',
        ['leave_prop_pre'] = 'Salir del ',
        ['collector_propamount'] = ' propiedades',
        ['owned_prefix'] = '~y~Dueño: ~s~',

        ['info_owned'] = 'Es de propiedad:',
        ['info_yes'] = '~g~Si',
        ['info_no'] = '~r~No',
        ['info_type'] = 'Tipo:',
        ['info_name'] = 'Nombre:',
        ['info_adress'] = 'Direccion:',
        ['unique'] = 'Unica:',
        ['enter_prop'] = 'Entrar a la propiedad',
        ['owner'] = 'Dueño: ',
        ['enter_key_prop'] = 'Ingrese otras propiedades',
        ['prop_of'] = 'Propiedad de ',
        ['have_key'] = 'Eres dueño de una ~b~LLAVE~s~!',
        ['open_for_everybody'] = 'La propiedad esta abierta ~g~para todos~s~!',
        ['buy'] = 'Comprar: ',
        ['rent'] = 'Rentar: ',
        ['rent_per_day'] = '$ / dia',
        ['cancel_rent'] = 'Cancelar contrato de alquiler',
        ['rented'] = 'Rentar:',
        ['cancel_prop'] = '[~r~!~s~] Cancelar',
        ['sell_prop'] = 'Vender propiedad',
        ['confirm'] = '[~r~!~s~] Confirmar',
        ['confirm_desc'] = '~s~Conseguirás ~g~',
        ['confirm_desc2'] = '$ ~s~Atras',
        ['invitation_expired'] = 'La invitacion a ~r~expirado~s~!',

        ['has_entered_prop'] = ' Has entrado a la ~g~propiedad~s~!',
        ['doorbell_title'] = 'Timbre de la puerta',
        ['invite_msg'] = 'Has sido invitado a ~y~',
        ['invite_msg2'] = ' ~s~. Presione ~g~E~s~, para ~g~acceptar al invitacion~s~.',
        ['got_key'] = 'Tienes una ~g~Llave~s~.',
        ['removed_key'] = 'Tu acceso llave fue ~y~removido~s~.',
        ['got_permission'] = 'Permiso concedido',
        ['remove_permission'] = 'Permiso revocado',
        ['remove_key'] = 'Tú has revocado ~y~',
        ['remove_key2'] = ' ~s~s ~y~Llave ~s~.',
        ['give_key_msg'] = 'Le diste una ~g~Llave ~s~a ~g~',
        ['give_key_msg2'] = '~s~.',
        ['too_heavy'] = 'No puedes cargar tanto!',
        ['not_enough_stored'] = 'No tienes tanto almacenado.',
        ['need_restart_addoninventory'] = '~y~El inventario de la propiedad no se cargó correctamente. Necesitas reiniciar tu juego.',
        ['wrong_input'] = 'Entrada incorrecta!',
        ['prop_successfully_rented'] = 'Has alquilado un accesorio para ~g~ ',
        ['prop_successfully_bought'] = 'Has comprado un accesorio para ~g~ ',
        ['bought_2'] = '$',
        ['rented_2'] = '$',
        ['prop_canceled'] = 'Has cancelado la propiedad!',
        ['not_enough_money'] = '~r~Dinero insuficiente!',
        ['rent_paid'] = '~g~',
        ['rent_paid2'] = '$ ~s~alquiler pagado.',
        ['money_added_to_wallet'] = '$ ~g~poner en la caja fuerte.',
        ['money_withdraw_from_safe'] = '$ ~g~sacado de la caja fuerte.',
        ['not_enough_money_in_wallet'] = '~r~No hay suficiente dinero en la casa.!',
        ['doorbell_changed'] = '~g~El letrero del timbre de la puerta cambió a ~w~',
        ['doorbell_changed2'] = '~g~.',
		['prop_not_available'] = 'Esta propiedad ya no está disponible!'
    }

}