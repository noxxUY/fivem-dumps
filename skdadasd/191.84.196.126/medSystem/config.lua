Config = {}


Config.Declared = 'Estas en coma espera a que llege un medico!' -- This Msg appeared when the player died using /med [id] to display blood = 0 - 5% and Hurt area is Head

Config.Timer = 5   -- Timer to Remove Med Display after using MedSystem

Config.job = {

		names = {
		ambulance = true, 
		police =  false, 
		mechanic = false
			--ambulance = true,             
			--police = false,  --SET This to false so Police job cant use /med commands
			--mechanic = false,  --SET This to false so mech job cant use /med commands
			--unemployed = false, --Default to False so unemployed Player cant use /med
		}
	
}

	