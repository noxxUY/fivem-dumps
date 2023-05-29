function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

-- Uncomment if you want add Players Steam or connected players

--local id = PlayerId()
--local serverID = GetPlayerServerId(PlayerId())
--players = {}
--for i = 0, 255 do
 --   if NetworkIsPlayerActive( i ) then
 --       table.insert( players, i )
 --   end
--end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', '~f~Bienvenido a AGRIO RP.')
  AddTextEntry('PM_PANE_LEAVE', '~o~Regresar a la lista de servidores.')
  AddTextEntry('PM_PANE_QUIT', '~r~Deja esta hermosa ciudad :c')
  AddTextEntry('PM_SCR_MAP', '~b~Mapa de Los Santos')
  AddTextEntry('PM_SCR_GAM', '~r~Salir')
  AddTextEntry('PM_SCR_INF', '~g~Logs')
  AddTextEntry('PM_SCR_SET', '~p~Configuración')
  AddTextEntry('PM_SCR_STA', '~f~Estadística')
  AddTextEntry('PM_SCR_RPL', '~y~Editor∑')
end)
