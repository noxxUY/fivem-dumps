$(document).ready(function () {
  HealthIndicator = new ProgressBar.Circle("#HealthIndicator", {
    color: "rgba(255, 0, 0, 0.8)",
    trailColor: "rgb(66, 66, 66, 0)",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  ArmorIndicator = new ProgressBar.Circle("#ArmorIndicator", {
    color: "rgba(0, 0, 255, 0.8)",
    trailColor: "rgb(66, 66, 66, 0)",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  HungerIndicator = new ProgressBar.Circle("#HungerIndicator", {
    color: "rgba(255, 102, 0, 0.8)",
    trailColor: "rgb(66, 66, 66, 0)",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  ThirstIndicator = new ProgressBar.Circle("#ThirstIndicator", {
    color: "rgba(0, 102, 255, 0.8)",
    trailColor: "rgb(66, 66, 66, 0)",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });

  StressIndicator = new ProgressBar.Circle("#StressIndicator", {
    color: "rgba(245, 40, 145, 0.8)",
    trailColor: "rgb(66, 66, 66, 0)",
    strokeWidth: 12,
    trailWidth: 12,
    duration: 250,
    easing: "easeInOut",
  });



  OxygenIndicator = new ProgressBar.Circle("#OxygenIndicator", {
    color: "rgba(0, 190, 0, 0.8)",
    trailColor: "rgb(66, 66, 66, 0)",
    strokeWidth: 7,
    trailWidth: 7,
    duration: 250,
    easing: "easeInOut",
  });


});

window.addEventListener("message", function (event) {
  let data = event.data;
 
  if (data.action == "update_hud") {
    HealthIndicator.animate(data.hp / 100);
    ArmorIndicator.animate(data.armor / 100);
    HungerIndicator.animate(data.hunger / 100);
    ThirstIndicator.animate(data.thirst / 100);
    StressIndicator.animate(data.stress / 100);
    OxygenIndicator.animate(data.oxygen / 100);
  }

 
  
  if (data.hp <= 100) {
    $("#HealthIndicator").show(500);
  } else if (data.hp > 90) {
    $("#HealthIndicator").hide(500);
  }

  if (data.thirst <= 100) {
    $("#ThirstIndicator").show(500);
  } else if (data.thirst > 50) {
    $("#ThirstIndicator").hide(500);
  }

  if (data.hunger <= 100) {
    $("#HungerIndicator").show(500);
  } else if (data.hunger > 50) {
    $("#HungerIndicator").hide(500);
  }

  if (data.stress <= 100) {
    $("#StressIndicator").show(500);
  } else if (data.stress > 100) {
    $("#StressIndicator").hide(500);
  }


  // Show oxygen if underwater
  if (data.showOxygen == true) {
    $("#OxygenIndicator").show(500);
  } else if (data.showOxygen == false) {
    $("#OxygenIndicator").hide(500);
  }

  // Hide armor if 0
  if (data.armor == 0) {
    $("#ArmorIndicator").fadeOut(500);
  } else if (data.armor > 50) {
    $("#ArmorIndicator").fadeIn(500);
  }
  const div = document.getElementById("SpeedIndicator");
  if (data.cruiser == 'on') {
    div.style.color = "green";
  } else if (data.cruiser == 'off') {
    div.style.color = "white";
  }

  


  // Flash if thirst is low
  if (data.thirst < 35) {
    $("#ThirstIcon").toggleClass("flash");
  }
  // Flash if hunger is low
  if (data.hunger < 35) {
    $("#HungerIcon").toggleClass("flash");
  }
  
  if (data.hp < 35) {
    $("#hp-icon").toggleClass("flash");
  }
  
  if (data.slidecoche){
    if(event.data.encoche){
        $("#ThirstIndicator").animate({"left": '28vh', "bottom":'3vh'},200 );
        $("#HungerIndicator").animate({"left": '28vh', "bottom":'3vh'},200 );
        $("#StressIndicator").animate({"left": '28vh', "bottom":'3vh'},200 );
        $("#HealthIndicator").animate({"left": '28vh', "bottom":'3vh'},200 );
        $("#ArmorIndicator").animate({"left": '28vh', "bottom":'3vh'},200 );
    }else if(!event.data.encoche){
        $("#ThirstIndicator").animate({"left": '0.7vh', "bottom":'0.7vh'},350 );
        $("#HungerIndicator").animate({"left": '0.7vh', "bottom":'0.7vh'},350 );
        $("#StressIndicator").animate({"left": '0.7vh', "bottom":'0.7vh'},350 );
        $("#HealthIndicator").animate({"left": '0.7vh', "bottom":'0.7vh'},350 );
        $("#ArmorIndicator").animate({"left": '0.7vh', "bottom":'0.7vh'},350 );
    }
}

  if (data.armor < 35) {
    $("#armor-icon").toggleClass("flash");
  }

  if (data.showUi == true) {
    $(".container").show();
  } else if (data.showUi == false) {
    $(".container").hide();
  }

  if (data.action == "toggle_hud") {
    $("body").fadeToggle()
  }
});
