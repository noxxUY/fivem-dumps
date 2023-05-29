Config = {}
Translation = {}

Config.Locale = 'en'

Config.useNewESX = true -- If you use ESX v.1.2 or newer enable this
Config.useOneSyncInfinity = true

Config.useESXCountSystem = false -- when you use item weights disable this
Config.useMyClothesAPI = false

Config.ChangeDoorbellPrice = 500
Config.CalculateRentPrice = 200 -- This means: Buy price / YOURVALUE = Rent price
Config.CalculateSellPrice = 4 -- This means: The player will get Buy price / YOURVALUE back when he sells a property

Config.ShowAvailableBlips = true -- shows blips for each property, which is available
Config.ShowOnlyNearestProperty = false -- Only the blip of the nearest available property is visible

Config.useBlackMoney = false
Config.BlackMoneyName = 'black_money'

-- Inventario de mafias (Stashes)
Config.PesoMaximo = 150000 -- PESO EN GRAMOS
Config.SlotsMaximo = 15 -- Slots que tiene el inventario

Config.PayRent = {h= 20, m = 00} -- rents were paid at 20:00 -> 8 pm

Translation = {
    
    ['en'] = {
        ['blip_available_prop'] = 'Propiedad disponible',
        ['blip_prop_owned'] = 'Propiedad Aquirida',
        ['blip_keyowner_unknown'] = 'Propiedad de un amigo',
        ['blip_keyowner'] = 'Propiedad de ~g~',
        ['show_info'] = 'Pulsá ~g~~INPUT_PICKUP~~s~, para mostrar información',
        ['leave_prop_infobar'] = 'Pulsá ~g~~INPUT_PICKUP~~s~, para salir de la propiedad',
        
        ['access_wardrobe'] = 'Pulsá ~g~~INPUT_PICKUP~~s~, para acceder al armario',
        ['prop'] = 'Propiedad',
        ['manage_keys'] = 'Gestionar llaves',
        ['remove_key_desc'] = 'Pulsa, para revocar el acceso a la llave ~r~',
        ['give_key'] = 'Dar llaves',
        ['give_key_desc'] = 'Haga clic, para dar ~b~',
        ['give_key_desc2'] = ' ~s~una llave',
        ['wardrobe'] = 'Armario',
        ['outfin_use'] = 'Ponerse la ropa',
        ['outfit_remove'] = 'Quitarse la ropa',
        ['outfit_removed'] = 'La ropa ~y~',
        ['outfit_removed2'] = 'El conjunto ~s~ se ha quitado',
        ['store'] = 'Almacenamiento',
        ['weaponary'] = 'Armamento',
        ['ammo'] = ' ~b~x ~s~ammo',
        ['insert_withdraw'] = '¿Cuánto queres retirar?',
        ['store_item'] = 'Almacenar artículo',
        ['insert_deposit'] = '¿Cuánto queres insertar?',
        ['wallet'] = 'Caja Fuerte',
        ['credit'] = 'Cartera:',
        ['current_credit'] = 'Dinero en Caja Fuerte',
        ['money_deposit'] = 'Depositar dinero',
        ['money_withdraw'] = 'Retirar dinero',
        ['currency'] = '$',
        ['invite'] = 'Invitar a alguien',
        ['invite_player'] = 'Haga clic, para invitar a ~b~',
        ['invite_player2'] = '~s~',
        ['invited_player'] = 'Has invitado a ~g~',
        ['invited_player2'] = '~s~',
        ['lock_only_key'] = '🔐 - Sólo con llave',
        ['lock_open'] = '🔓 - Abierto para todos',
        ['doorlock'] = 'Cierre de puerta',
        ['doorlock_desc'] = 'Configurar, quién puede entrar en la propiedad',
        ['doorlock_changed'] = '~g~Estado de bloqueo de la puerta cambiado a: ~w~',
        ['doorbell'] = 'Cambiar el signo del timbre',
        ['doorbell_desc'] = 'Cambiar el signo del timbre de la puerta',
        ['leave_prop'] = '~s~',
        ['leave_prop_pre'] = 'Deja ',
        ['collector_propamount'] = 'propiedades',
        ['owned_prefix'] = '~y~Owned: ~s~',

        ['info_owned'] = 'Es propiedad:',
        ['info_yes'] = '~g~Sí',
        ['info_no'] = '~r~No',
        ['info_type'] = 'Tipo:',
        ['info_name'] = 'Nombre:',
        ['info_adress'] = 'Dirección:',
        ['unique'] = 'Único:',
        ['enter_prop'] = 'Introducir propiedad propia',
        ['owner'] = 'Propietario: ',
        ['enter_key_prop'] = 'Introduzca otras propiedades',
        ['prop_of'] = 'Propiedad de ',
        ['have_key'] = 'Eres dueño de una ~b~llave~s~',
        ['open_for_everybody'] = 'La propiedad está abierta ~g~para todos~s',
        ['buy'] = 'Compra: ',
        ['rent'] = 'Rent: ',
        ['rent_per_day'] = '$ / día',
        ['cancel_rent'] = 'Cancelar el contrato de alquiler',
        ['rented'] = 'Alquilado:',
        ['cancel_prop'] = '[~r~~s~] Cancelar',
        ['sell_prop'] = 'Vender propiedad',
        ['confirm'] = '[~r~~s~] Confirmar',
        ['confirm_desc'] = '~s~Se obtendrá ~g~',
        ['confirm_desc2'] = '$ ~s~volver',
        ['invitation_expired'] = 'La invitación~r~expiró~s~',
       
        ['has_entered_prop'] = ' ha entrado en la ~g~propiedad~s~',
        ['doorbell_title'] = 'Timbre',
        ['invite_msg'] = 'Ha sido invitado a ~y~',
        ['invite_msg2'] = ' ~s~. Pulsá ~g~~INPUT_PICKUP~~s~, para ~g~aceptar la invitación~s~.',
        ['got_key'] = 'Tienes una ~g~key~s~.',
        ['removed_key'] = 'Tu acceso a la llave fue ~y~revocado~s~.',
        ['got_permission'] = 'Permiso concedido',
        ['remove_permission'] = 'Permiso revocado',
        ['remove_key'] = 'Has revocado ~y~',
        ['remove_key2'] = ' ~s~s ~y~key access~s~.',
        ['give_key_msg'] = 'Has dado una ~g~clave ~s~ a ~g~',
        ['give_key_msg2'] = '~s~.',
        ['too_heavy'] = 'No puedes cargar tanto',
        ['not_enough_stored'] = 'No tienes tanto en el almacén.',
        ['need_restart_addoninventory'] = '~y~El inventario de propiedades no se ha cargado correctamente. Necesitas reiniciar el juego',
        ['wrong_input'] = 'Entrada incorrecta',
        ['prop_successfully_rented'] = 'Has alquilado una propiedad para ~g~ ',
        ['prop_successfully_bought'] = 'Has comprado una propiedad por ~g~ ',
        ['bought_2'] = '$',
        ['rented_2'] = '$',
        ['prop_canceled'] = 'Has cancelado la propiedad',
        ['not_enough_money'] = '~r~No hay suficiente dinero',
        ['rent_paid'] = '~g~',
        ['rent_paid2'] = '$ ~s~alquiler pagado.',
        ['money_added_to_wallet'] = '$ ~g~Poner en la caja fuerte.',
        ['money_withdraw_from_safe'] = '$ ~g~tomado de la caja fuerte.',
        ['not_enough_money_in_wallet'] = '~r~No hay suficiente dinero en la casa',
        ['doorbell_changed'] = '~w~Cambiaste el nombre de tu puerta a ~g~',
        ['doorbell_changed2'] = '~g~.',
		['prop_not_available'] = 'Esta propiedad ya no está disponible'
    }

}