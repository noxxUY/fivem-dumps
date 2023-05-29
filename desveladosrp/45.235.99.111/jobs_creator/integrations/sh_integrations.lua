--[[
    If you have a different script name for the following ones, change it to your one
    Example:

    EXTERNAL_SCRIPTS_NAMES = {
        ["es_extended"] = "mygamemode_extended",
        ["esx_addonaccount"] = "mygamemode_addonaccount"
    }
]]

EXTERNAL_SCRIPTS_NAMES = {
    ["es_extended"] = "es_extended",
    ["esx_addonaccount"] = "esx_addonaccount",

    -- If you don't use these inventories, don't touch
    ["ox_inventory"] = "ox_inventory",
    ["qs-inventory"] = "qs-inventory",

    -- Edit only if you renamed billing_ui script, not if you are using another billing system 
    -- https://forum.cfx.re/t/billing-ui-esx-qbcore-bill-players-by-clicking-on-their-character/2715913
    ["billing_ui"] = "billing_ui",

    ["qb-core"] = "qb-core",
    ["qb-clothing"] = "qb-clothing",
    ["qb-weapons"] = "qb-weapons",
    ["qb-bossmenu"] = "qb-bossmenu",
    ["qb-management"] = "qb-management"
}

--[[
    Change it to a plate you want to automatically create random plates the way you prefer

    Examples of random plates with EXAMPLE_PLATE = "CX521YD"
        - XC111EW
        - SI849TW
        - YS364KD
    
    Examples of random plates with EXAMPLE_PLATE = "CBZ 629"
        - EGP 015
        - VHS 687
        - SXN 296


    Examples of random plates with EXAMPLE_PLATE = "72 QT 15"
        - 63 VD 85
        - 27 AC 66
        - 63 HR 75
]]
EXAMPLE_PLATE = "AB123CD"

--[[
    Available options: default, qs-inventory, ox-inventory      (they MUST be between double quotes "")
    If your inventory isn't listed, you'll have to integrate your own by using the script documentation
]]
INVENTORY_TO_USE = "default"

--[[
    The shared object of the framework will refresh each X seconds. If for any reason you don't want it to refresh, set to nil
]] 
SECONDS_TO_REFRESH_SHARED_OBJECT = nil