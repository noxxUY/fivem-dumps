window.onload = function() {

    $('#weedBody').hide();

};

window.addEventListener('message', function(event) {
    if (event.data.action == "update") {
        let fertilizer = event.data.fertilizer
        let water = event.data.water
        let status = event.data.status
        let quality = event.data.quality
        document.getElementById("fertilizer_progress").style.width = fertilizer += "%";
        document.getElementById("water_progress").style.width = water += "%";
        document.getElementById("status_progress").style.width = status += "%";
        document.getElementById("quality_progress").style.width = quality += "%";
    };

    if (event.data.action == "open") {
        window.setTimeout(function() {
            $('#weedBody').fadeIn(300);
        }, 300);
    };

    if (event.data.action == "close") {
        window.setTimeout(function() {
            $('#weedBody').fadeOut(300);
        }, 300);
    };

});