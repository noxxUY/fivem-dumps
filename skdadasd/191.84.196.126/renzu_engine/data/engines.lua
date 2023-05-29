
Engines = {}
if not IsDuplicityVersion() and GetResourceState('ox_inventory') == 'started' and Config.Ox_Inventory then
	function onEnter(self)
		lib.showTextUI('[E] - Comprar motores', {
			position = "right-center",
			icon = 'hand',
			style = {
				borderRadius = 0,
				backgroundColor = '#48BB78',
				color = 'white'
			}
		})
	end

	function onExit(self)
		lib.hideTextUI()
	end

	function inside(self)
		if IsControlJustPressed(0,38) then
			BuyEngines()
		end
	end

	local sphere = lib.zones.sphere({
		coords = vec3(845.97,-1067.82,28.035890),
		radius = 1,
		debug = false,
		inside = inside,
		onEnter = onEnter,
		onExit = onExit
	})
	BuyEngines = function()
		local options = {}
		local secondary = {}
		local brands = {}
		for k,v in pairs(Engines) do
			if v.brand == nil then v.brand = 'Reales' end
			if v.name == nil then v.name = v.handlingName end
			if not brands[v.brand] then
				brands[v.brand] = true
				table.insert(options,{
					title = v.brand,
					menu = 'brand_'..v.brand,
					arrow = true,
					description = 'Selecccionar '..v.brand,
				})
			end
			if secondary[v.brand] == nil then secondary[v.brand] = {} end
			table.insert(secondary[v.brand],{
				title = v.name..' Motores',
				onSelect = function(args)
					TriggerServerEvent('buyengine',k)
				end,
				description = 'Comprar '..v.name..' price:'..v.price,
			})
		end
		for k,v in pairs(Engines) do
			if v.brand == nil then v.brand = 'custom' end
			if v.name == nil then v.name = v.handlingName end
			lib.registerContext({
				id = 'brand_'..v.brand,
				title = v.brand..' Engine',
				onExit = function()
					print('Hello there')
				end,
				menu = 'buyengine',
				options = secondary[v.brand]
			})
		end
		
		lib.registerContext({
			id = 'buyengine',
			title = 'Buy Engine',
			onExit = function()
				print('Hello there')
			end,
			options = options
		})
		lib.showContext('buyengine')
	end
	local blip = AddBlipForCoord(845.97,-1067.82,28.035890)
	SetBlipSprite(blip, 642)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.8)
	SetBlipColour(blip, 3)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('Engine Shop')
	EndTextCommandSetBlipName(blip)
end
Engines = { -- https://github.com/qbcore-framework/qb-core/blob/main/shared/vehicles.lua
	--- Compacts
	-- ['asbo'] = {
	-- 	['name'] = 'Asbo',
	-- 	['brand'] = 'Maxwell',
	-- 	['model'] = 'asbo',
	-- 	['price'] = 4000,
	-- 	['category'] = 'compacts',
	-- 	['hash'] = `asbo`,
		
	-- },
}
local vehicles = {}
for k,v in pairs(Engines) do
	if not vehicles[v.brand] then vehicles[v.brand] = {} end
	table.insert(vehicles[v.brand],v)
end

if Config.custom_engine_enable then
    for k, v in pairs(Config.custom_engine) do
      Engines[k] = v
    end
end

Lists = function()
	return {
		Locals = Engines,
		Custom = Config.custom_engine
	}
end

exports('Engines',Lists)