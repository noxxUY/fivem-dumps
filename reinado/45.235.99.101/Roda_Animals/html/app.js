window.addEventListener('load', function() {
    console.log('Roda Animals Started')
    $.post('https://Roda_Animals/RequestAnimals', JSON.stringify({}));
})

window.addEventListener('message', function(event) {
    var v = event.data

    switch(v.action) {
        case 'loadAnimals':
            $('.CategoriasDeAnimales').append(`
                <div class="Razas Razas-${v.model}" id=${v.model}>
                    <h1><i class="fa-solid fa-bone"></i> ${v.label} <span style="color:green;">$ ${v.price} </span></h1>
                </div>
            `)
            $(`.Razas-${v.model}`).click(function() {
                console.log(v.label, v.model, v.price)
                $('.QuieresComprar').show(500)
                $('.QuieresComprar').attr('id', v.label)
                $('.putitaInvisible').attr('id', v.model)
                $('.putitaInvisible').val(v.price)
                
            })
        break;

        case 'loadVipAnimals':
            $('.CategoriasDeAnimalesVip').append(`
            <div class="Razas Razas-${v.model}" id=${v.model}>
                <h1><i class="fa-solid fa-bone"></i> ${v.label} <span style="color:green;">$ ${v.price} </span></h1>
            </div>
            `)
            $(`.Razas-${v.model}`).click(function() {
                console.log(v.label, v.model, v.price)
                $('.QuieresComprar').show(500)
                $('.QuieresComprar').attr('id', v.label)
                $('.putitaInvisible').attr('id', v.model)
                $('.putitaInvisible').val(v.price)
                
            })
        break;

        case 'openNormal': 
            $('.contenedor').show(500)
            $('.CategoriasDeAnimales').show()
            $('.OcultarDemas').show()
        break;

        
        case 'openVip': 
            $('.contenedor').show(500)
            $('.CategoriasDeAnimalesVip').show()
            $('#vip').show()
        break;

        case 'close': 
            CloseAll()
        break;
    }
})


$(function(){
    $('#bank').click(function(){
        var nombre = $('.inputnAME').val() || 'Pipo'
        var label = $('.QuieresComprar').attr('id')
        var model = $('.putitaInvisible').attr('id')
        var price = $('.putitaInvisible').val()
        $.post('https://Roda_Animals/buyAnimal', JSON.stringify({
            nombre, label, model, price
            }
        ));
    })

    $('#money').click(function(){
        var nombre = $('.inputnAME').val() || 'Pipo'
        var label = $('.QuieresComprar').attr('id')
        var model = $('.putitaInvisible').attr('id')
        var price = $('.putitaInvisible').val()
        $.post('https://Roda_Animals/buyAnimalMoney', JSON.stringify({
            nombre, label, model, price
            }
        ));
    })

    $('#vip').click(function(){
        var nombre = $('.inputnAME').val() || 'Pipo'
        var label = $('.QuieresComprar').attr('id')
        var model = $('.putitaInvisible').attr('id')
        var price = $('.putitaInvisible').val()
        $.post('https://Roda_Animals/buyAnimalVip', JSON.stringify({
            nombre, label, model, price
            }
        ));
    })
})

function CloseAll() {
    $('.contenedor').hide(500)
    $('.QuieresComprar').hide(500)
    $('.CategoriasDeAnimales').hide()
    $('.CategoriasDeAnimalesVip').hide()
    $('.OcultarDemas').hide()
    $('#vip').hide()
    $('input').val('')
    $.post('https://Roda_Animals/exit', JSON.stringify({}));
}

$(document).keyup((e) => {
    if (e.key === "Escape") {
        $.post('https://Roda_Animals/exit', JSON.stringify({}));
        CloseAll()
    }
});

//Make close panel