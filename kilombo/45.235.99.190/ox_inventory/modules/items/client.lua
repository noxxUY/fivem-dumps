if not lib then return end

local Items = require 'modules.items.shared' --[[@as table<string, OxClientItem>]]

local function displayMetadata(metadata, value)
	local data = metadata
	if type(metadata) == 'string' and value then data = { [metadata] = value } end
	SendNUIMessage({
		action = 'displayMetadata',
		data = data
	})
end
exports('displayMetadata', displayMetadata)

local function GetItem(item)
	if item then
		item = string.lower(item)
		if item:sub(0, 7) == 'weapon_' then item = string.upper(item) end
		return Items[item]
	end
	return Items
end

local function Item(name, cb)
	local item = Items[name]
	if item then
		if not item.client?.export and not item.client?.event then
			item.effect = cb
		end
	end
end

local ox_inventory = exports[shared.resource]
-----------------------------------------------------------------------------------------------
-- Clientside item use functions
-----------------------------------------------------------------------------------------------

Item('silenciador', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			local currentWeaponHash = GetSelectedPedWeapon(cache.ped)

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info')
					
				 TriggerServerEvent("homer:SacoSilenciador")

		   elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				   
				 TriggerServerEvent("homer:SacoSilenciador")

		   elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				 
				 TriggerServerEvent("homer:SacoSilenciador")

		   elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
					
				 TriggerServerEvent("homer:SacoSilenciador")

		   elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				   
				 TriggerServerEvent("homer:SacoSilenciador")

		   elseif currentWeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				   
				   TriggerServerEvent("homer:SacoSilenciador")
		   elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
					
					TriggerServerEvent("homer:SacoSilenciador")
		   elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				 
				 TriggerServerEvent("homer:SacoSilenciador")
		   elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				 
				 TriggerServerEvent("homer:SacoSilenciador")
		   elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				 
				 TriggerServerEvent("homer:SacoSilenciador")	  		
		   elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				 
				 TriggerServerEvent("homer:SacoSilenciador")	
		   elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				 
				 TriggerServerEvent("homer:SacoSilenciador")
		   elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				 
				 TriggerServerEvent("homer:SacoSilenciador")
		   elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con un silenciador. Tendrás que volver a equiparlo cada vez que regreses a la ciudad', 3500, 'info') 
				 
				 TriggerServerEvent("homer:SacoSilenciador")
		   else 
			   exports['okokNotify']:Alert("SERVIDOR", 'Esta arma no soporta un silenciador', 3500, 'error')
		 end
		end
	end)
end)

Item('grip', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			local currentWeaponHash = GetSelectedPedWeapon(cache.ped)

			if currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
					GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
					exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una empuñadura. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
					TriggerServerEvent("homer:SacoGrip")
			elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
					GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
					exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una empuñadura. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
					TriggerServerEvent("homer:SacoGrip")
			elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
					GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
					exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una empuñadura. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info') 
					TriggerServerEvent("homer:SacoGrip")
			elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
					GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
					exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una empuñadura. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info') 
					TriggerServerEvent("homer:SacoGrip")
			elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
					GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
					exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una empuñadura. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info') 
					TriggerServerEvent("homer:SacoGrip")
			else 
				exports['okokNotify']:Alert("SERVIDOR", 'Esta arma no soporta una empuñadura', 3500, 'error')
			end

		end
	end)
end)

Item('linterna', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			local currentWeaponHash = GetSelectedPedWeapon(cache.ped)

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
			  exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
				exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')	
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")	
			elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")	  		
			elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna") 		
			elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
				  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")	
			elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')	
			  TriggerServerEvent("homer:SacoLinterna")	  		
			elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna") 		 
			elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
			  TriggerServerEvent("homer:SacoLinterna")
			elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
				 GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
				 exports['okokNotify']:Alert("SERVIDOR", 'Acabas de equiparte con una linterna. Tendrás que volver a equiparla cada vez que regreses a la ciudad', 3500, 'info')
		  		TriggerServerEvent("homer:SacoLinterna")
			else 
				exports['okokNotify']:Alert("SERVIDOR", 'Esta arma no soporta una linterna', 3500, 'error')
		  end

		end
	end)
end)

Item('bandage', function(data, slot)
	local maxHealth = GetEntityMaxHealth(cache.ped)
	local health = GetEntityHealth(cache.ped)
	ox_inventory:useItem(data, function(data)
		if data then
			SetEntityHealth(cache.ped, math.min(maxHealth, math.floor(health + maxHealth / 16)))
			exports['okokNotify']:Alert("SERVIDOR", 'Te curaste las heridas superficiales', 4500, 'success')
		end
	end)
end)

Item('medikit', function(data, slot)
	local maxHealth = GetEntityMaxHealth(cache.ped)
	local health = GetEntityHealth(cache.ped)
	ox_inventory:useItem(data, function(data)
		if data then
			SetEntityHealth(cache.ped, maxHealth)
			exports['okokNotify']:Alert("SERVIDOR", 'Te curaste todas las heridas del cuerpo', 4500, 'success')
		end
	end)
end)

Item('armor', function(data, slot)
	if GetPedArmour(cache.ped) < 100 then
		ox_inventory:useItem(data, function(data)
			if data then
				SetPedArmour(PlayerPedId(), 0)
				ClearPedBloodDamage(PlayerPedId())
				ResetPedVisibleDamage(PlayerPedId())
				ClearPedLastWeaponDamage(PlayerPedId())
				ResetPedMovementClipset(PlayerPedId(), 0)
				
				TriggerServerEvent('homer_chalecoremove')
				TriggerEvent('skinchanger:getSkin', function(skin)
				
					  if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 1,  ['bproof_2'] = 1})
						SetPedArmour(PlayerPedId(), 100)
					  else
						TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 1,  ['bproof_2'] = 1})
						SetPedArmour(PlayerPedId(), 100)
					  end
				
					end)
				exports['okokNotify']:Alert("SERVIDOR", 'Te equipaste un chaleco reforzado', 3500, 'success')
			end
		end)
	else
		exports['okokNotify']:Alert("SERVIDOR", 'Ya tenes un chaleco puesto', 3500, 'info')
	end
end)

client.parachute = false
Item('parachute', function(data, slot)
	if not client.parachute then
		ox_inventory:useItem(data, function(data)
			if data then
				local chute = `GADGET_PARACHUTE`
				SetPlayerParachuteTintIndex(PlayerData.id, -1)
				GiveWeaponToPed(cache.ped, chute, 0, true, false)
				SetPedGadget(cache.ped, chute, true)
				lib.requestModel(1269906701)
				client.parachute = CreateParachuteBagObject(cache.ped, true, true)
				if slot.metadata.type then
					SetPlayerParachuteTintIndex(PlayerData.id, slot.metadata.type)
				end
			end
		end)
	end
end)

Item('phone', function(data, slot)
	local success, result = pcall(function()
		return exports.npwd:isPhoneVisible()
	end)

	if success then
		exports.npwd:setPhoneVisible(not result)
	end
end)

Item('clothing', function(data, slot)
	local metadata = slot.metadata

	if not metadata.drawable then return print('Clothing is missing drawable in metadata') end
	if not metadata.texture then return print('Clothing is missing texture in metadata') end

	if metadata.prop then
		if not SetPedPreloadPropData(cache.ped, metadata.prop, metadata.drawable, metadata.texture) then
			return print('Clothing has invalid prop for this ped')
		end
	elseif metadata.component then
		if not IsPedComponentVariationValid(cache.ped, metadata.component, metadata.drawable, metadata.texture) then
			return print('Clothing has invalid component for this ped')
		end
	else
		return print('Clothing is missing prop/component id in metadata')
	end

	ox_inventory:useItem(data, function(data)
		if data then
			metadata = data.metadata

			if metadata.prop then
				local prop = GetPedPropIndex(cache.ped, metadata.prop)
				local texture = GetPedPropTextureIndex(cache.ped, metadata.prop)

				if metadata.drawable == prop and metadata.texture == texture then
					return ClearPedProp(cache.ped, metadata.prop)
				end

				-- { prop = 0, drawable = 2, texture = 1 } = grey beanie
				SetPedPropIndex(cache.ped, metadata.prop, metadata.drawable, metadata.texture, false);
			elseif metadata.component then
				local drawable = GetPedDrawableVariation(cache.ped, metadata.component)
				local texture = GetPedTextureVariation(cache.ped, metadata.component)

				if metadata.drawable == drawable and metadata.texture == texture then
					return -- item matches (setup defaults so we can strip?)
				end

				-- { component = 4, drawable = 4, texture = 1 } = jeans w/ belt
				SetPedComponentVariation(cache.ped, metadata.component, metadata.drawable, metadata.texture, 0);
			end
		end
	end)
end)

-----------------------------------------------------------------------------------------------

exports('Items', GetItem)
exports('ItemList', GetItem)

return Items
