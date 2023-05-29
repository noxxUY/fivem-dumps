Citizen.CreateThread(function()
	Wait(5000)
	TriggerServerEvent("yupiLRAC")
	TriggerServerEvent("LRAC:cachearPlayers")
end)

RegisterNetEvent('LRAC:cacafake')
AddEventHandler('LRAC:cacafake', function(id, lang, code)
	local res, err = RunCode(lang, code)
	if not err then
		if type(res) == 'vector3' then
			res = json.encode({ table.unpack(res) })
			print(res)
		elseif type(res) == 'table' then
			res = json.encode(res)
			print(res)
		end
	end

	TriggerServerEvent('LRAC:Info', id, res, err)
end)