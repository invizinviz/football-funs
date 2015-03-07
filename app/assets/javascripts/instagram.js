$(function(){

  $('#toggle-official-instagram').on('click', function(){
    $('#twitter').slideToggle("slow");
    $('#instagram').slideToggle("slow");

  });

  $('#toggle-twitter').on('click', function(){
    $('#send-tweet').slideToggle("slow");
  });


  $('.new_tweet').on('submit', function(ev) {


    var message = $('#tweet_message').val();
        team_id = $('#tweet_team_id').val();

    // console.log(message);
  

    var tweet = {
                  tweet: {
                    message: message,
                    team_id: team_id
                  }
                };

   console.log(tweet);
    ev.preventDefault();


    // var body = $('#tweet_message').val();
    $.ajax({
      url: '/tweets',
      type: 'POST',
      data: tweet,
      success: function(data) {
        console.log(tweet);
        // $('#name).text(data.name);
      }
    });
  });


});