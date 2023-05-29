$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://revivestation/exit', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('http://revivestation/exit', JSON.stringify({}));
        return
    })
    $(".btn-3").click(function () {

        var id = $("#id").val()
        
        $.post('http://revivestation/btn-revive', JSON.stringify({
            id: id
        }));
        return
    })
    $(".btn-4").click(function () {

        var id = $("#id").val()
        
        $.post('http://revivestation/btn-revivebank', JSON.stringify({
            id: id
        }));
        return
    })
})
