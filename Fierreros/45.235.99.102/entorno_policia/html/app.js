$(function(){

    function display(bool){
        if(bool){
            $('#menu').show()
            $('#menu').removeClass("animate__animated animate__zoomOut")
            $('#menu').addClass("animate__animated animate__zoomIn")
        } else {
            $('#menu').removeClass("animate__animated animate__zoomIn")
            $('#menu').addClass("animate__animated animate__zoomOut")
            
        }
    }

    //escondemos el menu de primeras
    $('#menu').hide()
    display(false); //!!cambiar a false
    $("#notification").hide() //escondemos notificacion

    var numAlertasText = $("#alertNumber")
    var numAlertas = 0 //cantidad de alertas
    var currentAlert = 1 //alerta numerica actual
    var alertInfo //objeto donde se almacenan todas las alertas

    window.addEventListener('message',function(event){ 
        var item = event.data;
        if(item.type === "ui"){
            display(item.state);//"encender o apagar" el menú
        }
        else if(item.type === "alertNumber"){ //actualiza el numero total de alertas
            numAlertas = item.alertsCount
            numAlertasText.text(currentAlert +"/" + numAlertas)
        }
        else if(item.type == "alertInfo"){
            alertInfo = item.info
            updateAlertText()
        }
        else if(item.type == "updateNotification"){
            if(numAlertas>0){
                //encendemos notificacion con animacion
                $("#notification").show()
                $("#notification").removeClass("animate__animated animate__zoomOut")

                
                $("#notification").addClass("animate__animated animate__zoomIn")
  
                setTimeout(()=>{
                    $("#notification").removeClass("animate__animated animate__zoomIn")
                    $("#notification").addClass("animate__animated animate__zoomOut")
                },4000); //duracion de la alerta

            }
            else{
                $("#notification").removeClass("animate__animated animate__zoomIn")
                $("#notification").addClass("animate__animated animate__zoomOut")
            }
        }

    })

    //cancelar entorno
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://entorno_policia/exit', JSON.stringify({}));
            return
        }
    };


    //MOVIMIENTO DEL DIV
    dragElement(document.getElementById("menu"));

    function dragElement(elmnt) {
        var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
        if (document.getElementById(elmnt.id + "menuHeader")) {
            // if present, the header is where you move the DIV from:
            document.getElementById(elmnt.id + "menuHeader").onmousedown = dragMouseDown;
        } else {
            // otherwise, move the DIV from anywhere inside the DIV:
            elmnt.onmousedown = dragMouseDown;
        }

        function dragMouseDown(e) {
            e = e || window.event;
            e.preventDefault();
            // get the mouse cursor position at startup:
            pos3 = e.clientX;
            pos4 = e.clientY;
            document.onmouseup = closeDragElement;
            // call a function whenever the cursor moves:
            document.onmousemove = elementDrag;
        }

        function elementDrag(e) {
            e = e || window.event;
            e.preventDefault();
            // calculate the new cursor position:
            pos1 = pos3 - e.clientX;
            pos2 = pos4 - e.clientY;
            pos3 = e.clientX;
            pos4 = e.clientY;
            // set the element's new position:
            elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
            elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
        }

        function closeDragElement() {
            // stop moving when mouse button is released:
            document.onmouseup = null;
            document.onmousemove = null;
        }
    }
    //--------------------------
    //Minimizar y cerrar pestaña

    var botonCierre = $("#close");

    botonCierre.click(function(){
        $.post('http://entorno_policia/exit', JSON.stringify({}));
    })

    //Flechas para cambiar alerta

    var flechaDcha = $("#rightArrow")
    var flechaIzda = $("#leftArrow")

    function updateAlertText(){
        var nombreAlertaActual = "alerta" + currentAlert
        $("#adress").text(alertInfo[nombreAlertaActual]["nombre"] + ":" + alertInfo[nombreAlertaActual]["location"])
        $("#code").text(alertInfo[nombreAlertaActual]["codigo"])
        $("#message").text(alertInfo[nombreAlertaActual]["texto"])
        if(alertInfo[nombreAlertaActual["texto"]] === "Vehiculo forzado"){
            $("#message").css('color','red');
        }
        else{
            $("#message").css('color','white');
        }
        
        

    }

    flechaDcha.click(function(){ //flecha derecha del menu
        flechaDcha.removeClass("animate__animated animate__headShake")

        if(currentAlert < numAlertas){
            flechaDcha.addClass("animate__animated animate__headShake")
            setTimeout(() => {
                flechaDcha.removeClass("animate__animated animate__headShake")
            }, 300);


            currentAlert++;
            numAlertasText.text(currentAlert +"/" + numAlertas)

            updateAlertText()
        }
    })

    flechaIzda.click(function(){ //flecha izq del menu
        flechaIzda.removeClass("animate__animated animate__headShake")

        if(currentAlert > 1){
            flechaIzda.addClass("animate__animated animate__headShake")
            setTimeout(() => {
                flechaIzda.removeClass("animate__animated animate__headShake")
            }, 300);


            currentAlert--
            numAlertasText.text(currentAlert +"/" + numAlertas)

            updateAlertText()
        }
    })

    //botones de accion
    var eliminarAlerta = $("#deleteAlert")
    var aceptarAlerta = $("#acceptAlert")

    function deleteAlert(){
        
    
        delete alertInfo[nombreAlertaActual] //borramos en el objeto js la alerta actual
        $.post('http://entorno_policia/update', JSON.stringify({
            numeroAlertaEliminada:currentAlert,
            cantidadAlertas:numAlertas
        }));//enviamos al cliente información sobre el estado actual del panel
        var nombreAlertaActual = "alerta" + currentAlert
        numAlertas--;
        if(currentAlert>1)currentAlert--;            
        numAlertasText.text(currentAlert +"/" + numAlertas)
        if(numAlertas == 0){ //ponemos en default los mensajes
            $("#adress").text("")
            $("#message").text("No hay alertas recientes")
            $("#code").text("")
        }

    }

    eliminarAlerta.click(function(){
        
        if(numAlertas > 0){
            //animaciones
            eliminarAlerta.addClass("animate__animated animate__jello")
            setTimeout(() => {
                eliminarAlerta.removeClass("animate__animated animate__jello")
            }, 500);

            //---
            deleteAlert()
        }
    })
    aceptarAlerta.click(function(){
        if(numAlertas > 0){

            //animaciones
            aceptarAlerta.addClass("animate__animated animate__pulse")
            setTimeout(() => {
                aceptarAlerta.removeClass("animate__animated animate__pulse")
            }, 500);

            //---

            //deleteAlert() //debería eliminarse la alerta al aceptarla alguien?
            //enviar señal al cliente para que marque en el mapa solo si es policia la ubicación de la alerta
            var nombreAlertaActual = "alerta" + currentAlert
            $.post('http://entorno_policia/markOnMap',JSON.stringify({
                coordenadas:alertInfo[nombreAlertaActual]["coords"]
            }))
        }
    })

})