server_script "LSF.lua"
client_script "LSF.lua"

fx_version 'bodacious'
game 'gta5'

author 'ReinadoRP'
description 'Mapeados'
version '1.0.0'

this_is_a_map 'yes'


-- data_file 'TIMECYCLEMOD_FILE' 'gabz_timecycle_mods_1.xml'
data_file 'TIMECYCLEMOD_FILE' 'gabz_mrpd_timecycle.xml'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'
data_file 'FIVEM_LOVES_YOU_A9E8B9F6EEB35186' 'stream/little_seoul.ymt'
--- data_file 'TIMECYCLEMOD_FILE' 'gabztimecyclemods.xml'
-- data_file 'h4_dlc_int_03_h4' 'stream/h4_dlc_int_03_h4.ytyp'
-- data_file 'h4_dlc_int_04_h4' 'stream/h4_dlc_int_04_h4.ytyp'
-- data_file 'h4_mph4_airstrip_interior_0_airstrip_hanger' 'stream/h4_mph4_airstrip_interior_0_airstrip_hanger.ytyp'
-- data_file 'DLC_ITYP_REQUEST' 'stream/bridge_part.ytyp'
-- data_file "SCALEFORM_DLC_FILE" "stream/int3232302352.gfx"



-- data_file 'DLC_ITYP_REQUEST' 'stream/bridge_part.ytyp'
-- data_file 'h4_dlc_int_03_h4' 'stream/h4_dlc_int_03_h4.ytyp'
-- data_file 'h4_dlc_int_04_h4' 'stream/h4_dlc_int_04_h4.ytyp'
-- data_file 'h4_mph4_airstrip_interior_0_airstrip_hanger' 'stream/h4_mph4_airstrip_interior_0_airstrip_hanger.ytyp'




files {
--	'gabz_timecycle_mods_1.xml',
	'gabz_mrpd_timecycle.xml',
	'interiorproxies.meta',
--	'gabztimecyclemods.xml',
    'stream/little_seoul.ymt'
	-- "stream/int3232302352.gfx"
}

client_script {
    "gabz_mrpd_entitysets.lua"
	-- 'scripts/cayo_perico_entitysets.lua', -- Responsible for spawning in heist props in El Rubio's Mansion safe
	--'scripts/cp_both_islands.lua' -- Both Islands visible in game. (ENABLED BY DEFAULT)
--	"main.lua"
}