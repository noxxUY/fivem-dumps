-- Traducido por Dinamicka

Strings = {
    -- blips
    ["purchasable_house"] = "Casa en venta",
    ["owned_house"] = "Casa propia",
    ["access_house"] = "Casa cual tienes una llave",
    ["purchased_house"] = "La casa de alguien mas",

    ["purchasable_apartment"] = "Departamento en venta",
    ["owned_apartment"] = "Departamento propio",
    ["access_apartment"] = "Departamento cual tienes una llave",
    ["purchased_apartment"] = "Departamento de alguien mas",

    ["ikea"] = "WALLMART",
    ["robbery"] = "Robo",

    -- text for buttons
    ["buy_house"] = "Presiona ~INPUT_CONTEXT~ para adquirir ~b~%s~s~ (#%s) por ~g~$%s~s~.",
    ["contact_rea"] = "Presiona ~INPUT_CONTEXT~ para previsualizar %s [#%s]",
    ["contact_rea_nopreview"] = "Contacte a un martillero para adquirir esta propiedad",
    ["enter"] = "Presiona ~INPUT_CONTEXT~ para ingresar a la propiedad.",
    ["door"] = "Presiona ~INPUT_CONTEXT~ para abrir el menu de la puerta (%s)",
    ["enter_ikea"] = "Presiona ~INPUT_CONTEXT~ para ingresar al WALLMART.\nPresiona   ~INPUT_DETONATE~para vender tus muebles.",
    ["furnishing"] = "Objeto: %s\nVelocidad: %s ~INPUT_COVER~ ~INPUT_TALK~\nUsar ~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ para mover los muebles up/down\nUsar ~INPUT_ATTACK~ ~INPUT_AIM~ para rotar el objeto\nUsar ~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ para mover el objeto\nPress ~INPUT_DETONATE~ para mover el objeto hacia a ti\nPresiona ~INPUT_FRONTEND_RDOWN~ para confirmar.\nPresiona ~INPUT_FRONTEND_RRIGHT~ para cancelar.",
    ["access_storage"] = "Presiona ~INPUT_DETONATE~ para acceder al armario.",
    ["press_manage"] = "\nPresiona ~INPUT_DETONATE~ para administrar esta propiedad",
    ["enter_garage"] = "Presiona ~INPUT_CONTEXT~ para ingresar al garage.",
    ["store_garage"] = "Presiona ~INPUT_CONTEXT~ para guardar el vehiculo.",
    ["breach_door"] = "\nPresiona ~INPUT_DETONATE~ para romper la puerta.",
    ["lockpick_door"] = "\nPresiona ~INPUT_DETONATE~ forzar la puerta.",
    ["pole_dance"] = "Presiona ~INPUT_CONTEXT~ para bailar en el tubo",
    ["stop_dancing"] = "Presiona ~INPUT_VEH_DUCK~ para detener el baile",
    ["lap_dance"] = "Presiona ~INPUT_CONTEXT~ para dar un baile erotico\nPresiona   ~INPUT_VEH_EXIT~para sentarte",
    ["storage_wardrobe"] = "Almacenamiento o Guardarropas",
    ["storage_option"] = "Abrir almacenamiento",
    ["wardrobe_option"] = "Abrir guardarropas",
    ["select_outfit"] = "Elegir un atuendo",
    ["lockpicking"] = "Cuando la cerradura se ralentiza, estas cerca de la posicion correcta.\nGanzuas restantes: %s\n\nUsar ~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ para girar el candado\n~INPUT_FRONTEND_RDOWN~ desbloquear\n~INPUT_FRONTEND_RRIGHT~ Cancelar",

    -- ikea
    ["viewing_furniture"] = "Estas viendo ~r~%s~s~.\nUsa ~INPUT_REPLAY_BACK~ ~INPUT_REPLAY_ADVANCE~ para cambiar entre items.\nUsa ~INPUT_REPLAY_FFWD~ ~INPUT_REPLAY_REWIND~ para cambiar la categoria.\nUsa ~INPUT_MOVE_LEFT_ONLY~ ~INPUT_MOVE_RIGHT_ONLY~ para rotar el objeto.\nUsa ~INPUT_MOVE_UP_ONLY~ ~INPUT_MOVE_DOWN_ONLY~ para acercar y alejar.%s\nPresiona ~INPUT_FRONTEND_RDOWN~ para comprar ~b~%s~s~ por ~g~$%s~s~.\nPresiona ~INPUT_FRONTEND_RRIGHT~ para salir del Wallmart.",
    ["confirm_purchase"] = "Compra ~b~%s~s~ por ~g~$%s~s~?\n\n~INPUT_FRONTEND_RDOWN~ Compra\n~INPUT_FRONTEND_RRIGHT~ Cancelar",
    ["purchased"] = "Comprado %s por ~g~$%s~s~.",
    ["storage"] = "\nPuedes guardar cosas dentro de este item.",

    -- locked state
    ["locked"] = "Cerrado",
    ["unlocked"] = "Abierto",
    
    -- text for menus 
    ["house_key"] = "Llave de casa",
    ["door_menu"] = "Menu de la puerta",
    ["toggle_lock"] = "Cerrado / Abierto",
    ["exit"] = "Salir",
    ["furnish"] = "Amoblar",
    ["put_furniture"] = "Colocar muebles",
    ["manage_furniture"] = "Administrar amoblamiento",
    ["amount_furniture"] = "x%s %s",
    ["confirm_house_purchase"] = "Comprar %s por <span style='color:lime'>$%s</span>",
    ["are_you_sure"] = "Comprar %s?",
    ["what_interior"] = "Que interior te gustaria elegir?",
    ["interior_number"] = "Interiores #%s",
    ["remove_furniture"] = "Quitar %s?",
    ["inventory"] = "Almacenamiento",
    ["inventory_weapons"] = "Almacenamiento - armas",
    ["inventory_items"] = "Almacenamiento - objetos",
    ["black_money"] = "Dinero negro: <span style='color:red'>$%s</span>",
    ["cash"] = "Efectivo: <span style='color:lime'>$%s</span>",
    ["put"] = "Depositar objeto",
    ["get"] = "Retirar objeto",
    ["deposit"] = "Depositar",
    ["withdraw"] = "Retirar",
    ["weapons"] = "Armamentos",
    ["items"] = "Objetos",
    ["amount_of"] = "Cantidad de %s?",
    ["make_key_copy"] = "Crear una copia de la llave",
    ["resell_house"] = "Vende la casa por <span style='color:lime'>$%s</span>",
    ["kick_someone_out"] = "Expulsar a alguien",
    ["kick_out?"] = "Deseas echar a %s?",
    ["kick_out"] = "Expulsaste a %s",
    ["preview"] = "Previsualizar los posibles interiores",
    ["previewing"] = "~h~Revisando interiores\n\n~h~Revisando interior %s de %s possibles.\nUsa ~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ para ver otro interior\nPresiona ~INPUT_FRONTEND_RRIGHT~ para salir del modo previsualizacion.",
    ["previewing_nohelp"] = "~h~Previsualizando la casa~h~\ncontacta con un martillero publico para adquirir esta propiedad.\nPresiona ~INPUT_FRONTEND_RRIGHT~ para abandonar el modo previsualizacion.",
    ["transfer_house"] = "Transferir propiedad",
    ["transfer_property"] = "Desea transferir la propiedad a %s?",
    ["none_nearby"] = "No hay nadie cerca",
    ["yes"] = "Si",
    ["no"] = "No",
    ["no_outfits"] = "No tienes atuendos guardados.",
    ["confirm_delete"] = "Deseas eliminar la vestimenta \"%s\"?",
    ["equip_outfit"] = "Colocarte el atuendo",
    ["delete_outfit"] = "Eliminar el atuendo",

    -- text for notifications
    ["no_spawn"] = "No se encontro una propiedad para la casa/departamento.\n\nContacta con el staff mediante ticket para reportar este problema.",
    ["error_locked"] = "No puedes ingresar a esta casa/departamento - la puerta esta cerrada.",
    ["not_near_door"] = "No te encuentras cerca de la puerta por lo tanto no puedes cerrarla / abrirla.",
    ["must_be_number"] = "Debes ingresar un numero.",
    ["dont_have"] = "No tienes esa cantidad.",
    ["not_enough"] = "No hay suficiente dentro del inventario.",
    ["cant_carry"] = "No puedes cargar tanto.", 
    ["has_items"] = "Este mueble contiene objetos dentro de el y por lo tanto no puedes eliminarlo. Asegurate de vaciar el almacenamiento primero!",
    ["someone_in_house_cant_sell"] = "Se encuentra alguien en el interior de la propiedad - no la puedes vender ahora mismo!",
    ["cant_own_more"] = "No puedes poseer mas propiedades.",
    ["no_lockpicks"] = "No tienes ninguna ganzua.",
    ["robbery_progress"] = "ALERTA!! Alguien esta robando una casa! Revisa el GPS!",
    ["you_got_kicked"] = "Fuiste expulsado de la propiedad.",
    ["house_spawned_transfer"] = "Alguien se encuentra dentro de la propiedad, no la puedes transferir ahora mismo.",
    ["nolonger_nearby"] = "La persona ya no se encuentra cerca.",
    ["nearby_storage"] = "Alguien se encuentra cerca del mueble, por lo tanto no puedes abrirlo.",
    ["locked_door"] = "Has cerrado la puerta con llave",
    ["unlocked_door"] = "Has abierto la puerta con llave",

    -- text for loading
    ["purchasing"] = "Adquiriendo",
    ["removing_furniture"] = "Remover muebles",
    ["loading_object"] = "Cargando objetos",
    ["loading_storage"] = "Cargando almacenamiento",

    -- other
    ["rotation"] = "Rotacion: %s",
    ["not_enough_cops"] = "No hay suficientes policias en servicio!",
}