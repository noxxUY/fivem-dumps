
var visable = false;

$(function () {
	window.addEventListener('message', function (event) {

		switch (event.data.action) {
			case 'toggle':
				if (visable) {
					$('.main').hide();
				} else {
					$('.main').show();
				}

				visable = !visable;
				break;

			case 'close':
				$('.main').hide();
				visable = false;
				break;

			case 'toggleID':

				if (event.data.psg) {
					$('td:nth-child(2),th:nth-child(2)').show();
					$('td:nth-child(5),th:nth-child(5)').show();
					$('td:nth-child(8),th:nth-child(8)').show();
				} else {
					$('td:nth-child(2),th:nth-child(2)').hide();
					$('td:nth-child(5),th:nth-child(5)').hide();
					$('td:nth-child(8),th:nth-child(8)').hide();
				}

				break;

			case 'updatePlayerJobs':
				var jobs = event.data.jobs;

				$('#serverPlayerCount #current').html(jobs.player_count);

				$('#ems').html(jobs.ems);
				$('#police').html(jobs.police);
				$('#psg').html(jobs.psg);
				$('#taxi').html(jobs.taxi);
				$('#mechanic').html(jobs.mechanic);
				$('#wuzz').html(jobs.wuzz);
				$('#cardealer').html(jobs.cardealer);
				$('#epsg').html(jobs.epsg);
				$('#slaughterer').html(jobs.slaughterer);
				$('#sheriff').html(jobs.sheriff);
				$('#organizator').html(jobs.organizator);
				$('#miner').html(jobs.miner);
				$('#fueler').html(jobs.fueler);
				$('#tailor').html(jobs.tailor);
				$('#lumberjack').html(jobs.lumberjack);
				break;

			case 'updatePlayerList':
				$('.playerlist .players .player').remove();
				$('.playerlist .players').append(event.data.players);


				break;

			// case 'updatePing':
			// 	//updatePing(event.data.players);
			// 	//applyPingColor();
			// 	break;

			case 'updateServerInfo':
				if (event.data.maxPlayers) {
					$('#serverPlayerCount #max').html(event.data.maxPlayers);
				}

				if (event.data.uptime) {
					$('#server_uptime').html(event.data.uptime);
				}

				if (event.data.playTime) {
					$('#serverPlayTime .value').html(event.data.playTime);
				}

				break;

			default:
				//console.log('esx_scoreboard: unknown action!');
				break;
		}
	}, false);
});

function applyPingColor() {
	$('#playerlist tr').each(function () {
		$(this).find('td:nth-child(3), td:nth-child(6), td:nth-child(9)').each(function () {
			var ping = $(this).html();
			var color = 'green';

			if (ping > 50 && ping < 80) {
				color = 'orange';
			} else if (ping >= 80) {
				color = 'red';
			}

			$(this).css('color', color);
			$(this).html(ping + " <span style='color:white;'>ms</span>");
		});

	});
}

// Todo: not the best code
function updatePing(players) {
	jQuery.each(players, function (index, element) {
		if (element != null) {
			$('#playerlist tr:not(.heading)').each(function () {
				$(this).find('td:nth-child(2):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(2).html(element.ping);
				});	
				$(this).find('td:nth-child(5):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(5).html(element.ping);
				});
				$(this).find('td:nth-child(8):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(8).html(element.ping);
				});
			});
		}
	});
}

function sortPlayerList() {
	var table = $('#playerlist'),
		rows = $('tr:not(.heading)', table);

	rows.sort(function(a, b, c) {
		var keyA = $('td', a).eq(1).html();
		var keyB = $('td', b).eq(1).html();
		var keyC = $('td', c).eq(1).html();

		return (keyA - keyB - keyC);
	});

	rows.each(function(index, row) {
		table.append(row);
	});
}
