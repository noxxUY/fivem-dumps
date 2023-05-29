config = {}
   --progress bar config
   config.usearmourtext = "Equipando Chaleco!" -- text to show in progress bar
   config.Progressbartime = 3000
   config.disableMove = true
   config.disableCarMove = false
   config.disableMousemove = true
   config.disableCombataction = true
   
   
   --armour database name
   config.itemhigh = 'nb-armourhigh'
   config.itemmedium = 'nb-armourmedium'
   config.itemlow = 'nb-armourlow'
   
   --Armour 
   config.ManArmourIDhigh = 16
   config.ManArmourTexturehigh = 2
   config.FemArmourIDhigh = 10
   config.FemManArmourTexturehigh = 0
   
   config.ManArmourIDmedium = 10
   config.ManArmourTexturemedium = 1
   config.FemArmourIDmedium = 11
   config.FemManArmourTexturemedium = 0
   
   config.ManArmourIDlow = 2
   config.ManArmourTexturelow = 1
   config.FemArmourIDlow = 11
   config.FemManArmourTexturelow = 1
   
   config.PedArmourlow = 35
   config.PedArmourmedium = 50
   config.PedArmourheavy = 100
   
   
   
config.Text = {
	['use_armourlow'] = 'You have 35% of vest',
	['use_armourmedium'] = 'You have 50% of vest',
	['use_armourheavy'] = 'You have 100% of vest!',
	['not_usearmourlow'] = 'you need to have less than 75% to use!',
	['not_usearmourmedium'] = 'you need to have less than 50% to use!',
	['not_usearmourheavy'] = 'you need to have less than 0% to use!'
}



function SendTextMessage(msg)
          -- Use this for not depend in pNotify
		--SetNotificationTextEntry('STRING')
		--AddTextComponentString(msg)
		--DrawNotification(0,1)
		--EXAMPLE USED IN VIDEO
        TriggerEvent('pNotify:SendNotification', {text = {msg}, timeout = 5000})
end