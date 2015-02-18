$(function(){
  var channel = $('body').data('channel');

  var clientSubscribe = new Faye.Client('http://54.194.244.14:8000/faye');
  // console.log(clientSubscribe);
	var pusher = new Pusher('02abdbfcfa5036ae29ec');

	 var channel = pusher.subscribe(channel);
    		channel.bind('my_event', function(tweet) {
      		console.log(tweet.message);
    //		});
  //clientSubscribe.subscribe('/tweets/' + channel, function(tweet){

    var html = '<li class="media "><div class="media-left"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank"><img src="' + tweet.user.profile_image_url + '" class="media-object"/></a></div><div class="media-body"><h4 class="media-heading"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank">'+ tweet.user.name+'</a></h4>' + tweet.text + '</div></li>';
    $('#tweet-container').prepend(html);
    $('#tweet-container').twitter_autolink();
    // $('#twitter .media-list').prepend(html);
    var $twittercounter = $('#toggle-twitter span');
    $twittercounter.text(Number($twittercounter.text())+1);
    // $('#toggle-twitter').addClass("btn btn-success");
  });

  $('.team-timeline-tweets').twitter_autolink();

});
