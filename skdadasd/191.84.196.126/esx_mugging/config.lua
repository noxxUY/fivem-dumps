Config = {}

Config.GCPhone             = false --  added for GCPhone server that was not getting police alerts.
Config.progressBars        = true  --  If your server has progressBars and wants to use vs text for mugging time.
Config.CopsNeeded          = 2     --  Number of Police needed to mug locals.
Config.MinMoney            = 50     --  Min amount of money received from mugging
Config.MaxMoney            = 500   --  Max amount of money received from mugging.
Config.RobWaitTime         = 20     --  Current seconds it takes to finish mugging
Config.AddItemsPerctent    = 0    --  This is percent the script will add items as well as cash from mugging.
Config.AddItemsMax         = 0     --  This is the max number of items you can receive from NPC from mugging - min is 1
Config.PoliceNotify        = 99    --  This is percent the police will get notified: example: 40 means 40% chance of notification.
Config.AlwaysNotifyonDeath = true  --  This will set to 100% notify if NPC dies while someone is mugging them.

Config.giveableItems = { -- Make sure to add item you have in your database item table. Use item name and not label.
'water',
'hamburger'
}
