
$(function() {
		window.addEventListener('message', function(event) {
			if (event.data.type == 'shop') {
				$('#wrapper').show("fast");
			/*	
			var i1;
			var id = 285;
				
			if (event.data.result.length > 3) {
				for (i1 = 0; i1 < (event.data.result.length -10); i1++) { 
					
					$('#wrapper').append(
						`<div class="line" style = "top: ${id}px; position: relative;"></div>`
					);

					id = id + 285
					
				}
			}
			*/
			var i;
			$('#wrapper').append(			
				`<div class="top">
				<h4>Cantidad:</h4>
				<input type="number" id = "cantidad" value = "1" class = "textareas"></textarea></div>`
			)
			//var cantidad = document.getElementById('tk');
			for (i = 0; i < event.data.result.length; i++) {
				//var cantidad = ${event.data.result[i].item} . c
				var label = event.data.result[i].label;
				if (event.data.result[i].label == "Cigarillo") {
					label = "Cigarrillos x10"
				}
				$('#wrapper').append(
					`
					<div class = "image" id = ${event.data.result[i].item} label = ${label} count = ${event.data.result[i].count} price = ${event.data.result[i].price}>
						<img src="${event.data.result[i].src}"/>
						<h3 class = "h4">${label}</h3>
						<h4 class = "h4">$${event.data.result[i].price}</h4>
						<h5 class = "h4">En stock: ${event.data.result[i].count}x</h5>
					</div>`
				);
				
			}
			//document.getElementById(${event.data.result[i].item}).value = "1";
			document.getElementsByClassName('textareas').value = "1";
			
			if (event.data.owner == true) {

				$('#wrapper').append(
					`<div class="top">
					<button id = "bossactions" style = "top: 20%;">Menu Jefe</button>
					</div>`
				);
			}

			var CartCount;

			$('.image').on('click', function () {
				//$("#cart").load(location.href + " #cart");

				//$('.carticon').show("fast");

				//CartCount = CartCount + 1;
				var item = $(this).attr('id');
				var label = $(this).attr('label');
				var count = $(this).attr('count');
				var price = $(this).attr('price');
				
				var cantidad = document.getElementById('cantidad');
				//var cantidad = document.getElementsByClassName('textareas');
				//var cantidad = document.getElementsByClassName(item);	

				$.post('http://esx-kr-advanced-shops/buy', JSON.stringify({Count : cantidad.value, Item : item}));
				location.reload(true);
				//$.post('http://esx-kr-advanced-shops/refresh', JSON.stringify({}));	

				
				/*
				$("#" + item).hide();
				

				$.post('http://esx-kr-advanced-shops/putcart', JSON.stringify({item: item, price : price, label : label, count : count, id : id}), function( cb ) {

					$('#cart').html('');

				var i;
					for (i = 0; i < cb.length; i++) { 

						$('#cart').append(
							`<div class = "cartitem" label = ${cb[i].label} count = ${cb[i].count} price = ${cb[i].price}>
							<h6>${cb[i].label}</h4>
							<h6>$${cb[i].price} por unidad</h4>
							<h6>En stock: ${cb[i].count}</h4>
							<input type="text" id = ${cb[i].item} count = ${cb[i].count} class = "textareas" placeholder = "Cantidad?"></textarea>
							</div>`
								);
							};

							$('#cart').append(
							`
							<button class = "button" id = "buybutton" style = "position: absolute; right: 15px; top: 5px;">Comprar</button>
							<button class = "button" id = "back" style = "position: absolute; left: 15px; top: 5px;">Volver</button>
							`
						);
					});
				*/
			});
			
			$('.carticon').on('click', function () {
				$('#cart').show("fast");
				$('#wrapper').hide("fast");
				$('.carticon').hide("fast");
			});

			$("body").on("click", "#refreshcart", function() {
				$.post('http://esx-kr-advanced-shops/escape', JSON.stringify({}));
				location.reload(true);
				$('#wrapper').hide("fast");
				$('#payment').hide("fast");
				$('#cart').hide("fast");
				$.post('http://esx-kr-advanced-shops/refresh', JSON.stringify({}));
			});

			$("body").on("click", "#back", function() {
				$('#cart').hide("fast");
				$('#wrapper').show("fast");
				$('.carticon').show("fast");
			});

			$("body").on("click", "#buybutton", function() {
				var value = document.getElementsByClassName("textareas");

				for (i = 0; i < value.length; i++) {

					var isNumber = isNaN(value[i].value) === false;

					var count = $('#' + value[i].id).attr('count');

					if (parseInt(count) >= parseInt(value[i].value) && parseInt(value[i].value) != 0 && isNumber) {

						$.post('http://esx-kr-advanced-shops/escape', JSON.stringify({}));
					
						location.reload(true);

						$('#wrapper').hide("fast");
						$('#payment').hide("fast");
						$('#cart').hide("fast");
						$.post('http://esx-kr-advanced-shops/buy', JSON.stringify({Count : value[i].value, Item : value[i].id}));
					} 
					else {
						$.post('http://esx-kr-advanced-shops/notify', JSON.stringify({msg : "~r~Uno de los artículos no tiene suficiente stock o la cantidad no es válida."}));
					}
				}
			});

			
			$("body").on("click", "#bossactions", function() {
				$.post('http://esx-kr-advanced-shops/bossactions', JSON.stringify({}));
				$.post('http://esx-kr-advanced-shops/escape', JSON.stringify({}));
				location.reload(true);
				$.post('http://esx-kr-advanced-shops/emptycart', JSON.stringify({}));
				$('#wrapper').hide("fast");
				$('#payment').hide("fast");
				$('#cart').hide("fast");
			});
		}
	});

	


	document.onkeyup = function (data) {
		if (data.which == 27) { // Escape key
			$.post('http://esx-kr-advanced-shops/escape', JSON.stringify({}));
			location.reload(true);
			$.post('http://esx-kr-advanced-shops/emptycart', JSON.stringify({}));
			$('#wrapper').hide("fast");
			$('#payment').hide("fast");
			$('#cart').hide("fast");
		}
	}
});
