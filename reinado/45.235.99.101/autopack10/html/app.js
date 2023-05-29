

window.addEventListener("message", function(event) {
	
    var v = event.data 
    var top = event.data.datos
    var nombre = event.data.nombre
    var fotos = event.data.fotos
    if(v.open == true) {
        console.log('probando')
        $('#p1').html(roundMoney(top.uno.replace(/[^0-9\.]+/g, "")))
        $('#p2').html(roundMoney(top.dos.replace(/[^0-9\.]+/g, "")))
        $('#p3').html(roundMoney(top.tres.replace(/[^0-9\.]+/g, "")))
        $('#p4').html(roundMoney(top.cuatro.replace(/[^0-9\.]+/g, "")))
        $('#p5').html(roundMoney(top.cinco.replace(/[^0-9\.]+/g, "")))
        $('#p6').html(roundMoney(top.seis.replace(/[^0-9\.]+/g, "")))
        $('#p7').html(roundMoney(top.siete.replace(/[^0-9\.]+/g, "")))
        $('#p8').html(roundMoney(top.ocho.replace(/[^0-9\.]+/g, "")))
        $('#p9').html(roundMoney(top.nueve.replace(/[^0-9\.]+/g, "")))
        $('#p10').html(roundMoney(top.diez.replace(/[^0-9\.]+/g, "")))

        $('#uno').html(nombre.unombre)
        $('#dos').html(nombre.dnombre)
        $('#tres').html(nombre.tnombre)
        $('#cuatro').html(nombre.cnombre)
        $('#cinco').html(nombre.cinombre)
        $('#seis').html(nombre.senombre)
        $('#siete').html(nombre.sinombre)
        $('#ocho').html(nombre.ocnombre)
        $('#nueve').html(nombre.nunombre)
        $('#diez').html(nombre.dinombre)

        $('#f1').attr('src', fotos.funo)
        $('#f2').attr('src', fotos.fdos)
        $('#f3').attr('src', fotos.ftres)
        $('#f4').attr('src', fotos.fcuatro)
        $('#f5').attr('src', fotos.fcinco)
        $('#f6').attr('src', fotos.fseis)
        $('#f7').attr('src', fotos.fsiete)
        $('#f8').attr('src', fotos.focho)
        $('#f9').attr('src', fotos.fnueve)
        $('#f10').attr('src', fotos.fdiez)

        $('.leaderboard').fadeIn(1000)
    } else if (v.open == false) {
        $('.leaderboard').fadeOut(1000)
    }

});

function roundMoney (labelValue) {

    // Nine Zeroes for Billions
    return Math.abs(Number(labelValue)) >= 1.0e+9

    ? (Math.abs(Number(labelValue)) / 1.0e+9).toFixed(2) + "B"
    // Six Zeroes for Millions 
    : Math.abs(Number(labelValue)) >= 1.0e+6

    ? (Math.abs(Number(labelValue)) / 1.0e+6).toFixed(2) + "M"
    // Three Zeroes for Thousands
    : Math.abs(Number(labelValue)) >= 1.0e+3

    ? (Math.abs(Number(labelValue)) / 1.0e+3).toFixed(2) + "K"
    : Math.abs(Number(labelValue));

}

// function roundMoney(labelValue) 
// {
//     // Nine Zeroes for Billions
//     return Math.abs(Number(labelValue)) >= 1.0e+9

//     ? Math.abs(Number(labelValue)) / 1.0e+9 + "B"
//     // Six Zeroes for Millions 
//     : Math.abs(Number(labelValue)) >= 1.0e+6

//     ? Math.abs(Number(labelValue)) / 1.0e+6 + "M"
//     // Three Zeroes for Thousands
//     : Math.abs(Number(labelValue)) >= 1.0e+3

//     ? Math.abs(Number(labelValue)) / 1.0e+3 + "K"

//     : Math.abs(Number(labelValue));
// }

$(document).keyup((e) => {
        if (e.key === "Escape") {
            setTimeout(() => {
                $.post('https://autopack10/exit', JSON.stringify({}));
            }, 300);
        }
});
        