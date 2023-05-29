--[[
	Borrar puertas [Santander]
--]]

local coordssantander = vector3(306.4883,-297.3887,53.59317)
local Doordssantander = {
	list = {
		{ coords = vector3(312.358,-282.7301 ,54.30365) , dist = 2.0 , hash = 'v_ilev_gb_vauldr' },
	}
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1800)

		

if GetDistanceBetweenCoords(coordssantander, GetEntityCoords(PlayerPedId())) < 300.0 then
			for k, doors in ipairs(Doordssantander['list']) do
				local object = GetClosestObjectOfType(doors.coords, doors.dist, GetHashKey(doors.hash), false, false, false)
				deleteObject(object)
			end
		end
	end
end)


function deleteObject(object)
	if DoesEntityExist(object) then
		SetEntityVisible(object,false,0)

		SetEntityAsMissionEntity(object) 
		DeleteEntity(object)
	end
end