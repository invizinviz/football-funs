$(function(){

  $('#toggle-official-twitter').on('click', function(){
    // $('#instagram').hide();
    $('#twitter').slideToggle("slow");
  });

  $('#toggle-official-instagram').on('click', function(){
    $('#twitter').hide();
    $('#instagram').slideDown("slow");
  });
  

  $('#toggle-twitter').on('click', function(){
    $('#send-tweet').slideToggle("slow");
  });


});