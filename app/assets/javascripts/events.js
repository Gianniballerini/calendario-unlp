$(document).ready(function(){

  $('#recurrent').click(function() {
    if (this.checked) {
      $('#end_date_div').toggle();
      $('#start_date_div').toggle();
      $('#date_div').toggle();
      $('#end_date').removeAttr('required');
      $('#start_date').removeAttr('required');
      $('#date').attr('required','required');
      $("#start_date").val(null);
      $("#end_date").val(null);
    }else{
      $('#end_date_div').toggle();
      $('#start_date_div').toggle();
      $('#date_div').toggle();
      $('#end_date').attr('required','required');
      $('#start_date').attr('required','required');
      $('#date').removeAttr('required');
      $("#date").val(null);
    }
  });

  // $('#start_date').change(function() {
  //   var $start = $("#start_date").val;
  //   $("#end_date").val($start);
  // });

  $('#end_date').change(function() {
    var start = new Date($('#start_date').val());
    console.log(start)
    var end = new Date($('#end_date').val());
    console.log(end)
    console.log(start > end)
    if (start > end) {
      $("#start_date").val($("#end_date").val());
    }
  });
  $('#start_date').change(function() {
    var start = new Date($('#start_date').val());
    var end = new Date($('#end_date').val());
    if (start > end) {
      $("#end_date").val($("#start_date").val());
    }
  });
});
