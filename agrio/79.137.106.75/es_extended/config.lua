Config = {}
Config.Locale = 'en'

Config.Accounts = {
	bank = _U('account_bank'),
	black_money = _U('account_black_money'),
	money = _U('account_money'),
	agrio_coins = 'Agrio Coins',
	
}

Config.StartingAccountMoney = {bank = 30000, money = 250}

Config.EnableSocietyPayouts = true -- pay from the society account that the player is employed at? Requirement: esx_society
Config.EnableHud            = false -- enable the default hud? Display current job and accounts (black, bank & cash)
Config.MaxWeight            = 25000   -- the max inventory weight without backpack
Config.PaycheckInterval     = 900000
Config.EnableDebug          = false
