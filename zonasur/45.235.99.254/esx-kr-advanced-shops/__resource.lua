resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page('html/index.html') 

files({
  'html/index.html',
  'html/script.js',
  'html/style.css',
	'html/img/water.png',
	'html/img/phone.png',
	'html/img/pico.png',
	'html/img/bread.png',
	'html/img/apple.png',
	'html/img/bolchips.png',
	'html/img/cupcake.png',
	'html/img/chocolate.png',
	'html/img/beer.png',
	'html/img/wine.png',
	'html/img/vodka.png',
	'html/img/grand_cru.png',
	'html/img/coffee.png',
	'html/img/cocacola.png',
	'html/img/hamburger.png',
	'html/img/fishingrod.png',
	'html/img/fishbait.png',
	'html/img/turtlebait.png',
	'html/img/hacha.png',
	'html/img/sprite.png',
	'html/img/sandwich.png',
	'html/img/papas.png', 
	'html/img/tacos.png', 
	'html/img/cigarrillo.png',
	'html/img/habano.png', 
	'html/img/fanta.png',
	
  'html/font/vibes.ttf',
  'html/img/box.png',
	'html/img/carticon.png',
})

client_scripts {
  'config.lua',
  'client/main.lua',
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/fr.lua',	
  'locales/sv.lua',
}

server_scripts {
  'config.lua',
  'server/main.lua',
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua'
}

dependencies {
	'async',
	'cron'
}