radioConfig = {
    Controls = {
        Activator = { -- Open/Close Radio
            Name = "INPUT_DROP_WEAPON", -- Control name
            Key = 56, -- F2
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
            Key = 19, -- Caps Lock
        },
        ToggleClicks = { -- Toggle radio click sounds
            Name = "INPUT_SELECT_WEAPON", -- Control name
            Key = 37, -- Tab
        }
    },
    Frequency = {
        Private = { -- List of private frequencies
            [1] = true, -- Make 1 a private frequency
			[2] = true,
			[3] = true,
			[4] = true,
			[5] = true,
			[6] = true,
			[7] = true,
			[8] = true,
			[9] = true,
			[10] = true,
			[11] = true,	
			[12] = true,
			[13] = true,
			--Radios para orgs
			[20] = true,
			[21] = true,
			[22] = true,
			[23] = true,
			[24] = true,
			[25] = true,
			[26] = true,
			[27] = true,
			[28] = true,
			[29] = true,
			[30] = true,
			[31] = true,
			[32] = true,
			[33] = true,
			[34] = true,
			[35] = true,
			[36] = true,
			[37] = true,
			[38] = true,
			[39] = true,
			[40] = true,
			[41] = true,
			[42] = true,
			[43] = true,
			[44] = true,
			[45] = true,
			[46] = true,
			[47] = true,
			[48] = true,
			[49] = true,
			[50] = true,
			[51] = true,
			[52] = true,
			[53] = true,
			[54] = true,
			[55] = true,
			[56] = true,
			[57] = true,
			[58] = true,
			[59] = true,
			[60] = true,
			[61] = true,
			[62] = true,
			[63] = true,
			[64] = true,
			[65] = true,
        }, -- List of private frequencies
        Current = 1, -- Don't touch
        CurrentIndex = 1, -- Don't touch
        Min = 1, -- Minimum frequency
        Max = 800, -- Max number of frequencies
        List = {}, -- Frequency list, Don't touch
        Access = {}, -- List of freqencies a player has access to
    },
    AllowRadioWhenClosed = true -- Allows the radio to be used when not open (uses police radio animation) 
}