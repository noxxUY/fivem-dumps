


version "1.3.0"

fx_version "cerulean"
game "gta5"
lua54 "yes"

escrow_ignore {
    "config.lua",
    "bridge/**/*.lua"
}

data_file "DLC_ITYP_REQUEST" "stream/frame_02.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/frame_03.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/frame_fleeca.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/part_02.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/part_03.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/part_fleeca.ytyp"

files {
    "bridge/**/client.lua"
}

shared_script "config.lua"
server_scripts {
    "source/server.lua"
}
client_scripts {
    "source/client.lua"
}
exports {
    "useRope",
    "useDrill"
}
dependency '/assetpacks'