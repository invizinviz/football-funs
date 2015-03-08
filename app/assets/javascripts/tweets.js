$(function(){

  var counter = 0;
  var MAX_TWEETS_DISPLAYED = 20;

  var channel = $('body').data('channel');

	var pusher = new Pusher('02abdbfcfa5036ae29ec');

	var pChannel = pusher.subscribe(channel);
       pChannel.bind('my_event', function(tweet) {

    var html = '<li class="media "><div class="media-left"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank"><img src="' + tweet.user.profile_image_url + '" class="media-object"/></a></div><div class="media-body"><h4 class="media-heading"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank">'+ tweet.user.name+'</a></h4>' + tweet.text + '</div></li>';

    $('#tweet-list').prepend(html);

    $('#tweet-list').twitter_autolink();

    var $twittercounter = $('#toggle-twitter span');

    $twittercounter.text(Number($twittercounter.text())+1);

    if(counter > MAX_TWEETS_DISPLAYED) {
      $("#tweet-list li:last-child").remove();
    } else counter++;

  });

  $('.team-timeline-tweets').twitter_autolink();



});
