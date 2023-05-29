Config = {

  -- Keybinds, you can choose from here : https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
  DefaultControls = function()
    RegisterKeyMapping('+signal_left',     'Direccional - izquierda',         'KEYBOARD',  'LEFT') -- Signal to the left
    RegisterKeyMapping('+signal_right',    'Direccional - Derecha',        'KEYBOARD', 'RIGHT') -- Signal to the right
    RegisterKeyMapping('+signal_hazards',  'Direccional - Alerta',             'KEYBOARD',  'DOWN') -- Hazards
  end,

  -- Should a notif be sent if a user press a keybind but no vehicle is in range ?
  NoVehNotif = false,

  Strings = {
    ['no_veh']  = 'No vehicle nearby',
  },

}

local prev = nil
function ShowNotification(message)
  if prev ~= nil then
    RemoveNotification(prev)
  end
  AddTextEntry(GetCurrentResourceName().."Notif", Config.Strings[message])
  BeginTextCommandThefeedPost(GetCurrentResourceName().."Notif")
  prev = EndTextCommandThefeedPostTicker(false, false)
end
