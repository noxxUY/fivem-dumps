
fx_version 'adamant'
games { 'gta5' };


client_script {
    'client/main.lua'
}
  
ui_page {
  'ui/index.html'
}

files {
  'ui/index.html',
  'ui/style.css',
}

exports {
  'AfficherProgressbar',
  'CacherProgressbar'
}
