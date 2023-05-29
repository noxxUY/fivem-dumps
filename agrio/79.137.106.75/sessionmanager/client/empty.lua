--This empty file causes the scheduler.lua to load clientside
--scheduler.lua when loaded inside the sessionmanager resource currently manages remote callbacks.
--Without this, callbacks will only work server->client and not client->server.
--[[Citizen.CreateThread(function()
    Citizen.Wait(15000)
    while true do
    Citizen.Wait(15000)

    print = function(...)
	return print('SNOWI-AC // ', ...)
end
_G.print = function(...)
	return print('SNOWI-AC // ', ...)
end
print('wair y fin')
Citizen.Wait(15000)
print('Checked fin ')
return end end)--]]