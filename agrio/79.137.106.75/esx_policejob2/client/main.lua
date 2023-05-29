local PlayerData, CurrentActionData, handcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, IsHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerData = ESX.GetPlayerData()
end)

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end
RegisterNetEvent('snowiRefreshJob')
AddEventHandler('snowiRefreshJob', function(job)
	print('Refresco trabajo C . Info->'..json.encode(job))
trabajo = job.name
end)
function setUniform(job, playerPed) 
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		else
			if Config.Uniforms[job].female then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		end
	end)
end

function OpenCloakroomMenu()
	PlayerData = ESX.GetPlayerData()
	local elements = {
	  {label = _U('citizen_wear'), value = 'citizen_wear'},
	}
  
	ESX.UI.Menu.CloseAll()
  
	if Config.EnableNonFreemodePeds then
		if PlayerData.job.grade_name == 'sgc' then
			table.insert(elements, {label = 'Ropa Seguridad Civil', value = 'seguridadCivil'})
			table.insert(elements, {label = 'Ropa Seguridad Civil 2', value = 'seguridadCivil2'})
			table.insert(elements, {label = '-= Añadir Accesorios =-'})
			table.insert(elements, {label = 'Añadir armadura [Obligatorio ponerse chaleco]', value = 'anadirArmadura'})
			table.insert(elements, {label = 'Quitar chaleco', value = 'quitarchaleco'})
		else
	    table.insert(elements, {label = 'Uniforme desnudo', value = 'desnudo'})
		table.insert(elements, {label = '-= Seguridad Ciudadana Policia Nacional =-'})
		table.insert(elements, {label = 'Uniforme mujer', value = 'chica'})
		table.insert(elements, {label = 'Incógnita mujer', value = 'chicaincog'})
	    table.insert(elements, {label = 'Uniformidad Base', value = 'cnp_segciudadanabase'})
	    table.insert(elements, {label = 'Camiseta 1', value = 'cnp_segciudadacamiseta1'})
	    table.insert(elements, {label = 'Camiseta 2', value = 'cnp_segciudadacamiseta2'})
	    table.insert(elements, {label = '-= Grupo Especial Operaciones =-'})
	    table.insert(elements, {label = 'Mono GEO', value = 'geobase'})
	    table.insert(elements, {label = 'Boina GEO', value = 'geoboina'})
	    table.insert(elements, {label = 'Chaleco GEO', value = 'geobasechaleco'})
	    table.insert(elements, {label = 'Casco GEO', value = 'geocasco'})
	    table.insert(elements, {label = '-= Unidad Intervención Policial =-'})
	    table.insert(elements, {label = 'Uniforme', value = 'uip'})
	    table.insert(elements, {label = 'Quitar chaleco', value = 'quitarchaleco'})
	    table.insert(elements, {label = 'Quitar pasamontañas', value = 'quitardecal'})
	    table.insert(elements, {label = 'Quitar casco lateral', value = 'quitarpasamontanas'})
	    table.insert(elements, {label = '-= Añadir Accesorios =-'})
	    table.insert(elements, {label = 'Añadir armadura [Obligatorio ponerse chaleco]', value = 'anadirArmadura'})
	    table.insert(elements, {label = 'Añadir chaleco 1', value = 'armadura1'})
	    table.insert(elements, {label = 'Añadir chaleco 2', value = 'armadura2'})
	    table.insert(elements, {label = 'Poner pasamontañas 1', value = 'pasamontanas1'})   
	    table.insert(elements, {label = 'Poner pasamontañas 2', value = 'pasamontanas2'})
	    table.insert(elements, {label = 'Cinturón 1', value = 'cinturon1'})
	    table.insert(elements, {label = 'Cinturón 2', value = 'cinturon2'})
	    table.insert(elements, {label = 'Cinturón 3', value = 'cinturon3'})
	    table.insert(elements, {label = 'Arma en cinturon', value = 'arma1'})
	    table.insert(elements, {label = 'Arma en rodilla', value = 'arma2'})
	    table.insert(elements, {label = '-= Quitar Accesorios =-'})
	    table.insert(elements, {label = 'Quitar pasamontañas', value = 'quitarpasamontanas'})
	    table.insert(elements, {label = 'Quitar chaleco', value = 'quitarchaleco'})
	    table.insert(elements, {label = 'Quitar cinturón', value = 'quitarcinturon'})
	    table.insert(elements, {label = 'Quitar arma', value = 'quitararma'})
		end
		table.insert(elements, {label = 'Quitar gorra / casco', value = 'quitarcasco'})
		if PlayerData.job.grade_name == 'bope' then
			table.insert(elements, {label = 'Uniforme de B.O.P.E', value = 'bope'})
			table.insert(elements, {label = 'Uniforme de B.O.P.E. CHICA', value = 'bopec'})
		end
		
		
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
		  title    = _U('cloakroom'),
		  align    = 'bottom-right',
		  elements = elements,
		  },
  
		  function(data, menu)
  
		--menu.close()
  
		if data.current.value == 'citizen_wear' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			local model = nil
  
			if skin.sex == 0 then
			  model = GetHashKey("mp_m_freemode_01")
			else
			  model = GetHashKey("mp_f_freemode_01")
			end
  
			RequestModel(model)
			while not HasModelLoaded(model) do
			  RequestModel(model)
			  Citizen.Wait(1)
			end
  
			SetPlayerModel(PlayerId(), model)
			SetModelAsNoLongerNeeded(model)
  
			TriggerEvent('skinchanger:loadSkin', skin)
			TriggerEvent('esx:restoreLoadout')
		  end)
		end
		
  
		if data.current.value == 'skin' then
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
			if skin.sex == 0 then
			  TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[data.current.id].male)
			else
			  TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[data.current.id].female)
			end
  
		  end)
  
		end
		--Desnudo
	    if data.current.value == 'desnudo' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 57)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	            TriggerEvent('skinchanger:change', 'torso_1', 91)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 15)
	            TriggerEvent('skinchanger:change', 'pants_1', 61)
	            TriggerEvent('skinchanger:change', 'pants_2', 3)
	            TriggerEvent('skinchanger:change', 'shoes_1', 34)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 0)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', -1)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	            TriggerEvent('skinchanger:change', 'mask_1', 0)
	            TriggerEvent('skinchanger:change', 'mask_2', 0)
	            TriggerEvent('skinchanger:change', 'bags_1', 0)
	            TriggerEvent('skinchanger:change', 'bags_2', 0)
	            TriggerEvent('skinchanger:change', 'glasses_1', 0)
	            TriggerEvent('skinchanger:change', 'glasses_2', 0)
	            TriggerEvent('skinchanger:change', 'bproof_1', 0)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	            TriggerEvent('skinchanger:change', 'decals_1', 0)
	            TriggerEvent('skinchanger:change', 'decals_2', 0)
	          else
				TriggerEvent('skinchanger:change', 'tshirt_1', 10)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	            TriggerEvent('skinchanger:change', 'torso_1', 15)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 15)
	            TriggerEvent('skinchanger:change', 'pants_1', 107)
	            TriggerEvent('skinchanger:change', 'pants_2', 0)
	            TriggerEvent('skinchanger:change', 'shoes_1', 35)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 0)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', -1)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	            TriggerEvent('skinchanger:change', 'mask_1', 0)
	            TriggerEvent('skinchanger:change', 'mask_2', 0)
	            TriggerEvent('skinchanger:change', 'bags_1', 0)
	            TriggerEvent('skinchanger:change', 'bags_2', 0)
	            TriggerEvent('skinchanger:change', 'glasses_1', 5)
	            TriggerEvent('skinchanger:change', 'glasses_2', 0)
	            TriggerEvent('skinchanger:change', 'bproof_1', 0)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	            TriggerEvent('skinchanger:change', 'decals_1', 0)
	            TriggerEvent('skinchanger:change', 'decals_2', 0)
	          end

	        end)
		  end

		  if data.current.value == 'chica' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 1 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 35)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	            TriggerEvent('skinchanger:change', 'torso_1', 48)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 14)
	            TriggerEvent('skinchanger:change', 'pants_1', 34)
	            TriggerEvent('skinchanger:change', 'pants_2', 0)
	            TriggerEvent('skinchanger:change', 'shoes_1', 25)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 0)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', 45)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	            TriggerEvent('skinchanger:change', 'mask_1', 0)
	            TriggerEvent('skinchanger:change', 'mask_2', 0)
	            TriggerEvent('skinchanger:change', 'bags_1', 0)
	            TriggerEvent('skinchanger:change', 'bags_2', 0)
	            TriggerEvent('skinchanger:change', 'glasses_1', 11)
	            TriggerEvent('skinchanger:change', 'glasses_2', 0)
	            TriggerEvent('skinchanger:change', 'bproof_1', 0)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	            TriggerEvent('skinchanger:change', 'decals_1', 0)
	            TriggerEvent('skinchanger:change', 'decals_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
		  end

		  if data.current.value == 'chicaincog' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 1 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 160)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	            TriggerEvent('skinchanger:change', 'torso_1', 46)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 14)
	            TriggerEvent('skinchanger:change', 'pants_1', 77)
	            TriggerEvent('skinchanger:change', 'pants_2', 0)
	            TriggerEvent('skinchanger:change', 'shoes_1', 25)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 1)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', 112)
	            TriggerEvent('skinchanger:change', 'helmet_2', 1)
	            TriggerEvent('skinchanger:change', 'mask_1', 0)
	            TriggerEvent('skinchanger:change', 'mask_2', 0)
	            TriggerEvent('skinchanger:change', 'bags_1', 0)
	            TriggerEvent('skinchanger:change', 'bags_2', 0)
	            TriggerEvent('skinchanger:change', 'glasses_1', 11)
	            TriggerEvent('skinchanger:change', 'glasses_2', 0)
	            TriggerEvent('skinchanger:change', 'bproof_1', 0)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	            TriggerEvent('skinchanger:change', 'decals_1', 0)
	            TriggerEvent('skinchanger:change', 'decals_2', 0)
	          else
	            ESX.ShowNotification('No eres una chica para usar este uniforme!')
	          end

	        end)
		  end

		  if data.current.value == 'bope' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 0)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	            TriggerEvent('skinchanger:change', 'torso_1', 49)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 31)
	            TriggerEvent('skinchanger:change', 'pants_1', 31)
	            TriggerEvent('skinchanger:change', 'pants_2', 0)
	            TriggerEvent('skinchanger:change', 'shoes_1', 24)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 0)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', -1)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	            TriggerEvent('skinchanger:change', 'mask_1', 28)
	            TriggerEvent('skinchanger:change', 'mask_2', 0)
	            TriggerEvent('skinchanger:change', 'bags_1', 0)
	            TriggerEvent('skinchanger:change', 'bags_2', 0)
	            TriggerEvent('skinchanger:change', 'glasses_1', 0)
	            TriggerEvent('skinchanger:change', 'glasses_2', 0)
	            TriggerEvent('skinchanger:change', 'bproof_1', 23)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	            TriggerEvent('skinchanger:change', 'decals_1', 0)
	            TriggerEvent('skinchanger:change', 'decals_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
		  end

		  if data.current.value == 'bopec' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 1 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 159)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	            TriggerEvent('skinchanger:change', 'torso_1', 103)
	            TriggerEvent('skinchanger:change', 'torso_2', 3)
	            TriggerEvent('skinchanger:change', 'arms', 21)
	            TriggerEvent('skinchanger:change', 'pants_1', 30)
	            TriggerEvent('skinchanger:change', 'pants_2', 0)
	            TriggerEvent('skinchanger:change', 'shoes_1', 24)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 0)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', -1)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	            TriggerEvent('skinchanger:change', 'mask_1', 28)
	            TriggerEvent('skinchanger:change', 'mask_2', 0)
	            TriggerEvent('skinchanger:change', 'bags_1', 0)
	            TriggerEvent('skinchanger:change', 'bags_2', 0)
	            TriggerEvent('skinchanger:change', 'glasses_1', 0)
	            TriggerEvent('skinchanger:change', 'glasses_2', 0)
	            TriggerEvent('skinchanger:change', 'bproof_1', 8)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	            TriggerEvent('skinchanger:change', 'decals_1', 0)
	            TriggerEvent('skinchanger:change', 'decals_2', 0)
	          else
	            ESX.ShowNotification('No eres una chica pedazo de nenaza!!')
	          end

	        end)
		  end
		  
	      --Pasamontañas
	      if data.current.value == 'pasamontanas1' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'mask_1', 35)
	          else
	            TriggerEvent('skinchanger:change', 'mask_1', 35)
	          end

	        end)
	      end
	      if data.current.value == 'pasamontanas2' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'mask_1', 57)
	          else
	            TriggerEvent('skinchanger:change', 'mask_1', 57)
	          end

	        end)
	      end
	      if data.current.value == 'quitarpasamontanas' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'mask_1', 0)
	          else
	            TriggerEvent('skinchanger:change', 'mask_1', 0)
	          end

	        end)
	      end
	      --Fin de pasamontañas
	      if data.current.value == 'quitarcasco' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'helmet_1', -1)
	          else
	            TriggerEvent('skinchanger:change', 'mask_1', 0)
	          end

	        end)
	      end
	      if data.current.value == 'chaleco1' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'bproof_1', 20)
	            TriggerEvent('skinchanger:change', 'bproof_2', 6)
	            TriggerEvent('skinchanger:change', 'chain_1', 116)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'bproof_1', 20)
	            TriggerEvent('skinchanger:change', 'bproof_2', 6)
	            TriggerEvent('skinchanger:change', 'tshirt_1', 132)
	          end

	        end)
	      end
	     if data.current.value == 'chaleco2' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'bproof_1', 20)
	            TriggerEvent('skinchanger:change', 'bproof_2', 7)
	            TriggerEvent('skinchanger:change', 'chain_1', 116)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'bproof_1', 20)
	            TriggerEvent('skinchanger:change', 'bproof_2', 7)
	            TriggerEvent('skinchanger:change', 'tshirt_1', 132)
	          end

	        end)
	      end
	     if data.current.value == 'chaleco3' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'bproof_1', 20)
	            TriggerEvent('skinchanger:change', 'bproof_2', 8)
	            TriggerEvent('skinchanger:change', 'chain_1', 116)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'bproof_1', 20)
	            TriggerEvent('skinchanger:change', 'bproof_2', 8)
	            TriggerEvent('skinchanger:change', 'tshirt_1', 132)
	          end

	        end)
	      end
	      if data.current.value == 'chaleco4' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'bproof_1', 17)
	            TriggerEvent('skinchanger:change', 'bproof_2', 1)
	            TriggerEvent('skinchanger:change', 'chain_1', 116)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'bproof_1', 17)
	            TriggerEvent('skinchanger:change', 'bproof_2', 1)
	          end

	        end)
	      end
	      if data.current.value == 'chaleco5' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'bproof_1', 20)
	            TriggerEvent('skinchanger:change', 'bproof_2', 9)
	          else
	            TriggerEvent('skinchanger:change', 'bproof_1', 17)
	            TriggerEvent('skinchanger:change', 'bproof_2', 1)
	          end

	        end)
	      end
	      if data.current.value == 'quitarchaleco' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'bproof_1', 0)
	          else
	            TriggerEvent('skinchanger:change', 'bproof_1', 0)
	          end
	          SetPedArmour(GetPlayerPed(-1), 0)
	        end)
	      end
	      if data.current.value == 'quitarcinturon' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 57)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 57)
	          end

	        end)
	      end
	      if data.current.value == 'quitararma' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'chain_1', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 57)
	          end

	        end)
	      end
	      if data.current.value == 'quitardecal' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'decals_1', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 57)
	          end

	        end)
	      end
	      if data.current.value == 'ponermascaragas' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'glasses_1', 26)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'cinturon1' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 133)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'cinturon2' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 134)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'cinturon3' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 135)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'arma1' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'chain_1', 117)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'arma2' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'chain_1', 116)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'gc_segciudadanabase' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 38)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'tshirt_1', 135)
	            TriggerEvent('skinchanger:change', 'arms', 0)
	            TriggerEvent('skinchanger:change', 'pants_1', 84)
	            TriggerEvent('skinchanger:change', 'pants_2', 2)
	            TriggerEvent('skinchanger:change', 'shoes_1', 51)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 117)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', 84)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'torso_1', 89)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'tshirt_1', 152)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 14)
	            TriggerEvent('skinchanger:change', 'pants_1', 51)
	            TriggerEvent('skinchanger:change', 'pants_2', 0)
	            TriggerEvent('skinchanger:change', 'shoes_1', 74)
	            TriggerEvent('skinchanger:change', 'shoes_2', 24)
	            TriggerEvent('skinchanger:change', 'chain_1', 0)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', -1)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	            TriggerEvent('skinchanger:change', 'mask_1', -1)
	            TriggerEvent('skinchanger:change', 'mask_2', 0)
	            TriggerEvent('skinchanger:change', 'bags_1', 0)
	            TriggerEvent('skinchanger:change', 'bags_2', 0)
	            TriggerEvent('skinchanger:change', 'glasses_1', 5)
	            TriggerEvent('skinchanger:change', 'glasses_2', 0)
	            TriggerEvent('skinchanger:change', 'bproof_1', 0)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	          end

	        end)
	      end
	      if data.current.value == 'cnp_segciudadanabase' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 37)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'tshirt_1', 135)
	            TriggerEvent('skinchanger:change', 'arms', 4)
	            TriggerEvent('skinchanger:change', 'pants_1', 84)
	            TriggerEvent('skinchanger:change', 'pants_2', 7)
	            TriggerEvent('skinchanger:change', 'shoes_1', 51)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 117)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', 84)
	            TriggerEvent('skinchanger:change', 'helmet_2', 1)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 57)
	          end

	        end)
	      end
	      if data.current.value == 'gc_chubasquero' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 40)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'tshirt_1', 136)
	            TriggerEvent('skinchanger:change', 'arms', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 0)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'gc_segciudadacamiseta1' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 38)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'gc_segciudadacamiseta2' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 34)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 11)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'cnp_segciudadacamiseta1' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 37)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 4)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'cnp_segciudadacamiseta2' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 39)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'gc_segciudadapantalones1' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'pants_1', 84)
	            TriggerEvent('skinchanger:change', 'pants_2', 2)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'gc_segciudadapantalones2' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'pants_1', 84)
	            TriggerEvent('skinchanger:change', 'pants_2', 3)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'traficocamiseta1' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 38)
	            TriggerEvent('skinchanger:change', 'torso_2', 1)
	            TriggerEvent('skinchanger:change', 'arms', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'traficocamiseta2' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 34)
	            TriggerEvent('skinchanger:change', 'torso_2', 1)
	            TriggerEvent('skinchanger:change', 'arms', 11)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'cascotrafico' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'helmet_1', 86)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'traficobase' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 38)
	            TriggerEvent('skinchanger:change', 'torso_2', 1)
	            TriggerEvent('skinchanger:change', 'tshirt_1', 135)
	            TriggerEvent('skinchanger:change', 'pants_1', 84)
	            TriggerEvent('skinchanger:change', 'pants_2', 4)
	            TriggerEvent('skinchanger:change', 'shoes_1', 51)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 117)
	            TriggerEvent('skinchanger:change', 'chain_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', 84)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'geobase' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'torso_1', 44)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'pants_1', 25)
	            TriggerEvent('skinchanger:change', 'pants_2', 0)
	            TriggerEvent('skinchanger:change', 'shoes_1', 25)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'bproof_1', 0)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 4)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'uip' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 133)
	            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	            TriggerEvent('skinchanger:change', 'torso_1', 39)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'decals_1', 11)
	            TriggerEvent('skinchanger:change', 'decals_2', 1)
	            TriggerEvent('skinchanger:change', 'arms', 0)
	            TriggerEvent('skinchanger:change', 'pants_1', 84)
	            TriggerEvent('skinchanger:change', 'pants_2', 7)
	            TriggerEvent('skinchanger:change', 'shoes_1', 61)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', 84)
	            TriggerEvent('skinchanger:change', 'helmet_2', 1)
	            TriggerEvent('skinchanger:change', 'mask_1', 50)
	            TriggerEvent('skinchanger:change', 'mask_2', 0)
	            TriggerEvent('skinchanger:change', 'bags_1', 0)
	            TriggerEvent('skinchanger:change', 'bags_2', 0)
	            TriggerEvent('skinchanger:change', 'glasses_1', 0)
	            TriggerEvent('skinchanger:change', 'glasses_2', 0)
	            TriggerEvent('skinchanger:change', 'bproof_1', 22)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'geobasechaleco' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'bproof_1', 19)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'geocasco' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'helmet_1', 88)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'geoboina' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'helmet_1', 89)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'traficoanorak' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'tshirt_1', 55)
	            TriggerEvent('skinchanger:change', 'arms', 0)
	            TriggerEvent('skinchanger:change', 'torso_1', 94)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 117)
	            TriggerEvent('skinchanger:change', 'pants_1', 15)
	            TriggerEvent('skinchanger:change', 'pants_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
		  if data.current.value == 'seguridadCivil' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            
				TriggerEvent('skinchanger:change', 'tshirt_1', 55)
				TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 52)
	            TriggerEvent('skinchanger:change', 'torso_1', 94)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'chain_1', 117)
	            TriggerEvent('skinchanger:change', 'pants_1', 15)
	            TriggerEvent('skinchanger:change', 'pants_2', 3)
				TriggerEvent('skinchanger:change', 'shoes_1', 31)
	            TriggerEvent('skinchanger:change', 'shoes_2', 4)
	            TriggerEvent('skinchanger:change', 'helmet_1', 86)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 35)
				TriggerEvent('skinchanger:change', 'tshirt_2', 0)
	            TriggerEvent('skinchanger:change', 'arms', 70)
	            TriggerEvent('skinchanger:change', 'torso_1', 250)
	            TriggerEvent('skinchanger:change', 'torso_2', 1)
	            TriggerEvent('skinchanger:change', 'chain_1', 117)
	            TriggerEvent('skinchanger:change', 'pants_1', 25)
	            TriggerEvent('skinchanger:change', 'pants_2', 6)
				TriggerEvent('skinchanger:change', 'shoes_1', 32)
	            TriggerEvent('skinchanger:change', 'shoes_2', 4)
	            TriggerEvent('skinchanger:change', 'helmet_1', 84)
	            TriggerEvent('skinchanger:change', 'helmet_2', 0)
	          end

	        end)
	      end
		  if data.current.value == 'seguridadCivil2' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            
				TriggerEvent('skinchanger:change', 'tshirt_1', 131)
				TriggerEvent('skinchanger:change', 'tshirt_2', 11)
	            TriggerEvent('skinchanger:change', 'arms', 14)
	            TriggerEvent('skinchanger:change', 'torso_1', 219)
	            TriggerEvent('skinchanger:change', 'torso_2', 1)
	            TriggerEvent('skinchanger:change', 'pants_1', 31)
	            TriggerEvent('skinchanger:change', 'pants_2', 1)
				TriggerEvent('skinchanger:change', 'shoes_1', 24)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', 9)
	            TriggerEvent('skinchanger:change', 'helmet_2', 7)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 161)
				TriggerEvent('skinchanger:change', 'tshirt_2', 11)
	            TriggerEvent('skinchanger:change', 'arms', 14)
	            TriggerEvent('skinchanger:change', 'torso_1', 343)
	            TriggerEvent('skinchanger:change', 'torso_2', 0)
	            TriggerEvent('skinchanger:change', 'pants_1', 30)
	            TriggerEvent('skinchanger:change', 'pants_2', 1)
				TriggerEvent('skinchanger:change', 'shoes_1', 25)
	            TriggerEvent('skinchanger:change', 'shoes_2', 0)
	            TriggerEvent('skinchanger:change', 'helmet_1', 9)
	            TriggerEvent('skinchanger:change', 'helmet_2', 7)
	          end

	        end)
	      end
	      if data.current.value == 'quitarmascaragas' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'glasses_1', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end

	      if data.current.value == 'armadura1' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'bproof_1', 18)
	            TriggerEvent('skinchanger:change', 'bproof_2', 0)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end

	      if data.current.value == 'armadura2' then
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	          if skin.sex == 0 then
	            TriggerEvent('skinchanger:change', 'bproof_1', 18)
	            TriggerEvent('skinchanger:change', 'bproof_2', 1)
	          else
	            TriggerEvent('skinchanger:change', 'tshirt_1', 26)
	          end

	        end)
	      end
	      if data.current.value == 'anadirArmadura' then
	          SetPedArmour(GetPlayerPed(-1), 100)
	      end
	    end,
	  
  
	  function(data, menu)
  
		menu.close()
  
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	  end
	)
  
  end
  

function OpenArmoryMenu(station)
	local elements = {
		{label = _U('buy_weapons'), value = 'buy_weapons'},
		{label = _U('buy_items'), value = 'buy_items'}
	}

	if Config.EnableArmoryManagement then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('put_weapon'),     value = 'put_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
		table.insert(elements, {label = _U('deposit_object'), value = 'put_stock'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
		title    = _U('armory'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'get_weapon' then
			OpenGetWeaponMenu()
		elseif data.current.value == 'put_weapon' then
			OpenPutWeaponMenu()
		elseif data.current.value == 'buy_weapons' then
			OpenBuyWeaponsMenu()
		elseif data.current.value == 'buy_items' then
			OpenBuyItemsMenu()
		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	end)
end

function OpenVehicleSpawnerMenu(type, station, part, partNum)
	local playerCoords = GetEntityCoords(PlayerPedId())
	PlayerData = ESX.GetPlayerData()
	local elements = {
		{label = _U('garage_storeditem'), action = 'garage'},
		{label = _U('garage_storeitem'), action = 'store_garage'},
		{label='Garaje personal', action = 'personal'},
		{label = 'Guardar vehiculo personal', action = 'guardar'},
		{label = _U('garage_buyitem'), action = 'buy_vehicle'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle', {
		title    = _U('garage_title'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.action == 'buy_vehicle' then
			local shopElements, shopCoords = {}

			if type == 'car' then
				shopCoords = Config.PoliceStations[station].Vehicles[partNum].InsideShop
				local authorizedVehicles = Config.AuthorizedVehicles[PlayerData.job.grade_name]

				if #Config.AuthorizedVehicles.Shared > 0 and PlayerData.job.grade_name ~= 'sgc' then
					for k,vehicle in ipairs(Config.AuthorizedVehicles.Shared) do
						table.insert(shopElements, {
							label = ('%s - <span style="color:green;">%s</span>'):format(vehicle.label, _U('shop_item', ESX.Math.GroupDigits(vehicle.price))),
							name  = vehicle.label,
							model = vehicle.model,
							price = vehicle.price,
							type  = 'car'
						})
					end
				end

				if #authorizedVehicles > 0 then
					for k,vehicle in ipairs(authorizedVehicles) do
						table.insert(shopElements, {
							label = ('%s - <span style="color:green;">%s</span>'):format(vehicle.label, _U('shop_item', ESX.Math.GroupDigits(vehicle.price))),
							name  = vehicle.label,
							model = vehicle.model,
							price = vehicle.price,
							type  = 'car'
						})
					end
				else
					if #Config.AuthorizedVehicles.Shared == 0 then
						return
					end
				end
			elseif type == 'helicopter' then
				shopCoords = Config.PoliceStations[station].Helicopters[partNum].InsideShop
				local authorizedHelicopters = Config.AuthorizedHelicopters[PlayerData.job.grade_name]

				if #authorizedHelicopters > 0 then
					for k,vehicle in ipairs(authorizedHelicopters) do
						table.insert(shopElements, {
							label = ('%s - <span style="color:green;">%s</span>'):format(vehicle.label, _U('shop_item', ESX.Math.GroupDigits(vehicle.price))),
							name  = vehicle.label,
							model = vehicle.model,
							price = vehicle.price,
							livery = vehicle.livery or nil,
							type  = 'helicopter'
						})
					end
				else
					ESX.ShowNotification(_U('helicopter_notauthorized'))
					return
				end
			end

			OpenShopMenu(shopElements, playerCoords, shopCoords)
		elseif data.current.action == 'personal' then
			--TriggerEvent('snowigaragePriv', 'car_garage_point')
			TriggerEvent('snowiSyncJobGaraje', '')
		elseif data.current.action == 'guardar' then
			TriggerEvent('snowiSyncStoreVeh', 'Snowi Es un crack?')
		elseif data.current.action == 'garage' then
			local garage = {}

			ESX.TriggerServerCallback('esx_vehicleshop:retrieveJobVehicles', function(jobVehicles)
				if #jobVehicles > 0 then
					for k,v in ipairs(jobVehicles) do
						local props = json.decode(v.vehicle)
						local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(props.model))
						local label = ('%s - <span style="color:darkgoldenrod;">%s</span>: '):format(vehicleName, props.plate)

						if v.stored then
							label = label .. ('<span style="color:green;">%s</span>'):format(_U('garage_stored'))
						else
							label = label .. ('<span style="color:darkred;">%s</span>'):format(_U('garage_notstored'))
						end

						table.insert(garage, {
							label = label,
							stored = v.stored,
							model = props.model,
							vehicleProps = props
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_garage', {
						title    = _U('garage_title'),
						align    = 'bottom-right',
						elements = garage
					}, function(data2, menu2)
						if data2.current.stored then
							local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint(station, part, partNum)

							if foundSpawn then
								menu2.close()

								ESX.Game.SpawnVehicle(data2.current.model, spawnPoint.coords, spawnPoint.heading, function(vehicle)
									ESX.Game.SetVehicleProperties(vehicle, data2.current.vehicleProps)

									TriggerServerEvent('esx_vehicleshop:setJobVehicleState', data2.current.vehicleProps.plate, false)
									ESX.ShowNotification(_U('garage_released'))
								end)
							end
						else
							ESX.ShowNotification(_U('garage_notavailable'))
						end
					end, function(data2, menu2)
						menu2.close()
					end)
				else
					ESX.ShowNotification(_U('garage_empty'))
				end
			end, type)
		elseif data.current.action == 'store_garage' then
			StoreNearbyVehicle(playerCoords)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function StoreNearbyVehicle(playerCoords)
	local vehicles, vehiclePlates = ESX.Game.GetVehiclesInArea(playerCoords, 30.0), {}

	if #vehicles > 0 then
		for k,v in ipairs(vehicles) do

			-- Make sure the vehicle we're saving is empty, or else it wont be deleted
			if GetVehicleNumberOfPassengers(v) == 0 and IsVehicleSeatFree(v, -1) then
				table.insert(vehiclePlates, {
					vehicle = v,
					plate = ESX.Math.Trim(GetVehicleNumberPlateText(v))
				})
			end
		end
	else
		ESX.ShowNotification(_U('garage_store_nearby'))
		return
	end

	ESX.TriggerServerCallback('esx_policejob:storeNearbyVehicle', function(storeSuccess, foundNum)
		if storeSuccess then
			local vehicleId = vehiclePlates[foundNum]
			local attempts = 0
			ESX.Game.DeleteVehicle(vehicleId.vehicle)
			IsBusy = true

			Citizen.CreateThread(function()
				BeginTextCommandBusyString('STRING')
				AddTextComponentSubstringPlayerName(_U('garage_storing'))
				EndTextCommandBusyString(4)

				while IsBusy do
					Citizen.Wait(100)
				end

				RemoveLoadingPrompt()
			end)

			-- Workaround for vehicle not deleting when other players are near it.
			while DoesEntityExist(vehicleId.vehicle) do
				Citizen.Wait(500)
				attempts = attempts + 1

				-- Give up
				if attempts > 30 then
					break
				end

				vehicles = ESX.Game.GetVehiclesInArea(playerCoords, 30.0)
				if #vehicles > 0 then
					for k,v in ipairs(vehicles) do
						if ESX.Math.Trim(GetVehicleNumberPlateText(v)) == vehicleId.plate then
							ESX.Game.DeleteVehicle(v)
							break
						end
					end
				end
			end

			IsBusy = false
			ESX.ShowNotification(_U('garage_has_stored'))
		else
			ESX.ShowNotification(_U('garage_has_notstored'))
		end
	end, vehiclePlates)
end

function GetAvailableVehicleSpawnPoint(station, part, partNum)
	local spawnPoints = Config.PoliceStations[station][part][partNum].SpawnPoints
	local found, foundSpawnPoint = false, nil

	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i].coords, spawnPoints[i].radius) then
			found, foundSpawnPoint = true, spawnPoints[i]
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		ESX.ShowNotification(_U('vehicle_blocked'))
		return false
	end
end

function OpenShopMenu(elements, restoreCoords, shopCoords)
	local playerPed = PlayerPedId()
	isInShopMenu = true

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop', {
		title    = _U('vehicleshop_title'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop_confirm', {
			title    = _U('vehicleshop_confirm', data.current.name, data.current.price),
			align    = 'bottom-right',
			elements = {
				{label = _U('confirm_no'), value = 'no'},
				{label = _U('confirm_yes'), value = 'yes'}
		}}, function(data2, menu2)
			if data2.current.value == 'yes' then
				--ESX.UI.Menu.CloseAll()
				--isInShopMenu = false
					---	ESX.UI.Menu.CloseAll()
					--	DeleteSpawnedVehicles()
					--	FreezeEntityPosition(playerPed, false)
					--	SetEntityVisible(playerPed, true)

						--ESX.Game.Teleport(playerPed, restoreCoords)
						local longitud = 9


longitud = longitud - 6
local a=0
local b=0
local c=0
local d=nil
local list = {1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}

local function generatesnowi()
    for i=1,10,1 do
        a=math.random(1,10000)
        
        b=math.random(1,10000)
        
        c=math.random(1,10000)
    end
    math.randomseed(a*b-c+a-b*math.random(1,10000)-a)
end

generatesnowi()
d = list[math.random(1,82)]

for i=1,longitud -1,1 do
    --print(d)
    d = d .. list[math.random(1,82)]
end
print("----MATRICULA GENERADA-----")
print(d)
				local newPlate = 'CNP '..d
				local vehicle  = GetVehiclePedIsIn(playerPed, false)
				local props    = ESX.Game.GetVehicleProperties(vehicle)
				props.plate    = newPlate

				ESX.TriggerServerCallback('esx_policejob:buyJobVehicle', function (bought)
					if bought then
						ESX.ShowNotification(_U('vehicleshop_bought', data.current.name, ESX.Math.GroupDigits(data.current.price)))
						ESX.UI.Menu.CloseAll()
						isInShopMenu = false
						
						DeleteSpawnedVehicles()
						FreezeEntityPosition(playerPed, false)
						SetEntityVisible(playerPed, true)

						ESX.Game.Teleport(playerPed, restoreCoords)
					else
						ESX.ShowNotification('No tienes suficiente dinero')
						menu2.close()
					end
				end, props, data.current.type)
			else
				menu2.close()
			end
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		isInShopMenu = false
		ESX.UI.Menu.CloseAll()

		DeleteSpawnedVehicles()
		FreezeEntityPosition(playerPed, false)
		SetEntityVisible(playerPed, true)

		ESX.Game.Teleport(playerPed, restoreCoords)
	end, function(data, menu)
		DeleteSpawnedVehicles()
		WaitForVehicleToLoad(data.current.model)

		ESX.Game.SpawnLocalVehicle(data.current.model, shopCoords, 0.0, function(vehicle)
			table.insert(spawnedVehicles, vehicle)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			FreezeEntityPosition(vehicle, true)
			SetModelAsNoLongerNeeded(data.current.model)

			if data.current.livery then
				SetVehicleModKit(vehicle, 0)
				SetVehicleLivery(vehicle, data.current.livery)
			end
		end)
	end)

	WaitForVehicleToLoad(elements[1].model)
	ESX.Game.SpawnLocalVehicle(elements[1].model, shopCoords, 0.0, function(vehicle)
		table.insert(spawnedVehicles, vehicle)
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		FreezeEntityPosition(vehicle, true)
		SetModelAsNoLongerNeeded(elements[1].model)

		if elements[1].livery then
			SetVehicleModKit(vehicle, 0)
			SetVehicleLivery(vehicle, elements[1].livery)
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if isInShopMenu then
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		else
			Citizen.Wait(500)
		end
	end
end)

function DeleteSpawnedVehicles()
	while #spawnedVehicles > 0 do
		local vehicle = spawnedVehicles[1]
		ESX.Game.DeleteVehicle(vehicle)
		table.remove(spawnedVehicles, 1)
	end
end

function WaitForVehicleToLoad(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		BeginTextCommandBusyString('STRING')
		AddTextComponentSubstringPlayerName(_U('vehicleshop_awaiting_model'))
		EndTextCommandBusyString(4)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)
			DisableAllControlActions(0)
		end

		RemoveLoadingPrompt()
	end
end

function OpenPoliceActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions', {
		title    = 'Police',
		align    = 'bottom-right',
		elements = {
			{label = _U('citizen_interaction'), value = 'citizen_interaction'},
			{label = _U('vehicle_interaction'), value = 'vehicle_interaction'},
			{label = _U('object_spawner'), value = 'object_spawner'},
			{label = 'Obtener acceso a frecuencia CNP & SHERIFF [112 & 114]', value = 'radiofrec'},
	}}, function(data, menu)
		if data.current.value == 'citizen_interaction' then
			local elements = {
				{label = _U('id_card'), value = 'identity_card'},
				{label = _U('search'), value = 'body_search'},
				{label = _U('Porte'), value = 'porte'},
				{label = _U('handcuff'), value = 'handcuff'},
				{label = _U('uncuff'), value = 'uncuff'},
				{label = 'Poner vestimenta de preso', value = 'bilick'},
				{label = 'Ponerle su vestimenta', value = 'bilick2'},
				{label = _U('drag'), value = 'drag'},
				{label = _U('put_in_vehicle'), value = 'put_in_vehicle'},
				{label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
				{label = _U('fine'), value = 'fine'},
				{label = _U('jail'), value = 'jail'},
				{label = _U('unpaid_bills'), value = 'unpaid_bills'},
				--{label = "Servicios comunitarios",	value = 'communityservice'}
			}

			if Config.EnableLicenses then
				table.insert(elements, { label = _U('license_check'), value = 'license' })
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('citizen_interaction'),
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value

					if action == 'identity_card' then
						OpenIdentityCardMenu(closestPlayer)
					elseif action == 'bilick' then
						TriggerServerEvent(' hug 7237 as',GetPlayerServerId(closestPlayer) )
					elseif action == 'bilick2' then
						TriggerServerEvent(' hug 7237 as2',GetPlayerServerId(closestPlayer) )
					elseif action == 'body_search' then
						TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), _U('being_searched'))
						OpenBodySearchMenu(closestPlayer)
					elseif action == 'handcuff' then
						local target, distance = ESX.Game.GetClosestPlayer()
						playerheading = GetEntityHeading(GetPlayerPed(-1))
						playerlocation = GetEntityForwardVector(PlayerPedId())
						playerCoords = GetEntityCoords(GetPlayerPed(-1))
						local target_id = GetPlayerServerId(target)
						if distance <= 2.0 then
							--Si veis esto, ni lo intenteis jajaja.
							TriggerServerEvent('esx_policejob:requestarrest', target_id, playerheading, playerCoords, playerlocation)
						else
							ESX.ShowNotification('Not Close Enough to Cuff.')
						end
					elseif action == 'uncuff' then
						local target, distance = ESX.Game.GetClosestPlayer()
						playerheading = GetEntityHeading(GetPlayerPed(-1))
						playerlocation = GetEntityForwardVector(PlayerPedId())
						playerCoords = GetEntityCoords(GetPlayerPed(-1))
						local target_id = GetPlayerServerId(target)
						if distance <= 2.0 then
							--Y este tampoco, que n osoy tan tooonto
							TriggerServerEvent('esx_policejob:requestrelease', target_id, playerheading, playerCoords, playerlocation)
						else
							ESX.ShowNotification('Not Close Enough to Uncuff.')
						end	
					elseif action == 'porte' then
						--Bueno en veradd no intenteis nada de aqui, ya es muy viejo. Traerme cosas nuevas :( peqeños hackercillos
						TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), _U('being_porte'))
						Openporteadd(closestPlayer)	
					elseif action == 'drag' then
						TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
					elseif action == 'put_in_vehicle' then
						TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'out_the_vehicle' then
						TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'fine' then
						OpenFineMenu(closestPlayer)
				    elseif action == 'jail' then
						JailPlayer(GetPlayerServerId(closestPlayer))
					elseif action == 'license' then
						ShowPlayerLicense(closestPlayer)
					elseif action == 'unpaid_bills' then
						OpenUnpaidBillsMenu(closestPlayer)
					elseif action == 'communityservice' then
						SendToCommunityService(GetPlayerServerId(closestPlayer))
					end
				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'vehicle_interaction' then
			local elements  = {}
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()

			if DoesEntityExist(vehicle) then
				table.insert(elements, {label = _U('vehicle_info'), value = 'vehicle_infos'})
				table.insert(elements, {label = _U('pick_lock'), value = 'hijack_vehicle'})
				table.insert(elements, {label = _U('impound'), value = 'impound'})
			end

			table.insert(elements, {label = _U('search_database'), value = 'search_database'})

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
				title    = _U('vehicle_interaction'),
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				local coords  = GetEntityCoords(playerPed)
				vehicle = ESX.Game.GetVehicleInDirection()
				action  = data2.current.value

				if action == 'search_database' then
					LookupVehicle()
				elseif DoesEntityExist(vehicle) then
					if action == 'vehicle_infos' then
						local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
						OpenVehicleInfosMenu(vehicleData)
					elseif action == 'hijack_vehicle' then
						if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
							TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
							Citizen.Wait(20000)
							ClearPedTasksImmediately(playerPed)

							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ESX.ShowNotification(_U('vehicle_unlocked'))
						end
					elseif action == 'impound' then
						-- is the script busy?
						if currentTask.busy then
							return
						end

						ESX.ShowFloatingHelpNotification(_U('impound_prompt'))
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

						currentTask.busy = true
						currentTask.task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							ImpoundVehicle(vehicle)
							Citizen.Wait(100) -- sleep the entire script to let stuff sink back to reality
						end)

						-- keep track of that vehicle!
						Citizen.CreateThread(function()
							while currentTask.busy do
								Citizen.Wait(1000)

								vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
								if not DoesEntityExist(vehicle) and currentTask.busy then
									ESX.ShowNotification(_U('impound_canceled_moved'))
									ESX.ClearTimeout(currentTask.task)
									ClearPedTasks(playerPed)
									currentTask.busy = false
									break
								end
							end
						end)
					end
				else
					ESX.ShowNotification(_U('no_vehicles_nearby'))
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'object_spawner' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('traffic_interaction'),
				align    = 'bottom-right',
				elements = {
					{label = _U('cone'), model = 'prop_roadcone02a'},
					{label = _U('barrier'), model = 'prop_barrier_work05'},
					{label = _U('spikestrips'), model = 'p_ld_stinger_s'},
					{label = _U('box'), model = 'prop_boxpile_07d'},
					{label = 'Frenos', model = 'stt_prop_track_slowdown'}
			}}, function(data2, menu2)
				local playerPed = PlayerPedId()
				local coords    = GetEntityCoords(playerPed)
				local forward   = GetEntityForwardVector(playerPed)
				local x, y, z   = table.unpack(coords + forward * 1.0)

				if data2.current.model == 'prop_roadcone02a' then
					z = z - 1.0
				end

				ESX.Game.SpawnObject(data2.current.model, {x = x, y = y, z = z}, function(obj)
					SetEntityHeading(obj, GetEntityHeading(playerPed))
					PlaceObjectOnGroundProperly(obj)
					TriggerServerEvent('snowiSyncLogBad', {obj=obj, model=data2.current.model})
					table.insert(objetosborrar, {objeto = obj})
				end)
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'radiofrec' then
			exports["rp-radioja"]:GivePlayerAccessToFrequencies(112)
			exports["rp-radioja"]:GivePlayerAccessToFrequencies(114)
			exports["rp-radioja"]:GivePlayerAccessToFrequencies(20)
			ESX.ShowNotification('Concedido el acceso de radio de CNP & SHERIFF & EMS [112 & 114 & 20]')
		end
	end, function(data, menu)
		menu.close()
	end)
end
objetosborrar = {}
RegisterNetEvent('clearPoliceObject', function() 
for i, j in pairs(objetosborrar) do
 if j.objeto then
	print('Borrado objeto '..j.objeto)
	DeleteEntity(j.objeto)
	DeleteObject(j.objeto)
 end
end
end)
function JailPlayer(player)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_menu', {
		title = _U('jail_menu_info'),
	}, function (data2, menu)
		local jailTime = tonumber(data2.value)
		if jailTime == nil then
			ESX.ShowNotification('invalid number!')
		else
			TriggerServerEvent("esx_jailer:senFsddToJail132", player, jailTime * 60, GetPlayerServerId(PlayerId()), 'open')
			menu.close()
		end
	end, function (data2, menu)
		menu.close()
	end)
end

function SendToCommunityService(player)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Community Service Menu', {
		title = "Community Service Menu",
	}, function (data2, menu)
		local community_services_count = tonumber(data2.value)
		
		if community_services_count == nil then
			ESX.ShowNotification('Invalid services count.')
		else
			TriggerServerEvent("esx_communityservice:sendToCommunityService", player, community_services_count)
			menu.close()
		end
	end, function (data2, menu)
		menu.close()
	end)
end

function OpenIdentityCardMenu(player)
	local player, distance = ESX.Game.GetClosestPlayer()
			  
		if distance ~= -1 and distance <= 3.0 then
		  exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/787236825977847828/pOq3Mqksqxehyv0b0n_8I-z-ATCpi4f0zbHXEsgyohFIsvNcLBlqlqOyM2z5Z3sXoWfT', 'files[]', function(data)
			local resp = json.decode(data)
			TriggerEvent('chat:addMessage', { template = "", args = { "^8Has tomado el DNI de ^2[ "..GetPlayerName(player).." ^2] ^5(Nombre OOC)^8, se cargó a la nube con ^2éxito^8!" } })
		end)
		  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
		  TriggerServerEvent(
					  "snowilogdni:sendToDiscord",
					  "­LOGS DNI POLICIA",
					  "**\n ** [ " ..GetPlayerName(PlayerId()).." ] Le cogio el dni con menu de [ POLICIA ] a [ "..GetPlayerName(player).." ]",
					  16711680
				  )
				end
  end
  local j = 0
  RegisterCommand('animS', function(source, args)
    local grupo = args[1]
    local tipo = args[2]
    if grupo and tipo then
    print('Si valido')
    RequestAnimDict(grupo)
        while not HasAnimDictLoaded(grupo) do
          Wait(100)
    print('Animacion cargando')
	j = j+1
	if j >= 15 then
		j = 0
		break
	end
        end
    TaskPlayAnim(GetPlayerPed(-1), grupo, tipo, 8.0, -8, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(1000)
    else
    print('No valido')
    end end)

function OpenBodySearchMenu(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local elements = {}
		local blackMoney = 0
print(json.encode(data.accounts))
		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 20000 then
				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end
		end

		table.insert(elements, {label = _U('guns_label')})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label')})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
			title    = _U('search'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				TriggerServerEvent('esx_policejob:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
				OpenBodySearchMenu(player)
			end
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenFineMenu(player)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine', {
		title    = _U('fine'),
		align    = 'bottom-right',
		elements = {
			{label = _U('traffic_offense'), value = 0},
			{label = _U('minor_offense'),   value = 1},
			{label = _U('average_offense'), value = 2},
			{label = _U('major_offense'),   value = 3}
	}}, function(data, menu)
		OpenFineCategoryMenu(player, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

function Openporteadd(player)
	local elements = {}
	local _player = player

    ESX.ShowNotification('Has entregado una licencia de armas')
	TriggerServerEvent('esx_license:addLicense', GetPlayerServerId(player), 'weapon',cb, function ()
	LoadLicenses(_player)
	end)
end

function OpenFineCategoryMenu(player, category)
	ESX.TriggerServerCallback('esx_policejob:getFineList', function(fines)
		local elements = {}

		for k,fine in ipairs(fines) do
			table.insert(elements, {
				label     = ('%s <span style="color:green;">%s</span>'):format(fine.label, _U('armory_item', ESX.Math.GroupDigits(fine.amount))),
				value     = fine.id,
				amount    = fine.amount,
				fineLabel = fine.label
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine_category', {
			title    = _U('fine'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			if Config.EnablePlayerManagement then
				TriggerServerEvent('esx_billing:senhfgdBill132', GetPlayerServerId(player), 'society_police', _U('fine_total', data.current.fineLabel), data.current.amount)
			else
				TriggerServerEvent('esx_billing:senhfgdBill132', GetPlayerServerId(player), '', _U('fine_total', data.current.fineLabel), data.current.amount)
			end

			ESX.SetTimeout(300, function()
				OpenFineCategoryMenu(player, category)
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, category)
end

function LookupVehicle()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_vehicle',
	{
		title = _U('search_database_title'),
	}, function(data, menu)
		local length = string.len(data.value)
		if data.value == nil or length < 2 or length > 13 then
			ESX.ShowNotification(_U('search_database_error_invalid'))
		else
			ESX.TriggerServerCallback('esx_policejob:getVehicleFromPlate', function(owner, found)
				if found then
					ESX.ShowNotification(_U('search_database_found', owner))
				else
					ESX.ShowNotification(_U('search_database_error_not_found'))
				end
			end, data.value)
			menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end
RegisterNetEvent('MeVistoSexy', function()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

		if skin.sex == 0 then
		  
		  TriggerEvent('skinchanger:change', 'tshirt_1', 15)
		  TriggerEvent('skinchanger:change', 'tshirt_2', 0)
		  TriggerEvent('skinchanger:change', 'arms', 15)
		  TriggerEvent('skinchanger:change', 'torso_1', 239)
		  TriggerEvent('skinchanger:change', 'torso_2', 0)
		  TriggerEvent('skinchanger:change', 'pants_1', 58)
		  TriggerEvent('skinchanger:change', 'pants_2', 0)
		  TriggerEvent('skinchanger:change', 'shoes_1', 6)
		  TriggerEvent('skinchanger:change', 'shoes_2', 0)
		  TriggerEvent('skinchanger:change', 'helmet_1', 2)
		  TriggerEvent('skinchanger:change', 'helmet_2', 0)
		else
		  TriggerEvent('skinchanger:change', 'tshirt_1', 14)
		  TriggerEvent('skinchanger:change', 'tshirt_2', 0)
		  TriggerEvent('skinchanger:change', 'arms', 15)
		  TriggerEvent('skinchanger:change', 'torso_1', 118)
		  TriggerEvent('skinchanger:change', 'torso_2', 0)
		  TriggerEvent('skinchanger:change', 'pants_1', 60)
		  TriggerEvent('skinchanger:change', 'pants_2', 0)
		  TriggerEvent('skinchanger:change', 'shoes_1', 4)
		  TriggerEvent('skinchanger:change', 'shoes_2', 0)
		  TriggerEvent('skinchanger:change', 'helmet_1', 5)
		  TriggerEvent('skinchanger:change', 'helmet_2', 0)
		end

	  end)
end)
RegisterNetEvent('MeVistoSexy2', function()
	
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

		TriggerEvent('skinchanger:loadSkin', skin)
		TriggerEvent('esx:restoreLoadout')
	  end)
end)
function ShowPlayerLicense(player)
	local elements, targetName = {}

	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		if data.licenses then
			for i=1, #data.licenses, 1 do
				if data.licenses[i].label and data.licenses[i].type then
					table.insert(elements, {
						label = data.licenses[i].label,
						type = data.licenses[i].type
					})
				end
			end
		end

		if Config.EnableESXIdentity then
			targetName = data.firstname .. ' ' .. data.lastname
		else
			targetName = data.name
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license', {
			title    = _U('license_revoke'),
			align    = 'bottom-right',
			elements = elements,
		}, function(data, menu)
			ESX.ShowNotification(_U('licence_you_revoked', data.current.label, targetName))
			TriggerServerEvent('esx_policejob:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))

			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.type)

			ESX.SetTimeout(300, function()
				ShowPlayerLicense(player)
			end)
		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))
end
RegisterNetEvent('staffGetBill', function(player) 
	OpenUnpaidBillsMenu(player)
end)
function OpenUnpaidBillsMenu(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_billing:getTargetBills', function(bills)
		for k,bill in ipairs(bills) do
			table.insert(elements, {
				label = ('%s - <span style="color:red;">%s</span>'):format(bill.label, _U('armory_item', ESX.Math.GroupDigits(bill.amount))),
				billId = bill.id
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
			title    = _U('unpaid_bills'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)

			TriggerServerEvent('snowiRemoveBill', GetPlayerServerId(player), data.current.billId)
			ESX.SetTimeout(300, function()
				OpenUnpaidBillsMenu(player)
			end)
		end, function(data,menu)
			 menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenVehicleInfosMenu(vehicleData)
	ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(retrivedInfo)
		local elements = {{label = _U('plate', retrivedInfo.plate)}}

		if retrivedInfo.owner == nil then
			table.insert(elements, {label = _U('owner_unknown')})
		else
			table.insert(elements, {label = _U('owner', retrivedInfo.owner)})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
			title    = _U('vehicle_info'),
			align    = 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, vehicleData.plate)
end

function OpenGetWeaponMenu()
	ESX.TriggerServerCallback('esx_policejob:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name),
					value = weapons[i].name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon', {
			title    = _U('get_weapon_menu'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('esx_policejob:removeArmoryWeapon', function()
				OpenGetWeaponMenu()
			end, data.current.value)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {
				label = weaponList[i].label,
				value = weaponList[i].name
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon', {
		title    = _U('put_weapon_menu'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		menu.close()

		ESX.TriggerServerCallback('esx_policejob:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value, true)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenBuyWeaponsMenu()
	local elements = {}
	local playerPed = PlayerPedId()
	PlayerData = ESX.GetPlayerData()

	for k,v in ipairs(Config.AuthorizedWeapons[PlayerData.job.grade_name]) do
		local weaponNum, weapon = ESX.GetWeapon(v.weapon)
		local components, label = {}
		local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

		if v.components then
			for i=1, #v.components do
				if v.components[i] then
					local component = weapon.components[i]
					local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

					if hasComponent then
						label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_owned'))
					else
						if v.components[i] > 0 then
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_item', ESX.Math.GroupDigits(v.components[i])))
						else
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_free'))
						end
					end

					table.insert(components, {
						label = label,
						componentLabel = component.label,
						hash = component.hash,
						name = component.name,
						price = v.components[i],
						hasComponent = hasComponent,
						componentNum = i
					})
				end
			end
		end

		if hasWeapon and v.components then
			label = ('%s: <span style="color:green;">></span>'):format(weapon.label)
		elseif hasWeapon and not v.components then
			label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_owned'))
		else
			if v.price > 0 then
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_item', ESX.Math.GroupDigits(v.price)))
			else
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_free'))
			end
		end

		table.insert(elements, {
			label = label,
			weaponLabel = weapon.label,
			name = weapon.name,
			components = components,
			price = v.price,
			hasWeapon = hasWeapon
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons', {
		title    = _U('armory_weapontitle'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.hasWeapon then
			if #data.current.components > 0 then
				OpenWeaponComponentShop(data.current.components, data.current.name, menu)
			end
		else
			ESX.TriggerServerCallback('esx_policejob:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.weaponLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, data.current.name, 1)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenBuyItemsMenu()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_items_buy',
		  {
			title    = '¿Que quieres?',
			align    = 'top-right',
			elements = {
				{label = 'Pan (5$)', value = 'water_1', item = 'bread', price = 5},
				{label = 'Agua (10$)', value = 'water_1', item = 'water', price = 10},
				{label = 'Localizador (150$)', value = 'water_1', item = 'gps', price = 150},
				{label = 'Silenciador (500$)', value = 'water_1', item = 'silent', price = 500},
				{label = 'Linterna (300$)', value = 'water_1', item = 'flashlight', price = 300},
				{label = 'Empuñadura (500$)', value = 'water_1', item = 'grip', price = 500},
				{label = 'Mira de alto alcalce (2000$)', value = 'water_1', item = 'scope', price = 2000},
				{label = 'Mira avanzada (2500$)', value = 'water_1', item = 'advanced_scope', price = 2500},
				{label = 'Mira avanzada (2500$)', value = 'water_1', item = 'advanced_scope', price = 2500},
	      }
		},
		function(data, menu)
			local item = data.current.item
			local price = data.current.price
			ESX.UI.Menu.CloseAll()
			TriggerServerEvent('esx_policejob:buyitem', item, price)
		end,
	function(data, menu)
		menu.close()
	end)
end

function OpenWeaponComponentShop(components, weaponName, parentShop)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons_components', {
		title    = _U('armory_componenttitle'),
		align    = 'bottom-right',
		elements = components
	}, function(data, menu)
		if data.current.hasComponent then
			ESX.ShowNotification(_U('armory_hascomponent'))
		else
			ESX.TriggerServerCallback('esx_policejob:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.componentLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					parentShop.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, weaponName, 2, data.current.componentNum)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_policejob:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. tostring(items[i].label),
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('police_stock'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:getStockItem', itemName, count)

					Citizen.Wait(1000)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:putStockItems', itemName, count)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
print('Actu job setjob info '..json.encode(job))
	Citizen.Wait(5000)
	TriggerServerEvent('esx_policejob:forceBlip')
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_police'),
		number     = 'police',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTVGcd/u3cfSXaTLEk2j80TCI8ECI9ABCyoiBqhBVQqVG2ppVKBQqUVgUl5OU7HKqNOHUHU0oHamZZWoGkVS6cWAR2JPJuAQBPy2ISEvLN57+v2u2E33e4k6Ngz85+9d++95/zP9/h/39GpqsqiRYsIGz8QZAq28/8PRfC+4HT4fMXFxeiH+GC54NeCbYLLATLpYe/ECx4VnBTsF0wWhM6lXY8VbBE0Ch4IzLcpfDFD2P1TgrdC7nMCZLRxQ9AkiAkQCn77DcH3BC2COoFRkCSIG2JzLwqiQi0RSmCD4JXbmNKh0+kc/X19tLtc9Ll9sk9ZS1yoU71YIk3xsbEx8QaDEc2ttxmaJSKC1ggSKBK8MKwTFQVXRzs3WzpJGjmZgvxcMpMtWIwqsjztvSrlzjYul56jp+46qSmJmMwR+P3+4aZ8TtCprRkk0DvUW7JjmV6lsqoKW/pU1q9YQOE4Nxkx4ladE7zd8ivuVmJQfXZKW5dx5EwPRw4fxNx2g5SUVLw+33AkzoRaQDP9SkFu6OKqz0uF8yaz7vsOL6ycQVLkcSg/BlWNsjuFoKE1knqDSl5aNnmPLmThrE0UvXqQqvJPyMrMGorEHwQfEha57/3P7mXS684GFjy8kreLppPUuBXfyd/ibeoS2kb0mWPANhJdYjb61AxUvx5PdT3+4y+Tb3mTd19ZSebE+VTXVGNQlHAC7w4VhH8TbA36vKq6ilnzlvPSunHw6Trc7XpZ14AyfgYeyz18crGN1Alz6e3qwNNQSv4dZox1h/BW9+O7eIaEsVv41Y4XeHJDG83Nl4mLTwzGhJYtx0PzNTjOB9KMTlc7Nkcem39YAGU7cbeBKVLMPGMVf296nMd2VbBq1wmizHoqqm/wrS1/Zf0+N19YN2PIu1fcIda4Vk66Zx/rVi+jo9eIX9wZGGcFXUMR6BHUa76/2ezioYcXMtpyAl91DSaTfDxlJbtLprHm2ecpObqPuTPzSNV9yKz4a4zJSuLo71/j8Q17ON69EmXiPIlNMe6FoyzOqWPW/MU03Lw5EFcyKghTrNDh7+/vw545mcJcWbTiGKpRdGPMXbx90sGmDaux6sXk+kimjU+BjnMkx3kYP34cXrFuZ+3nrHi6iDMt92JITcPjk3R3naRwZhpuNSqoD93DKaFVU7j2dhcF8+YzNlpErbIBTVh8toVccbaysPB+4pMcuPw25kwSsau7BIlmHpy3guaOPtISYyi/UkaJM5Lpc5agq5Xkcl6gIHkmqaMn0dtylcjIyPThCNyhaXyfR2W0I1our0v6qBii07ih5rDtGSOxNVdk1y4R2SR8jR/g7hQD9l1jUeY/WLJB5m39AlZN4GZyIQ1fFJNsEgt0duBIc5GRkcZF53mNwIzhXPDgQPoZIkiMkbTxtstDMVnmFA4cOsbz2/aKjSQjev4Mp9ZAg+hIpFhB3EH5Yal16+X+Kq3dGfxkzRY+KauBjBzREvGN0kNCTARu94AejBLMHorAQ7cEQMGs2cXvkWshYLDi6e9l728O8P1XW6hKeB2yv42q18tjj+iFTGoSi+X9jJM9RTxS9E+OHT0krhNiZqlbqraoT7RAU5bBGrEknEBhgJks7KXbLS8qERI0ErVqF/Y4K6NHZfLZB+/wzJvncacvFd91oXO3o/O40MfZKJOKu/rne+mRQByXM4lYreb1tUnkizVVA/0SpfpbWaCNBeEE5gb/UH19NLqEgDF+oNDQWcn41Cj0EXFEWqzkOIyYekslFkThsvMxpIyE2hIc6lXGZ6cPyK7Nnk5OipixRdxgUESAYmhq68VsGgy5CYKCUAJTg0+izApXne3CJFmUTwg4L3FProFxU+6krqmXu3MskkhSD2av41jLdzlnfFrSdCZxyqfMnppN6ZUa7pwt0h3fiK9DCt4IO9e7YqisvI7VYgmNv7mhBKKD/9psNi5dOMv5ZjukjsLdr0ffWsyTi6eSlfcA+dmiVyOXs+/sHNZu3M6PdxzgVO9GmDSHsSNqmTz/R6y6Xxqma4fwaS5Mn85n1ZE0Vl3CHBER3lUNEhiURpPJRFdTOcVnpUJnPIhR7cZXfoH5UYc5+E4RzRH3sfSnl9m2dSMjE+Tz9msse+o5dr7UwcQ5T3HwlWUkNuzG3dKFSTbsNs7m/Y8vExOlC29UWkMJlAxKoRQMR3IC7x85zOn6fHS50+U/2Untx2R1voinu5no+DQmz7yPXmMKZnsu0wrm0Oe3YhOVHdm8A09dBQYhTv4T7C+xUPrZh8Qn2MMr4qcDSRfoirWgKAvtgOpv1JI8Zi77X15G7L+fxeOUOiUFxZiULD5fSlNzNM62W+k1yq5gjajGX/ZHvOIyxd+Fkj+P092rWP/si0Qr7VisMaEWuCiYonXFwbAUTWWPYLV245NITnGkUXnpI9butLJn2y6iba+hlp7C09qBcvoN7FYL9mhxo1/y/LoEXK8Pv6qIC8WbBY/xr9YlPLf9dZT+OqKTUwfmDBm/GOw7ws4FWpuUP2gJEZvKqmocuXPZuWYJMzKuSsH+SNwh3bo0p6hao6HeEqwYEZ2M6aKWd3PwTCy7du/D0F1DsmzE6/WGLr5LsDF4LggnYBacCOboQLHQ3FFfR58SR+HCR1iQH8ukhA5s5o5AYZMwUqOp74nl8xvRHDlRTsnxYpJsUjtsceHt2C8Fm0MPJrphTkZvBc4It9RKLOFx91Pf0Igu0k7W2MmkOewS2QYJUJVWVz9VNbXUVVwkyuAmKTFJayrDo/4Jwe/CT0aGYTrWVYEeUfsgXssMRcpyenraQJa0VX9O3ZU+Ma1fax4xGxUsUVFkOUbcama1hf+7+LmA9juHWshwmwOE1iMmCFYEzg1jtIm1BaxW6wCGGoFdewPfvyE4ertTiv4rHC73B855dwp2a23bbd4tC1hvhOCbX7b4VyUQKhxrtSOaYKngasizvwi0RmOS4O1QZf2yYfiaR+73AvhTQEVf+rpn9/8IMAChKDrDzfsdIQAAAABJRU5ErkJggg=='
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
	if PlayerData.job and PlayerData.job.name == 'police' and PlayerData.job.name == dispatchNumber then
		-- if esx_service is enabled
		if Config.MaxInService ~= -1 and not playerInService then
			CancelEvent()
		end
	end
end)

AddEventHandler('esx_policejob:hasEnteredMarker', function(station, part, partNum)
	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	elseif part == 'Armory' then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	elseif part == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('garage_prompt')
		CurrentActionData = {station = station, part = part, partNum = partNum}
	elseif part == 'Helicopters' then
		CurrentAction     = 'Helicopters'
		CurrentActionMsg  = _U('helicopter_prompt')
		CurrentActionData = {station = station, part = part, partNum = partNum}
	elseif part == 'BossActions' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_policejob:hasExitedMarker', function(station, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

AddEventHandler('esx_policejob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'cni') and IsPedOnFoot(playerPed) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('remove_prop')
		CurrentActionData = {entity = entity}
	end

	if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle, i, true, 1000)
			end
		end
	end
end)

AddEventHandler('esx_policejob:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)

RegisterNetEvent('esx_policejob:handcuff132')
AddEventHandler('esx_policejob:handcuff132', function()
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if IsHandcuffed then

			

			if Config.EnableHandcuffTimer then
				if handcuffTimer.active then
					ESX.ClearTimeout(handcuffTimer.task)
				end

				StartHandcuffTimer()
			end
		else
			if Config.EnableHandcuffTimer and handcuffTimer.active then
				ESX.ClearTimeout(handcuffTimer.task)
			end

		
		end
	end)
end)

RegisterNetEvent('esx_policejob:unrestrain')
AddEventHandler('esx_policejob:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
--		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

RegisterNetEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(copId)
	if not IsHandcuffed then
		return
	end

	dragStatus.isDragged = not dragStatus.isDragged
	dragStatus.CopId = tonumber(copId)
end)

Citizen.CreateThread(function()
	local playerPed
	local targetPed

	while true do
		Citizen.Wait(1)

		if IsHandcuffed then
			playerPed = PlayerPedId()

			if dragStatus.isDragged then
				targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

				-- undrag if target is in an vehicle
				if not IsPedSittingInAnyVehicle(targetPed) then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				else
					dragStatus.isDragged = false
					DetachEntity(playerPed, true, false)
				end

				if IsPedDeadOrDying(targetPed, true) then
					dragStatus.isDragged = false
					DetachEntity(playerPed, true, false)
				end

			else
				DetachEntity(playerPed, true, false)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if not IsHandcuffed then
		return
	end

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	end
end)

RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

RegisterNetEvent('esx_policejob:getarrested')
AddEventHandler('esx_policejob:getarrested', function(playerheading, playercoords, playerlocation)
	playerPed = GetPlayerPed(-1)
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Citizen.Wait(3760)
	IsHandcuffed = true
	TriggerEvent('esx_policejob:handcuff')
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
end)

RegisterNetEvent('esx_policejob:doarrested')
AddEventHandler('esx_policejob:doarrested', function()
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)

end) 

RegisterNetEvent('esx_policejob:douncuffing')
AddEventHandler('esx_policejob:douncuffing', function()
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('esx_policejob:getuncuffed')
AddEventHandler('esx_policejob:getuncuffed', function(playerheading, playercoords, playerlocation)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	IsHandcuffed = false
	TriggerEvent('esx_policejob:handcuff')
	ClearPedTasks(GetPlayerPed(-1))
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if IsHandcuffed then
			--DisableControlAction(0, 1, true) -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			--DisableControlAction(0, 32, true) -- W
			--DisableControlAction(0, 34, true) -- A
			--DisableControlAction(0, 31, true) -- S
			--DisableControlAction(0, 30, true) -- D

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()

	for k,v in pairs(Config.PoliceStations) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(_U('map_blip'))
		EndTextCommandSetBlipName(blip)
	end

end)

-- Display markers
local thaahs= 2500
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(thaahs)

		if PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'cni') then
			--thaahs = 1500
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			local isInMarker, hasExited, letSleep = false, false, true
			local currentStation, currentPart, currentPartNum

			for k,v in pairs(Config.PoliceStations) do

				for i=1, #v.Cloakrooms, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Cloakrooms[i], true)

					if distance < Config.DrawDistance then
						DrawMarker(20, v.Cloakrooms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						thaahs = 1
						letSleep = false
					end

					if distance < Config.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Cloakroom', i
					end
				end

				for i=1, #v.Armories, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Armories[i], true)

					if distance < Config.DrawDistance then
						DrawMarker(21, v.Armories[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
						thaahs = 1
					end

					if distance < Config.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Armory', i
					end
				end

				for i=1, #v.Vehicles, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner, true)

					if distance < Config.DrawDistance then
						DrawMarker(36, v.Vehicles[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
						thaahs = 1
					end

					if distance < Config.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Vehicles', i
					end
				end

				for i=1, #v.Helicopters, 1 do
					local distance =  GetDistanceBetweenCoords(coords, v.Helicopters[i].Spawner, true)

					if distance < Config.DrawDistance then
						DrawMarker(34, v.Helicopters[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
						thaahs = 1
					end

					if distance < Config.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Helicopters', i
					end
				end

				
				if Config.EnablePlayerManagement and PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'cni' then
					for i=1, #v.BossActions, 1 do
						local distance = GetDistanceBetweenCoords(coords, v.BossActions[i], true)

						if distance < Config.DrawDistance then
							DrawMarker(42, v.BossActions[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, false, false, false)
							letSleep = false
							thaahs = 1
						end

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'BossActions', i
						end
					end
				end
			end

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastStation and LastPart and LastPartNum) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_policejob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

			if letSleep then
				thaahs = 1500
			end

		else
			thaahs = 4000
		end
	end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()
	Citizen.Wait(50)
	local trackedEntities = {
		'prop_roadcone02a',
		'prop_barrier_work05',
		'p_ld_stinger_s',
		'prop_boxpile_07d',
		'hei_prop_cash_crate_half_full'
	}

	local wait = 400
	while true do
Citizen.Wait(wait)
if trabajo == 'police' or trabajo == 'cni' then
wait = 400
local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(coords, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance  = GetDistanceBetweenCoords(coords, objCoords, true)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_policejob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity then
				TriggerEvent('esx_policejob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
else
wait = 2500
end

		
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	local wait = 0
	while true do
Citizen.Wait(wait)
if trabajo == 'police' or trabajo == 'cni' then
wait = 0
else
wait = 2500
end
		local duerme = false
if PlayerData.job and (PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'cni')  then
	duerme = true
end
		if CurrentAction then
			ESX.ShowFloatingHelpNotification(CurrentActionMsg)
			if IsControlJustReleased(0, 38) and PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'cni') then
print("preesed"..CurrentAction)
				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu()
				elseif CurrentAction == 'menu_armory' then
					if Config.MaxInService == -1 then
						OpenArmoryMenu(CurrentActionData.station)
					elseif playerInService then
						OpenArmoryMenu(CurrentActionData.station)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'menu_vehicle_spawner' then
					if Config.MaxInService == -1 then
						OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					elseif playerInService then
						OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'Helicopters' then
					if Config.MaxInService == -1 then
						OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					elseif playerInService then
						OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'delete_vehicle' then
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				elseif CurrentAction == 'menu_boss_actions' then
					local options = {
            wash      = Config.EnableMoneyWash,
          }
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
						menu.close()

						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, { wash = true }) -- disable washing money
				elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end

				CurrentAction = nil
			end
		else
			Citizen.Wait(2000)
		end -- CurrentAction end

		

		if IsControlJustReleased(0, 38) and currentTask.busy then
			ESX.ShowNotification(_U('impound_canceled'))
			ESX.ClearTimeout(currentTask.task)
			ClearPedTasks(PlayerPedId())

			currentTask.busy = false
		end
		if duerme == true then
			print("Duerme")
			Citizen.Wait(5000)
		end
	end
end)
Citizen.CreateThread(function()
local wait = 0
	while true do
Citizen.Wait(wait)
if trabajo == 'police' or trabajo == 'cni' then
wait = 0
if IsControlJustReleased(0, 167) and not isDead and PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'cni') and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') then
	print('Pulsa F8')
	if Config.MaxInService == -1 then
		OpenPoliceActionsMenu()
	elseif playerInService then
		OpenPoliceActionsMenu()
	else
		ESX.ShowNotification(_U('service_not'))
	end
end
else
wait = 2500
end

end end)
-- Create blip for colleagues
function createBlip(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)

		table.insert(blipsCops, blip) -- add blip to array so we can remove it later
	end
end
RegisterCommand('policeDes', function()
print(PlayerData.job.name)
print(isDead)
print(PlayerData.job)
print(ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions')) 
end)
--[[RegisterNetEvent('esx_policejob:updateBlip')
AddEventHandler('esx_policejob:updateBlip', function()

	-- Refresh all blips
	for k, existingBlip in pairs(blipsCops) do
		RemoveBlip(existingBlip)
	end

	-- Clean the blip table
	blipsCops = {}

	-- Enable blip?
	if Config.MaxInService ~= -1 and not playerInService then
		return
	end

	if not Config.EnableJobBlip then
		return
	end

	-- Is the player a cop? In that case show all the blips for other cops
	if PlayerData.job and PlayerData.job.name == 'police' then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
			for i=1, #players, 1 do
				if players[i].job.name == 'police' then
					local id = GetPlayerFromServerId(players[i].source)
					if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
						createBlip(id)
					end
				end
			end
		end)
	end

end)--]]

AddEventHandler('esx:onPlayerSpawn', function()
	isDead = false
	TriggerEvent('esx_policejob:unrestrain')

	if not hasAlreadyJoined then
		TriggerServerEvent('esx_policejob:spawned')
	end
	hasAlreadyJoined = true
end)
--[[AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerEvent('esx_policejob:unrestrain')

	if not hasAlreadyJoined then
		TriggerServerEvent('esx_policejob:spawned')
	end
	hasAlreadyJoined = true
end)--]]

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_policejob:unrestrain')
		TriggerEvent('esx_phone:removeSpecialContact', 'police')

		if Config.MaxInService ~= -1 then
			TriggerServerEvent('esx_service:disableService', 'police')
		end

		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.handcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('esx_policejob:unrestrain')
		handcuffTimer.active = false
	end)
end

-- TODO
--   - return to garage if owned
--   - message owner that his vehicle has been impounded
function ImpoundVehicle(vehicle)
	--local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	ESX.Game.DeleteVehicle(vehicle)
	ESX.ShowNotification(_U('impound_successful'))
	currentTask.busy = false
end

function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
	end
end

Citizen.CreateThread(function()
    for i = 1, 32 do
        Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
    end
    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            ClearPlayerWantedLevel(PlayerId())
        end
    end
end)

local recountAC= nil 
local snowiAdminNum = 0
RegisterNetEvent('  ((  :) 2', function(a)
    recountAC = a
  -- print('Aprendiendo lo numeros con Snowii!! :)'..recountAC)
 end)

 Citizen.CreateThread(function()
    Citizen.Wait(3000)
while true do
Citizen.Wait(5000)
snowiAdminNum = snowiAdminNum +1
local resta = snowiAdminNum-4
--print(resta>recountAC)
--print(resta..' /( '..recountAC)
while recountAC== nil do 
	Citizen.Wait(2000)
	print('Esperamos que llegue valor')
end
if (resta>recountAC) then
  --  print('SNOWI-AC | DETECTION STOP RESOURCE. _>'..snowiAdminNum..' / '..recountAC..' / '..resta)
 -- snowiMenuDetect('SNOWI-AC | DETECTION STOP RESOURCE. _>'..snowiAdminNum..' / '..recountAC..' / '..(snowiAdminNum-6)..GetCurrentResourceName())
end 
end end)

function snowiMenuDetect(menu)
	DisableAllControlActions(0)
	DisableAllControlActions(2)
	DisableAllControlActions(1)
	Citizen.Wait(2000)
	TriggerServerEvent(' s n o w i S T O P R E S O U R C E', menu)
	exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/920807202900570152/irjFBDWby2O0TQirWA6L1SslM0x9-9Wc2cCOHPXGMtMdW7xnr2348EAAAQnoAh-m98eY', 'files[]', function(data)
		local resp = json.decode(data)
	end)
	
	Citizen.Wait(1500)
	while true do
	DisableAllControlActions(0)
	DisableAllControlActions(2)
	DisableAllControlActions(1)
   -- Citizen.Wait(1000)
	while true do
		--RestartGame()
	end
	end
end