Markers = {}
Markers.markerPositions = {}

function Markers.StartMarkers()
    Markers.ResetMarkers()
    local temp = 500
    Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(temp)
    
            for _, markerPosition in pairs(Markers.markerPositions) do
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, markerPosition.coords.x, markerPosition.coords.y, markerPosition.coords.z)
            if dist <= 20.5 then
                temp = 5
                Markers.DrawCircle(markerPosition.coords, markerPosition.markerType)
            else temp = 1000
            end
            end
        end
    end)
end

function Markers.SetMarker(coords, markerType)
    Markers.markerPositions = { {coords = coords, markerType = markerType} }
end

function Markers.ResetMarkers()
    Markers.markerPositions = {}
    for _, location in pairs(Config.Locations) do
        table.insert(Markers.markerPositions, {coords = location.Entrance, markerType = Config.Markers.Entrance})
    end
end

function Markers.DrawCircle(coords, markerType)
    DrawMarker(1, coords.x, coords.y, coords.z, 0, 0, 0, 0, 0, 0, markerType.size, markerType.size, 
        markerType.size, markerType.r, markerType.g, markerType.b, 100, true, 0, 2, 0, 0, 0, 0)
end
