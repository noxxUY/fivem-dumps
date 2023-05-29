Config, Locales = {}, {}

Config.Locale = 'es' -- en / pt / gr / fr / de

Config.ESX11 = false -- set it to true if you are using ESX 1.1

Config.okokTextUI = false -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.IBANPrefix = "OK" -- IBAN prefix

Config.IBANNumbers = 6 -- How many characters the IBAN has by default

Config.CustomIBANMaxChars = 10 -- How many characters the IBAN can have when changing it to a custom one (on Settings tab)

Config.CustomIBANAllowLetters = true -- If the custom IBAN can have letters or only numbers (on Settings tab)

Config.IBANChangeCost = 5000 -- How much it costs to change the IBAN to a custom one (on Settings tab)

Config.PINChangeCost = 1000 -- How much it costs to change the PIN (on Settings tab)

Config.AnimTime = 2 -- Seconds (ATM animation)

Config.UseAddonAccount = false -- If true it will use the addon_account_data table | If false the okokbanking_societies table

Config.RequireCreditCardForATM = false -- Set to true if you would like players to access the ATM with a card item | If false there is no item requirement

Config.CreditCardItem = "creditcard" -- Required item to access the ATM

Config.CreditCardPrice = 100 -- How much it costs to purchase a credit card

Config.UseSteamNames = false -- If true it will use steam name | If false, the character name

Config.Locale = 'en'

Config.Societies = { -- Which societies have bank accounts
	"police",
	"ambulance"
}

Config.SocietyAccessRanks = { -- Which ranks of the society have access to it
	"boss",
	"chief",
}

Config.ShowBankBlips = true -- True = show bank blips on the map | false = don't show blips

Config.BankLocations = { -- To get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
	{blip = 108, blipColor = 2, blipScale = 0.7, x = 150.266, y = -1040.203, z = 29.374, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = -1212.980, y = -330.841, z = 37.787, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = -2962.582, y = 482.627, z = 15.703, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = -112.202, y = 6469.295, z = 31.626, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = 314.187, y = -278.621, z = 54.170, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = -351.534, y = -49.529, z = 49.042, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = 1175.064, y = 2706.643, z = 38.094, blipText = "Banco", BankDistance = 3},

	--

	{blip = 108, blipColor = 2, blipScale = 0, x = 479.2713, y = -1326.5663, z = 29.2075, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0, x = 725.5333, y = -1067.2583, z = 28.3110, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0, x = -2589.3918, y = 1913.0363, z = 167.4989, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0, x = -674.0752, y = 318.8852, z = 83.0831, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0, x = 834.9214, y = -1291.7061, z = 28.2420, blipText = "Banco", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0, x= 1189.6395263672, y= -1278.3608398438, z= 35.89208984375, blipText = "Banco", BankDistance = 3}, -- ATM LEna


}

Config.ATMDistance = 1.5 -- How close you need to be in order to access the ATM

Config.ATM = { -- ATM models, do not remove any
	{model = -870868698}, 
	{model = -1126237515}, 
	{model = -1364697528}, 
	{model = 506770882}
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 2

Config.BotName = 'Transacciones' -- Write the desired bot name

Config.ServerName = 'ReinadoRP' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.TransferWebhookColor = '16127'

Config.WithdrawWebhookColor = '16127'

Config.DepositWebhookColor = '16127'

-------------------------- LOCALES (DON'T TOUCH)

function _L(id)
    if Locales[Config.Locale][id] then
        return Locales[Config.Locale][id]
    else
        print("Locale '"..id.."' doesn't exist")
    end
end