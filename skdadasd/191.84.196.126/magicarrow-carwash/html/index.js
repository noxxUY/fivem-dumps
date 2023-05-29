$(function() {
    function display(bool) {
        if (bool) {
            $("#container").show();
            $(".container").show();
            $(".esya-1-gorunum").hide();
            $(".esya-2-gorunum").hide();
            $(".esya-3-gorunum").hide();
            $(".esya-4-gorunum").hide();
            $(".esya-5-gorunum").hide();
            $(".purchase-esya5").hide();
            $(".esya-6-gorunum").hide();
            $(".purchase-esya6").hide();
            $(".esya-7-gorunum").hide();
            $(".purchase-esya7").hide();
            $(".esya-8-gorunum").hide();
            $(".purchase-esya8").hide();
            $(".esya-9-gorunum").hide();
            $(".purchase-esya9").hide();
            $(".esya-10-gorunum").hide();
            $(".purchase-esya10").hide();
            $(".esya-11-gorunum").hide();
            $(".purchase-esya11").hide();
            $(".esya-12-gorunum").hide();
            $(".purchase-esya12").hide();
            $(".esya-13-gorunum").hide();
            $(".purchase-esya13").hide();
            $(".esya-14-gorunum").hide();
            $(".purchase-esya14").hide();
            $(".exitmenu2").hide();
            $(".purchase-pistol").hide();
            $(".purchase-rifle").hide();
            $(".purchase-esya3").hide();
            $(".purchase-esya4").hide();
            $(".esya-2-gorunum2").hide();
            $(".esya-8").hide();
            $(".esya-9").hide();
            $(".esya-10").hide();
            $(".esya-11").hide();
            $(".esya-12").hide();
            $(".esya-13").hide();
            $(".esya-14").hide();
            $(".sol-ok").hide();
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


    //
    document.onkeyup = function(data) {
        if (data.which == 27) {
            $(".container").show();
            $(".esya-1").show();
            $(".esya-2").show();
            $(".esya-3").show();
            $(".esya-4").show();
            $(".esya-5").show();
            $(".esya-6").show();
            $(".esya-7").show();
            $(".sag-ok").show();
            $(".esya-8").hide();
            $(".esya-9").hide();
            $(".esya-10").hide();
            $(".esya-11").hide();
            $(".esya-12").hide();
            $(".esya-13").hide();
            $(".esya-14").hide();
            $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
            return
        }
    };

    $("#esya1").click(function() {
        $(".container").hide();
        $(".esya-1-gorunum").fadeIn(1250)
        $(".purchase-pistol").show();
        $(".exitmenu2").show();
        $(".esya-2-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya2").click(function() {
        $(".esya-2-gorunum").fadeIn(1250)
        $(".purchase-rifle").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya3").click(function() {
        $(".esya-3-gorunum").fadeIn(1250)
        $(".purchase-esya3").show();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })


    $("#esya4").click(function() {
        $(".esya-4-gorunum").fadeIn(1250)
        $(".purchase-esya4").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya5").click(function() {
        $(".esya-5-gorunum").fadeIn(1250)
        $(".purchase-esya5").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya6").click(function() {
        $(".esya-6-gorunum").fadeIn(1250)
        $(".purchase-esya6").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya7").click(function() {
        $(".esya-7-gorunum").fadeIn(1250)
        $(".purchase-esya7").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya8").click(function() {
        $(".esya-8-gorunum").fadeIn(1250)
        $(".purchase-esya8").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya9").click(function() {
        $(".esya-9-gorunum").fadeIn(1250)
        $(".purchase-esya9").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya10").click(function() {
        $(".esya-10-gorunum").fadeIn(1250)
        $(".purchase-esya10").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya11").click(function() {
        $(".esya-11-gorunum").fadeIn(1250)
        $(".purchase-esya11").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya12").click(function() {
        $(".esya-12-gorunum").fadeIn(1250)
        $(".purchase-esya12").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya13").click(function() {
        $(".esya-13-gorunum").fadeIn(1250)
        $(".purchase-esya13").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-14-gorunum").hide();
        $(".purchase-esya14").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#esya14").click(function() {
        $(".esya-14-gorunum").fadeIn(1250)
        $(".purchase-esya14").show();
        $(".container").hide();
        $(".esya-1-gorunum").hide();
        $(".esya-3-gorunum").hide();
        $(".purchase-esya3").hide();
        $(".esya-4-gorunum").hide();
        $(".purchase-esya4").hide();
        $(".esya-5-gorunum").hide();
        $(".purchase-esya5").hide();
        $(".esya-6-gorunum").hide();
        $(".purchase-esya6").hide();
        $(".esya-7-gorunum").hide();
        $(".purchase-esya7").hide();
        $(".esya-8-gorunum").hide();
        $(".purchase-esya8").hide();
        $(".esya-10-gorunum").hide();
        $(".purchase-esya10").hide();
        $(".esya-11-gorunum").hide();
        $(".purchase-esya11").hide();
        $(".esya-12-gorunum").hide();
        $(".purchase-esya12").hide();
        $(".esya-13-gorunum").hide();
        $(".purchase-esya13").hide();
        $(".esya-9-gorunum").hide();
        $(".purchase-esya9").hide();
        $(".esya-2-gorunum").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#sag-ok").click(function() {
        $(".esya-1").hide();
        $(".esya-2").hide();
        $(".esya-3").hide();
        $(".esya-4").hide();
        $(".esya-5").hide();
        $(".esya-6").hide();
        $(".esya-7").hide();
        $(".sag-ok").hide();
        $(".esya-8").show();
        $(".esya-9").show();
        $(".esya-10").show();
        $(".esya-11").show();
        $(".esya-12").show();
        $(".esya-13").show();
        $(".esya-14").show();
        $(".sol-ok").show();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })

    $("#sol-ok").click(function() {
        $(".esya-1").show();
        $(".esya-2").show();
        $(".esya-3").show();
        $(".esya-4").show();
        $(".esya-5").show();
        $(".esya-6").show();
        $(".esya-7").show();
        $(".sag-ok").show();
        $(".esya-8").hide();
        $(".esya-9").hide();
        $(".esya-10").hide();
        $(".esya-11").hide();
        $(".esya-12").hide();
        $(".esya-13").hide();
        $(".esya-14").hide();
        $(".sol-ok").hide();
        $.post('http://magicarrow-blackmarket/ses', JSON.stringify({}));
        return
    })


    $("#purchase-pistol").click(function() {
        $.post('http://magicarrow-blackmarket/esya1', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    
    $("#purchase-rifle").click(function() {
        $.post('http://magicarrow-blackmarket/esya2', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya3").click(function() {
        $.post('http://magicarrow-blackmarket/esya3', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya4").click(function() {
        $.post('http://magicarrow-blackmarket/esya4', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya5").click(function() {
        $.post('http://magicarrow-blackmarket/esya5', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya6").click(function() {
        $.post('http://magicarrow-blackmarket/esya6', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya7").click(function() {
        $.post('http://magicarrow-blackmarket/esya7', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya8").click(function() {
        $.post('http://magicarrow-blackmarket/esya8', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya9").click(function() {
        $.post('http://magicarrow-blackmarket/esya9', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya10").click(function() {
        $.post('http://magicarrow-blackmarket/esya10', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya11").click(function() {
        $.post('http://magicarrow-blackmarket/esya11', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya12").click(function() {
        $.post('http://magicarrow-blackmarket/esya12', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya13").click(function() {
        $.post('http://magicarrow-blackmarket/esya13', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#purchase-esya14").click(function() {
        $.post('http://magicarrow-blackmarket/esya14', JSON.stringify({}));
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    $("#exitmenu").click(function() {
        $(".container").show();
        $(".esya-1").show();
        $(".esya-2").show();
        $(".esya-3").show();
        $(".esya-4").show();
        $(".esya-5").show();
        $(".esya-6").show();
        $(".esya-7").show();
        $(".sag-ok").show();
        $(".esya-8").hide();
        $(".esya-9").hide();
        $(".esya-10").hide();
        $(".esya-11").hide();
        $(".esya-12").hide();
        $(".esya-13").hide();
        $(".esya-14").hide();
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

    // $("#pistol-img").click(function() {
    //     $(".esya-1-gorunum").show();
    // });


    $("#close").click(function() {
        $(".container").show();
        $(".esya-1").show();
        $(".esya-2").show();
        $(".esya-3").show();
        $(".esya-4").show();
        $(".esya-5").show();
        $(".esya-6").show();
        $(".esya-7").show();
        $(".sag-ok").show();
        $(".esya-8").hide();
        $(".esya-9").hide();
        $(".esya-10").hide();
        $(".esya-11").hide();
        $(".esya-12").hide();
        $(".esya-13").hide();
        $(".esya-14").hide();
        $.post('http://magicarrow-blackmarket/exit', JSON.stringify({}));
        return
    })

})