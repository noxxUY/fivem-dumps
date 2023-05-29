--SCRIPT CRIADO POR GHOSTSBR TODOS OS DIREITOS RESERVADOS // SCRIPT CREATED BY FEELING ALL RIGHTS RESERVED // DISCORD: Feeling#2974
local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX							= nil
local CurrentZoneType   = nil
local open              = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

local empresas = {
    {x = -267.09, y = -969.37, z = 30.23}
}

--Icone do mapa
Citizen.CreateThread(function()
		Citizen.Wait(100)
		for k in pairs(empresas) do
			local blip = AddBlipForCoord(empresas[k].x, empresas[k].y, empresas[k].z)
			SetBlipSprite(blip, 408)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip, 0.6)
			SetBlipColour(blip, 31)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Compra de Empresas")
			EndTextCommandSetBlipName(blip)
		end
end)

Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
						Citizen.Wait(0)
		for k in pairs(empresas) do
						
			DrawMarker(1, empresas[k].x, empresas[k].y, empresas[k].z, 0, 0, 0, 0, 0, 0, 1.5000, 1.5000, 1.0000, 255, 251, 0, 200, 0, 0, 0, 0)
							
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, empresas[k].x, empresas[k].y, empresas[k].z)
							
			if dist <= 1.8 then
				DrawTxt("Pulsa E para acceder al menu de empresas")
					if IsControlJustPressed(1,51) then
						open = true
						openempresasmenu()
					end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			open = false
		end
	end
end)

function openempresasmenu()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'menu_empresas',
	{
		title    = 'Menu de Empresas',
		align    = 'top-right',
		elements = {
			{label = 'Comprar', value = 'buy'},
			{label = 'Vender', value = 'sell'}
		}
	},
	function(data, menu)
		local val = data.current.value
		
		if val == 'buy' then
			openempresasmenucompra()
		elseif val == 'sell' then
			openempresasmenuvenda()
		end
	end,
	function(data, menu)
		menu.close()
	end
	)
end

function openempresasmenuvenda()

	local elements = {}

    for i=1, #Config.empresas.EmpresastoSell, 1 do

      local empresa = Config.empresas.EmpresastoSell[i]

      table.insert(elements, {label = empresa.label .. ' - $' .. empresa.price, value = empresa.name, price = empresa.price})

    end

	ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'menu_sell_empresas',
      {
        title    = "Venta de Empresa",
        align    = 'top-right',
        elements = elements,
      },
      function(data, menu)
			  local ename = data.current.value
			  local eprice = data.current.price
			  local elabel = data.current.label
		      TriggerServerEvent('esx_empresa:venda', ename, eprice, elabel)
      end,
      function(data, menu)
        menu.close()
      end
    )
end

function openempresasmenucompra()

	local elements = {}

    for i=1, #Config.empresas.EmpresastoSell, 1 do

      local empresa = Config.empresas.EmpresastoSell[i]

      table.insert(elements, {label = empresa.label .. ' - $' .. empresa.price, value = empresa.name, price = empresa.price, bosslevel = empresa.bosslevel})

    end

	ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'menu_buy_empresas',
      {
        title    = "Compra de Empresa",
        align    = 'top-right',
        elements = elements,
      },
      function(data, menu)
			  local ename = data.current.value
			  local eprice = data.current.price
			  local elabel = data.current.label
			  local elevel = data.current.bosslevel
		      TriggerServerEvent('esx_empresa:compra', ename, eprice, elabel, elevel)
      end,
      function(data, menu)
        menu.close()
      end
    )
end

function DrawTxt(text)
  SetTextFont(0)
  SetTextProportional(1)
  SetTextScale(0.0, 0.45)
  SetTextDropshadow(1, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)

  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(0.014, 0.035)
end

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end