ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
end)

RegisterNetEvent('tm1_getcoords')
AddEventHandler('tm1_getcoords', function()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local codeA = "{x = "..round(x,2)..",  y = "..round(y,2)..",  z = "..round(z,2).."},"
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'codemenu',
        {
          title = "Nombre"
        },
        function(data, menu)
            local name = data.value
            TriggerServerEvent('tm1_getcoords:print', name.." : "..codeA)
            menu.close()
        end,
      function(data, menu)
        menu.close()
      end)
    
end)

RegisterNetEvent('tm1_getcoords1')
AddEventHandler('tm1_getcoords1', function()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local codeA = round(x,2)..", "..round(y,2)..", "..round(z,2)
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'codemenu',
        {
          title = "Nombre"
        },
        function(data, menu)
            local name = data.value
            TriggerServerEvent('tm1_getcoords:print', name.." : "..codeA)
            menu.close()
        end,
      function(data, menu)
        menu.close()
      end)
end)

function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end