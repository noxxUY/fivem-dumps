Config                            = {}

Config.MinPolice = 4
Config.Time = 1800
Config.lastrobbed = 0

Config.BankHeists = {

    Banco_Galicia = {

        Money = 500000,

        Bank_Vault = {
            model = -63539571,
            x = -2958.539,
            y = 482.2706,
            z = 15.835,
            hStart = -105.0,
            hEnd = -2.0
        },
		
		Stop_Alarm = { x = -2957.83, y = 479.71, z = 14.71 },

        Start_Robbing = { 
			{ x = -2956.5705566406, y = 481.70111083984, z = 15.697088241577 },
        },

        Cash_Pile = { 
            x = -2954.1071777344, 
            y = 484.38818359375, 
            z = 16.267852783203, 
            h = 86.886528015137 
        }

    },
	
	Banco_Sandy = {

        Money = 500000,

        Bank_Vault = {
            model = -63539571,
            x = -2958.539,
            y = 482.2706,
            z = 15.835,
            hStart = -105.0,
            hEnd = -2.0
        },
		
		Stop_Alarm = { x = 1177.82, y = 2711.31, z = 37.1 },

        Start_Robbing = { 
			{ x = 1175.97, y = 2712.89, z = 38.09 },
        },

        Cash_Pile = { 
            x = 1173.32, 
            y = 2715.22, 
            z = 38.91, 
            h = 177.54 
        }

    },
	
	Banco_Paleto = {

        Money = 500000,

        Bank_Vault = {
            model = -1185205679,
            x = -104.6049,
            y = 6473.444,
            z = 31.79532,
            hStart = 150.0,
            hEnd = 45.0
        },
		Stop_Alarm = { x = -102.17, y = 6468.6, z = 30.63 },

        Start_Robbing = { 
			{ x = -105.61, y = 6472.01, z = 31.63 },
        },

        Cash_Pile = { 
            x = -2954.1071777344, 
            y = 484.38818359375, 
            z = 16.267852783203, 
            h = 86.886528015137 
        }

    },
	
	Banco_Santander = {

        Money = 500000,

        Bank_Vault = {
            model = -1185205679,
            x = -104.6049,
            y = 6473.444,
            z = 31.79532,
            hStart = 150.0,
            hEnd = 45.0
        },
		Stop_Alarm = { x=-1213.09, y=-336.063, z=37.790 },

        Start_Robbing = { 
			{ x=-1210.77, y=-336.558, z=37.781 },
        },

        Cash_Pile = { 
            x = -2954.1071777344, 
            y = 484.38818359375, 
            z = 16.267852783203, 
            h = 86.886528015137 
        }

    },

    Banco_Macro = {

        Money = 500000,

        Bank_Vault = {
            model = 2121050683,
            x = 148.025,
            y = -1044.364,
            z = 29.50693,
            hStart = -210.0,
            hEnd = 250.0
        },
		
		Stop_Alarm = { x = 145.04, y = -1044.19, z = 28.37 },

        Start_Robbing = {
			{ x = 146.86993408203, y = -1046.0607910156, z = 29.368083953857 },
        },

        Cash_Pile = { x = 148.67572021484, y = -1049.197265625, z = 29.93883895874, h = 160.95620727539 }


    },

    Banco_Provincia = {

        Money = 500000,

        Bank_Vault = {
            model = 2121050683,
            x = -352.725,
            y = -53.564,
            z = 49.50693,
            hStart = -210.0,
            hEnd = 250.0
        },
		
		Stop_Alarm = { x = -355.22, y = -53.46, z = 48.05 },

        Start_Robbing = { 
			{ x = -353.85614013672, y = -55.297225952148, z = 49.036598205566 },
        },

        Cash_Pile = { x = -352.00219726563, y = -58.390628814697, z = 49.60733795166, h = 160.58137512207 }


    },
	
	Banco_MazeBank = {
		Money = 1000000,

        Bank_Vault = {
            model = 2121050683,
            x = -352.725,
            y = -53.564,
            z = 49.50693,
            hStart = -210.0,
            hEnd = 250.0
        },
		
		Stop_Alarm = { x=-1364.00, y=-482.315, z=33.190 },

        Start_Robbing = { 
			{ x=-1370.41, y=-477.342, z=33.190 },
        },

        Cash_Pile = { x=-1358.80, y=-465.810, z=33.190, h = 75.61060333252 }
	},
}
