$(function () {
    function display(bool) {
    if (bool) {
        $("body").show();
        $("#yordi").show();
		document.querySelector('#yordi').style.display = 'block';
    } else {
        $("body").hide();
        $("#yordi").hide();
		document.querySelector('#yordi').style.display = 'none';
    }
}

display(false)

window.addEventListener('message', function(event) {

        var item = event.data;

        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }

        yordiCoords(event.data);
        yordinormalCoords(event.data);
        yordinvector3Coords(event.data);

    })
})

function yordiClose(){
    $.post('http://coords/yordicloseButton');
}

function yordiCopy(){
    const copyText = document.getElementById("yordiCoords").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
}

function yordinormalCopy(){
    const copyText = document.getElementById("yordinormalCoords").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
}

function yordivector3Copy(){
    const copyText = document.getElementById("yordivector3Coords").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
}

function yordiCoords(data) {

	if (data.type === 'yordi') {
        yordicoordsStart(data);
    }

}

function yordinormalCoords(data) {

	if (data.type === 'normal') {
        yordicoordsnormalStart(data);
    }

}

function yordinvector3Coords(data) {

	if (data.type === 'vector3') {
        yordicoordsvector3Start(data);
    }

}

function yordicoordsStart(data){
    document.querySelector("#yordiCoords").textContent = data.text;
}

function yordicoordsnormalStart(data){
    document.querySelector("#yordinormalCoords").textContent = data.text;
}

function yordicoordsvector3Start(data){
    document.querySelector("#yordivector3Coords").textContent = data.text;
}