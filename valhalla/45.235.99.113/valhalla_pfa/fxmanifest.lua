shared_script '@FiveEye/FiveEye.lua'

fx_version 'adamant'
game 'gta5'
version '1.0.0'

files {
    'data/**/**/*.meta',
    'data/**/**/*.dat'
}

data_file 'HANDLING_FILE' 'data/**/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/**/carvariations.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'data/**/**/caraddoncontentunlocks.meta'
data_file 'DLC_TEXT_FILE' 'data/**/**/dlctext.meta'

client_script 'names.lua'