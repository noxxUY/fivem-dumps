function AddTextEntry(k, v)
   Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), k, v)
end

local fivem_title = "~o~ReinadoRP - discord.gg/reinadorp"
local map_category = "~o~Mapa"

local game_category = "~o~-"
local disconnect_submenu = "~o~Ir a la lista de Servidores"
local closegame_submenu = "~o~Cerrar Juego"

local info_category = "~o~Logs"
local statistics_category = "~o~Estadisticas"
local settings_category = "~o~Configuración"
local gallery_category = "~o~Galeria"
local rockstar_editor_category = "~o~∑ Editor"

local fivem_key_config_submenu = "~o~ReinadoRP Bindeos"

Citizen.CreateThread(function()
   AddTextEntry('FE_THDR_GTAO', fivem_title)
   AddTextEntry('PM_SCR_MAP', map_category)
   AddTextEntry('PM_SCR_GAM', game_category)
   AddTextEntry('PM_PANE_LEAVE', disconnect_submenu)
   AddTextEntry('PM_PANE_QUIT', closegame_submenu)
   AddTextEntry('PM_SCR_INF', info_category)
   AddTextEntry('PM_SCR_STA', statistics_category)
   AddTextEntry('PM_SCR_SET', settings_category)
   AddTextEntry('PM_SCR_GAL', gallery_category)
   AddTextEntry('PM_SCR_RPL', rockstar_editor_category)
   AddTextEntry('PM_PANE_CFX', fivem_key_config_submenu)
end)
