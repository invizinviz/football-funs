$(function(){

  $('#toggle-official-twitter').on('click', function(){
    $('#twitter').slideToggle("slow");
  });
  

  $('#toggle-twitter').on('click', function(){
    $('#send-tweet').slideToggle("slow");
  });
});