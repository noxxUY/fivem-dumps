$(document).keyup(function (e) {
	if (e.key === "Escape") {
		$(".container").fadeOut(300);
		$.post('http://dream_guide/focusOff');
	}
}); 

function Zaznacz(type) {
	$.post('http://dream_guide/przewodnik', JSON.stringify({ type: type}));
}    

(function () {
    let status = [];

	let renderStatus = function () {
        $(".card").empty();
	};

	window.onData = function (data) {
		if (data.update) {
			status.length = 0;

			for (let i = 0; i < data.status.length; i++) {
				status.push(data.status[i]);
			}
			renderStatus();
		}

		if (data.setDisplay) {
			$('#status_list').css({ 'opacity': data.display });
        }
        
        if (data.display == true) {
            $(".container").show();
        }
        if (data.display == false) {
            $(".container").fadeOut(100);
        }
	};

	window.onload = function (e) {
		window.addEventListener('message', function (event) {
			onData(event.data);
		});
    };

})();

document.addEventListener('DOMContentLoaded', function () {
    $(".container").hide();
});

jQuery(document).ready(function ($) {

  $('#checkbox').change(function(){
    setInterval(function () {
        moveRight();
    }, 3000);
  });
  
	var slideCount = $('#slider ul li').length;
	var slideWidth = $('#slider ul li').width();
	var slideHeight = $('#slider ul li').height();
	var sliderUlWidth = slideCount * slideWidth;
	
	$('#slider').css({ width: slideWidth, height: slideHeight });
	
	$('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
	
    $('#slider ul li:last-child').prependTo('#slider ul');

    function moveLeft() {
        $('#slider ul').animate({
            left: + slideWidth
        }, 200, function () {
            $('#slider ul li:last-child').prependTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

    function moveRight() {
        $('#slider ul').animate({
            left: - slideWidth
        }, 200, function () {
            $('#slider ul li:first-child').appendTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

    $('a.control_prev').click(function () {
        moveLeft();
    });

    $('a.control_next').click(function () {
        moveRight();
    });

});    