$(function(){
  var channel = $('body').data('channel');

  // var clientSubscribe = new Faye.Client('http://54.194.244.14:8000/faye');

	var pusher = new Pusher('02abdbfcfa5036ae29ec');

	var pChannel = pusher.subscribe(channel);
       pChannel.bind('my_event', function(tweet) {

    var html = '<li class="media "><div class="media-left"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank"><img src="' + tweet.user.profile_image_url + '" class="media-object"/></a></div><div class="media-body"><h4 class="media-heading"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank">'+ tweet.user.name+'</a></h4>' + tweet.text + '</div></li>';

    $('#tweet-container').prepend(html);

    $('#tweet-container').twitter_autolink();

    var $twittercounter = $('#toggle-twitter span');

    $twittercounter.text(Number($twittercounter.text())+1);
    
  });

  $('.team-timeline-tweets').twitter_autolink();

});
