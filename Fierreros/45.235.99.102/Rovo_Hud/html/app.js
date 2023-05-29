window.addEventListener("message", function(event) {
    var v = event.data
    let formatodinero = Intl.NumberFormat('en-US');
    var velocidad = new  ldBar(".velocimetro2")
    var motor = new ldBar(".motor2")
    var gasolina = new ldBar(".combustible2")

    switch (v.action) {
        case 'update': 
            $('.todoelHUd').show()
            $('.bar1').css({'height': `${v.health}%`})
            $('.bar2').css({'height': `${v.armour}%`})
            $('.bar3').css({'height': `${v.food}%`})
            $('.bar4').css({'height': `${v.water}%`})
            $('.bar5').css({'height': `${v.stamina}%`})
            $('.bar6').css({'height': `${v.stress}%`})

            $('.texto1').text(`${v.health.toFixed(0)}%`)
            $('.texto2').text(`${v.armour.toFixed(0)}%`)
            $('.texto3').text(`${v.food.toFixed(0)}%`)
            $('.texto4').text(`${v.water.toFixed(0)}%`)
            $('.texto5').text(`${v.stamina.toFixed(0)}%`)
            $('.texto6').text(`${v.stress.toFixed(0)}%`)

            $('.laid').text('ID: '+v.pid)
            if (v.talking == true) {
                $('li[id^="microJs"]').addClass('active')
            } else {
                $('li[id^="microJs"]').removeClass('active')
            }
        break;

        case 'updateOnlinePlayers': 
            $('.cantusers').text(v.player_count)
        break;


        case 'changeLimit': 
            if (v.maxSpeed == true) {
                $('.imgspeed img').attr('src', `img/speed2.png`)
            } else {
                $('.imgspeed img').attr('src', `img/speed.png`)
            }
         
        break;

        case 'showAmmo': 
            $('.armas').show()
            $('.armas span').text(`${v.cargada} / ${v.resta}`)
        break;

        case 'hideAmmo':
            $('.armas').hide()
        break;

        case 'showPanel':
            $('.panel').show()

        break;


        case 'ConfigureHud':
            UpdateChecks()
        break;

        case 'hidePanel':
            $('.panel').hide()
        break;

        case 'showCarhud': 
            $('.velocimetro').show()
            velocidad.set(v.vel/3)
            motor.set(v.carhealth)
            gasolina.set(v.gasolina)
            $('.numspeed p').text(v.vel.toFixed(0))
            $('.textmotor p').text(v.carhealth.toFixed(0)+'%')

            if (v.cinturon == true) {
                $('.imgcinto img').attr('src', 'img/cinto2.png')
            } else {
                $('.imgcinto img').attr('src', 'img/cinto.png')
            }

            if(v.vehicleLights == 1 && v.vehicleHighlights == 0) {
                $('.imgluz img').attr('src', 'img/luz2.png')
            } else if(v.vehicleLights == 1 && v.vehicleHighlights == 1 || v.vehicleLights == 0 && v.vehicleHighlights == 1){
                $('.imgluz img').attr('src', 'img/luz2.png')
            } else {
                $('.imgluz img').attr('src', 'img/luz.png')
            }

        break;

        case 'hideCarhud':
                $('.velocimetro').hide()
        break;

        case 'UpdateSociety':
            $('.societyjs').text(`${formatodinero.format(v.money) || 0} `)
        break;

        case 'showSociety':
            $('.societyjs').text(`${formatodinero.format(v.money) || 0} `)
            $('.sociedad').show()
        break;

        case 'hideSociety':
            $('.sociedad').hide()
        break;

        case 'UpdateMoney': 
                $('.moneyjs').text(`${formatodinero.format(v.money)}`)
                $('.blackjs').text(`${formatodinero.format(v.black)}`)
                $('.bankjs').text(`${formatodinero.format(v.bank)}`)
                $('.vipjs').text(`${formatodinero.format(v.vip)}`)
                
        break;


        case 'UpdateJob':
            $('.job').text(`${v.job}`)
            $('.range').text(`${v.grade}`)
        break;

        case 'hideAllHud': 
            $('.todoelHUd').hide()
        break;
    }
})


$(function(){
    $(".colorVida").on("input",(e)=>{        
        $(".bar1").css('background-color', $(e.target).val());
        saveId('colorVida', $(e.target).val())
    });

    $(".colorChaleco").on("input",(e)=>{        
        $(".bar2").css('background-color', $(e.target).val());
        saveId('colorChaleco', $(e.target).val())
    });

    $(".colorComida").on("input",(e)=>{        
        $(".bar3").css('background-color', $(e.target).val());
        saveId('colorComida', $(e.target).val())
    });

    $(".colorAgua").on("input",(e)=>{
        $(".bar4").css('background-color', $(e.target).val());
        saveId('colorAgua', $(e.target).val())
    });

    $(".colorStamina").on("input",(e)=>{
        $(".bar5").css('background-color', $(e.target).val());
        saveId('colorStamina', $(e.target).val())
    });

    $(".colorStress").on("input",(e)=>{
        $(".bar6").css('background-color', $(e.target).val());
        saveId('colorStress', $(e.target).val())
    });

    $('.colorVehicle').on('input', (e) => {
        $('.ldBar.velocimetro2 path.mainline').css('stroke', $(e.target).val())
        saveId('colorVehicle', $(e.target).val())
    });

    $('.fuelVehicle').on('input', (e) => {
        $('.ldBar.combustible2 path.mainline').css('stroke', $(e.target).val())
        saveId('colorVehicle3', $(e.target).val())
    });

    $('.timeColor').on('input', (e) => {
        $('.relojito i').css('color', $(e.target).val())
        saveId('timeColor', $(e.target).val())
    });

    $('.idColor').on('input', (e) => {
        $('.laid').css('background-color', $(e.target).val())
        saveId('idColor', $(e.target).val())
    });

    $('.jobColor').on('input', (e) => {
        $('.trabajo span').css('color', $(e.target).val())
        saveId('jobColor', $(e.target).val())
    });


    $('.motorVehicle').on('input', (e) => {
        $('.ldBar.motor2 path.mainline').css('stroke', $(e.target).val())
        saveId('colorVehicle2', $(e.target).val())
    });

    $('.onlineColor').on('input', (e) => {
        $('.usernumeros i').css('color', $(e.target).val())
        saveId('onlineColor', $(e.target).val())
    });


    $("#vida").on("dragstop", function(event, ui) {
        dragVidaTop = ui.position.top;
        dragVidaLeft = ui.position.left;
        saveId('vidaTop', dragVidaTop)
        saveId('vidaLeft', dragVidaLeft)
    }); 

    $("#chaleco").on("dragstop", function(event, ui) {
        dragChalecoTop = ui.position.top;
        dragChalecoLeft = ui.position.left;
        saveId('chalecoTop', dragChalecoTop)
        saveId('chalecoLeft', dragChalecoLeft)
    });

    $("#comida").on("dragstop", function(event, ui) {
        dragComidaTop = ui.position.top;
        dragComidaLeft = ui.position.left;
        saveId('comidaTop', dragComidaTop)
        saveId('comidaLeft', dragComidaLeft)
    });

    $("#agua").on("dragstop", function(event, ui) {
        dragAguaTop = ui.position.top;
        dragAguaLeft = ui.position.left;
        saveId('aguaTop', dragAguaTop)
        saveId('aguaLeft', dragAguaLeft)
    });

    $("#stamina").on("dragstop", function(event, ui) {
        dragStaminaTop = ui.position.top;
        dragStaminaLeft = ui.position.left;
        saveId('staminaTop', dragStaminaTop)
        saveId('staminaLeft', dragStaminaLeft)
    });

    $('.TodoElCarHudxD').on('dragstop', (e) => {
        dragVelocimetroTop = $(e.target).offset().top;
        dragVelocimetroLeft = $(e.target).offset().left;
        saveId('velocimetroTop', dragVelocimetroTop)
        saveId('velocimetroLeft', dragVelocimetroLeft)
    });

    $('#stress').on('dragstop', function(event, ui) {
        dragStressTop = ui.position.top;
        dragStressLeft = ui.position.left;
        saveId('stressTop', dragStressTop)
        saveId('stressLeft', dragStressLeft)
    });

    $('.moveThinkMoney').on('dragstop', function(event, ui) {
        dragMoneyTop = ui.position.top;
        dragMoneyLeft = ui.position.left;
        saveId('moneyTop', dragMoneyTop)
        saveId('moneyLeft', dragMoneyLeft)
    });

    $('.movejObxd').on('dragstop', function(event, ui) {
        dragJobTop = ui.position.top;
        dragJobLeft = ui.position.left;
        saveId('jobTop', dragJobTop)
        saveId('jobLeft', dragJobLeft)
    });

    $('.moveAllUserInfo').on('dragstop', function(event, ui) {
        dragUserInfoTop = ui.position.top;
        dragUserInfoLeft = ui.position.left;
        saveId('userTop', dragUserInfoTop)
        saveId('userLeft', dragUserInfoLeft)
    })

    $('.reset').click(function(){
        RemoveLocal()
        ResetPosition()
    })
})

$(document).keyup((e) => {
    if (e.key === "Escape") {
        CloseAll()
    }
});


function saveId(item, check) {
    localStorage.setItem(item, check);
}

function GetSaveId(item) {
    return localStorage.getItem(item);
}

function CloseAll() {
    $('.panel').fadeOut(100)
    SaveChecks()
    $.post('https://Rovo_Hud/exit', JSON.stringify({}));
}

// Make load event
window.addEventListener("load", function() {
    LoadColors()
    LoadChecks()
    UpdateChecks()
    LoadPosition()
});


function SaveChecks() {
    var vidaCheck = $('#1')[0];
    var chalecoCheck = $('#2')[0];
    var comidaCheck = $('#3')[0];
    var aguaCheck = $('#4')[0];
    var staminaCheck = $('#5')[0];
    var stressCheck = $('#23')[0];
    var timeCheck = $('#7')[0];
    var onlineCheck = $('#8')[0];
    var idCheck = $('#9')[0];
    var fuelCheck = $('#10')[0];
    var motorCheck = $('#11')[0];
    var jobCheck = $('#15')[0];
    var moneyCheck = $('#16')[0];

    saveId('vidaCheck', vidaCheck.checked)
    saveId('chalecoCheck', chalecoCheck.checked)
    saveId('comidaCheck', comidaCheck.checked)
    saveId('aguaCheck', aguaCheck.checked)
    saveId('staminaCheck', staminaCheck.checked)
    saveId('stressCheck', stressCheck.checked)
    saveId('timeCheck', timeCheck.checked)
    saveId('idCheck', idCheck.checked)
    saveId('onlineCheck', onlineCheck.checked)
    saveId('fuelCheck', fuelCheck.checked)
    saveId('motorCheck', motorCheck.checked)
    saveId('jobCheck', jobCheck.checked)
    saveId('moneyCheck', moneyCheck.checked)
}
var NewUser = GetSaveId('NewUserVariableV22') || 'yes'
function LoadChecks() {
    if (NewUser == 'no') {
        var vidaCheck = JSON.parse(GetSaveId('vidaCheck'))
        var chalecoCheck = JSON.parse(GetSaveId('chalecoCheck'))
        var comidaCheck = JSON.parse(GetSaveId('comidaCheck'))
        var aguaCheck = JSON.parse(GetSaveId('aguaCheck'))
        var staminaCheck = JSON.parse(GetSaveId('staminaCheck'))
        var stressCheck = JSON.parse(GetSaveId('stressCheck'))
        var timeCheck = JSON.parse(GetSaveId('timeCheck'))
        var idCheck = JSON.parse(GetSaveId('idCheck'))
        var onlineCheck = JSON.parse(GetSaveId('onlineCheck'))
        var fuelCheck = JSON.parse(GetSaveId('fuelCheck'))
        var motorCheck = JSON.parse(GetSaveId('motorCheck'))
        var jobCheck = JSON.parse(GetSaveId('jobCheck'))
        var moneyCheck = JSON.parse(GetSaveId('moneyCheck'))
    
        $('#1').attr('checked', vidaCheck)
        $('#2').attr('checked', chalecoCheck)
        $('#3').attr('checked', comidaCheck)
        $('#4').attr('checked', aguaCheck)
        $('#5').attr('checked', staminaCheck)
        $('#7').attr('checked', timeCheck)
        $('#8').attr('checked', onlineCheck)
        $('#9').attr('checked', idCheck)
        $('#10').attr('checked', fuelCheck)
        $('#11').attr('checked', motorCheck)
        $('#15').attr('checked', jobCheck)
        $('#23').attr('checked', stressCheck)
        $('#16').attr('checked', moneyCheck)
    } else {
        saveId('NewUserVariableV22', 'no')
        $('#1').attr('checked', true) // Show health
        $('#2').attr('checked', true) // Show Armour
        $('#3').attr('checked', true) // Show food
        $('#4').attr('checked', true) // show water
        $('#5').attr('checked', true) // show Stamina
        $('#7').attr('checked', true) // show time
        $('#8').attr('checked', true) // show online
        $('#9').attr('checked', true) // show id
        $('#10').attr('checked', true) // show fuel
        $('#11').attr('checked', true) // show motor
        $('#15').attr('checked', true) // show job
        $('#23').attr('checked', true) // show stress
        $('#16').attr('checked', true) // show money

        SaveChecks()
    }

}

function LoadColors() {
    let colorVida = GetSaveId('colorVida')
    let colorChaleco = GetSaveId('colorChaleco')
    let colorComida = GetSaveId('colorComida')
    let colorAgua = GetSaveId('colorAgua')
    let colorStamina = GetSaveId('colorStamina')
    let colorStress = GetSaveId('colorStress')
    let colorVehicle = GetSaveId('colorVehicle')
    let colorVehicle2 = GetSaveId('colorVehicle2')
    let colorVehicle3 = GetSaveId('colorVehicle3')
    let timeColor = GetSaveId('timeColor')
    let idColor = GetSaveId('idColor')
    let jobColor = GetSaveId('jobColor')
    let onlineColor = GetSaveId('onlineColor')

    $(".bar1").css('background-color', colorVida || '#ff0a0a');
    $(".bar2").css('background-color', colorChaleco || '#1568f4');
    $(".bar3").css('background-color', colorComida || '#fd5900');
    $(".bar4").css('background-color', colorAgua || '#2c92e0');
    $(".bar5").css('background-color', colorStamina || '#f9e814');
    $(".bar6").css('background-color', colorStress || '#ff00e6');

    $('.colorVida').val(colorVida || '#ff0a0a')
    $('.colorChaleco').val(colorChaleco || '#1568f4')
    $('.colorComida').val(colorComida || '#fd5900')
    $('.colorAgua').val(colorAgua || '#2c92e0')
    $('.colorStamina').val(colorStamina || '#f9e814')
    $('.colorStress').val(colorStress || '#ff00e6')
    $('.colorVehicle').val(colorVehicle || '#f9e814')
    $('.fuelVehicle').val(colorVehicle3 || '#f9e814')
    $('.motorVehicle').val(colorVehicle2 || '#f9e814')
    $('.timeColor').val(timeColor || '#f9e814')
    $('.idColor').val(idColor || '#f9e814')
    $('.jobColor').val(jobColor || '#ffffff')
    $('.onlineColor').val(onlineColor || '#f9e814')

    $('.ldBar.velocimetro2 path.mainline').css('stroke', colorVehicle || '#f9e814')
    $('.ldBar.motor2 path.mainline').css('stroke', colorVehicle2 || '#f9e814')
    $('.ldBar.combustible2 path.mainline').css('stroke', colorVehicle3 || '#f9e814')

    $('.relojito i').css('color', timeColor || '#f9e814')
    $('.laid').css('background-color', idColor || '#f9e814')
    $('.usernumeros i').css('color', onlineColor || '#f9e814')
    $('.trabajo span').css('color', jobColor || '#ffffff')
}


function UpdateChecks() {
    if($('#8').is(':checked')) {
        $('.cantidad').css({'opacity':'1'})
    } else {
        $('.cantidad').css({'opacity':'0'})
    }

    if($('#1').is(':checked')) {
        $('#vida').css({'opacity':'1'})
    } else {
        $('#vida').css({'opacity':'0'})
    }

    if($('#2').is(':checked')) {
        $('#chaleco').css({'opacity':'1'})
    } else {
        $('#chaleco').css({'opacity':'0'})
    }

    if($('#23').is(':checked')) {
        $('#stress').css({'opacity':'1'})
    } else {
        $('#stress').css({'opacity':'0'})
    }

    if($('#3').is(':checked')) {
        $('#comida').css({'opacity':'1'})
    } else {
        $('#comida').css({'opacity':'0'})
    }

    if($('#4').is(':checked')) {
        $('#agua').css({'opacity':'1'})
    } else {
        $('#agua').css({'opacity':'0'})
    }

    if($('#5').is(':checked')) {
        $('#stamina').css({'opacity':'1'})
    } else {
        $('#stamina').css({'opacity':'0'})
    }

    if($('#9').is(':checked')) {
        $('.laid').show()
    } else {
        $('.laid').hide()
    }

    if($('#15').is(':checked')) {
         $('.trabajo').css({'opacity':'1'})
    } else {
        $('.trabajo').css({'opacity':'0'})
    }

    if($('#16').is(':checked')) {
        $('.moveThinkMoney').css({'opacity':'1'})
    } else {
        $('.moveThinkMoney').css({'opacity':'0'})
    }

    if($('#7').is(':checked')) {
        $('.relojito').show()
    } else {
        $('.relojito').hide()
    }

    if($('#10').is(':checked')) {
        $('.combustible2').show()
        $('.imggasoil').show()
        $('.imgcinto img').css({'right': '4.9vw'})
        $('.imgluz img').css({'right': '7vw'})
        $('.imgspeed img').css({'right': '9.1vw'})
    } else {
        $('.combustible2').hide()
        $('.imggasoil').hide()
        $('.imgcinto img').css({'right': '3.6vw'})
        $('.imgluz img').css({'right': '6vw'})
        $('.imgspeed img').css({'right': '8.5vw'})
    }

    if($('#11').is(':checked')) {
        $('.motor2').show()
        $('.imgtmotor').show()
        $('.textmotor').show()
    } else {
        $('.motor2').hide()
        $('.imgtmotor').hide()
        $('.textmotor').hide()
    }

    $('#vida').draggable()
    $('#chaleco').draggable()
    $('#stress').draggable()
    $('#comida').draggable()
    $('#agua').draggable()
    $('#stamina').draggable()
    $('.TodoElCarHudxD').draggable()
    $('.moveThinkMoney').draggable()
    $('.movejObxd').draggable()
    $('.moveAllUserInfo').draggable()
}


function LoadPosition() {
    $('#vida').animate({ top: GetSaveId('vidaTop'), left: GetSaveId('vidaLeft')})
    $('#chaleco').animate({ top: GetSaveId('chalecoTop'), left: GetSaveId('chalecoLeft')})
    $('#stress').animate({ top: GetSaveId('stressTop'), left: GetSaveId('stressLeft')})
    $('#comida').animate({ top: GetSaveId('comidaTop'), left: GetSaveId('comidaLeft')})
    $('#agua').animate({ top: GetSaveId('aguaTop'), left: GetSaveId('aguaLeft')})
    $('#stamina').animate({ top: GetSaveId('staminaTop'), left: GetSaveId('staminaLeft')})
    $('.TodoElCarHudxD').animate({ top: GetSaveId('velocimetroTop') || '55vw', left: GetSaveId('velocimetroLeft')|| '0vw'})
    $('.moveThinkMoney').animate({ top: GetSaveId('moneyTop') || '0vw', left: GetSaveId('moneyLeft')|| '0vw'})
    $('.movejObxd').animate({ top: GetSaveId('jobTop') || '0vw', left: GetSaveId('jobLeft')|| '0vw'})
    $('.moveAllUserInfo').animate({ top: GetSaveId('userTop') || '0vw', left: GetSaveId('userLeft')|| '0vw'})
}

function ResetPosition() {
    $('#vida').animate({ top: '0vw', left: '0vw'})
    $('#chaleco').animate({ top: '0vw', left: '0vw'})
    $('#comida').animate({ top: '0vw', left: '0vw'})
    $('#stress').animate({ top: '0vw', left: '0vw'})
    $('#agua').animate({ top: '0vw', left: '0vw'})
    $('#stamina').animate({ top: '0vw', left: '0vw'})
    $('.moveThinkMoney').animate({ top: '0vw', left: '0vw'})
    $('.TodoElCarHudxD').animate({ top: '55vw', left: '0vw'})
    $('.movejObxd').animate({ top: '0vw', left: '0vw'})
    $('.moveAllUserInfo').animate({ top: '0vw', left: '0vw'})
}

function ByeLocal(item) {
    localStorage.removeItem(item)
}

function RemoveLocal() {
    ByeLocal('vidaTop')
    ByeLocal('vidaLeft')
    ByeLocal('chalecoTop')
    ByeLocal('chalecoLeft')
    ByeLocal('comidaTop')
    ByeLocal('comidaLeft')
    ByeLocal('aguaTop')
    ByeLocal('aguaLeft')
    ByeLocal('staminaTop')
    ByeLocal('staminaLeft')
    ByeLocal('stressTop')
    ByeLocal('stressLeft')
    ByeLocal('moneyTop')
    ByeLocal('moneyLeft')
    ByeLocal('jobTop')
    ByeLocal('jobLeft')
    ByeLocal('velocimetroTop')
    ByeLocal('velocimetroLeft')
    ByeLocal('colorComida')
    ByeLocal('colorAgua')
    ByeLocal('colorStamina')
    ByeLocal('colorVehicle')
    ByeLocal('colorVehicle2')
    ByeLocal('colorVehicle3')
    ByeLocal('timeColor')
    ByeLocal('idColor')

    ByeLocal('onlineColor')
    ByeLocal('userTop')
    ByeLocal('userLeft')
    ByeLocal('vidaCheck')
    ByeLocal('chalecoCheck')
    ByeLocal('comidaCheck')
    ByeLocal('aguaCheck')
    ByeLocal('stressCheck')
    ByeLocal('staminaCheck')
    ByeLocal('velocimetroCheck')
    ByeLocal('timeCheck')
    ByeLocal('idCheck')
    ByeLocal('onlineCheck')

    $('#1').attr('checked', true)
    $('#2').attr('checked', true)
    $('#3').attr('checked', true)
    $('#4').attr('checked', true)
    $('#5').attr('checked', true)
    $('#6').attr('checked', true)
    $('#7').attr('checked', true)
    $('#8').attr('checked', true)
    $('#9').attr('checked', true)
    $('#10').attr('checked', true)
    $('#11').attr('checked', true)
    $('#15').attr('checked', true)
    $('#16').attr('checked', true)
    $('#23').attr('checked', true)
}