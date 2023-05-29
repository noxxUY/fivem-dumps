var timeout = new Date().getTime() + 86399000;
girando = false
var items = {
	a: {
		modelo: "18velar",
		skin: "Range Rover Velar",
		img: "img/cars/18velar.png"
	},
	b: {
		modelo: "2019chiron",
		skin: "Bugatti Chiron",
		img: "img/cars/2019chiron.png"
	},
	c: {
		modelo: "2020ss",
		skin: "Camaro SS",
		img: "img/cars/2020ss.png"
	},

	d: {
		modelo: "agerars",
		skin: "Agera",
		img: "img/cars/agerars.png"
	},

	e: {
		modelo: "ap2",
		skin: "Honda S2000",
		img: "img/cars/ap2.png"
	},
	f: {
		modelo: "ben17",
		skin: "Bentley 2017",
		img: "img/cars/ben17.png"
	},
	g: {
		modelo: "bmw8mm",
		skin: "BMW M8",
		img: "img/cars/bmw8mm.png"
	},
	h: {
		modelo: "cam8tun",
		skin: "Toyota Camry",
		img: "img/cars/cam8tun.png"
	},

	i: {
		modelo: "divo",
		skin: "Bugatti Divo",
		img: "img/cars/divo.png"
	},

	j: {
		modelo: "escalade",
		skin: "Cadillac Escalade",
		img: "img/cars/escalade.png"
	},
	k: {
		modelo: "imola",
		skin: "Pagani Imola",
		img: "img/cars/imola.png"
	},
	l: {
		modelo: "m6prior",
		skin: "BMW M6",
		img: "img/cars/m6prior.png"
	},
	m: {
		modelo: "nightblade2",
		skin: "Night Blade",
		img: "img/cars/nightblade2.png"
	},

	n: {
		modelo: "ninja250fi",
		skin: "Kawasaki Ninja",
		img: "img/cars/ninja250fi.png"
	},

	o: {
		modelo: "r8ppi",
		skin: "Audi R8",
		img: "img/cars/r8ppi.png"
	},
	p: {
		modelo: "rc16",
		skin: "RC16",
		img: "img/cars/rc16.png"
	},
	q: {
		modelo: "rs7c8wb",
		skin: "Audi RS7 mod",
		img: "img/cars/rs7c8wb.png"
	},
	r: {
		modelo: "sianr",
		skin: "Lamborghini Sian",
		img: "img/cars/sianr.png"
	},

	s: {
		modelo: "srt8",
		skin: "Jeep SRT",
		img: "img/cars/srt8.png"
	},

	t: {
		modelo: "tahoe21",
		skin: "Chevrolet Tahoe Lujosa",
		img: "img/cars/tahoe21.png"
	},
	u: {
		modelo: "terzo",
		skin: "Lamborghini Terzo Mileno",
		img: "img/cars/terzo.png"
	},
	v: {
		modelo: "vxr",
		skin: "Toyota VXR V8",
		img: "img/cars/vxr.png"
	},
	w: {
		modelo: "xre300",
		skin: "Honda 300",
		img: "img/cars/xre300.png"
	}
};

$(function () {
	$("#submit_canjear").click(function (data) {
		let inputValue = $("#input").val()
		if (inputValue.length >= 100) {
			$.post("http://hr-redeem/error", JSON.stringify({
				error: "Input was greater than 100"
			}))
			return
		} else if (!inputValue) {
			$.post("http://hr-redeem/error", JSON.stringify({
				error: "There was no value in the input field"
			}))
			return
		}
		// if there are no errors from above, we can send the data back to the original callback and hanndle it from there
		$.post('http://hr-redeem/hr-vipsystem:codeRedeem', JSON.stringify({
			text: inputValue,
		}));
		return;
	})
})

$(function () {
	$("#main").hide();
	$("#header").html(Config.header);
	$("button").html(Config.buttomn);
	$('#countdown').countdown(timeout, { elapse: true }).on('update.countdown', function (event) {
		if (event.elapsed) {
			$(this).text(Config.countdown_done);
			$("#submitbtn").attr("disabled", false);
		} else {
			$(this).text(Config.remaining + (event.strftime('%D') != "00" ? event.strftime(' %D días, %H horas, %M minutos y %S segundos') : event.strftime(' %H horas, %M minutos y %S segundos')));
			$("#submitbtn").attr("disabled", true);
		}
	});
	$('#countdown').countdown(0);

	window.addEventListener('message', function (event) {
		if (event.data.type == "toggleshow") {
			toggleshow(event.data.enable);
			if (event.data.enable && event.data.timeout != null) {
				timeout = event.data.timeout;
				$('#countdown').countdown(event.data.timeout, { elapse: true });
			}
		}
		if (event.data.type == "settimeout") {
			$('#countdown').countdown(event.data.timeout);
		}
		if (event.data.type == "ruleta") {
			generate(1);
		}
		if (event.data.type == "ruletaToggle") {
			$('.first-screen').fadeOut();
			setTimeout(function () {
				$('.roulette-screen').css("display", "flex")
			}, 1000);
		}
	});

	$("#freeform").submit(function (e) {
		e.preventDefault();
		$.post('http://hr-redeem/collect', JSON.stringify({ "t": new Date().getTime() }));
	});

	document.onkeyup = function (data) {
		if (data.which == 27) {
			$.post('http://hr-redeem/hidemenu', JSON.stringify({}));
		}
	};
});

function toggleshow(show) {
	if (!show) {
		$("#main").delay(100).animate({ height: 0 }, 700, "swing", function () { $("#main").hide(); });
	} else {
		$("#main").show();
		$("#main").delay(100).animate({ height: 500 }, 700);
	}
}

function generate(ng) {

	if (girando === false) {

		$('.raffle-roller-container').css({
			transition: "sdf",
			"margin-left": "0px"
		}, 10).html('');
		var randed2 = Math.floor(Math.random() * 22) + 1;

		for (var i = 0; i < 101; i++) {
			var element = '<div id="CardNumber' + i + '" class="item class_red_item" style="background-image:url(' + items.a.img + ');"></div>';
			var randed = randomInt(1, 856);

			if (randed >= 30 && randed < 69) {
				element = '<div id="CardNumber' + i + '" class="item class_red_item" style="background-image:url(' + items.b.img + ');"></div>';
			} else if (randed >= 69 && randed < 107) {
				element = '<div id="CardNumber' + i + '" class="item class_red_item" style="background-image:url(' + items.c.img + ');"></div>';
			} else if (randed >= 107 && randed < 146) {
				element = '<div id="CardNumber' + i + '" class="item class_red_item" style="background-image:url(' + items.d.img + ');"></div>';
			} else if (randed >= 146 && randed < 184) {
				element = '<div id="CardNumber' + i + '" class="item class_red_item" style="background-image:url(' + items.e.img + ');"></div>';
			} else if (randed >= 184 && randed < 222) {
				element = '<div id="CardNumber' + i + '" class="item class_green_item" style="background-image:url(' + items.f.img + ');"></div>';
			} else if (randed >= 222 && randed < 260) {
				element = '<div id="CardNumber' + i + '" class="item class_green_item" style="background-image:url(' + items.g.img + ');"></div>';
			} else if (randed >= 260 && randed < 298) {
				element = '<div id="CardNumber' + i + '" class="item class_green_item" style="background-image:url(' + items.h.img + ');"></div>';
			} else if (randed >= 298 && randed < 336) {
				element = '<div id="CardNumber' + i + '" class="item class_blue_item" style="background-image:url(' + items.i.img + ');"></div>';
			} else if (randed >= 336 && randed < 374) {
				element = '<div id="CardNumber' + i + '" class="item class_blue_item" style="background-image:url(' + items.j.img + ');"></div>';
			} else if (randed >= 374 && randed < 400) {
				element = '<div id="CardNumber' + i + '" class="item class_orange_item" style="background-image:url(' + items.k.img + ');"></div>';
			} else if (randed >= 400 && randed < 438) {
				element = '<div id="CardNumber' + i + '" class="item class_orange_item" style="background-image:url(' + items.l.img + ');"></div>';
			} else if (randed >= 438 && randed < 476) {
				element = '<div id="CardNumber' + i + '" class="item class_orange_item" style="background-image:url(' + items.m.img + ');"></div>';
			} else if (randed >= 476 && randed < 514) {
				element = '<div id="CardNumber' + i + '" class="item class_orange_item" style="background-image:url(' + items.n.img + ');"></div>';
			} else if (randed >= 514 && randed < 552) {
				element = '<div id="CardNumber' + i + '" class="item class_orange_item" style="background-image:url(' + items.o.img + ');"></div>';
			} else if (randed >= 552 && randed < 590) {
				element = '<div id="CardNumber' + i + '" class="item class_purple_item" style="background-image:url(' + items.p.img + ');"></div>';
			} else if (randed >= 590 && randed < 628) {
				element = '<div id="CardNumber' + i + '" class="item class_purple_item" style="background-image:url(' + items.q.img + ');"></div>';
			} else if (randed >= 628 && randed < 666) {
				element = '<div id="CardNumber' + i + '" class="item class_purple_item" style="background-image:url(' + items.r.img + ');"></div>';
			} else if (randed >= 666 && randed < 704) {
				element = '<div id="CardNumber' + i + '" class="item class_yellow_item" style="background-image:url(' + items.s.img + ');"></div>';
			} else if (randed >= 704 && randed < 742) {
				element = '<div id="CardNumber' + i + '" class="item class_yellow_item" style="background-image:url(' + items.t.img + ');"></div>';
			} else if (randed >= 742 && randed < 780) {
				element = '<div id="CardNumber' + i + '" class="item class_yellow_item" style="background-image:url(' + items.u.img + ');"></div>';
			} else if (randed >= 780 && randed < 818) {
				element = '<div id="CardNumber' + i + '" class="item class_gray_item" style="background-image:url(' + items.v.img + ');"></div>';
			} else if (randed >= 818 && randed < 856) {
				element = '<div id="CardNumber' + i + '" class="item class_gray_item" style="background-image:url(' + items.w.img + ');"></div>';
			}

			$(element).appendTo('.raffle-roller-container');
		}

		setTimeout(function () {
			if (randed2 == 22) {
				goRoll(items.w.skin, items.w.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.w.modelo}));
			}

			if (randed2 == 21) {
				goRoll(items.v.skin, items.v.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.v.modelo }));
			}

			if (randed2 == 20) {
				goRoll(items.u.skin, items.u.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.u.modelo }));
			}

			if (randed2 == 19) {
				goRoll(items.a.skin, items.a.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.a.modelo }));
			}

			else if (randed2 == 18) {
				goRoll(items.t.skin, items.t.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.t.modelo }));
			}

			else if (randed2 == 17) {
				goRoll(items.s.skin, items.s.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.s.modelo }));
			}

			else if (randed2 == 16) {
				goRoll(items.r.skin, items.r.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.r.modelo }));
			}

			else if (randed2 == 15) {
				goRoll(items.q.skin, items.q.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.q.modelo }));
			}

			else if (randed2 == 14) {
				goRoll(items.p.skin, items.p.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.p.modelo }));
			}
			else if (randed2 == 13) {
				goRoll(items.o.skin, items.o.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.o.modelo }));
			}

			else if (randed2 == 12) {
				goRoll(items.n.skin, items.n.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.n.modelo }));
			}

			else if (randed2 == 11) {
				goRoll(items.m.skin, items.m.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.m.modelo }));
			}

			else if (randed2 == 10) {
				goRoll(items.l.skin, items.l.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.l.modelo }));
			}

			else if (randed2 == 9) {
				goRoll(items.k.skin, items.k.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.k.modelo }));
			}

			else if (randed2 == 8) {
				goRoll(items.j.skin, items.j.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.j.modelo }));
			}

			else if (randed2 == 7) {
				goRoll(items.i.skin, items.i.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.i.modelo }));
			}

			else if (randed2 == 6) {
				goRoll(items.h.skin, items.h.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.h.modelo }));
			}

			else if (randed2 == 5) {
				goRoll(items.g.skin, items.g.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.g.modelo }));
			}
			else if (randed2 == 4) {
				goRoll(items.f.skin, items.f.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.f.modelo }));
			}

			else if (randed2 == 3) {
				goRoll(items.e.skin, items.e.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.e.modelo }));
			}

			else if (randed2 == 2) {
				goRoll(items.d.skin, items.d.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.d.modelo }));
			}

			else if (randed2 == 1) {
				goRoll(items.c.skin, items.c.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.c.modelo }));
			}

			else {
				goRoll(items.b.skin, items.b.img);
				$.post('http://hr-redeem/obtengoCoche', JSON.stringify({ "t": new Date().getTime(), coche: randed2, modelo: items.b.modelo }));
			}
		}, 500);
		//var girando = true
	} else if (girando === true) {
		// console.log("ya estás girando")
	}


}

function goRoll(skin, skinimg) {
	girando = true
	$('.raffle-roller-container').css({
		transition: "all 8s cubic-bezier(.08,.6,0,1)"
	});
	$('#CardNumber78').css({
		"background-image": "url(" + skinimg + ")"
	});
	setTimeout(function () {
		$('.win-alert').css("display", "flex")

		$('.win-alert').animate({
			top: "50%",
		}, 1000)

		$('.confetti').fadeIn();
		$('.confetti2').fadeIn();
		$('.confetti3').fadeIn();
		$('.confetti4').fadeIn();

		$('#CardNumber78').addClass('winning-item');
		$('#rolled').html(skin);
		var win_element = "<div class='item class_red_item' style='background-image: url(" + skinimg + ")'></div>";
		$(win_element).appendTo('.win-img');
	}, 8500);
	$('.raffle-roller-container').css('margin-left', '-6770px');
}
function randomInt(min, max) {
	return Math.floor(Math.random() * (max - min)) + min;
}

$(document).on("click", '.accept', function (e) {
	$('.win-alert').fadeOut();
	$('.confetti').fadeOut();
	$('.confetti2').fadeOut();
	$('.confetti3').fadeOut();
	$('.confetti4').fadeOut();
	// window.location=''
	girando = false
	e.preventDefault();
	// $.post('http://hr-redeem/premio', JSON.stringify({ "t": new Date().getTime() }));
})

$(document).on("click", '.roulette-btn', function () {
	$.post('http://hr-redeem/ruleta_prueba');
})

$(document).on("click", ".redeem-btn", function () {
	$('.first-screen').fadeOut();
	setTimeout(function () {
		$('.redeem-screen').css("display", "flex")
	}, 1000);
})

$(document).on("click", ".exit", function () {
	$('.redeem-screen').fadeOut();
	$('.roulette-screen').fadeOut();
	setTimeout(function () {
		$('.first-screen').css("display", "flex")
	}, 1000);
})
