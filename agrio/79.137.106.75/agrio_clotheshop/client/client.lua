ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
local alright = false
local pArmor = 0
local enabled = false
local player = false
local firstChar = false
local cam = false
local customCam = false
local oldPed = false
local startingMenu = false

local drawable_names = {"face", "masks", "hair", "torsos", "legs", "bags", "shoes", "neck", "undershirts", "vest", "decals", "jackets"}
local prop_names = {"hats", "glasses", "earrings", "mouth", "lhand", "rhand", "watches", "braclets"}
local head_overlays = {"Blemishes","FacialHair","Eyebrows","Ageing","Makeup","Blush","Complexion","SunDamage","Lipstick","MolesFreckles","ChestHair","BodyBlemishes","AddBodyBlemishes"}
local face_features = {"Nose_Width","Nose_Peak_Hight","Nose_Peak_Lenght","Nose_Bone_High","Nose_Peak_Lowering","Nose_Bone_Twist","EyeBrown_High","EyeBrown_Forward","Cheeks_Bone_High","Cheeks_Bone_Width","Cheeks_Width","Eyes_Openning","Lips_Thickness","Jaw_Bone_Width","Jaw_Bone_Back_Lenght","Chimp_Bone_Lowering","Chimp_Bone_Lenght","Chimp_Bone_Width","Chimp_Hole","Neck_Thikness"}

function RefreshUI()
    hairColors = {}
    for i = 0, GetNumHairColors()-1 do
        local outR, outG, outB= GetPedHairRgbColor(i)
        hairColors[i] = {outR, outG, outB}
    end

    SendNUIMessage({
        type="colors",
        hairColors=hairColors,
        hairColor=GetPedHair()
    })
    SendNUIMessage({
        type = "menutotals",
        drawTotal = GetDrawablesTotal(),
        propDrawTotal = GetPropDrawablesTotal(),
        textureTotal = GetTextureTotals(),
        -- headoverlayTotal = GetHeadOverlayTotals(),
    })
    SendNUIMessage({
        type = "clothesmenudata",
        drawables = GetDrawables(),
        props = GetProps(),
        drawtextures = GetDrawTextures(),
        proptextures = GetPropTextures(),
        skin = GetSkin(),
        oldPed = oldPed,
    })
end

Citizen.CreateThread(function()
    for i=1, #clothingShops, 1 do
        if clothingShops[i].blip == true then
          local blip = AddBlipForCoord(clothingShops[i].x, clothingShops[i].y, clothingShops[i].z)

          SetBlipSprite (blip, 73)
          SetBlipDisplay(blip, 4)
          SetBlipScale  (blip, 0.7)
          SetBlipColour (blip, 0)
          SetBlipAsShortRange(blip, true)

          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString('Tienda de ropa')
          EndTextCommandSetBlipName(blip)
        end
    end
end)


function GetSkin()
    for i = 1, #frm_skins do
        if (GetHashKey(frm_skins[i]) == GetEntityModel(PlayerPedId())) then
            return {name="skin_male", value=i}
        end
    end
    for i = 1, #fr_skins do
        if (GetHashKey(fr_skins[i]) == GetEntityModel(PlayerPedId())) then
            return {name="skin_female", value=i}
        end
    end
    return false
end

function GetDrawables()
    drawables = {}
    local model = GetEntityModel(PlayerPedId())
    local mpPed = false
    if (model == `mp_f_freemode_01` or model == `mp_m_freemode_01`) then
        mpPed = true
    end
    for i = 0, #drawable_names-1 do
        if mpPed and drawable_names[i+1] == "undershirts" and GetPedDrawableVariation(player, i) == -1 then
            SetPedComponentVariation(player, i, 15, 0, 2)
        end
        drawables[i] = {drawable_names[i+1], GetPedDrawableVariation(player, i)}
    end
    return drawables
end

function GetProps()
    props = {}
    for i = 0, #prop_names-1 do
        props[i] = {prop_names[i+1], GetPedPropIndex(player, i)}
    end
    return props
end

function GetDrawTextures()
    textures = {}
    for i = 0, #drawable_names-1 do
        table.insert(textures, {drawable_names[i+1], GetPedTextureVariation(player, i)})
    end
    return textures
end

function GetPropTextures()
    textures = {}
    for i = 0, #prop_names-1 do
        table.insert(textures, {prop_names[i+1], GetPedPropTextureIndex(player, i)})
    end
    return textures
end

function GetDrawablesTotal()
    drawables = {}
    for i = 0, #drawable_names - 1 do
        drawables[i] = {drawable_names[i+1], GetNumberOfPedDrawableVariations(player, i)}
    end
    return drawables
end

function GetPropDrawablesTotal()
    props = {}
    for i = 0, #prop_names - 1 do
        props[i] = {prop_names[i+1], GetNumberOfPedPropDrawableVariations(player, i)}
    end
    return props
end

function GetTextureTotals()
    local values = {}
    local draw = GetDrawables()
    local props = GetProps()

    for idx = 0, #draw-1 do
        local name = draw[idx][1]
        local value = draw[idx][2]
        values[name] = GetNumberOfPedTextureVariations(player, idx, value)
    end

    for idx = 0, #props-1 do
        local name = props[idx][1]
        local value = props[idx][2]
        values[name] = GetNumberOfPedPropTextureVariations(player, idx, value)
    end
    return values
end

function SetClothing(drawables, props, drawTextures, propTextures)
    for i = 1, #drawable_names do
        if drawables[0] == nil then
            if drawable_names[i] == "undershirts" and drawables[tostring(i-1)][2] == -1 then
                SetPedComponentVariation(player, i-1, 15, 0, 2)
            else
                SetPedComponentVariation(player, i-1, drawables[tostring(i-1)][2], drawTextures[i][2], 2)
            end
        else
            if drawable_names[i] == "undershirts" and drawables[i-1][2] == -1 then
                SetPedComponentVariation(player, i-1, 15, 0, 2)
            else
                SetPedComponentVariation(player, i-1, drawables[i-1][2], drawTextures[i][2], 2)
            end
        end
    end

    for i = 1, #prop_names do
        local propZ = (drawables[0] == nil and props[tostring(i-1)][2] or props[i-1][2])
        ClearPedProp(player, i-1)
        SetPedPropIndex(
            player,
            i-1,
            propZ,
            propTextures[i][2], true)
    end
end

function GetSkinTotal()
    print(#frm_skins)
	return {
        #frm_skins,
        #fr_skins
    }
end

local toggleClothing = {}
function ToggleProps(data)
    local name = data["name"]

    selectedValue = has_value(drawable_names, name)
    if (selectedValue > -1) then
        if (toggleClothing[name] ~= nil) then
            SetPedComponentVariation(
                player,
                tonumber(selectedValue),
                tonumber(toggleClothing[name][1]),
                tonumber(toggleClothing[name][2]), 2)
            toggleClothing[name] = nil
        else
            toggleClothing[name] = {
                GetPedDrawableVariation(player, tonumber(selectedValue)),
                GetPedTextureVariation(player, tonumber(selectedValue))
            }

            local value = -1
            if name == "undershirts" or name == "torsos" then
                value = 15
                if name == "undershirts" and GetEntityModel(PlayerPedId()) == GetHashKey('mp_f_freemode_01') then
                    value = -1
                end
            end
            if name == "legs" then
                value = 14
            end

            SetPedComponentVariation(
                player,
                tonumber(selectedValue),
                value, 0, 2)
        end
    else
        selectedValue = has_value(prop_names, name)
        if (selectedValue > -1) then
            if (toggleClothing[name] ~= nil) then
                SetPedPropIndex(
                    player,
                    tonumber(selectedValue),
                    tonumber(toggleClothing[name][1]),
                    tonumber(toggleClothing[name][2]), true)
                toggleClothing[name] = nil
            else
                toggleClothing[name] = {
                    GetPedPropIndex(player, tonumber(selectedValue)),
                    GetPedPropTextureIndex(player, tonumber(selectedValue))
                }
                ClearPedProp(player, tonumber(selectedValue))
            end
        end
    end
end

function SaveToggleProps()
    for k in pairs(toggleClothing) do
        local name  = k
        selectedValue = has_value(drawable_names, name)
        if (selectedValue > -1) then
            SetPedComponentVariation(
                player,
                tonumber(selectedValue),
                tonumber(toggleClothing[name][1]),
                tonumber(toggleClothing[name][2]), 2)
            toggleClothing[name] = nil
        else
            selectedValue = has_value(prop_names, name)
            if (selectedValue > -1) then
                SetPedPropIndex(
                    player,
                    tonumber(selectedValue),
                    tonumber(toggleClothing[name][1]),
                    tonumber(toggleClothing[name][2]), true)
                toggleClothing[name] = nil
            end
        end
    end
end

function LoadPed(data)
    SetSkin(data.model, true)
    SetClothing(data.drawables, data.props, data.drawtextures, data.proptextures)
    -- Citizen.Wait(500)
    SetPedHairColor(player, tonumber(data.hairColor[1]), tonumber(data.hairColor[2]))
    SetPedHeadBlend(data.headBlend)
    SetHeadStructure(data.headStructure)
    SetHeadOverlayData(data.headOverlay)
    return
end

function GetCurrentPed()
    player = GetPlayerPed(-1)
    return {
        model = GetEntityModel(PlayerPedId()),
        hairColor = GetPedHair(),
        headBlend = GetPedHeadBlendData(),
        headOverlay = GetHeadOverlayData(),
        headStructure = GetHeadStructure(),
        drawables = GetDrawables(),
        props = GetProps(),
        drawtextures = GetDrawTextures(),
        proptextures = GetPropTextures(),
    }
end

function PlayerModel(data)
    local skins = nil
    if (data['name'] == 'skin_male') then
        skins = frm_skins
    else
        skins = fr_skins
    end
    local skin = skins[tonumber(data['value'])]
    rotation(180.0)
    SetSkin(GetHashKey(skin), true)
    Citizen.Wait(1)
    rotation(180.0)
end

function SetSkin(model, setDefault)
    -- TODO: If not isCop and model not in copModellist, do below.
    -- Model is a hash, GetHashKey(modelName)
    SetEntityInvincible(PlayerPedId(),true)
    if IsModelInCdimage(model) and IsModelValid(model) then
        RequestModel(model)
        while (not HasModelLoaded(model)) do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)
        player = GetPlayerPed(-1)
        FreezePedCameraRotation(player, true)
        if setDefault and model ~= nil and not isCustomSkin(model) then
            if (model ~= `mp_f_freemode_01` and model ~= `mp_m_freemode_01`) then
                SetPedRandomComponentVariation(GetPlayerPed(-1), true)
            else
                SetPedHeadBlendData(player, 0, 0, 0, 15, 0, 0, 0, 1.0, 0, false)
                SetPedComponentVariation(player, 11, 0, 11, 0)
                SetPedComponentVariation(player, 8, 0, 1, 0)
                SetPedComponentVariation(player, 6, 1, 2, 0)
                SetPedHeadOverlayColor(player, 1, 1, 0, 0)
                SetPedHeadOverlayColor(player, 2, 1, 0, 0)
                SetPedHeadOverlayColor(player, 4, 2, 0, 0)
                SetPedHeadOverlayColor(player, 5, 2, 0, 0)
                SetPedHeadOverlayColor(player, 8, 2, 0, 0)
                SetPedHeadOverlayColor(player, 10, 1, 0, 0)
                SetPedHeadOverlay(player, 1, 0, 0.0)
                SetPedHairColor(player, 1, 1)
            end
        end
    end
    SetEntityInvincible(PlayerPedId(),false)
end

RegisterNUICallback('getMyOutfits', function(data, cb)
    ESX.TriggerServerCallback('agrio_clothes:getPlayerDressing', function(dressing)

        local elements = {}
        for i=1, #dressing, 1 do
		  table.insert(elements, {text = dressing[i], value = i})
		end

        cb(elements)
    end)

end)

RegisterNUICallback('deleteoutfit', function(data, cb)
    TriggerServerEvent("agrio_clothes:removeOutfit", tonumber(data.number))
    cb(true)
end)

RegisterNUICallback('updateclothes', function(data, cb)
    Citizen.Wait(0)
   -- SetPedArmour(PlayerPedId(),pArmor)
    toggleClothing[data["name"]] = nil
    selectedValue = has_value(drawable_names, data["name"])
    if (selectedValue > -1) then
	
    TriggerEvent('skinchanger:getSkin', function(skin2)
        --print(skin2.chain_1)
	  if selectedValue == 11 then
	   skin2.torso_1 = tonumber(data["value"])
	   skin2.torso_2 = tonumber(data["texture"])
	  elseif selectedValue == 2 then
	   skin2.hair_1 = tonumber(data["value"])
	   skin2.hair_2 = tonumber(data["texture"])   
	  elseif selectedValue == 8 then
	   skin2.tshirt_1 = tonumber(data["value"])
	   skin2.tshirt_2 = tonumber(data["texture"])	   
	  elseif selectedValue == 3 then
	   skin2.arms = tonumber(data["value"])	 
	  elseif selectedValue == 4 then
	   skin2.pants_1 = tonumber(data["value"])	 
	   skin2.pants_2 = tonumber(data["texture"])	   
	  elseif selectedValue == 6 then
	   skin2.shoes_1 = tonumber(data["value"])	 
	   skin2.shoes_2 = tonumber(data["texture"])	
	  elseif selectedValue == 10 then
	   skin2.decals_1 = tonumber(data["value"])	 
	   skin2.decals_2 = tonumber(data["texture"])	
	  elseif selectedValue == 1 then
	   skin2.mask_1 = tonumber(data["value"])	 
	   skin2.mask_2 = tonumber(data["texture"])
	  elseif selectedValue == 5 then
	   skin2.bags_1 = tonumber(data["value"])	 
       skin2.bags_2 = tonumber(data["texture"])
      elseif selectedValue == 7 then
        skin2.chain_1 = tonumber(data["value"])	 
        skin2.chain_2 = tonumber(data["texture"])
	  elseif selectedValue == 9 then
	   skin2.bproof_1 = tonumber(data["value"])	 
	   skin2.bproof_2 = tonumber(data["texture"])
	  end
	   TriggerEvent("skinchanger:loadSkin",skin2)	  
	end)
		
        cb({
            GetNumberOfPedTextureVariations(player, tonumber(selectedValue), tonumber(data["value"]))
        })
    else
        selectedValue = has_value(prop_names, data["name"])
        if (tonumber(data["value"]) == -1) then
            ClearPedProp(player, tonumber(selectedValue))
        else
    TriggerEvent('skinchanger:getSkin', function(skin2)
	  if selectedValue == 1 then
	   skin2.glasses_1 = tonumber(data["value"])
	   skin2.glasses_2 = tonumber(data["texture"])
      elseif selectedValue == 2 then
        if tonumber(data["value"]) == 0 then
            skin2.ears_1 = -1
            skin2.ears_2 = tonumber(data["texture"])
        else
            skin2.ears_1 = tonumber(data["value"])
            skin2.ears_2 = tonumber(data["texture"])
        end
      elseif selectedValue == 0 then
        if tonumber(data["value"]) == 0 then
            skin2.helmet_1 = -1
            skin2.helmet_2 = tonumber(data["texture"])
        else
            skin2.helmet_1 = tonumber(data["value"])
            skin2.helmet_2 = tonumber(data["texture"])
        end
      elseif selectedValue == 6 then
        if tonumber(data["value"]) == 0 then
            skin2.watches_1 = -1
            skin2.watches_2 = tonumber(data["texture"])
        else
            skin2.watches_1 = tonumber(data["value"])
            skin2.watches_2 = tonumber(data["texture"])
        end	
	  elseif selectedValue == 7 then
	   skin2.bracelets_1 = tonumber(data["value"])	 
	   skin2.bracelets_2 = tonumber(data["texture"])		   
	  end
	   TriggerEvent("skinchanger:loadSkin",skin2)	  
	end)
				        end
        cb({
            GetNumberOfPedPropTextureVariations(
                player,
                tonumber(selectedValue),
                tonumber(data["value"])
            )
        })
    end
	
	
end)

RegisterNUICallback('customskin', function(data, cb)
    if canUseCustomSkins() then
        local valid_model = isInSkins(data)
        if valid_model then
            SetSkin(GetHashKey(data), true)
        end
    end
end)

-- RegisterNUICallback('setped', function(data, cb)
--     PlayerModel(data)
--     RefreshUI()
--     cb('ok')
-- end)

RegisterNUICallback('resetped', function(data, cb)
    LoadPed(oldPed)
    cb('ok')
end)

RegisterNUICallback('loadsaved', function(data, cb)
    
   -- SetPedArmour(PlayerPedId(),pArmor)
    if tonumber(data.number) == 0 then
        LoadPed(oldPed)
        return
    end

    ESX.TriggerServerCallback('agrio_clothes:getPlayerDressing', function(dressing)
        for i=1, #dressing, 1 do
            if tonumber(i) == tonumber(data.number) then
                TriggerEvent('skinchanger:getSkin', function(skin)

                    ESX.TriggerServerCallback('agrio_clothes:getPlayerOutfit', function(clothes)
                        TriggerEvent('skinchanger:loadClothes', skin, clothes)
                        TriggerEvent('esx_skin:setLastSkin', skin)
        
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end, i)
                end)
                return
            end
        end
    end)
end)

RegisterNUICallback('saveescape', function(data, cb)
    ESX.TriggerServerCallback('agrio_clothes:removeMoney2', function(alright)
        if alright then
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent('agrio_clothes:saveOutfit', data, skin)
            end)
    
            --SetPedArmour(PlayerPedId(),pArmor)

            ESX.ShowNotification('Traje guardado.')
            cb('ok')
        end
    end)
end)

------------------------------------------------------------------------------------------
-- Barber

function GetPedHeadBlendData()
    local blob = string.rep("\0\0\0\0\0\0\0\0", 6 + 3 + 1) -- Generate sufficient struct memory.
    if not Citizen.InvokeNative(0x2746BD9D88C5C5D0, player, blob, true) then -- Attempt to write into memory blob.
        return nil
    end

    return {
        shapeFirst = string.unpack("<i4", blob, 1),
        shapeSecond = string.unpack("<i4", blob, 9),
        shapeThird = string.unpack("<i4", blob, 17),
        skinFirst = string.unpack("<i4", blob, 25),
        skinSecond = string.unpack("<i4", blob, 33),
        skinThird = string.unpack("<i4", blob, 41),
        shapeMix = string.unpack("<f", blob, 49),
        skinMix = string.unpack("<f", blob, 57),
        thirdMix = string.unpack("<f", blob, 65),
        hasParent = string.unpack("b", blob, 73) ~= 0,
    }
end
function SetPedHeadBlend(data)
    SetPedHeadBlendData(player,
        tonumber(data['shapeFirst']),
        tonumber(data['shapeSecond']),
        tonumber(data['shapeThird']),
        tonumber(data['skinFirst']),
        tonumber(data['skinSecond']),
        tonumber(data['skinThird']),
        tonumber(data['shapeMix']),
        tonumber(data['skinMix']),
        tonumber(data['thirdMix']),
        false)
end

function GetHeadOverlayData()
    local headData = {}
    for i = 1, #head_overlays do
        local retval, overlayValue, colourType, firstColour, secondColour, overlayOpacity = GetPedHeadOverlayData(player, i-1)
        if retval then
            headData[i] = {}
            headData[i].name = head_overlays[i]
            headData[i].overlayValue = overlayValue
            headData[i].colourType = colourType
            headData[i].firstColour = firstColour
            headData[i].secondColour = secondColour
            headData[i].overlayOpacity = overlayOpacity
        end
    end
    return headData
end

function SetHeadOverlayData(data)
    if json.encode(data) ~= "[]" then
        for i = 1, #head_overlays do
            SetPedHeadOverlay(player,  i-1, tonumber(data[i].overlayValue),  tonumber(data[i].overlayOpacity))
            -- SetPedHeadOverlayColor(player, i-1, data[i].colourType, data[i].firstColour, data[i].secondColour)
        end

        SetPedHeadOverlayColor(player, 0, 0, tonumber(data[1].firstColour), tonumber(data[1].secondColour))
        SetPedHeadOverlayColor(player, 1, 1, tonumber(data[2].firstColour), tonumber(data[2].secondColour))
        SetPedHeadOverlayColor(player, 2, 1, tonumber(data[3].firstColour), tonumber(data[3].secondColour))
        SetPedHeadOverlayColor(player, 3, 0, tonumber(data[4].firstColour), tonumber(data[4].secondColour))
        SetPedHeadOverlayColor(player, 4, 2, tonumber(data[5].firstColour), tonumber(data[5].secondColour))
        SetPedHeadOverlayColor(player, 5, 2, tonumber(data[6].firstColour), tonumber(data[6].secondColour))
        SetPedHeadOverlayColor(player, 6, 0, tonumber(data[7].firstColour), tonumber(data[7].secondColour))
        SetPedHeadOverlayColor(player, 7, 0, tonumber(data[8].firstColour), tonumber(data[8].secondColour))
        SetPedHeadOverlayColor(player, 8, 2, tonumber(data[9].firstColour), tonumber(data[9].secondColour))
        SetPedHeadOverlayColor(player, 9, 0, tonumber(data[10].firstColour), tonumber(data[10].secondColour))
        SetPedHeadOverlayColor(player, 10, 1, tonumber(data[11].firstColour), tonumber(data[11].secondColour))
        SetPedHeadOverlayColor(player, 11, 0, tonumber(data[12].firstColour), tonumber(data[12].secondColour))
    end
end

-- function GetHeadOverlayTotals()
--     local totals = {}
--     for i = 1, #head_overlays do
--         totals[head_overlays[i]] = GetNumHeadOverlayValues(i-1)
--     end
--     return totals
-- end

function GetPedHair()
    local hairColor = {}
    hairColor[1] = GetPedHairColor(player)
    hairColor[2] = GetPedHairHighlightColor(player)
    return hairColor
end

function GetHeadStructureData()
    local structure = {}
    for i = 1, #face_features do
        structure[face_features[i]] = GetPedFaceFeature(player, i-1)
    end
    return structure
end

function GetHeadStructure(data)
    local structure = {}
	
    for i = 1, #face_features do
        structure[i] = GetPedFaceFeature(player, i-1)
    end
	
    return structure
end

function SetHeadStructure(data)
    for i = 1, #face_features do
        SetPedFaceFeature(player, i-1, data[i])
    end
end

RegisterNUICallback('savehaircolor', function(data, cb)
 Citizen.Wait(0)
 TriggerEvent('skinchanger:getSkin', function(skin2)
	skin2.hair_color_1 = tonumber(data['firstColour'])
	skin2.hair_color_1 =tonumber(data['secondColour'])
    TriggerEvent("skinchanger:loadSkin",skin2)
   end)
 end)

RegisterNUICallback('saveheadoverlay', function(data, cb)
    local index = has_value(head_overlays, data["name"])
    SetPedHeadOverlay(player,  index, tonumber(data["value"]), tonumber(data["opacity"]) / 100)
    cb('ok')
end)

RegisterNUICallback('saveheadoverlaycolor', function(data, cb)
    local index = has_value(head_overlays, data["name"])
    local success, overlayValue, colourType, firstColour, secondColour, overlayOpacity = GetPedHeadOverlayData(player, index)
    local sColor = tonumber(data['secondColour'])
    if (sColor == nil) then
        sColor = tonumber(data['firstColour'])
    end
    SetPedHeadOverlayColor(player, index, colourType, tonumber(data['firstColour']), sColor)
    cb('ok')
end)


----------------------------------------------------------------------------------
-- UTIL SHIT

function has_value (tab, val)
    for index = 1, #tab do
        if tab[index] == val then
            return index-1
        end
    end
    return -1
end

function EnableGUI(enable, menu)
    enabled = enable
    SetNuiFocus(enable, enable)
    FreezeEntityPosition(PlayerPedId(), enable)
    SendNUIMessage({
        type = "enableclothesmenu",
        enable = enable,
        menu = menu,
        isService = isService,
    })

    if (not enable) then
        SaveToggleProps()
        oldPed = {}
    end
end

function CustomCamera(position)
    if customCam or position == "torso" then
        FreezePedCameraRotation(player, false)
        SetCamActive(cam, false)
        RenderScriptCams(false,  false,  0,  true,  true)
        if (DoesCamExist(cam)) then
            DestroyCam(cam, false)
        end
        customCam = false
    else
        if (DoesCamExist(cam)) then
            DestroyCam(cam, false)
        end

        local pos = GetEntityCoords(player, true)
        SetEntityRotation(player, 0.0, 0.0, 0.0, 1, true)
        FreezePedCameraRotation(player, true)

        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamCoord(cam, player)
        SetCamRot(cam, 0.0, 0.0, 0.0)

        SetCamActive(cam, true)
        RenderScriptCams(true,  false,  0,  true,  true)

        SwitchCam(position)
        customCam = true
    end
end

function rotation(dir)
    local pedRot = GetEntityHeading(PlayerPedId())+dir
    SetEntityHeading(PlayerPedId(), pedRot % 360)
end

function TogRotation()
    local pedRot = GetEntityHeading(PlayerPedId())+90 % 360
    SetEntityHeading(PlayerPedId(), math.floor(pedRot / 90) * 90.0)
end

function SwitchCam(name)
    if name == "cam" then
        TogRotation()
        return
    end

    local pos = GetEntityCoords(player, true)
    local bonepos = false
    if (name == "head") then
        bonepos = GetPedBoneCoords(player, 31086)
        bonepos = vector3(bonepos.x - 0.1, bonepos.y + 0.4, bonepos.z + 0.05)
    end
    if (name == "torso") then
        bonepos = GetPedBoneCoords(player, 11816)
        bonepos = vector3(bonepos.x - 0.4, bonepos.y + 2.2, bonepos.z + 0.2)
    end
    if (name == "leg") then
        bonepos = GetPedBoneCoords(player, 46078)
        bonepos = vector3(bonepos.x - 0.1, bonepos.y + 1, bonepos.z)
    end

    SetCamCoord(cam, bonepos.x, bonepos.y, bonepos.z)
    SetCamRot(cam, 0.0, 0.0, 180.0)
end

RegisterNUICallback('escape', function(data, cb)
    
    --ESX.TriggerServerCallback('agrio_clothes:removeMoney2', function(alright)
   -- if alright then
   -- SetPedArmour(PlayerPedId(),pArmor)
   -- Save(data['save'])
	--	TriggerEvent('skinchanger:getSkin', function(skin)
	--	TriggerServerEvent('esx_skin:save', skin)
	--end)	
    EnableGUI(false, false)
    cb('ok')
--end
end)


RegisterNUICallback('escape2', function(data, cb) 
    --SetPedArmour(PlayerPedId(),pArmor)
    EnableGUI(false, false)
    FreezePedCameraRotation(player, false)
        SetCamActive(cam, false)
        RenderScriptCams(false,  false,  0,  true,  true)
        if (DoesCamExist(cam)) then
            DestroyCam(cam, false)
        end
        customCam = false
    cb('ok')
end)

RegisterNUICallback('togglecursor', function(data, cb)
    CustomCamera("torso")
    SetNuiFocus(false, false)
    FreezePedCameraRotation(player, false)
	TriggerEvent('skinchanger:getSkin', function(skin)
		TriggerServerEvent('esx_skin:save', skin)
	end)	
    cb('ok')
end)

RegisterNUICallback('rotate', function(data, cb)
    if (data["key"] == "left") then
        rotation(20)
    else
        rotation(-20)
    end
    cb('ok')
end)

RegisterNUICallback('switchcam', function(data, cb)
    CustomCamera(data['name'])
    cb('ok')
end)

RegisterNUICallback('toggleclothes', function(data, cb)
    ToggleProps(data)
    cb('ok')
end)


--------------------------------------------------------------------
-- Main menu

function OpenMenu(name)
    player = GetPlayerPed(-1)
    oldPed = GetCurrentPed()
    local isAllowed = false
    if(oldPed.model == 1885233650 or oldPed.model == -1667301416) then isAllowed = true end
    if((oldPed.model ~= 1885233650 or oldPed.model ~= -1667301416) and (name == "clothesmenu")) then isAllowed = true end
    if isAllowed then
        FreezePedCameraRotation(player, true)
        RefreshUI()
        EnableGUI(true, name)
    else
        ESX.ShowNotification("You are not welcome here!");
    end
end

function Save(save)
    if save then
        data = GetCurrentPed()
        TriggerServerEvent("agrio_clothes:insert_character_current", data)
        if data.model == `mp_f_freemode_01` or data.model == `mp_m_freemode_01` then
            TriggerServerEvent("agrio_clothes:insert_character_face", data)
            TriggerServerEvent("agrio_clothes:set_tats", currentTats)
        end
    else
        LoadPed(oldPed)
    end
    CustomCamera('torso')
end

function IsNearShop(shops)
    local dstchecked = 1000
    local plyPos = GetEntityCoords(GetPlayerPed(PlayerId()), false)
	for i = 1, #shops do
		shop = shops[i]
		local comparedst = Vdist(plyPos.x, plyPos.y, plyPos.z,shop.x, shop.y, shop.z)
		if comparedst < dstchecked then
			dstchecked = comparedst
		end

		if comparedst < 2.0 then
           -- DrawMarker(27,shop[1], shop[2], shop[3], 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 1.7001, 0, 55, 240, 20, 0, 0, 0, 0)
            DrawScriptMarker({
                ["type"] = 6,
                ["pos"] = vector3(shop.x, shop.y, shop.z + 0.05),
                ["r"] = 255,
                ["g"] = 255,
                ["b"] = 255,
                ["sizeX"] = 2.0,
                ["sizeY"] = 2.0,
                ["sizeZ"] = 2.0,
              })  
		end
	end
	return dstchecked
end

DrawScriptMarker = function(markerData)
	--DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0, markerData["sizeX"] or 1.0, markerData["sizeY"] or 1.0, markerData["sizeZ"] or 1.0, markerData["r"] or 1.0, markerData["g"] or 1.0, markerData["b"] or 1.0, 100, markerData["bob"] and true or false, true, 2, false, false, false, false)
    DrawText3D(markerData["pos"].x,markerData["pos"].y,markerData["pos"].z+0.9,'~w~[~r~E~w~]~w~  - Abrir Tienda')
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
        local nearcloth = IsNearShop(clothingShops)

        local menu = nil

        if nearcloth < 2.0 then

            if (not enabled) then

                if IsControlJustPressed(1, 38) then
                    --pArmor = GetPedArmour(PlayerPedId())
                    OpenMenu("clothesmenu")
                end
            else
                if (IsControlJustReleased(1, 25)) then
                    SetNuiFocus(true, true)
                    FreezePedCameraRotation(player, true)
                end
                InvalidateIdleCam()
            end
        else
            local dist = math.min(nearcloth)
            if dist > 10 then
                Citizen.Wait(math.ceil(dist * 10))
            end
		end
	end
end)

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x,y,z)
    if onScreen then
        local factor = #text / 350
        SetTextScale(0.45, 0.45)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        --DrawRect(_x, _y + 0.0120, 0.006 + factor, 0.024, 0, 0, 0, 155)
    end
end

--- RSKIN ---
RegisterNetEvent('resetskin:resetSkin')
AddEventHandler('resetskin:resetSkin', function()
    
    local uniforms = {
  
          male = {
              ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
              ['torso_1'] = 260,   ['torso_2'] = 23,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 11,
              ['pants_1'] = 26,   ['pants_2'] = 6,
              ['shoes_1'] = 1,   ['shoes_2'] = 0,
              ['chain_1'] = 0,  ['chain_2'] = 0
          },
          female = {
              ['tshirt_1'] = 14,   ['tshirt_2'] = 0,
              ['torso_1'] = 269,    ['torso_2'] = 23,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 9,
              ['pants_1'] = 0,   ['pants_2'] = 8,
              ['shoes_1'] = 1,    ['shoes_2'] = 1,
              ['chain_1'] = 0,    ['chain_2'] = 0
          }

    }
    local playerPed = PlayerPedId()
    local lastHealth = GetEntityHealth(playerPed) 
    local defaultModel = GetHashKey('a_m_y_stbla_02')
    SetEntityVisible(PlayerPedId(), false)
    RequestModel(defaultModel)
    while not HasModelLoaded(defaultModel) do
        Citizen.Wait(100)
    end
    SetPlayerModel(PlayerId(), defaultModel)
    
    
    SetPedDefaultComponentVariation(PlayerPedId())
    SetPedRandomComponentVariation(PlayerPedId(), true)
    SetModelAsNoLongerNeeded(defaultModel)
    FreezeEntityPosition(PlayerPedId(), false)
 
    Citizen.Wait(300)

    TriggerEvent('skinchanger:getSkin', function(skin)
        skin['sex'] = changeSex(skin['sex']) --cambiamos sexo
        TriggerEvent('skinchanger:loadSkin', skin)
        Citizen.Wait(300)
        skin['sex'] = changeSex(skin['sex'])
        TriggerEvent('skinchanger:loadSkin', skin)
        ESX.ShowNotification('~g~Skin recargada')
    end)
    Citizen.Wait(1000)
    TriggerEvent('skinchanger:getSkin', function(skin)
  
        if skin.sex == 0 then
            if uniforms.male ~= nil then
                TriggerEvent('skinchanger:loadClothes', skin, uniforms.male)
            else
                ESX.ShowNotification('~r~Error')
            end
        else
            if uniforms.female ~= nil then
                TriggerEvent('skinchanger:loadClothes', skin, uniforms.female)
            else
                ESX.ShowNotification('~r~Error')
            end
        end
    end)
    Citizen.Wait(300)

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    SetEntityHealth(PlayerPedId(), lastHealth)
    SetEntityVisible(PlayerPedId(), true)
    ClearPedTasksImmediately(PlayerPedId())

    -- REMOVE ALL WEAPONS OF FIVEM IN CLIENT
  --  RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_DAGGER")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_BAT")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_BOTTLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_CROWBAR")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_FLASHLIGHT")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_GOLFCLUB")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HAMMER")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_KNUCKLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_KNIFE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MACHETE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SWITCHBLADE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_NIGHTSTICK")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_WRENCH")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_WRENCH")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_BATTLEAXE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_POOLCUE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_STONE_HATCHET")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_APPISTOL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_STUNGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL50")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SNSPISTOL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SNSPISTOL_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_VINTAGEPISTOL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_FLAREGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_RAYPISTOL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_CERAMICPISTOL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_NAVYREVOLVER")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_GADGETPISTOL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MICROSMG")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SMG")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SMG_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPDW")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MACHINEPISTOL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MINISMG")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_RAYCARBINE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_PUMPSHOTGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_PUMPSHOTGUN_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SAWNOFFSHOTGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSHOTGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_BULLPUPSHOTGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MUSKET")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYSHOTGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_DBSHOTGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_AUTOSHOTGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_COMBATSHOTGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_COMPACTRIFLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MILITARYRIFLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MG")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_COMBATMG")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_COMBATMG_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_GUSENBERG")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SNIPERRIFLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYSNIPER")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYSNIPER_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MARKSMANRIFLE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MARKSMANRIFLE_MK2")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_RPG")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_GRENADELAUNCHER")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_GRENADELAUNCHER_SMOKE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MINIGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_FIREWORK")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_RAILGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HOMINGLAUNCHER")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_COMPACTLAUNCHER")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_RAYMINIGUN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_GRENADE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_BZGAS")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_MOLOTOV")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_STICKYBOMB")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_PROXMINE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SNOWBALL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_PIPEBOMB")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_BALL")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_SMOKEGRENADE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_FLARE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HAZARDCAN")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_FIREEXTINGUISHER")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("GADGET_PARACHUTE")) RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_PETROLCAN"))

  --  TriggerEvent('esx_tattooshop:cleanPlayer')

    -- RELOAD GUNS
  --  TriggerServerEvent('esfer-rskin:recargararmas', source)


    
end)

function changeSex(sex)
    if sex == 0 then sex = 1 else sex = 0 end
    return sex
end


local cooldownRSKIN = false
local CurrentTimeRSKIN = 0

RegisterCommand('rskin', function(source, args, rawCommand)
	if cooldownRSKIN == false then
		if not IsPedDeadOrDying(GetPlayerPed(-1), 1) then
			TriggerEvent('resetskin:resetSkin')
		else
			ESX.ShowNotification('No puedes hacer rskin si estas muerto')
		end
		cooldownRSKIN = true
        cooldownOn()
	else
		ESX.ShowNotification('Tiene que esperar '..tostring(60-CurrentTimeRSKIN)..' segundos más para poder usar este comando de nuevo')
	end

end, false)

function cooldownOn()
    CurrentTimeRSKIN = 0
    while cooldownRSKIN == true do
        Wait(1000)
        CurrentTimeRSKIN = CurrentTimeRSKIN + 1
        if CurrentTimeRSKIN >= 60 then
            cooldownRSKIN = false
        end
    end

end
