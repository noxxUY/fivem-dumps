$(function(){
    window.onload = (e) => { 
        window.addEventListener('message', (event) => {	            
            var item = event.data;
            if (item !== undefined && item.type === "ui") {		                
                if (item.display === true) {
                    $("#mina").show();
                    var start = new Date();
                    var maxTime = item.time;
                    var text = item.text;
                    var timeoutVal = Math.floor(maxTime/100);
                    animateUpdate();

                    $('#pbar_innertext').text(text);

                    function updateProgress(percentage) {
                        $('#pbar_innerdiv').css("width", percentage + "%");
                    }

                    function animateUpdate() {
                        var now = new Date();
                        var timeDiff = now.getTime() - start.getTime();
                        var perc = Math.round((timeDiff/maxTime)*100);
                        if (perc <= 100) {
                            updateProgress(perc);
                            setTimeout(animateUpdate, timeoutVal);
                        } else {
                            $("#mina").hide();
                        }
                    }


                } else {
                    $("#mina").hide();
                }
            }
        });
    };
});