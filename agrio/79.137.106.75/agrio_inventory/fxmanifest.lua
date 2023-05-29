fx_version 'cerulean'

games { 'gta5' }

author 'Barikelo'

lua54 'on'

ui_page "html/ui.html"

client_scripts {
  "@es_extended/locale.lua",
  "client/main.lua",
  "locales/es.lua",
  "client/player.lua",
  "config.lua",
  "client/clothing.lua",
  "client/trunk.lua"
}

server_scripts {
  "@async/async.lua",
  "@mysql-async/lib/MySQL.lua",
  "@es_extended/locale.lua",
  "server/main.lua",
  "locales/es.lua",
  "config.lua"
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  "html/locales/cs.js",
  "html/locales/en.js",
  "html/locales/es.js",
  "html/locales/fr.js",
  'html/img/items/*.png',
  'html/img/*.png',
  "html/inventario.ogg",
  "html/botones.ogg",
  "html/cerrar.ogg"
}

dependencies {
	"es_extended"
}