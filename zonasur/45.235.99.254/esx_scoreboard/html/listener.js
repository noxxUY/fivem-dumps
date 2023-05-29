var visable = false;

$(function () {
	window.addEventListener('message', function (event) {

		switch (event.data.action) {
			case 'toggle':
				if (visable) {
					$('#wrap').fadeOut();
				} else {
					$('#wrap').fadeIn();
				}

				visable = !visable;
				break;

			case 'close':
				$('#wrap').fadeOut();
				visable = false;
				break;

			case 'updatePlayerJobs':
				var jobs = event.data.jobs;

				$('#player_count').html(jobs.player_count);

				$('#ems').html(jobs.ems);
				$('#police').html(jobs.police);
				$('#police2').html(jobs.police2);
				$('#fbi').html(jobs.fbi);
				$('#gendarme').html(jobs.gendarme);
				$('#seguridad').html(jobs.seguridad);				
				$('#taxi').html(jobs.taxi);
				$('#mechanic').html(jobs.mechanic);
				$('#mechanic3').html(jobs.mechanic3);
				$('#mechanic2').html(jobs.mechanic2);
				$('#telefe').html(jobs.telefe);
				$('#judicial').html(jobs.judicial);
				$('#transito').html(jobs.transito);
				$('#mechanic4').html(jobs.mechanic4);

				//$('#bus').html(jobs.bus);
				//$('#miner').html(jobs.miner);
				//$('#pizzero').html(jobs.pizzero);
				//$('#pollero').html(jobs.pollero);
				//$('#lumberjack').html(jobs.lumberjack);
				//$('#portuario').html(jobs.portuario);
				//$('#trucker').html(jobs.trucker);
				//$('#garbage').html(jobs.garbage);
				//$('#unemployed').html(jobs.unemployed);
				//$('#fisherman').html(jobs.fisherman);
				//$('#mlibre').html(jobs.mlibre);
				
				//$('#edesur').html(jobs.edesur);
				
				break;

			case 'updatePlayerList':
				$('#playerlist tr:gt(0)').remove();
				$('#playerlist').append(event.data.players);
				//applyPingColor();
				sortPlayerList();
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

				break;

			default:
				console.log('esx_scoreboard: unknown action!');
				break;
		}
	}, false);
});


function sortPlayerList() {
	var table = $('#playerlist'),
		rows = $('tr:not(.heading)', table);

	rows.sort(function(a, b) {
		var keyA = $('td', a).eq(1).html();
		var keyB = $('td', b).eq(1).html();

		return (keyA - keyB);
	});

	rows.each(function(index, row) {
		table.append(row);
	});
}
