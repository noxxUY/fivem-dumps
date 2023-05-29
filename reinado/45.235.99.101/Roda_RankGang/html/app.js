window.addEventListener('load', function() {
    console.log('Roda Gang Rank Started')
})

window.addEventListener('message', function(event) {
    var v = event.data

    switch(v.action) {
        case 'openRank':
            var info = v.datos
            $('.global').show()
            $('.listado').append(`
                <div class="user">
                <div class="killfoto"><img src="${info.avatar}"></div>
                    <div class="infouser">
                        <div class="killnombre"><div class="rankid">${info.top}</div> ${info.name}</div>
                        <div class="datakill">
                            <div class="killcount">KILLS: <div class="matados">${info.kills}</div></div>
                            <div class="killjob">JOB: <div class="trabajito">${info.job}</div></div>
                        </div>
                    </div> 
                </div>
            `)
        break;
    }
})


$(document).keyup((e) => {
    
    if (e.key === "Escape") {
        CloseAll()
    }
});

function CloseAll() {
    $('.global').hide()
    $('.listado').empty()
    $.post('https://Roda_RankGang/exit', JSON.stringify({}));
}