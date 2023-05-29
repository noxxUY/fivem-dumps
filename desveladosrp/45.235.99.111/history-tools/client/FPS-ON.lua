local fps = false
RegisterCommand("fps",function(source,args)
	enable_fps_optimization()
end)

function enable_fps_optimization()
	fps = not fps
	if fps then
		SetResourceKvp("FPS-ON", tostring(fps))
		SetTimecycleModifier("cinema")
	else
		SetResourceKvp("FPS-ON", tostring(fps))
		SetTimecycleModifier("default")
	end
end

function check_cache_fps_optimization()
	if GetResourceKvpString('FPS-ON') == "true" then
		SetTimecycleModifier("cinema")
	end
end