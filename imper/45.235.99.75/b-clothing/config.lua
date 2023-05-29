--[[

    [!] Please check out our documentation at https://docs.b-development.xyz/ for more information. [!] 
    [?] If you need help, join our discord server at https://discord.gg/b-dev [?]
    

]]

BDEV = {
    ESXEvent = "esx:getShILovePizzaaredObjILovePizzaect",
    Accounts = {
        bank = "bank",
        money = "bank" 
    },
    MenuAlign = "right", -- this is for esx menu
    Locales = {
        clothingShop = "Tienda de Ropa",
        pressToEnter = "Presione ~INPUT_PICKUP~ para acceder a la tienda de ropa.",
        bought = "Has comprado %s$ de ropa.",
        notEnoughMoney = "No puedes permitirte esta compra..",
        outfitSaved = "Traje guardado con éxito.",
        outfitDeleted = "Traje eliminado con éxito.",
        changeClothing = "Elegir ropa.",
        removeOutfit = "Quitar atuendo.",
        changeOutfit = "Cambiarse de ropa.",
        outfits = "Outfits",
        nameOfOutfit = "Nombre de Outfits",
        yes = "Si",
        no = "No",
        saveOutfit = "¿Quieres guardar el atuendo?"
    },
    Blip = {
        Color = 1,
        Size = 0.8
    },
    Color = {215, 66, 245, 100}, -- for the Markers
    Marker = {
        type = 1,
        size = {1.0, 1.0, 1.0}, -- x , y, z
    },
    LabelOverride = {
        ["helmet_1"] = {
            [5] = "Gran casco."
        }
    },
    PriceOverride = {
        ["helmet_1"] = {
            [5] = 187187,
            [6] = 8966
        },
        ["pants_1"] = {
            [132] = 12356
        }
    },
    Zoom = {
        --[[
            Here you can configuerate the standard zoom  
        ]]
        curzoom = 75, 
        curheight = 15,
        currot = 0,
    },
    ClothingBlacklist = {
        --[[
          ["helmet_1"] = { -- category name
            7, 10, 12 -- clothing id's that are not allowed to be equipped
        },
        ]]
        ["helmet_1"] = {
            7, 10, 12
        },
    },
    CategoryPrices = { -- List of all components used ordered by top to bottom.
        ["helmet_1"] = 1000,
        ["mask_1"] = 500,
        ["tshirt_1"] = 187,
        ["torso_1"] = 123,
        ["arms"] = 0,
        ["pants_1"] = 1111,
        ["shoes_1"] = 999
    },
    Notify = function(msg)
        ESX.ShowNotification(msg)
    end,
    DefaultClothes = {
        {
            name = "helmet_1",
            variation = "helmet_2",
            label = "Gorras",
            icon = "hats.svg",
            price = 5000,
          },
		   {
            name = "tshirt_1",
            variation = "tshirt_2",
            label = "Camisa",
            icon = "tshirt.svg",
            price = 10000,
          },
		    {
            name = "torso_1",
            variation = "torso_2",
            label = "Torso",
            icon = "torso.svg",
            price = 10000,
          },
		   {
            name = "pants_1",
            variation = "pants_2",
            label = "Pantalones",
            icon = "pants.svg",
            price = 9000,
          },
		   {
            name = "arms",
            variation = "arms_2",
            label = "Brazos",
            icon = "arms.svg",
            price = 6000,
          },
          {
            name = "shoes_1",
            variation = "shoes_2",
            label = "Zapatos",
            icon = "shoes.svg",
            price = 9000,
          },
          {
            name = "bags_1",
            variation = "bags_2",
            label = "Mochila",
            icon = "bags.svg",
            price = 8000,
          },
          {
            name = "ears_1",
            variation = "ears_2",
            label = "Orejas",
            icon = "earring.svg",
            price = 3000,
          },
          {
            name = "glasses_1",
            variation = "glasses_2",
            label = "Lentes",
            icon = "glasses.svg",
            price = 4000,
          },
          {
            name = "mask_1",
            variation = "mask_2",
            label = "Mascara",
            icon = "mask.svg",
            price = 70000,
          },
		  {
            name = "watches_1",
            variation = "watches_2",
            label = "Relojes",
            icon = "arms.svg",
            price = 6000,
          },
		  {
            name = "chain_1",
            variation = "chain_2",
            label = "Cadenas",
            icon = "earring.svg",
            price = 6000,
          },
		  {
            name = "bracelets_1",
            variation = "bracelets_2",
            label = "Pulseras",
            icon = "arms.svg",
            price = 6000,
          },
          {
            name = "bproof_1",
            variation = "bproof_2",
            label = "Chalecos",
            icon = "tshirt.svg",
            price = 90000,
          }
    },
    Shops = {
        { -- this is the first shop that will open if you trigger the event "b-clothing:openShop"
            pos = vector3(72.3, -1399.1, 28.4),
            useblip = false, -- make this on false if you want to disable the blip
            heading = 0.0,
            blipSprite = 73,
            blipName = "Tienda De Ropa",
            -- clothes = {} -- add clothes here the same as in BDEV.DefaultClothes if you want to
        },
        {
            pos = vector3(-703.8, -152.3, 36.4),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",
        },
        {
            pos = vector3(-167.9, -299, 38.7),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",
        },
        {
            pos = vector3(428.7, -800.1, 28.5),
            heading = 90.1,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",
        },
        {
            pos = vector3(-829.4, -1073.7, 10.3),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",        
        },
        {
            pos = vector3(-1447.8, -242.5, 48.8),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",       
        },
        {
            pos = vector3(11.6, 6514.2, 30.9),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",
        },
        {
            pos = vector3(123.6, -219.4, 53.6),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",
        },
        {
            pos = vector3(618.1, 2759.6, 41.1),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",
        },
        {
            pos = vector3(1190.6, 2713.4, 37.2),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",        
        },
        {
            pos = vector3(-1193.4, -772.3, 16.3),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",        
        },
        {
            pos = vector3(-3172.5, 1048.1, 19.9),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",        
        },
        {
            pos = vector3(-1108.4, 2708.9, 18.1),
            heading = 0.0,
            useblip = true,
            blipSprite = 73,
            blipName = "Tienda De Ropa",        
        }
    }
}

function help(msg)
    AddTextEntry("b-clothing", msg)
    DisplayHelpTextThisFrame("b-clothing", false)
end

function ShopMenu(i)
	local elements = {
		{ label = BDEV.Locales["changeClothing"], value = "change_outfit" },
		{ label = BDEV.Locales["changeOutfit"], value = "select_outfit" },
		{ label = BDEV.Locales["removeOutfit"], value = "remove_outfit" },
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_menu', {
		title    = BDEV.Locales["clothingShop"],
		align    = BDEV.MenuAlign,
		elements = elements
	}, function(data, menu)
		if data.current.value == 'change_outfit' then
			openClothing(i)
		elseif data.current.value == 'select_outfit' then
			OpenOutfits()
		elseif data.current.value == 'remove_outfit' then 
			RemoveOutfits()
		end
		
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function onbuy(type, source, price)
    --[[
      type is money or bank
      source is the player source
      and the price is the current price
    ]]
end