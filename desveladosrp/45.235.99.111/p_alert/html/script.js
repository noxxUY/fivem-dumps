$(function(){
    window.addEventListener("message", function(event){

        var todo = document.querySelector("#All")  
        var alertador = document.querySelector("#score")  
        var registro = document.querySelector("#registro")

        if (event.data.target == "mini") {
            if (event.data.inpause) {
                todo.style = "display:none;" 
            } else {
                todo.style = "display:block;" 
            }

            if (event.data.showmini == false) {
                alertador.style = "display:block;" 

                var alertas = event.data.alertas;
                $("#numllam").html(alertas + "");
        
                var msg = event.data.msg;
                $("#mensje").html(msg + "");
                
                var id = event.data.id;
                $("#id").html(id+ "");

                var idcs = document.querySelector("#id")
                if (event.data.dispo) {
                    idcs.style.color = "rgba(1, 255, 100, 1.0)"
                } else {
                    idcs.style.color = "rgba(143, 143, 143, 0.753)";
                } 
    
                    
            } else {
                alertador.style = "display:none;" 
            }
        } else if (event.data.target == "listadd") {
            $(".databox").append('<p style = "position:sticky; margin: 0.5vh; font-size: 1.396296vh;color: rgba(250, 250, 250, 0.7);">'+"#"+event.data.id+'</p><p style = "position:sticky ;margin: 0.5vh;margin-top: -0.5vh; font-size: 1.696296vh;">'+event.data.msg+'</p><div style = "position: sticky; width: 100%; height: 1px; background-color: rgba(143, 143, 143, 0.753);"></div>')
        } else if (event.data.target == "showlista") {
            if (event.data.mostrar == true) {
                registro.style = "display:block;" 
            } else {
                registro.style = "display:none;" 
            }
        }
    })

})

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27:
            $.post('https://p_alert/closeui');
            break;
    }
});

