function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	--LC500
	AddTextEntry('lc500_arches_5','Liberty Walk Widebody Kit')
	AddTextEntry('lc500_arches_2','Liberty Walk Widebody Kit w/ Rivets')
	AddTextEntry('lc500_bonnet_1','Liberty Walk Hood')
	AddTextEntry('lc500_black_package','BlackOut Details')
	AddTextEntry('lc500_black_grille','BlackOut Grille')
end)
