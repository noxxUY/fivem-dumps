window.addEventListener("message", function(event) {
    var v = event.data

    switch (v.action) {
        case 'open':
                $('.menu h1').text(`Bienvenido ${v.nombre}`)
                $('.menu h2').text(`Tu porcentaje de lavado es ${v.porcentaje}%`)
                $('.savepo').val(v.porcentaje)
                $('.menu').fadeIn(1000)
        break;

        case 'exit':
            $('.menu').fadeOut(1000)
        break;

    }
});

$(document).keyup((e) => {
    if (e.key === "Escape") {
        setTimeout(() => {
            $.post('https://Roda_Lavado/exit', JSON.stringify({}));
        }, 300);
        let formulario = document.getElementById('formul')
        formulario.reset()
    }
});


$(function() {
    $('.btnps').click(function() {
            money = $('.money').val()
            porcentaje = $('.savepo').val()
            $.post('https://Roda_Lavado/sendserver', JSON.stringify({
                money : money, 
                porcentaje : porcentaje,
            })
        );
    });
});