--[[

	Holograms / Floating text Script by Meh
	
	Just put in the coordinates you get when standing on the ground, it's above the ground then
	By default, you only see the hologram when you are within 10m of it, to change that, edit the 10.0 infront of the "then"
	The Default holograms are at the Observatory.
	
	If you want to add a line to the hologram, just make a new Draw3DText line with the same coordinates, and edit the vertical offset.
	
	Formatting:
			Draw3DText( x, y, z  vertical offset, "text", font, text size, text size)
			
			
	To add a new hologram, copy paste this example under the existing ones, and put coordinates and text into it.
	
		if GetDistanceBetweenCoords( X, Y, Z, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( X, Y, Z,  -1.400, "TEXT", 4, 0.1, 0.1)
			Draw3DText( X, Y, Z,  -1.600, "TEXT", 4, 0.1, 0.1)
			Draw3DText( X, Y, Z,  -1.800, "TEXT", 4, 0.1, 0.1)		
		end


]]--

Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
		while true do
			Citizen.Wait(0)
				-- Hologram No. 1
		if GetDistanceBetweenCoords( -266.5312, -960.4347, 31.2231, GetEntityCoords(GetPlayerPed(-1))) < 6.0 then
			Draw3DText( -266.5312, -960.4347, 31.2231  -1.400, "~y~- Bienvenido a PicanteRP -", 4, 0.1, 0.1) 
			Draw3DText( -266.5312, -960.4347, 31.2231  -1.600, "Recuerda Leerte las Normas en Discord.", 4, 0.1, 0.1)
			Draw3DText( -266.5312, -960.4347, 31.2231 -1.800, "~r~Usa /Report para mas informacion de la ciudad.", 4, 0.1, 0.1)
			Draw3DText( -266.5312, -960.4347, 31.2231  -2.200, "Para entrevistas llena el formulario en la Recepcion de cada Faccion.", 4, 0.1, 0.1)
			Draw3DText( -266.5312, -960.4347, 31.2231  -2.000, "Si necesitas ayuda usa /ayuda o /report y un staff te atenderá", 4, 0.1, 0.1)			
		end		
				--Hologram No. 2
		if GetDistanceBetweenCoords( -260.4728, -965.3359, 31.2244, GetEntityCoords(GetPlayerPed(-1))) < 6.0 then 
			Draw3DText( -260.4728, -965.3359, 31.2244  -1.400, "~y~-- Oficina de Empleo-", 4, 0.1, 0.1)					
		end
		if GetDistanceBetweenCoords( -265.7933, -967.7559, 31.2242, GetEntityCoords(GetPlayerPed(-1))) < 6.0 then 
			Draw3DText( -265.7933, -967.7559, 31.2242  -1.400, "~y~-- Como Iniciar En La Ciudad -", 4, 0.1, 0.1)
			Draw3DText( -265.7933, -967.7559, 31.2242  -1.600, "Debes comprarte un telefono en la tienda, luego lo usas con F1.", 4, 0.1, 0.1)
			Draw3DText( -265.7933, -967.7559, 31.2242  -2.400, "Renta una Bicicleta para movilizarte mientras.", 4, 0.1, 0.1)
			Draw3DText( -265.7933, -967.7559, 31.2242  -1.800, "Puedes ir a realizar el trabajo que escogiste.", 4, 0.1, 0.1)
			Draw3DText( -265.7933, -967.7559, 31.2242  -2.000, "Te recordamos sacar la licencia de conducir.", 4, 0.1, 0.1)
			Draw3DText( -265.7933, -967.7559, 31.2242  -2.200, "Te recordamos que tienes que usar el cinturon [M] , salvar tu vida es tu responsabilidad!", 4, 0.1, 0.1)						
      end	
	end
end
-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(250, 250, 250, 255)		-- You can change the text color here
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
        end
