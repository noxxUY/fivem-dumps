radioConfig = {
    Controls = {
        Activator = { -- Open/Close Radio
            Name = "INPUT_SWITCH_VISOR", -- Control name
            Key = 344, -- F2
        },
        Secondary = {
            Name = "INPUT_SPRINT",
            Key = 21, -- Left Shift
            Enabled = true, -- Require secondary to be pressed to open radio with Activator
        },
        Toggle = { -- Toggle radio on/off
            Name = "INPUT_CONTEXT", -- Control name
            Key = 51, -- E
        },
        Increase = { -- Increase Frequency
            Name = "INPUT_CELLPHONE_RIGHT", -- Control name
            Key = 175, -- Right Arrow
            Pressed = false,
        },
        Decrease = { -- Decrease Frequency
            Name = "INPUT_CELLPHONE_LEFT", -- Control name
            Key = 174, -- Left Arrow
            Pressed = false,
        },
        Input = { -- Choose Frequency
            Name = "INPUT_FRONTEND_ACCEPT", -- Control name
            Key = 201, -- Enter
            Pressed = false,
        },
        Broadcast = {
            Name = "INPUT_CHARACTER_WHEEL", -- Control name
            Key = 19	, -- Caps Lock - alt
        },
        ToggleClicks = { -- Toggle radio click sounds
            Name = "INPUT_SELECT_WEAPON", -- Control name
            Key = 37, -- Tab
        }
    },
	
    Frequency = {
        Private = { -- List of private frequencies
            [1] = true, -- SAMES
            [101] = true, -- Policia 
            [102] = true, -- Policia 
            [103] = true, -- Policia 
            [104] = true, -- Policia 
            [105] = true, -- Policia 
            [106] = true, -- Policia 
            [107] = true, -- Policia 
            [108] = true, -- Policia 
            [109] = true, -- Policia 
            [110] = true, -- Policia
            [120] = true, -- Policia Alianza 1 - Prosegur - Militar - Fbi
            [122] = true, -- Policia Alianza 2 - Prosegur - Militar - Fbi
			---- 
            [130] = true, -- PSG
            [131] = true, -- PSG
            [132] = true, -- PSG Alianza 1 - Policia - Militar - Fbi
            [133] = true, -- PSG
			---- 
            [139] = true, -- Militar
            [140] = true, -- Militar Alianza 1 - Policia - Prosegur - Fbi
            [141] = true, -- Militar Alianza 2 - Policia - Prosegur - Fbi
			---- 
			[702] = true, -- Mafia02
			[703] = true, -- Mafia03
			[704] = true, -- Mafia04
			[705] = true, -- Mafia05
			[706] = true, -- Mafia06
			[707] = true, -- Mafia07
			[708] = true, -- Mafia08
			[709] = true, -- Mafia09
			[710] = true, -- Mafia10
			[711] = true, -- Mafia11
			[712] = true, -- Mafia12
			[713] = true, -- Mafia13
			[714] = true, -- Mafia14
			[715] = true, -- Mafia15
			[716] = true, -- Mafia16
			[717] = true, -- Mafia17
			[718] = true, -- Mafia18
			[719] = true, -- Mafia19
			[720] = true, -- Mafia20
			[721] = true, -- Mafia21
			[722] = true, -- Mafia22
			[723] = true, -- Mafia23
			[724] = true, -- Mafia24
			[725] = true, -- Mafia25
			[726] = true, -- Mafia26
			[727] = true, -- Mafia27
			[728] = true, -- Mafia28
			[729] = true, -- Mafia29
			[730] = true, -- Mafia30
			[731] = true, -- Mafia31
			[732] = true, -- Mafia32
			[733] = true, -- Mafia33
			[734] = true, -- Mafia34
			[735] = true, -- Mafia35
			[736] = true, -- Mafia36
			[737] = true, -- Mafia37
			[738] = true, -- Mafia38
			[739] = true, -- Mafia39
			[740] = true, -- Mafia40
			[741] = true, -- Mafia41
			[742] = true, -- Mafia42
			[743] = true, -- Mafia43
			[744] = true, -- Mafia44
			[745] = true, -- Mafia45
			[746] = true, -- Mafia46
			[747] = true, -- Mafia47
			[748] = true, -- Mafia48
			[749] = true, -- Mafia49
			[750] = true, -- Mafia50
        }, -- List of private frequencies
        Current = 1, -- Don't touch
        CurrentIndex = 1, -- Don't touch
        Min = 1, -- Minimum frequency
        Max = 2500, -- Max number of frequencies
        List = {}, -- Frequency list, Don't touch
        Access = {}, -- List of freqencies a player has access to
    },
    AllowRadioWhenClosed = true -- Allows the radio to be used when not open (uses police radio animation) 
}
