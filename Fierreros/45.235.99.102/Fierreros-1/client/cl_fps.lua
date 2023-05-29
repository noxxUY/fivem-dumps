ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('fps:openfps') 
AddEventHandler('fps:openfps', function()
    OpenFPSMenu()
end)


function OpenFPSMenu() 

    local elements = {
		  {label = 'FPS Boost',		value = 'fps'},	   	       
      {label = 'View & Improved lights',		value = 'fps5'},               
		  {label = 'Basic',		value = 'fps2'},									          
        }
  
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'headbagging',
      {
        title    = 'Boost FPS Menu',
        align    = 'top-left',
        elements = elements
        },
  
            function(data2, menu2)
  
  
  
  
              if data2.current.value == 'fps' then
                SetTimecycleModifier('yell_tunnel_nodirect')

             

             elseif data2.current.value == 'fps2' then
                SetTimecycleModifier()
                ClearTimecycleModifier()
                ClearExtraTimecycleModifier()
              elseif data2.current.value == 'fps5' then
                SetTimecycleModifier('tunnel')
                
                elseif data2.current.value == 'fps8' then    
                  DisplayRadar(false)
                elseif data2.current.value == 'fps9' then      
                  DisplayRadar(true)
              else
              end
            end,
      function(data2, menu2)
        menu2.close()
      end
    )
  
  end
  