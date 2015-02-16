$(function(){
  $('#toggle-instagram, #toggle-official-twitter').on('click', function(){
    $('#instagram').slideToggle("slow");
    $('#twitter').slideToggle("slow");
  });

  // $('#instagram-timeline-size').hover(function(){
  //   $("#likes-comments").css("display", "block");
  // }, function(){
  //   $("#likes-comments").css("display", "none");
  // });
  
});