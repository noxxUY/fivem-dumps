window.addEventListener('load', function() {
	$(".label_createcharacter").html(`${translate.createcharacter}`)
	$(".label_firstname").html(`${translate.firstname}`)
	$(".label_lastname").html(`${translate.lastname}`)
	$(".label_height").html(`${translate.height}`)
	$(".label_dob").html(`${translate.dob}`)
	$(".label_male").html(`${translate.male}`)
	$(".label_female").html(`${translate.female}`)
	$(".label_register").val(`${translate.register}`)
})

$(function() {
	$.post('http://vms_identity/ready', JSON.stringify({}))

	window.addEventListener('message', function(event) {
		if (event.data.type === "enableui") {
			document.body.style.display = event.data.enable ? "block" : "none"
		}
	})

	$(document).on('click', '#submit', function(e) {
		e.preventDefault()
		var date = $("#dateofbirth").val()
		var dateCheck = new Date($("#dateofbirth").val())
		if (dateCheck == "Invalid Date") {
			date == "invalid"
		} else {
			const year = new Intl.DateTimeFormat('en', {year: 'numeric'}).format(dateCheck)
			const month = new Intl.DateTimeFormat('en', {month: '2-digit'}).format(dateCheck)
			const day = new Intl.DateTimeFormat('en', {day: '2-digit'}).format(dateCheck)
			var formattedDate = `${day}/${month}/${year}`
			$.post('http://vms_identity/register', JSON.stringify({
				firstname: $("#firstname").val(),
				lastname: $("#lastname").val(),
				dateofbirth: formattedDate,
				sex: $("input[type='radio'][name='sex']:checked").val(),
				height: $("#height").val()
			}))
			$("#firstname").val("")
			$("#lastname").val("")
			$("#height").val("")
			$("#dateofbirth").val("")
		}
	})

})
