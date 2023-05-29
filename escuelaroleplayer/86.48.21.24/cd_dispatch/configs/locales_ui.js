const locale = {
  cd_dispatch_small_title: "No hay alertas",
  cd_dispatch_small_previous: "Anterior",
  cd_dispatch_small_next: "Siguiente",
  cd_dispatch_small_respond: "Marcar",
  cd_dispatch_small_mode: "Pulse el botón derecho para salir del modo de desplazamiento.",

  cd_dispatch_main_show_refresh_bar: "Mostrar",
  cd_dispatch_main_hide_refresh_bar: "Esconder",
  cd_dispatch_main_refresh: "Recargar blips",
  cd_dispatch_main_close_refresh_bar: "Cerrar",
  cd_dispatch_main_refresh_last: "Ultima actualización",

  cd_dispatch_main_units_responding: "Unidad(es) que responde(n)",

  cd_dispatch_unit_list: "Lista de unidades",

  cd_dispatch_main_dropdown_respond: "Responder a la notificación",
  cd_dispatch_main_dropdown_remove_response: "Eliminar respuesta a la notificación",
  cd_dispatch_main_dropdown_remove_notification: "Eliminar esta notificación",
  cd_dispatch_main_dropdown_remove_all: "Eliminar todas las notificaciones",
  cd_dispatch_main_dropdown_assign_all: "Asignar todas las unidades a la alerta",

  cd_dispatch_main_modal_title: "Configuración de Dispatch",
  cd_dispatch_main_modal_autodel: "Eliminar automáticamente después",
  cd_dispatch_main_modal_autodel_desc:"La cantidad de tiempo necesaria para auto borrar la notificación. (En minutos, 1-60)",
  cd_dispatch_main_modal_set_callsign:"Actualizando llamado",
  cd_dispatch_main_modal_set_callsign_help:"Esta llamada sera visible para todas las unidades",
  cd_dispatch_main_modal_assigned_vehicle:"Vehiculo asignado",
  cd_dispatch_main_modal_close: "Cerrar",
  cd_dispatch_main_modal_save: "Guardar Cambios",
  cd_dispatch_main_modal_vehicle_foot:" Pie",
  cd_dispatch_main_modal_vehicle_car:" Auto",
  cd_dispatch_main_modal_vehicle_motorcycle:" Motocicleta",
  cd_dispatch_main_modal_vehicle_helicopter:" Helicoptero",
  cd_dispatch_main_modal_vehicle_boat: " Bote",
  cd_dispatch_main_modal_sound_control: "Control de sonido",
  cd_dispatch_main_modal_mute_sounds: "Mutear Sonidos",
  cd_dispatch_main_modal_mute_sounds_description: "Esta opción silenciará los sonidos de pánico y de notificación",
  cd_dispatch_main_modal_enable_dispatcher: "¿Activar el modo dispatch?",
  cd_dispatch_main_modal_toggle_button:"Activar el modo dispatch",
  cd_dispatch_main_modal_dispatcher_status: "El modo dispatch esta actualmente",
  cd_dispatch_main_modal_dispatcher_status_enabled: "habilitado.",
  cd_dispatch_main_modal_dispatcher_status_disabled: "deshabilitado.",

  cd_dispatch_unit_dropdown_gps: "Establecer ubicación GPS",
  cd_dispatch_unit_join_radio:"Unirse al canal de radio",
  cd_dispatch_unit_leave_radio:"Dejar el canal de radio",

  cd_dispatch_toggle_voice_on: "Activar voz",
  cd_dispatch_toggle_voice_off: "Apagar voz",
  cd_dispatch_revert_map: "Revertir",

  cd_dispatch_notification_panel: "Panel de notificaciones",

  cd_dispatch_settings_status: "Estado",
  cd_dispatch_settings_status_help: "Seleccione su estado actual.",

  cd_dispatch_units_notification: "No hay unidades que respondan",

  cd_dispatch_tamper_message: "¿Ha manipulado los valores?",
  cd_dispatch_callsign_message: "La llamada debe de tener menos de 16 caracteres.",

};

let statusMessages = [
  {name:"Disponible", color:"#539D1B"}, // The status will default to the first one in the list
  {name:"Unavailable", color:"#F05B56"},
  {name:"Indisponible", color:"#E46211"},
  {name:"Capacitación", color:"#009DE0"},
  {name:"Clandestino", color:"#2E570F"},
]

moment.locale("en"); // The locale of the time on top of the small UI

// Possible locales v
// en,af,ar-dz,ar-kw,ar-ly,ar-ma,ar-sa,ar-tn,ar,az,be,bg,bm,bn-bd,bn,bo,br,bs,ca,cs,cv,cy,da,de-at,de-ch,de,dv,el,en-au,en-ca,en-gb,en-ie,en-il,en-in,en-nz,en-sg,eo,es-do,es-mx,es-us,es,et,eu,fa,fi,fil,fo,fr-ca,fr-ch,fr,fy,ga,gd,gl,gom-deva,gom-latn,gu,he,hi,hr,hu,hy-am,id,is,it-ch,it,ja,jv,ka,kk,km,kn,ko,ku,ky,lb,lo,lt,lv,me,mi,mk,ml,mn,mr,ms-my,ms,mt,my,nb,ne,nl-be,nl,nn,oc-lnc,pa-in,pl,pt-br,pt,ro,ru,sd,se,si,sk,sl,sq,sr-cyrl,sr,ss,sv,sw,ta,te,tet,tg,th,tk,tl-ph,tlh,tr,tzl,tzm-latn,tzm,ug-cn,uk,ur,uz-latn,uz,vi,x-pseudo,yo,zh-cn,zh-hk,zh-mo,zh-tw
