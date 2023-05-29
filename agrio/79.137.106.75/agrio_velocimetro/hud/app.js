
console.log("JS Loaded")
$(function(){
    window.addEventListener("message", function(event){
        var cb = event.data
        if(cb.action == "updateVehicleInfo"){
            $(".container").fadeIn()

            if(cb.vehicleSpeed >= 100){
                document.getElementById("velocidadSpeed").innerHTML = cb.vehicleSpeed;
            }else if(cb.vehicleSpeed >= 10){
                document.getElementById("velocidadSpeed").innerHTML = "0" + cb.vehicleSpeed;
            }else{
                document.getElementById("velocidadSpeed").innerHTML = "00" + cb.vehicleSpeed;
            }
            var bar = document.querySelector('#rpm')
            if(getComputedStyle(bar).getPropertyValue('--scroll') >= "60%"){
                var s = document.querySelector('#rpm');
                s.style.setProperty('--progres', "red");
            }else if(getComputedStyle(bar).getPropertyValue('--scroll') >= "40%"){
                var s = document.querySelector('#rpm');
                s.style.setProperty('--progres', "yellow");
            }else{
                var s = document.querySelector('#rpm');
                s.style.setProperty('--progres', cb.colorVar);
            }
                
            document.getElementById("saludText").innerHTML = cb.saludCar;
            document.getElementById("fuelText").innerHTML = cb.fuel;
            // document.getElementById("marcha").innerHTML = "M" + cb.vehicleGear;
            document.querySelector('#rpm').style.setProperty('--scroll', cb.vehicleRPM + '%');
            // CINTURÓN
            if(cb.type == "8" || cb.type == 16 || cb.type == 15 || cb.type == 13){
                $("#seatbelt").fadeOut();
            }else{
                if(cb.seatbelt === true){
                    $("#seatbelt").removeClass('parpadea');
                    $("#seatbelt").fadeOut();
                }else{
                    $("#seatbelt").addClass('parpadea');
                    $("#seatbelt").fadeIn();
                }
            }
            if(cb.vehicleSiren === true){
                $("#velocidadSpeed").addClass('emergencia');
            }else{
                $("#velocidadSpeed").removeClass('emergencia');
            }
            if(cb.vehicleCruiser === "on"){
                $("#cruiser").fadeIn();
            }else if(cb.vehicleCruiser === "off"){
                $("#cruiser").fadeOut();
            }
            if(cb.lightvehicle === "off"){
                $("#carlight").fadeOut();
            }else if(cb.lightvehicle === "normal"){
                $("#carlight").fadeIn();
                $("#cortas").fadeIn();
                $("#largas").fadeOut();
            }else if(cb.lightvehicle === "hight"){
                $("#carlight").fadeIn();
                $("#largas").fadeIn();
                $("#cortas").fadeOut();
            }
            var r = document.querySelector(':root');
            r.style.setProperty('--color', cb.colorVar);
            // $(".text").css({color: cb.colorVar})
            
            // let rpm = cb.vehicleRPM;
            // itemsToSelect=0;
            // lastItem=0;
          
            // switch (true) {
            //     case rpm > 10:
            //         itemsToSelect=4;
            //     case rpm > 30:
            //         itemsToSelect=9;
            //     case rpm > 60:
            //         itemsToSelect=15;
            //     break;
            // }
        
            // console.log("rpm=" + rpm)
            // console.log(itemsToSelect)
            // let items = document.querySelectorAll('.item');
            // Array.from(items).slice(lastItem, itemsToSelect).map((item) => {
            //     item.classList.add('fill');
            // })
            $(".container").draggable();

        }else if(cb.action === "hideHUD"){
            $(".container").fadeOut()
        }
    })
})

// $(function() {
//     $(".container").draggable();
// });

