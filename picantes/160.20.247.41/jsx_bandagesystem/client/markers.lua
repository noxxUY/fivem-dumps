_SpawnPoints = {}

_SpawnPoints.CreateMarker = function(markerData)

    _markerDistance = #(GetEntityCoords(PlayerPedId()) - markerData.coords)

    if (_markerDistance <= markerData.finalDistance) then
        _inMarker = true
        DrawMarker(1, vec3(markerData.x, markerData.y, markerData.z), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, markerData.w, markerData.h, markerData.d, markerData.r, markerData.g, markerData.b, markerData.a, false, true, 2, false, nil, nil, false)
    elseif (_markerDistance >= markerData.finalDistance) then
        _inMarker = false
    end

end

local function inMarkerState()
    return _inMarker
end