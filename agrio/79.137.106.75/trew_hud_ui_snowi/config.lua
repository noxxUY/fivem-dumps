Config = {}

Config.Locale = 'br'

Config.serverLogo = 'https://i.imgur.com/mjPxpdt.png'

Config.font = {
	name 	= 'Montserrat',
	url 	= 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700,900&display=swap'
}

Config.date = {
	format	 	= 'default',
	AmPm		= false
}

Config.voice = {

	levels = {
		default = 5.0,
		shout = 12.0,
		whisper = 1.0,
		current = 0
	},
	
	keys = {
		distance 	= '~', --.
	}
}

Config.vehicle = {
	speedUnit = 'KMH', -- KMH or MPH
	maxSpeed = 400,

	useLegacyFuel = true, -- if you use the LegacyFuel script, set this  to true. If not, set to false

	seatbelt = {
		playBuckleSound 	= true,
		playUnbuckleSound 	= true,
		playUnsafeSound 	= true
	},

	keys = {
		seatbelt 	= 'G', -- X
		cruiser		= 'CAPS', -- CAPS
		signalLeft	= 'LEFT', -- Arrow Left
		signalRight	= 'RIGHT', -- Arrow Right
		signalBoth	= 'DOWN', -- Arrow Down
	}
}

Config.ui = {
	showJob		 		= false,

	showWalletMoney 	= false,
	showBankMoney 		= false,
	showagrio_coins		= false,
	showBlackMoney 		= false,
	showSocietyMoney	= false,

	showDate 			= false,
	showLocation 		= false,

	showHealth			= true,
	showArmor	 		= true,
	showStamina	 		= true,
	showHunger 			= true,
	showThirst	 		= true,
	showStress = true,

	showMinimap			= false,

	showVoice	 		= true
}