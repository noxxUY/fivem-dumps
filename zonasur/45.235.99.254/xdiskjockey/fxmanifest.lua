fx_version "adamant"
games { "gta5" }

dependencies {
	"xsound",
}

client_scripts {
	"locales/*.lua",
	"config.lua",
	"utils/class.lua",
	"client/*.lua",
}

server_script {
	"config.lua",
	"@mysql-async/lib/MySQL.lua", -- comment this file if you dont use mysql async
	"server/mysql.lua", -- uncommend this only if you dont use mysql async
	
	"locales/*.lua",
	"server/*.lua",
}

shared_scripts {
	"utils/shared.lua",
}

escrow_ignore {
	"locales/*.lua",
	"config.lua",
	"utils/*.lua",
	"server/mysql.lua",
}


ui_page "html/index.html"

files {
	"html/*.html",
	"html/css/*.css",
	"html/css/img/*.png",
	"html/scripts/*.js",
}

lua54 "yes"