$(function () {
    window.addEventListener('message', (event) => {
        switch (event.data.action) {
            case 'show': {
                $(".main__hex-ffa-container-frame-1").fadeIn()
                $(".categoryButton").removeClass('active')
                $(".main__hex-ffa-frame-1-header-right-item-left").addClass('active')
                $("#mainZones").show().empty()
                $("#privateZones").hide().empty()
                $("#playerStats").hide().empty()
            }
                break
            case 'addFFAZone': {
                $("#mainZones").append(`
                    <div class="main__hex-ffa-frame-1-scroll-item">
                        <div class="main__hex-ffa-frame-1-scroll-item-img-container">
                            <img src="${event.data.imgUrl}">
                        </div>
                        <div class="main__hex-ffa-frame-1-scroll-item-bottom-information-container">
                            <div class="main__hex-ffa-frame-1-scroll-item-bottom-information-header-big">
                                <p>${event.data.name}</p>
                            </div>
                            <div class="main__hex-ffa-frame-1-scroll-item-bottom-information-header-small">
                                <p>${event.data.label}</p>
                            </div>
                            <div class="main__hex-ffa-frame-1-scroll-item-bottom-information-btn-container">
                                <div class="main__hex-ffa-frame-1-scroll-item-bottom-information-btn-select" data-index="${event.data.index}" data-type="${event.data.zoneType}" data-zone="${event.data.zone}">
                                    <p>INGRESAR</p>
                                </div>
                                <div class="main__hex-ffa-frame-1-scroll-item-bottom-information-btn-player">
                                    <p>${event.data.currentPlayers}/${event.data.maxPlayers}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                `)
            }
                break
            case 'addPrivateZone': {
                $("#privateZones").append(`
                    <div class="main__hex-ffa-frame-1-scroll-item">
                        <div class="main__hex-ffa-frame-1-scroll-item-img-container">
                            <img src="${event.data.imgUrl}">
                        </div>
                        <div class="main__hex-ffa-frame-1-scroll-item-bottom-information-container">
                            <div class="main__hex-ffa-frame-1-scroll-item-bottom-information-header-big">
                                <p>${event.data.name}</p>
                            </div>
                            <div class="main__hex-ffa-frame-1-scroll-item-bottom-information-input-container">
                                <input type="text" id="input-${event.data.zone}" placeholder="CONTRASEÑA">
                            </div>
                            <div class="main__hex-ffa-frame-1-scroll-item-bottom-information-btn-select" data-index="${event.data.index}" data-type="${event.data.zoneType}" data-zone="${event.data.zone}">
                                <p>INGRESAR</p>
                            </div>
                        </div>
                    </div>
                `)
            }
                break
            case 'addPlayerToStats': {
                $("#playerStats").append(`
                    <div class="main__hex-ffa-frame-2-scroll-item">
                        <div class="main__hex-ffa-frame-2-scroll-item-left-container">
                            <div class="main__hex-ffa-frame-2-scroll-item-left-rank-container first">
                                <p>#${event.data.id}</p>
                            </div>
                            <div class="main__hex-ffa-frame-2-scroll-item-left-name-container">
                                <p>${event.data.name}</p>
                            </div>
                        </div>
                        <div class="main__hex-ffa-frame-2-scroll-item-right-container">
                            <div class="main__hex-ffa-frame-2-scroll-item-right-item">
                                <div class="main__hex-ffa-frame-2-scroll-item-right-item-header">
                                    <p>Kills</p>
                                </div>
                                <div class="main__hex-ffa-frame-2-scroll-item-right-item-count">
                                    <p>${event.data.kills}</p>
                                </div>
                                <div class="main__hex-ffa-frame-2-scroll-item-right-item-icon">
                                    <i class="fa-solid fa-skull"></i>
                                </div>
                            </div>
                            <div class="main__hex-ffa-frame-2-scroll-item-right-item">
                                <div class="main__hex-ffa-frame-2-scroll-item-right-item-header">
                                    <p>Deaths</p>
                                </div>
                                <div class="main__hex-ffa-frame-2-scroll-item-right-item-count">
                                    <p>${event.data.deaths}</p>
                                </div>
                                <div class="main__hex-ffa-frame-2-scroll-item-right-item-icon">
                                    <i class="fa-solid fa-handshake-simple"></i>
                                </div>
                            </div>
                            <div class="main__hex-ffa-frame-2-scroll-item-right-item">
                                <div class="main__hex-ffa-frame-2-scroll-item-right-item-header">
                                    <p>KDA</p>
                                </div>
                                <div class="main__hex-ffa-frame-2-scroll-item-right-item-count">
                                    <p>${event.data.deaths == 0 ? event.data.kills : (event.data.kills / event.data.deaths).toFixed(2)}</p>
                                </div>
                                <div class="main__hex-ffa-frame-2-scroll-item-right-item-icon">
                                    <i class="fa-solid fa-bullseye"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                `)
            }
                break
            case 'hud': {
                if (event.data.show) {
                    $(".main__hex-ffa-container-frame-3").fadeIn()
                } else {
                    $(".main__hex-ffa-container-frame-3").fadeOut()
                }
            }
                break
            case 'setStats': {
                $("#playerKda").text(event.data.deaths == 0 ? event.data.kills : (event.data.kills / event.data.deaths).toFixed(2))
                $("#playerXp").text(event.data.xp)
                $("#playerKills").text(event.data.kills)
                $("#playerDeaths").text(event.data.deaths)
            }
                break
            case 'addPlayerKill': {
                const playerItem = $(`
                    <div class="main__hex-ffa-frame-3-top-notify-item">
                        <div class="main__hex-ffa-frame-3-top-notify-item-name-container">
                            <div class="main__hex-ffa-frame-3-top-notify-item-name-stripe"></div>
                            <div class="main__hex-ffa-frame-3-top-notify-item-name-border">
                                <p>${event.data.killer}</p>
                            </div>
                        </div>
                        <div class="main__hex-ffa-frame-3-top-notify-item-icon-container">
                            <i class="fa-solid fa-skull"></i>
                        </div>
                        <div class="main__hex-ffa-frame-3-top-notify-item-name-container">
                            <div class="main__hex-ffa-frame-3-top-notify-item-name-stripe"></div>
                            <div class="main__hex-ffa-frame-3-top-notify-item-name-border">
                                <p>${event.data.player}</p>
                            </div>
                        </div>
                    </div>
                `)

                $(".main__hex-ffa-frame-3-top-notify-container").prepend(playerItem).fadeIn()

                setTimeout(() => {
                    playerItem.animate({
                        'right': '-100vh'
                    }, 500, function () {
                        playerItem.remove()
                    })
                }, 5000)
            }
                break
            case 'deathscreen': {
                if (event.data.show) {
                    $("#killerName").text(event.data.name)
                    $("#killerTimer").text(event.data.time)
                    const interval = setInterval(() => {
                        event.data.time--
                        $("#killerTimer").text(event.data.time)
                        if (event.data.time == 0) {
                            clearInterval(interval)
                        }
                    }, 1000)
                    $(".main__hex-ffa-container-frame-4").fadeIn()
                } else {
                    $(".main__hex-ffa-container-frame-4").fadeOut()
                }
            }
                break
        }
    })

    window.addEventListener('keyup', (event) => {
        if (event.key == 'Escape') {
            $(".main__hex-ffa-container-frame-1").fadeOut()
            $.post(`https://${GetParentResourceName()}/escape`)
        }
    })

    $("#closeButton").click(function () {
        $(".main__hex-ffa-container-frame-1").fadeOut()
        $.post(`https://${GetParentResourceName()}/escape`)
    })

    $(document).on("click", ".categoryButton", function () {
        const type = $(this).attr('data-type')

        $(".categoryButton").removeClass('active')
        $(this).addClass('active')

        $(".cleanCategory").hide()

        switch (type) {
            case 'main':
                $("#mainZones").fadeIn()
                break
            case 'private':
                $("#privateZones").fadeIn()
                break
            case 'statistics':
                $("#playerStats").fadeIn()
                break
        }
    })

    $(document).on("click", ".main__hex-ffa-frame-1-scroll-item-bottom-information-btn-select", function () {
        const index = $(this).attr('data-index')
        const type = $(this).attr('data-type')
        const zone = $(this).attr('data-zone')
        const password = $(this).parent().find(`#input-${zone}`).val()

        if (type == 'private' && password == '') {
            return
        }

        $.post(`https://${GetParentResourceName()}/join`, JSON.stringify({
            index: index,
            type: type,
            zone: zone,
            password: password,
        }))

        $(".main__hex-ffa-container-frame-1").fadeOut()
    })
})