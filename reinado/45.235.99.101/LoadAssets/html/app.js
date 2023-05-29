window.addEventListener('load', function() {
    console.log('Roda WeaponShop Started')
})

window.addEventListener('message', function(event) {
    var v = event.data

    switch(v.action) {
        case 'openAssets':
            $('.contenedor').fadeIn(500)
        break;

        case 'GetCheck': 
            UpdateChecks()
        break; 
    }
})

$(function(){
    $('#mapas').click(function(){
        ShowStatus('download')
        $(`#mapas`).prop('disabled', true)
        $(`#mapas`).addClass('fa-fade')
        $.post('https://LoadAssets/ChooseOption', JSON.stringify({option: 'mapas'}))
    })
    $('#vehiculos').click(function(){
        ShowStatus('download')
        $(`#vehiculos`).prop('disabled', true)
        $(`#vehiculos`).addClass('fa-fade')
        $.post('https://LoadAssets/ChooseOption', JSON.stringify({option: 'vehiculos'}))
    })
    $('#ropas').click(function(){
        ShowStatus('download')
        $(`#ropas`).prop('disabled', true)
        $(`#ropas`).addClass('fa-fade')
        $.post('https://LoadAssets/ChooseOption', JSON.stringify({option: 'ropas'}))
    })
})

function ShowStatus(idToShow) {
    if (idToShow == 'download') {
        $('.status').html(`
            <i id="download" class="fa-solid fa-cloud-arrow-down fa-fade"></i> downloading... <br> 
        `)
    } else if (idToShow == 'complete') {
        $('.status').html(`
            <i id="complete" class="fa-solid fa-thumbs-up"></i> Completed
        `)
    }
}


$(document).keyup((e) => {
    if (e.key === "Escape") {
        $('.contenedor').fadeOut(500)
        $.post('https://LoadAssets/exit', JSON.stringify({}));
    }
});