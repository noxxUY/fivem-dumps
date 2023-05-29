$(document).ready(function(){
  // LUA listener
  window.addEventListener('message', function( event ) {
    if (event.data.action == 'open') {
		var type        = event.data.type;
		var userData    = event.data.array['user'][0];
		var licenseData = event.data.array['licenses'];
		var sex         = userData.sex;
		var matricula = String(userData.dateofbirth);
		var matricula2 = matricula.replace('/', '');
		var matricula3 = matricula2.replace('/', '');
	  
	  
	  
		$('#name').css('left','165px');
		$('#name').css('top','49px');
		$('#name').css('font-size','13px');
			
		$('#apellido').css('left','165px');
		$('#apellido').css('top','88px');
		$('#apellido').css('font-size','13px');
			
		$('#dob').css('left','20px');
		$('#dob').css('top','44px');
		$('#dob').css('color', '#282828');
		$('#dob').css('font-size','13px');
			
		$('img').css('left','28px');
		$('img').css('top','60px');
		$('img').css('width','126px');
		$('img').css('height','164px');
		
		$('#signature').css('bottom', '90px');
		$('#signature').css('right', '20px');
		$('#signature').css('font-size','19px');
		$('#signature').css('color', '#282828');
		
		
			
      if ( type == 'drive' || type == null) {
        $('img').show();
        $('#name').css('color', '#282828');
		$('#licenses').html('');	
        if ( sex.toLowerCase() == 'm' ) {
          $('img').attr('src', 'assets/images/male.png');
          $('#sex').text('Masculino');
        } else {
          $('img').attr('src', 'assets/images/female.png');
          $('#sex').text('Femenino');
        }
		$('#apellido').hide();
		$('#sex').show();
		$('#licenses').hide();
        $('#name').text(userData.firstname + ' ' + userData.lastname);
		$('#name').css('left','168px');
		$('#name').css('top','74px');
		$('#name').css('font-size','13px');
		
		$('#sex').css('left','25px');
		$('#sex').css('top','-06px');
		$('#sex').css('font-size','13px');

        $('#dob').text(userData.dateofbirth);
		$('#dob').css('color', '#282828');
		
		$('#signature').css('bottom', '90px');
		$('#signature').css('right', '20px');
		$('#signature').css('font-size','19px');
		$('#signature').css('color', '#282828');
        $('#signature').text(userData.lastname);

        if ( type == 'drive' ) {
          if ( licenseData != null ) {
          Object.keys(licenseData).forEach(function(key) {
            var type = licenseData[key].type;
			$('#sex').hide();
			$('#licenses').show();
			$('#apellido').show();
			$('#name').text(userData.firstname);
			$('#apellido').text(userData.lastname);
			
			$('#name').css('left','225px');
			$('#name').css('top','87px');
			$('#name').css('font-size','13px');
			
			$('#apellido').css('left','225px');
			$('#apellido').css('top','72px');
			$('#apellido').css('font-size','13px');
			
			$('#dob').css('left','80px');
			$('#dob').css('top','-5px');
			$('#dob').css('font-size','13px');
			
			$('img').css('left','18px');
			$('img').css('top','55px');
			$('img').css('width','100px');
			$('img').css('height','120px');
			
			$('#signature').css('bottom', '90px');
			$('#signature').css('right', '20px');
			$('#signature').css('font-size','19px');
			$('#signature').css('color', '#282828');
			
			$('#licenses').css('font-size','19px');
			$('#licenses').css('color', '#282828');
			
			$('img').show();			
			$('#signature').css('color', '#282828');
			
            if ( type == 'drive_bike') {
              type = 'MOTO';
            } else if ( type == 'drive_truck' ) {
              type = 'CAMION';
            } else if ( type == 'drive' ) {
              type = 'AUTO';
            }

            if ( type == 'MOTO' || type == 'CAMION' || type == 'AUTO' ) {
              $('#licenses').append('<p>'+ type +'</p>');
            }
          });
        }

          $('#id-card').css('background', 'url(assets/images/license.png)');
        } else {
          $('#id-card').css('background', 'url(assets/images/idcard.png)');
        }
      } else if ( type == 'weapon' ) {
        $('img').hide();
		$('#apellido').hide();
        $('#name').text(userData.firstname + ' ' + userData.lastname);
        $('#dob').text(userData.dateofbirth);
		$('#signature').css('bottom', '90px');
		$('#signature').css('right', '20px');
		$('#signature').css('font-size','19px');
		$('#signature').css('color', '#282828');
        $('#signature').text(userData.lastname);
		$('#licenses').hide();
		//$('#licenses').html('');

        $('#id-card').css('background', 'url(assets/images/firearm.png)');
      } else if ( type == 'gym' ) {
			$('img').hide();
			$('#apellido').hide();
			$('#name').css('left','225px');
			$('#name').css('top','80px');
			$('#name').css('font-size','14px');
			$('#name').css('color', '#990066');
			$('#name').text(userData.firstname + ' ' + userData.lastname);
			
			$('#dob').css('left','125px');
			$('#dob').css('top','10px');
			$('#dob').css('color', '#990066');
			$('#dob').css('font-size','14px');
			$('#dob').text(userData.dateofbirth);
			
			$('#signature').css('bottom', '60px');
			$('#signature').css('right', '70px');
			$('#signature').css('font-size','24px');
			$('#signature').css('color', '#990066');
			$('#signature').text(userData.lastname);
			
			$('#licenses').hide();
			//$('#licenses').html('');

			$('#id-card').css('background', 'url(assets/images/gym.png)');
			
	  } else if ( type == 'abogado' ) {
			$('#apellido').hide();
			$('img').show();
			
			$('img').css('left','290px');
			$('img').css('top','40px');
			$('img').css('width','100px');
			$('img').css('height','120px');
			
			$('#sex').css('left','-105px');
			$('#sex').css('top','85px');
				
			$('#name').css('left','40px');
			$('#name').css('top','125px');
			$('#name').css('font-size','14px');
			$('#name').css('color', '#000000');
			$('#name').text(userData.firstname + ' ' + userData.lastname);
			
			if ( sex.toLowerCase() == 'm' ) {
				$('img').attr('src', 'assets/images/male.png');	
				$('#sex').text('Masculino');
			} else {
				$('img').attr('src', 'assets/images/female.png');
				$('#sex').text('Femenino');
			}
			
			$('#dob').css('left','-105px');
			$('#dob').css('top','52px');
			$('#dob').css('color', '#000000');
			$('#dob').css('font-size','14px');
			
			$('#dob').text(matricula3);
			
			$('#signature').css('bottom', '60px');
			$('#signature').css('right', '70px');
			$('#signature').css('font-size','24px');
			$('#signature').css('color', '#000000');
			$('#signature').text(userData.lastname);
			
			$('#licenses').hide();
			//$('#licenses').html('');

			$('#id-card').css('background', 'url(assets/images/abogado.png)');
	  }

      $('#id-card').show();
    } else if (event.data.action == 'close') {
      $('#name').text('');
      $('#dob').text('');
      $('#height').text('');
      $('#signature').text('');
      $('#sex').text('');
      $('#id-card').hide();
      $('#licenses').html('');
    }
  });
});
