fx_version 'bodacious'
games { 'gta5' }
version '1.0'
Author 'Wezzo'
description 'East Customs Garage'



this_is_a_map 'yes'

file 'gabz_timecycle_mods_1.xml'
data_file 'TIMECYCLEMOD_FILE' 'gabz_timecycle_mods_1.xml'
data_file('DLC_ITYP_REQUEST')('stream/happy2020.ytyp')
data_file "INTERIOR_PROXY_ORDER_FILE" "interiorproxies.meta"

files {

    "interiorproxies.meta"
}

client_script {
    "main.lua"
}



