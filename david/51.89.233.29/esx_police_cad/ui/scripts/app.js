let showCadSystem = function(){
    $('#police-cad').show();
    $('#input-plate').focus();
    isCadSystemShowed = true;
}

let hideCadSystem = function(){
    $('#police-cad').hide();
    isCadSystemShowed = false;
}

document.onkeydown = function (data) {
    if ((data.which == 120 || data.which == 27) && isCadSystemShowed) { // || data.which == 8
        $.post('http://esx_police_cad/escape');
    }
};

$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.plate){
            $('#plate').empty().append(event.data.plate);
            $('#model').empty().append(event.data.model);
            $('#firstname').empty().append(event.data.firstname);
            $('#lastname').empty().append(event.data.lastname);
        }

        if(event.data.showCadSystem === true){
            showCadSystem();
        }

        if(event.data.showCadSystem === false){
            hideCadSystem();
        }
    });

    document.onkeydown = function (data) {
        if ((data.which == 120 || data.which == 27) && isCadSystemShowed) { // || data.which == 8
            $.post('http://esx_police_cad/escape');
            hideCadSystem();
        }
    };

    $(document).on('click','.police-cad-close',function(event){
        $.post('http://esx_police_cad/escape');
        hideCadSystem();
    });

    $(document).on('click','#search-for-plate',function(event){
        plate = JSON.stringify({ plate: $('#input-plate').val() })
        $.post('http://esx_police_cad/search-plate', plate);
    });
});