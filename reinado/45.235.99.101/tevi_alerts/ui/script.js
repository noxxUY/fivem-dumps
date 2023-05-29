$(function(){
	window.onload = function(e){
		window.addEventListener('message', function(event){

			var item = event.data;
			if (item !== undefined && item.type === "logo") {
			
				if (item.display === "tac0") {
					
					document.getElementById('Alerta').src='https://i.imgur.com/TuMFbw3.png'
				} else if (item.display === "tac1") {
					document.getElementById('Alerta').src='https://i.imgur.com/cEbfT6C.png'
				} else if (item.display === "tac2") {
					document.getElementById('Alerta').src='https://i.imgur.com/o2LPQcm.png'
				} else if (item.display === "tac3") {
					document.getElementById('Alerta').src='https://i.imgur.com/zay6QsT.png'
				}
			}
		});
	};
});