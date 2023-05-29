Config = {}

Config.UseRPName = false 							-- If set to true, it uses either esx-legacy or qb-core built-in function to get players' RP name

Config.LetPlayersChangeVisibilityOfRadioList = true	-- Let players to toggle visibility of the list
Config.RadioListVisibilityCommand = "radiolist" 	-- Only works if Config.LetPlayersChangeVisibilityOfRadioList is set to true

Config.LetPlayersSetTheirOwnNameInRadio = true		-- Let players to customize how their name is displayed on the list
Config.ResetPlayersCustomizedNameOnExit = true		-- Only works if Config.LetPlayersSetTheirOwnNameInRadio is set to true - Removes customized name players set for themselves on their server exit
Config.RadioListChangeNameCommand = "nameinradio" 	-- Only works if Config.LetPlayersSetTheirOwnNameInRadio is set to true

Config.RadioChannelsWithName = {
	["0"] = "Admin",
	["1"] = "Police",
	["2"] = "PFA",
	["3"] = "Fbi",
	["4"] = "VITTAL",
	["5"] = "Artesh",
	["10"] = "PSG 1",
	["11"] = "PSG 2"
}