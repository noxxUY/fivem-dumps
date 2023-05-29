local downloadvehicles = false
local downloadclothes = false
local downloadmaps = false
function DownloadVehicles()
    if downloadvehicles then return end
    downloadvehicles = true
    local vehicles = GetAllVehicleModels()
    for k, v in pairs(vehicles) do
        local model = GetHashKey(v)
        if IsModelInCdimage(model) then
            RequestModel(model)
            local tick = 50
            while not HasModelLoaded(model) and tick > 0 do
                Wait(100)
                if Config.Debug then 
                    print('['..GetCurrentResourceName()..'] Loading vehicle model: ', v)
                end
                tick = tick - 1
            end
            SetModelAsNoLongerNeeded(model)
        end
    end
    downloadvehicles = false
    if Config.Debug then 
        print('['..GetCurrentResourceName()..'] All vehicles downloaded.')
        for i=1, 100 do
            print('['..GetCurrentResourceName()..'] Now, leave the server and your vehicles will be downloaded.')
        end
    end
end

function DownloadClothes()
    if downloadclothes then return end
    downloadclothes = true
    local ped = PlayerPedId()
    for i=1, 13 do
        print('Downloading clothes.. ')
        local componentId = (i - 1)
        local drawableVariations = GetNumberOfPedDrawableVariations(ped, componentId)

        for drawableId=1, drawableVariations do
            local textureIds = GetNumberOfPedTextureVariations(ped, componentId, drawableId)
            for textureId=1, textureIds do
                for paleteId=1, 4 do
                    Wait(1)
                    local paletteId = (paleteId - 1)
                    SetPedComponentVariation(
                        ped, 
                        componentId, 
                        drawableId, 
                        textureId, 
                        paletteId
                    )
                end
            end
        end
    end
    Wait(1000)
    downloadclothes = false
    if Config.Debug then 
        print('['..GetCurrentResourceName()..'] All clothes downloaded.')
        for i=1, 100 do
            print(' ['..GetCurrentResourceName()..'] Reconnect to this server please. You should have all the clothes downloaded')
        end
    end
end

function DownloadMaps()
    if downloadmaps then return end
    downloadmaps = true
    for i=1, 1000000 do
        if IsValidInterior(i) then
            print('Downloading interiors.. '..i)
            PinInteriorInMemory(i)
            Wait(100)
            UnpinInterior(i)
        end
    end
    downloadmaps = false
    if Config.Debug then 
        print('All MLOs downloaded.')
        for i=1, 100 do
            print('['..GetCurrentResourceName()..'] Reconnect to this server please. You should have all the MLOs downloaded.')
        end
    end
end