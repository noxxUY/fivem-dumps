var app = new Vue({
    el: '#app',
    data: {
        opened: false,
        job : null,
        page: 'create',
        presets: null,
        value: null
    },
    methods: {
        setPage: function(string){
            this.page = string 
        },
        sendAlert: function(){
           let string = $("#text-input").val()
            let obj = {
                msg : string
            }    
            $.post('https://announce-creator/send', JSON.stringify({obj}));
        },
        sendPresetAnnounce: function(obj) {
            $.post('https://announce-creator/send', JSON.stringify({obj}));
            
            var anuncio = document.getElementById("anuncio");
        }
    }
})
$(function () {
    $(".bloque-anuncio").hide()
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://announce-creator/exit', JSON.stringify({}));
            app.opened = false
            return
        }
    };
    window.addEventListener("message", function(event){
        const v = event.data;
        if (v.action == "anuncio") {
            app.opened = true
            app.presets = v.presets
            app.job = v.job
        } else if (v.action = 'execute'){
            let duration = 4
            $(".anuncio").text(event.data.content.msg)
            var anuncio = document.getElementById("anuncio");
            $(".bloque-anuncio").fadeIn(700)
            //if (app.job == 'police') {
            //    $(".bloque-header").text('🚔 LSPD')
            //} else if (app.job == 'ambulance') {
             // **  $(".bloque-header").text('🚑 SAMS')
          //  } else if (app.job == 'sc') {
            //    $(".bloque-header").text('🚔 SC')
            //} else if (app.job == 'sheriff') {
              //  $(".bloque-header").text('🚔 SHERIFF')
            //} else if (app.job == 'armeriaSandy') {
              //  $(".bloque-header").text('🔫 ARMERIA SANDY')
            //} else if (app.job == 'armasNorte') {
              //  $(".bloque-header").text('🔫 ARMERIA PALETO')
            //} else if (app.job == 'armasmenor') {
              //  $(".bloque-header").text('🔫 ARMERIA CIUDAD')
            //} else if (app.job == 'armeriaSur') {
              //  $(".bloque-header").text('🔫 ARMERIA MERCADO NEGRO')
            //} else if (app.job == 'uwucat') {
             //   $(".bloque-header").text('☕ UWU CAFE')
         //   } else if (app.job == 'mechanic') {
           //     $(".bloque-header").text('🔧 MECANICOS')
           // } else if (app.job == 'mechanic2') {
             //   $(".bloque-header").text('🔧 MECANICOS')
            //} else if (app.job == 'mechanic3') {
             //   $(".bloque-header").text('TALLER EXOTICS')
            //} else if (app.job == 'mechanic4') {
              //  $(".bloque-header").text('TALLER RUTA 68')
           // } else if (app.job == 'unicorn') {
              //  $(".bloque-header").text('🍸 VANILLA UNICORN')
           // } else if (app.job == 'bahamas') {
             //   $(".bloque-header").text('🍸 BAHAMAS WEST MAMAS')
            //} else if (app.job == 'yellow') {
              //  $(".bloque-header").text('🍸 YELLOW JACK')
           // } else if (app.job == 'tequila') {
             //   $(".bloque-header").text('🍸 TEQUILA-LA')
            //} else if (app.job == 'skybar') {
              //  $(".bloque-header").text('🍸 SKYBAR')
            //}
            setTimeout(() => {
                $(".bloque-anuncio").fadeOut(800)
            }, duration * 4000);
        } else {
            app.opened = false
        }
    });
});
