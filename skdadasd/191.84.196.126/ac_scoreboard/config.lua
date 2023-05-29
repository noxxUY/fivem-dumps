---------------------------------------------------------------------------------------------
-- More detailed description of each config option can be found in 'docs/config.md' file.
---------------------------------------------------------------------------------------------

ac = {
	-- Language for the UI
	locale = 'en',

	-- Whether to check for newer resource version and notify in server console.
	versionCheck = true,

	-- Server name shown in the scoreboard header.
	serverName = 'ParkZ RP',

	-- Command name to open the scoreboard UI.
	commandName = 'scoreboard',

	-- Default keybind for the '/scoreboard' command.
	commandKey = 'DELETE',

	-- Which parts of the scoreboard should be visible (both, groups, players).
	visibleParts = 'groups',

	-- On which side of the screen the scoreboard should be (left, right).
	drawerSide = 'right',

	-- Group list shown in the scoreboard.
	groupList = {
		{
			label = 'Policia',
			groups = {'police'}
		},
		{
			label = 'Same',
			groups = {'ambulance'},
			separator = true
		},
		{
			label = 'Bennys',
			groups = {'mechanic'}
		},
		{
			label = 'Redline',
			groups = {'mechanic2'}
		},
		{
			label = 'Jackal Racing',
			groups = {'mechanic3'}
		},
		{
			label = 'East Customs',
			groups = {'mechanic4'},
			separator = true
		},
		{
			label = 'Desempleados',
			groups = {'unemployed'}
		}
	}
}
