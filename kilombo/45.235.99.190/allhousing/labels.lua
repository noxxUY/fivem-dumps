local labels = {
  ['en'] = {
    ['Entry']       = "Entrar",
    ['Exit']        = "Opciones",
    ['Garage']      = "Garaje",
    ['Wardrobe']    = "Guardaropa",
    ['Inventory']   = "Inventario",
    ['InventoryLocation']   = "Inventario",

    ['LeavingHouse']      = "Salir de la casa",

    ['AccessHouseMenu']   = "Acceder al menú",

    ['InteractDrawText']  = "<span style='color:green;font-weight:bold'>[E]</span> ",
    ['InteractHelpText']  = "~INPUT_PICKUP~ ",

    ['AcceptDrawText']    = "<span style='color:green;font-weight:bold'>[G]</span> ",
    ['AcceptHelpText']    = "~INPUT_DETONATE~ ",

    ['FurniDrawText']     = "<span style='color:red;font-weight:bold'>[F]</span> ",
    ['CancelDrawText']    = "<span style='color:red;font-weight:bold'>[F]</span> ",

    ['VehicleStored']     = "Guardaste el coche en el garage de la casa [#%d]",
    ['CantStoreVehicle']  = "No podés guardar este coche",

    ['HouseNotOwned']     = "No sos el dueño de la casa",
    ['InvitedInside']     = "Aceptar invitación a la casa",
    ['MovedTooFar']       = "Te alejaste demasiado de la puerta",
    ['KnockAtDoor']       = "Alguien te está tocando la puerta",

    ['TrackMessage']      = "Track message",

    ['Unlocked']          = "Casa abierta",
    ['Locked']            = "Casa cerrada",

    ['WardrobeSet']       = "Guardaropa colocado",
    ['InventorySet']      = "Inventario colocado",

    ['ToggleFurni']       = "Togglear decoración",

    ['GivingKeys']        = "Darle las llaves a una persona",
    ['TakingKeys']        = "Sacar llaves de una persona",

    ['GarageSet']         = "Punto de garage seteado",
    ['GarageTooFar']      = "El garage está muy lejos",

    ['PurchasedHouse']    = "Compraste la casa por $%d",
    ['CantAffordHouse']   = "No podés comprar esta casa",

    ['MortgagedHouse']    = "Hipotecaste la casa por $%d",

    ['NoLockpick']        = "No tenes una ganzúa",
    ['LockpickFailed']    = "No pudiste forzar la cerradura",
    ['LockpickSuccess']   = "Forzaste la cerradura correctamente",

    ['NotifyRobbery']     = "Alguien está intentando robar una casa en %s",

    ['ProgressLockpicking'] = "Forzando cerradura",

    ['InvalidShell']        = "Shell de la casa inválido: %s, por favor informe al propietario de su servidor.",
    ['ShellNotLoaded']      = "El shell no se ha cargado: %s, por favor informe al propietario de su servidor.",
    ['BrokenOffset']        = "El desplazamiento se ha estropeado para la casa con ID %s, por favor informe al propietario de su servidor.",

    ['UpgradeHouse']        = "Actualizar la casa a: %s",
    ['CantAffordUpgrade']   = "No podés permitirte esta actualización",

    ['SetSalePrice']        = "Establecé el precio de venta",
    ['InvalidAmount']       = "Cantidad introducida no válida",
    ['InvalidSale']         = "No podés vender una casa de la que aún debes dinero",
    ['InvalidMoney']        = "No tenés dinero suficiente",

    ['EvictingTenants']     = "Desalojar a los inquilinos",

    ['NoOutfits']           = "No tienes ninguna ropa guardada",

    ['EnterHouse']          = "Entrar a la casa",
    ['KnockHouse']          = "Tocar puerta",
    ['RaidHouse']           = "Entrar a la fuerza",
    ['BreakIn']             = "Romper la puerta",
    ['InviteInside']        = "Invitar adentro",
    ['HouseKeys']           = "Llaves de la casa",
    ['UpgradeHouse2']       = "Actualizar casa",
    ['UpgradeShell']        = "Actualizar Shell",
    ['SellHouse']           = "Vender casa",
    ['FurniUI']             = "Decoraciones",
    ['SetWardrobe']         = "Colocar guardaropa",
    ['SetInventory']        = "Colocar inventario",
    ['SetGarage']           = "Colocar garage",
    ['LockDoor']            = "Cerrar casa",
    ['UnlockDoor']          = "Abrir casa",
    ['LeaveHouse']          = "Salir de la casa",
    ['Mortgage']            = "Hipoteca",
    ['Buy']                 = "Comprar",
    ['View']                = "Mirar",
    ['Upgrades']            = "Actualizaciones",
    ['MoveGarage']          = "Mover Garage",

    ['GiveKeys']            = "Dar llaves",
    ['TakeKeys']            = "Sacar llaves",

    ['MyHouse']             = "Mi casa",
    ['PlayerHouse']         = "Casa de usuario",
    ['EmptyHouse']          = "Casa vacía",

    ['NoUpgrades']          = "No hay actualizaciones",
    ['NoVehicles']          = "No hay vehículos guardados",
    ['NothingToDisplay']    = "Nada que mostrar",

    ['ConfirmSale']         = "Si, vender mi casa.",
    ['CancelSale']          = "No, no vender mi casa.",
    ['SellingHouse']        = "Estás vendiendo tu casa por: $%d",

    ['MoneyOwed']           = "Dinero que se debe: $%s",
    ['LastRepayment']       = "Último reembolso: %s",
    ['PayMortgage']         = "Pagar la hipoteca",
    ['MortgageInfo']        = "Información Hipotecaria",

    ['SetEntry']            = "Poner entrada",
    ['CancelGarage']        = "Sin Garage",
    ['UseInterior']         = "Usar Interior",
    ['UseShell']            = "Usar Shell",
    ['InteriorType']        = "Tipo de interior",
    ['SetInterior']         = "Seleccionar el interior actual",
    ['SelectDefaultShell']  = "Seleccioná el tipo de interior",
    ['ToggleShells']        = "Seleccioná el shell (Debe ser el mismo que anterior)",
    ['AvailableShells']     = "Sehlsl disponibles",
    ['Enabled']             = "~g~ACTIVADO~s~",
    ['Disabled']            = "~r~DESACTIVADO~s~",
    ['NewDoor']             = "Añadir una nueva puerta",
    ['Done']                = "Listo",
    ['Doors']               = "Puertas",
    ['Interior']            = "Interior",

    ['CreationComplete']    = "Creación de la casa completada.",

    ['HousePurchased'] = "Tu casa fue comprada por $%d",
    ['HouseEarning']   = ", ganaste $%d por la venta.",
    
    -- GARAGES
    ['license_plate'] = 'Patente: %d',
    ['vehicle'] = 'Vehiculo: %d',
  }
}

Labels = labels[Config.Locale]

