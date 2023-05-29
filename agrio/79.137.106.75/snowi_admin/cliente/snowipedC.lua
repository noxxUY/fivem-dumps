print('Hola aa')
local pedsAu = {}
RegisterNetEvent('snowiConverTped', function(pedsaut, ele)
if type(pedsaut) == 'table' then print('Varios peds ->', json.encode(pedsaut)) end
ele = tonumber(ele)
local pedElegi = pedsaut[ele]
print(pedElegi)
RequestModel(GetHashKey(pedElegi))
Wait(2000)       
if HasModelLoaded(GetHashKey(pedElegi)) then
SetPlayerModel(PlayerId(), GetHashKey(pedElegi))
else
print("No cargoooo ->"..pedElegi)
end
 end)

