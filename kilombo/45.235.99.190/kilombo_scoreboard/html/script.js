$(function() {
	window.addEventListener('message', function(event) {
		switch (event.data.action) {
			case 'enable':
				$('#wrap').fadeIn();
				break;

			case 'toggleID':
				if (event.data.state) {
					$('td:nth-child(2),th:nth-child(2)').show();
				} else {
					$('td:nth-child(2),th:nth-child(2)').hide();
				}

				break;

			case 'updatePlayerJobs':
				var jobs = event.data.jobs;
				$('#player_count').html(jobs.player_count);
				$('#ems').html(jobs.ems);
				$('#police').html(jobs.police);
				$('#gna').html(jobs.gna);
				$('#mechanic2').html(jobs.mechanic2);
				$('#mechanic3').html(jobs.mechanic3);
				$('#mechanic').html(jobs.mechanic);
				break;

			case 'updatePlayerList':
				$('.playerlist tr:gt(0)').remove();
				$('.playerlist').append(event.data.players);
				sortPlayerList();
				break;

			case 'updatePing':
				updatePing(event.data.players);
				break;

			case 'apagar':
				$('#wrap').fadeOut();
				$.post('http://kilombo_scoreboard/onCloseMenu');
			break;

			case 'updateServerInfo':
				if (event.data.maxPlayers) {
					$('#max_players').html(event.data.maxPlayers);
				}

				if (event.data.uptime) {
					$('#server_uptime').html(event.data.uptime);
				}

				if (event.data.playTime) {
					$('#play_time').html(event.data.playTime);
				}

				if (event.data.playersInQueue) {
					$('#players_in_queue').html(event.data.playersInQueue);
				}

				break;

			default:
				break;
		}
	});


	document.onkeyup = function (event) {
		if (event.which == 27 ) {
			$('#wrap').fadeOut();
			$.post('http://kilombo_scoreboard/onCloseMenu');
		}
	};
});

function sortPlayerList() {
	var table = $('.playerlist'),
		rows = $('tr:not(:first-child)', table);

	rows.sort(function(a, b) {
		var keyA = $('td', a).eq(1).html();
		var keyB = $('td', b).eq(1).html();

		return (keyA - keyB);
	});

	rows.each(function(index, row) {
		table.append(row);
	});
}