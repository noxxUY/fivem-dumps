fx_version 'bodacious'
game 'gta5'

replace_level_meta 'gta5'


this_is_a_map 'yes'

client_scripts {
	'client.lua',
	"main.lua",
}

files {
	'interiorproxies.meta',
	"test31_milo_.ymap",
	'custom_timecycle_template.xml',
	'gta5.meta',
	'doortuning.ymt',
	"lr_sc1_18.ymap",
	"lr_sc1_18_critical_0.ymap",
	"lr_sc1_18_long_0.ymap",
	"lr_sc1_18_strm_0.ymap",
	"lr_sc1_occl_00.ymap",
	"lr_sc1_occl_03.ymap",
	"lr_sc1_rd.ymap",
	"lr_sc1_rd_long_0.ymap",
	"lr_sc1_rd_strm_0.ymap",
	"lr_sc1_rd_strm_2.ymap",
	"lr_sc1_rd_strm_3.ymap",

}

data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'
data_file 'DLC_ITYP_REQUEST' 'stream/life_porte1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/life_porteg1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/[elevator]/patoche_elevator1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'dousojin_touge.ytyp'

-- cs-hall
files {
    'stream/cs-stream/cs_prop_hall_spotlight.ytyp',
    'stream/cs-stream/h4_battle_club_screen.ytyp',
}

data_file 'DLC_ITYP_REQUEST' 'stream/cs-stream/cs_prop_hall_spotlight.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/cs-stream/h4_battle_club_screen.ytyp'

data_file 'TIMECYCLEMOD_FILE' 'stream/cs-stream/custom_timecycle_template.xml'
data_file 'GTXD_PARENTING_DATA' 'stream/cs-stream/meta/gtxd.meta' 


-- Rapel

files {
    'stream/Rapel/def_props.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'stream/Rapel/def_props.ytyp'


