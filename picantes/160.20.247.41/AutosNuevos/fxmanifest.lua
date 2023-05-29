shared_script '@FiveEye/FiveEye.lua'

fx_version 'cerulean'
game 'gta5'
files {
---------------------------data coche
	'data/**/*.meta',
	'data/**/*.meta',
	'data/**/*.meta',
	'data/**/*.meta',
	'data/**/*.meta',
	'data/**/*.meta'
}

--------------------------meta coches
data_file 'DLC_TEXT_FILE' 'data/**/dlctext.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'

client_script 'vehicle_name.lua'
