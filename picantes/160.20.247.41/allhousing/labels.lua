local labels = {
  ['en'] = {
    ['Entry']       = "Entrar",
    ['Exit']        = "Salir",
    ['Garage']      = "Garage",
    ['Wardrobe']    = "Vestuario",
    ['Inventory']   = "Inventario",
    ['InventoryLocation']   = "Inventario",

    ['LeavingHouse']      = "Dejar casa",

    ['AccessHouseMenu']   = "Acceder al menu",

    ['InteractDrawText']  = "["..Config.TextColors[Config.MarkerSelection].."E~s~] ",
    ['InteractHelpText']  = "~INPUT_PICKUP~ ",

    ['AcceptDrawText']    = "["..Config.TextColors[Config.MarkerSelection].."G~s~] ",
    ['AcceptHelpText']    = "~INPUT_DETONATE~ ",

    ['FurniDrawText']     = "["..Config.TextColors[Config.MarkerSelection].."F~s~] ",
    ['CancelDrawText']    = "["..Config.TextColors[Config.MarkerSelection].."F~s~] ",

    ['VehicleStored']     = "Vehiculo guardado",
    ['CantStoreVehicle']  = "No puedes guardar este vehiculo",

    ['HouseNotOwned']     = "No eres dueño de esta casa",
    ['InvitedInside']     = "Aceptar la invitación de la casa",
    ['MovedTooFar']       = "Te alejaste demasiado de la puerta",
    ['KnockAtDoor']       = "Alguien esta tocando la puerta",

    ['TrackMessage']      = "Track message",

    ['Unlocked']          = "Casa abierta",
    ['Locked']            = "Casa cerrada",

    ['WardrobeSet']       = "Guardarropa ubicado",
    ['InventorySet']      = "Inventario ubicado",

    ['ToggleFurni']       = "Activar / Desactivar muebles",

    ['GivingKeys']        = "Dando llaves al jugador",
    ['TakingKeys']        = "Sacando llaves al jugador",

    ['GarageSet']         = "Garage location set",
    ['GarageTooFar']      = "Garage is too far away",

    ['PurchasedHouse']    = "Compraste la casa por $%d",
    ['CantAffordHouse']   = "No puedes pagar esta casa",

    ['MortgagedHouse']    = "You mortgaged the house for $%d",

    ['NoLockpick']        = "You don't have a lockpick",
    ['LockpickFailed']    = "You failed to crack the lock",
    ['LockpickSuccess']   = "You successfully cracked the lock",

    ['NotifyRobbery']     = "Someone is attempting to rob a house at %s",

    ['ProgressLockpicking'] = "Lockpicking Door",

    ['InvalidShell']        = "Invalid house shell: %s, please report to your server owner.",
    ['ShellNotLoaded']      = "Shell would not load: %s, please report to your server owner.",
    ['BrokenOffset']        = "Offset is messed up for house with ID %s, please report to your server owner.",

    ['UpgradeHouse']        = "Upgrade house to: %s",
    ['CantAffordUpgrade']   = "You can't afford this upgrade",

    ['SetSalePrice']        = "Seleccionar precio",
    ['InvalidAmount']       = "Monto Invalido",
    ['InvalidSale']         = "You can't sell a house that you still owe money on",
    ['InvalidMoney']        = "No tienes dinero suficiente",

    ['EvictingTenants']     = "Evicting tenants",

    ['NoOutfits']           = "You don't have any outfits stored",

    ['EnterHouse']          = "Entrar",
    ['KnockHouse']          = "Golpear",
    ['RaidHouse']           = "Raid House",
    ['BreakIn']             = "Break In",
    ['InviteInside']        = "Invitar",
    ['HouseKeys']           = "Llaves de la casa",
    ['UpgradeHouse2']       = "Modernizar Casa",
    ['UpgradeShell']        = "Actualizar Shell",
    ['SellHouse']           = "Vender Casa",
    ['FurniUI']             = "Muebles",
    ['SetWardrobe']         = "Ubicar Guardarropa",
    ['SetInventory']        = "Ubicar Inventario",
    ['SetGarage']           = "Ubicar garage",
    ['LockDoor']            = "Cerrar puerta",
    ['UnlockDoor']          = "Abrir puerta",
    ['LeaveHouse']          = "Salir",
    ['Mortgage']            = "Mortgage",
    ['Buy']                 = "Comprar",
    ['View']                = "Ver",
    ['Upgrades']            = "Modernizar",
    ['MoveGarage']          = "Mover garage",

    ['GiveKeys']            = "Dar llaves",
    ['TakeKeys']            = "Tomar llaves",

    ['MyHouse']             = "Mi casa",
    ['PlayerHouse']         = "Casa ocupada",
    ['EmptyHouse']          = "Casa disponible",

    ['NoUpgrades']          = "No upgrades available",
    ['NoVehicles']          = "No vehicles",
    ['NothingToDisplay']    = "Nothing to display",

    ['ConfirmSale']         = "Si, quiero venderla",
    ['CancelSale']          = "No, no quiero venderla",
    ['SellingHouse']        = "Vender Casa ($%d)",

    ['MoneyOwed']           = "Money Owed: $%s",
    ['LastRepayment']       = "Last Repayment: %s",
    ['PayMortgage']         = "Pay Mortgage",
    ['MortgageInfo']        = "Mortgage Info",

    ['SetEntry']            = "Ubicar entrada",
    ['CancelGarage']        = "Cancelar garage",
    ['UseInterior']         = "Usar Interior",
    ['UseShell']            = "Usar Shell",
    ['InteriorType']        = "Seleccionar tipo de Interior",
    ['SetInterior']         = "Seleccionar interior",
    ['SelectDefaultShell']  = "Selecciona el modelo de casa",
    ['ToggleShells']        = "Seleccione los modelos disponibles para la casa",
    ['AvailableShells']     = "Available Shells",
    ['Enabled']             = "Activado",
    ['Disabled']            = "Desactivado",
    ['NewDoor']             = "Añadir puertas",
    ['Done']                = "Listo",
    ['Doors']               = "Puertas",
    ['Interior']            = "Interiores",

    ['CreationComplete']    = "Casa creada correctamente.",

    ['HousePurchased'] = "Compraste la casa por $%d",
    ['HouseEarning']   = ", Ganaste $%d por la venta."
  }
}

Labels = labels[Config.Locale]

