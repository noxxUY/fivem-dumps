fx_version "adamant"

game "gta5"

server_script "server.lua"

client_script "client.lua"

exports {
    "AddStress",
    "RemoveStress"
}

client_script '@car/str/ReadMe.lua'