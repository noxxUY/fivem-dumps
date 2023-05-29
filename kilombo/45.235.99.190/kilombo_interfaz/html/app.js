// let song = new Audio('song.mp3')
let cnew = false
window.addEventListener('message', (e) => {
    if (e.data.action == 'openwithChar') {
        let data = e.data.data
        // song.play()
        // song.volume = 0.1
        $('.name').text(data.name)
        $('.birthday').text(data.dob)
        $('.tel').text(data.phone)
        $('.job').text(data.job)
        $('.gender').text(data.gender)
        $('.bank').text('$'+data.bank)
        $('.money').text('$'+data.cash)
        //onlinejobs
        let shv = e.data.svdata
        $('#onlineplys').text(shv.plys)
        $('#polices').text(shv.polices)
        $('#doctors').text(shv.doctors)
        $('#mechanics').text(shv.mechanics)
        $('#taxists').text(shv.taxists)
        $('.loader').fadeOut()
    }else if (e.data.action == 'openwithoutChar') {
        // song.play()
        // song.volume = 0.1
        cnew = true
    }
})

$(document).on('click', '.btn-play', function(r){
    $.post('https://kilombo_interfaz/play')
    $('body').fadeOut()
    // song.pause()
})

$(document).on('click', '.btn-first', function(e){
    $('.btn-first').fadeOut();
    setTimeout(function() {
        $('.loader').fadeIn();
        setTimeout(function() {
            if (cnew == false) { 
                $('.second-page').fadeIn();
            } else if (cnew == true) {
                $.post('https://kilombo_interfaz/identity')
                $('.container').hide()
                // song.pause()
            }
        },3500)
    },500)
})

$(document).on('click', '.btn-normativa', function(e){
    $('.cont-norm-1').fadeOut();
    $('.cont-norm-2').fadeOut();
    // $('.cont-norm-3').fadeOut();
    $('.controles').fadeOut();
    $('.nos').fadeOut();
    $('.cont-slider').fadeOut();
    $('.btn-normativa').css('color', '#e7c691');
    $('.btn-keys').css('color', 'white');
    $('.btn-nos').css('color', 'white');
    setTimeout(function(){
        $('.normativas').fadeIn();
        $('.btn-normas').fadeIn();
    },300)
})

$(document).on('click', '.norm-1', function(e){
    $('.btn-normas').fadeOut();
    $('.cont-norm-2').fadeOut();
    // $('.cont-norm-3').fadeOut();
    setTimeout(function(){
        $('.cont-norm-1').fadeIn();
    },600)
})

$(document).on('click', '.norm-2', function(e){
    $('.btn-normas').fadeOut();
    $('.cont-norm-1').fadeOut();
    // $('.cont-norm-3').fadeOut();
    setTimeout(function(){
        $('.cont-norm-2').fadeIn();
    },600)
})

// $(document).on('click', '.norm-3', function(e){
//     $('.btn-normas').fadeOut();
//     $('.cont-norm-1').fadeOut();
//     $('.cont-norm-2').fadeOut();
//     setTimeout(function(){
//         $('.cont-norm-3').fadeIn();
//     },600)
// })

$(document).on('click', '.exit-norm', function(e){
    $('.cont-norm-1').fadeOut();
    $('.cont-norm-2').fadeOut();
    // $('.cont-norm-3').fadeOut();
    $('.controles').fadeOut();
    $('.nos').fadeOut();
    $('.cont-slider').fadeOut();
    setTimeout(function(){
        $('.normativas').fadeIn();
        $('.btn-normas').fadeIn();
    },300)
})

$(document).on('click', '.btn-keys', function(e){

    setTimeout(function(){
        $('.normativas').fadeOut();
        $('.nos').fadeOut();
        $('.cont-slider').fadeOut();
        $('.btn-keys').css('color', '#e7c691');
        $('.btn-nos').css('color', 'white');
        $('.btn-normativa').css('color', 'white');
        setTimeout(function(){
            $('.controles').fadeIn();
        },300)
    },300)
})

$(document).on('click', '.btn-nos', function(e){

    setTimeout(function(){
        $('.normativas').fadeOut();
        $('.controles').fadeOut();
        $('.btn-nos').css('color', '#e7c691');
        $('.btn-keys').css('color', 'white');
        $('.btn-normativa').css('color', 'white');
        setTimeout(function(){
            $('.nos').fadeIn();
            $('.cont-slider').fadeIn();
        },300)
    },300)
})

let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block";
  setTimeout(showSlides, 3500); // Change image every 2 seconds
}


$(document).on('click', '.btn-normativa', function(e){

    var disabledElements = document.querySelectorAll('.btn-keys, .btn-nos');
    disabledElements.forEach(function(element) {
        element.disabled = true;
    });

    setTimeout(function(){
        disabledElements.forEach(function(element) {
            element.disabled = false;
        });
    },1500)

})

$(document).on('click', '.btn-keys', function(e){

    var disabledElements2 = document.querySelectorAll('.btn-normativa, .btn-nos');
    disabledElements2.forEach(function(element) {
        element.disabled = true;
    });

    setTimeout(function(){
        disabledElements2.forEach(function(element) {
            element.disabled = false;
        });
    },1500)

})

$(document).on('click', '.btn-nos', function(e){

    var disabledElements3 = document.querySelectorAll('.btn-normativa, .btn-keys');
    disabledElements3.forEach(function(element) {
        element.disabled = true;
    });

    setTimeout(function(){
        disabledElements3.forEach(function(element) {
            element.disabled = false;
        });
    },1500)

})
