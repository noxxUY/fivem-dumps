var warenkorb = []

$(document).ready(function(){
    window.addEventListener('message', function( event ) {      
      if (event.data.action == 'open') {

        const warenkorb2 = document.getElementById("warenkorb-list");
        warenkorb2.innerHTML = '';

        warenkorb = []

        $('#warenkorb-1').text('$0.0');
        $('#warenkorb-2').text('$0.0');

        $('.container').css('display', 'block');        

      } else if (event.data.action == 'add') {
                
        AddItem(event.data.name, event.data.display, event.data.price);       

      } else {
        $('.container').css('display', 'none');
      }
    });

    $( ".close" ).click(function() {
      $('.container').css('display', 'none');
      $.post('http://1974_mc/escape', JSON.stringify({}));
    });
});

function AddWarenkorb(name, display, price) {
  warenkorb.push({name: name, display: display, price: price});

  $(".warenkorb-list").append
  (`
    <div class="warenkorb-list-elem">
        <p>[1x] ---- `+ display +` ---- $`+ price +`</p>
    </div>
  `);

  var current = $('#warenkorb-1').text();
  var current2 = current.replace("$", "");
  var int = parseFloat(current2)
  
  $('#warenkorb-1').text('$' + (int + parseFloat(price)));

  var xcurrent = $('#warenkorb-1').text();
  var xcurrent2 = xcurrent.replace("$ ", "");
  var xint = parseFloat(xcurrent2)

  $('#warenkorb-2').text('$' + (xint));
}

function buy() {
  $.post('http://1974_mc/buy', JSON.stringify({warenkorb: warenkorb}));
  $('.container').css('display', 'none');
  $.post('http://1974_mc/escape', JSON.stringify({}));
}

function AddItem(name, display, price) {
  $("#items-content").append
      (`
      
      <div class="items-element">
          <div class="items-element-inner" onclick="AddWarenkorb('`+name+`', '`+display+`', '`+price+`')" style="background-image: url(items/`+name+`.png);">

          </div>
          <div class="items-element-sub">
              PRECIO : $`+price+`
          </div>
		  <br>
      </div>
	  
      `);
}