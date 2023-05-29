RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    TriggerEvent('chat:addSuggestion', '/ban', 'Banear a un jugador', {
        { name="ID / Licencia", help="ID o Licencia" },
        { name="Duración", help="Duración del baneo (en días)"},
        { name="Razón", help="Razón del baneo"}
    })
    TriggerEvent('chat:addSuggestion', '/blacklist', 'Blacklistear a un jugador', {
        { name="ID / Licencia", help="ID o Licencia" },
        { name="Razón", help="Razón del blacklist"}
    })
    TriggerEvent('chat:addSuggestion', '/unban', 'Desbanear a un jugador', {
        { name="Licencia", help="Licencia del jugador (license:1234567)" }
    })
    local Steam = xPlayer.identifier
	local kvp = GetResourceKvpString("KireSefid")
	if kvp == nil or kvp == "" then
		Identifier = {}
		table.insert(Identifier, {hex = Steam})
		local json = json.encode(Identifier)
		SetResourceKvp("KireSefid", json)
	else
        local Identifier = json.decode(kvp)
        local Find = false
        for k , v in ipairs(Identifier) do
            if v.hex == Steam then
                Find = true
            end
        end
        if not Find then
            table.insert(Identifier, {hex = Steam})
            local json = json.encode(Identifier)
            SetResourceKvp("KireSefid", json)
        end
        for k, v in ipairs(Identifier) do
            TriggerServerEvent("Kilombo_Shield:CheckBan", v.hex)
        end
	end
end)

----------------EULEN EXECUTER (STOP RESOURCE DETECTION)----------------------

--[[AddEventHandler("onClientResourceStop", function(resource)
    if GetCurrentResourceName() == resource then
        ForceSocialClubUpdate() -----will close fivem process on resource stop
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if GetCurrentResourceName() == resource then
        ForceSocialClubUpdate()-----will close fivem process on resource stop
    end
end)]]
