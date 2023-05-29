console.log("JS LOADED")
window.addEventListener('message', function(event) {
    if(event.data.type == "show" && event.data.text != null) {
        $(".container").fadeIn()
        // $(".text").value = event.data.text
        document.getElementById("texto").innerHTML = event.data.text;
    }else if(event.data.type == "hide"){
        $(".container").fadeOut()
    }
});