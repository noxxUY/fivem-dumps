window.addEventListener('load', function() {
    console.log('Roda WeaponShop Started')
})

window.addEventListener('message', function(event) {
    var v = event.data

    switch(v.action) {
        case 'purgaIniciada':
            $('.purgaIniciada').show(250)
            $('.purgaFinalizada').hide(250)
        break;

        case 'purgaFinalizada':
            $('.purgaFinalizada').show(250)
            $('.purgaIniciada').hide(250)
        break;

    }
})

$(function(){
    $('.joinpurga').click(function(){
        $.post('https://lapurga/joinpurga', JSON.stringify({}));
        CloseAll()
    });
})

$(document).keyup((e) => {
    
    if (e.key === "Escape") {
            CloseAll()
    }
});

function CloseAll() {
    $('.purgaIniciada').hide(250)
    $('.purgaFinalizada').hide(250)
    $.post('https://lapurga/exit', JSON.stringify({}));
}