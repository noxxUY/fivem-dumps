var timeleft = 2000 
var waiting = false 

$(() => {
    $(".container").css({'left' : '-10%', 'opacity' : '0'});

    addEventListener("message", event =>{
        const e = event.data;
        if (e.message) {
            $(".container").css({'left' : '0.50%', 'opacity' : '1'}).html(e.message);
            HelpTimer(2000)
        }
    })
})

HelpTimer = (restore) => {
    if(restore != null){
        timeleft = 2000
    }

    if(!waiting){
        waiting = true 
        setTimeout(function(){ 
            timeleft -= 1000  

            if(timeleft == 0){ 
                $(".container").css({'left' : '-10%', 'opacity' : '0'});
            }
             
            waiting = false 
            HelpTimer()   
        }, 1000) 
    }
}