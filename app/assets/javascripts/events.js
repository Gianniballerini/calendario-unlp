$(document).ready(function(){

  $('#recurrent').click(function() {
    var sdValue = $( "#start_date" ).val();
    if (this.checked) {
      $('#end_date').val(sdValue);
      $("#end_date").prop('disabled', true);
      $("#end_date").prop('required', flase);
    }else{
      $("#end_date").prop('disabled', false);
      $("#end_date").prop('required', required);
    }
  });

  // when start date changes set minDate for end date and sets disabled to false
  $('#start_date').datepicker().on("input change", function (e) {
    if ($('#recurrent').is(':checked')) {
      $('#end_date').prop('disabled', true);
    }else{
      $('#end_date').prop('disabled', false);
    }
    $('#end_date').val(e.target.value);
    $('#end_date').datepicker({
      minDate: new Date(e.target.value)
    });
  });


});