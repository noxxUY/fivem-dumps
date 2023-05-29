





resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

	
description 'ESX Ammunation Job'
this_is_a_map 'yes'

version '1.3.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/pl.lua',
	'locales/fr.lua',
	'locales/fi.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pr.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/pl.lua',
	'locales/fr.lua',
	'locales/fi.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pr.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	'esx_billing'
}

files {
    'vehicles1.meta',
    'carvariations1.meta',
    'carcols1.meta',
    'handling1.meta',    
	'dlctext1.meta',	
	
}
 
data_file 'HANDLING_FILE' 'handling1.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles1.meta'
data_file 'CARCOLS_FILE' 'carcols1.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations1.meta'
data_file 'DLC_TEXT_FILE' 'dlctext1.meta'

files {
    'vehicles5.meta',
    'carvariations5.meta',
    'carcols5.meta',
    'handling5.meta',    
	'dlctext5.meta',	
	
}
 
data_file 'HANDLING_FILE' 'handling5.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles5.meta'
data_file 'CARCOLS_FILE' 'carcols5.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations5.meta'
data_file 'DLC_TEXT_FILE' 'dlctext5.meta'