local type = {money=1,item=2,weapon=3} -- No tocar porfa, gracias
Config = {}

Config.tiempoPlatinum           = 2592000
Config.tiempoRuby               = 1296000

Config.claimed = "~g~You claimed your daily reward"

--------------------
Config.Locale 						= 'en' 			                      -- Select your language (es, en)
--------------------
Config.RedeemCommand                = 'canjear'
--------------------
Config.CreateCodeCommand            = 'vipcode'
--------------------
Config.ReclamarBoostCommand         = 'booster'
--------------------
Config.Webhook                      = "nope"
--------------------


Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true


--[[ Numeric Generator ]]
Config.numericGenerator = false --[[ Si es verdadero, el código se genera entre Config.minNumber y Config.maxNumber ]]
Config.minNumber = 0000000
Config.maxNumber = 9999999

--[[ Alphanumeric Generator ]]
Config.alphanumericGen = true --[[ Si es verdadero, el código se genera con letras y números aleatorios, y usa Config.length para establecer la longitud del código. ]]
Config.length = 20 --[[ Establece la longitud de los códigos generados (sólo con alfanuméricGen) ]]


-- Discord and Gift Cards config are located inside server/main.lua

Config.Identifier = 'license' -- 'steam' or 'license', depends on what identifier your server uses
Config.Command = 'vip_code' -- The command used to redeem your VIP package In Game
Config.vipCommand = 'vip' -- It will show a notification with your current VIP status and level
Config.CreateCommand = 'giftcard' -- /giftcard [months] [level] (For Admins Only, check HOW TO.lua)

Config.Lang = {
	['tebex_not_found'] = '^2[ERROR] ^3No Tebex Secret ID found on server.cfg',
	['transaction_missing'] = 'You need to insert your Tebex Transaction ID',
	['transaction_not_found'] = 'Transaction ID not found',
	['already_redeemed'] = '¡Este código ya fue reclamado!',
	['success'] = '¡Felicidades! Código reclamado exitósamente',
	['vip_notfound'] = "No eres miembro VIP. Puedes convertite VIP en nuestro discord",
	['vip_active'] = 'Tu VIP está activo hasta: ',
	['vip_level'] = 'Nivel VIP: ',
	['not_whitelisted'] = "No tienes acceso.",
	['giftcard_created'] = 'VIP creado. Revisar el código en Discord.'
}

--	Your Notification System
RegisterNetEvent('homer_vip:notification')
AddEventHandler('homer_vip:notification', function(type,msg)
	-- print(msg)
	-- TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = false, args = {"VIP", msg}}) 
	-- exports['mythic_notify']:SendAlert(type,msg)
	exports['okokNotify']:Alert("SERVIDOR", msg, 5500, type)
end)