function AddTextEntry(key , value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY") , key , value)
end

Citizen.CreateThread(function()
	AddTextEntry('FE_THDR_GTAO' , '~b~🌴PicanteRP🌴 ~w~|~w~ ¡Tu ID es la ~g~' .. GetPlayerServerId(PlayerId()) .. '~w~!')
	AddTextEntry('PM_PANE_LEAVE' , 'Regresar a la lista de servidores')
	AddTextEntry('PM_PANE_QUIT' , 'Cerrar FiveM')
	AddTextEntry('PM_SCR_MAP' , 'GPS')
	AddTextEntry('PM_SCR_GAM' , 'Desconectarse')
	AddTextEntry('PM_SCR_INF' , 'Logs')
	AddTextEntry('PM_SCR_SET' , 'Configuración')
	AddTextEntry('PM_SCR_STA' , 'Estadísticas')
	AddTextEntry('PM_SCR_GAL' , 'Galería')
	AddTextEntry('PM_SCR_RPL' , 'Editor ∑')
end)