$(function(){

  $('#toggle-official-instagram').on('click', function(){
    // $('#instagram').hide();
    $('#twitter').slideToggle("slow");
    $('#instagram').slideToggle("slow");

  });

  // $('').on('click', function(){
  //   // $('#twitter').hide();
  // });
  

  $('#toggle-twitter').on('click', function(){
    $('#send-tweet').slideToggle("slow");
  });


});