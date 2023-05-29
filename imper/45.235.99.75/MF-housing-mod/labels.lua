local labels = {
  ['en'] = {
    ['Entry']       = "Entrar",
    ['Exit']        = "Salir",
    ['Garage']      = "Garage",
    ['Wardrobe']    = "Guardaropa",
    ['Inventory']   = "Inventariio",
    ['InventoryLocation']   = "Inventario",

    ['LeavingHouse']      = "Salir de la casa",

    ['AccessHouseMenu']   = "Accede al menú de la casa",

    ['InteractDrawText']  = "["..Config.TextColors[Config.MarkerSelection].."E~s~] ",
    ['InteractHelpText']  = "~INPUT_PICKUP~ ",

    ['AcceptDrawText']    = "["..Config.TextColors[Config.MarkerSelection].."G~s~] ",
    ['AcceptHelpText']    = "~INPUT_DETONATE~ ",

    ['FurniDrawText']     = "["..Config.TextColors[Config.MarkerSelection].."F~s~] ",
    ['CancelDrawText']    = "["..Config.TextColors[Config.MarkerSelection].."F~s~] ",

    ['VehicleStored']     = "Vehículo almacenado",
    ['CantStoreVehicle']  = "No puedes almacenar este vehículo",

    ['HouseNotOwned']     = "No eres dueño de esta casa",
    ['InvitedInside']     = "Aceptar la invitación de la casa",
    ['MovedTooFar']       = "Te alejaste demasiado de la puerta",
    ['KnockAtDoor']       = "Alguien está llamando a tu puerta",

    ['TrackMessage']      = "Mensaje de seguimiento",

    ['Unlocked']          = "Casa abierta",
    ['Locked']            = "Casa cerrada",

    ['WardrobeSet']       = "Colocar guardaropa",
    ['InventorySet']      = "Colocar inventario",

    ['ToggleFurni']       = "Alternar interfaz de usuario de muebles",

    ['GivingKeys']        = "Dar llave a un jugador",
    ['TakingKeys']        = "Tomando llaves de un jugador",

    ['GarageSet']         = "Garage location set",
    ['GarageTooFar']      = "Garage is too far away",

    ['PurchasedHouse']    = "Trajiste la casa para $%d",
    ['CantAffordHouse']   = "No puedes pagar esta casa",

    ['MortgagedHouse']    = "Hipotecaste la casa por $%d",

    ['NoLockpick']        = "No tienes una ganzúa",
    ['LockpickFailed']    = "Fallaste en romper la cerradura",
    ['LockpickSuccess']   = "Has roto con éxito la cerradura",

    ['NotifyRobbery']     = "Alguien está intentando robar una casa en %s",

    ['ProgressLockpicking'] = "Puerta con ganzúa",

    ['InvalidShell']        = "Invalid house shell: %s, informe al propietario de su servidor.",
    ['ShellNotLoaded']      = "Shell would not load: %s, please report to your server owner.",
    ['BrokenOffset']        = "Offset is messed up for house with ID %s, please report to your server owner.",

    ['UpgradeHouse']        = "Actualizar casa a: %s",
    ['CantAffordUpgrade']   = "No puedes pagar esta actualización",

    ['SetSalePrice']        = "Establecer precio de oferta",
    ['InvalidAmount']       = "Cantidad no válida ingresada",
    ['InvalidSale']         = "No puedes vender una casa en la que todavía debes dinero",
    ['InvalidMoney']        = "No tienes suficiente dinero",

    ['EvictingTenants']     = "Desalojar a las inquilinas",

    ['NoOutfits']           = "No tienes ningún atuendo almacenado",

    ['EnterHouse']          = "Entrar a la casa",
    ['KnockHouse']          = "Tocar la puerta",
    ['RaidHouse']           = "Casa Raid",
    ['BreakIn']             = "Irrumpir",
    ['InviteInside']        = "Invitar adentro",
    ['HouseKeys']           = "Llaves de la casa",
    ['UpgradeHouse2']       = "Actualizar casa",
    ['UpgradeShell']        = "Acualizar Shell",
    ['SellHouse']           = "Vender casa",
    ['FurniUI']             = "Editor de casas",
    ['SetWardrobe']         = "Colocar guardaropa",
    ['SetInventory']        = "Colocar inventario",
    ['SetGarage']           = "Colocar garage",
    ['LockDoor']            = "Cerrar puerta",
    ['UnlockDoor']          = "Abrir puerta",
    ['LeaveHouse']          = "Salir",
    ['Mortgage']            = "Hipoteca",
    ['Buy']                 = "Comprar",
    ['View']                = "Mirar",
    ['Upgrades']            = "Actualizar",
    ['MoveGarage']          = "Move Garage",

    ['GiveKeys']            = "Dar llaves",
    ['TakeKeys']            = "Tomar llaves",

    ['MyHouse']             = "Mi casa",
    ['PlayerHouse']         = "Casa del jugador",
    ['EmptyHouse']          = "Casa vacía",

    ['NoUpgrades']          = "No hay actualizaciones disponibles",
    ['NoVehicles']          = "No vehicles",
    ['NothingToDisplay']    = "Nada que mostrar",

    ['ConfirmSale']         = "Yes, sell my house",
    ['CancelSale']          = "No, don't sell my house",
    ['SellingHouse']        = "Sell House ($%d)",

    ['MoneyOwed']           = "Money Owed: $%s",
    ['LastRepayment']       = "Last Repayment: %s",
    ['PayMortgage']         = "Pay Mortgage",
    ['MortgageInfo']        = "Mortgage Info",

    ['SetEntry']            = "Set Entry",
    ['CancelGarage']        = "Cancel Garage",
    ['UseInterior']         = "Use Interior",
    ['UseShell']            = "Use Shell",
    ['InteriorType']        = "Set Interior Type",
    ['SetInterior']         = "Select Current Interior",
    ['SelectDefaultShell']  = "Select default house shell",
    ['ToggleShells']        = "Toggle shells available for this property",
    ['AvailableShells']     = "Available Shells",
    ['Enabled']             = "~g~ENABLED~s~",
    ['Disabled']            = "~r~DISABLED~s~",
    ['NewDoor']             = "Add New Door",
    ['Done']                = "Done",
    ['Doors']               = "Doors",
    ['Interior']            = "Interior",

    ['CreationComplete']    = "House creation complete.",

    ['HousePurchased'] = "Your house was purchased for $%d",
    ['HouseEarning']   = ", you earnt $%d from the sale."
  }
}

Labels = labels[Config.Locale]

