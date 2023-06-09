Shared = {}

Shared.currentResourceName = GetCurrentResourceName()

Shared.Callback = {}

Shared.Callback.getPlayersInRadio = ("%s:getPlayersInRadio"):format(Shared.currentResourceName)

Shared.Callback.getPlayerName = ("%s:getPlayerName"):format(Shared.currentResourceName)

Shared.State = {}

Shared.State.nameInRadio = ("%s_nameInRadio"):format(Shared.currentResourceName)

Shared.State.callsignIsSet = ("%s_callsignIsSet"):format(Shared.currentResourceName)

Shared.State.allowedToSeeRadioList = ("%s_allowedToSeeRadioList"):format(Shared.currentResourceName)

function dumpTable(table, nb)
    if nb == nil then
        nb = 0
    end

    if type(table) == 'table' then
        local s = ''
        for i = 1, nb + 1, 1 do
            s = s .. "    "
        end

        s = '{\n'
        for k,v in pairs(table) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            for i = 1, nb, 1 do
                s = s .. "    "
            end
            s = s .. '['..k..'] = ' .. dumpTable(v, nb + 1) .. ',\n'
        end

        for i = 1, nb, 1 do
            s = s .. "    "
        end

        return s .. '}'
    else
        return tostring(table)
    end
end