$(document).ready(function(){

	$('#recurrent').click(function() {
		if (this.checked) {
			$('#end_date_div').toggle();
			$("#start_time_div").attr('class', 'input-field col s12 m6');
			$("#end_time_div").attr('class', 'input-field col s12 m6');
			$("#start_date_div").attr('class', 'input-field col s12 m12');
			$("#end_date").val("May 29, 2018");
			$("#end_date_tag").text("Dia");
		}else{
			$('#end_date_div').toggle();
			$("#start_time_div").attr('class', 'input-field col s12 m3');
			$("#end_time_div").attr('class', 'input-field col s12 m3');
			$("#start_date_div").attr('class', 'input-field col s12 m3');
			$("#end_date_tag").text("Desde");
		}
	});

	$('#start_date').change(function() {
		var $start = $("#start_date").val;
		$("#end_date").val($start);
	});
});
