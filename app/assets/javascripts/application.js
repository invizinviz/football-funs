// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require faye
//= require_tree .

// $(function(){
  // var channel = $('body').data('channel');

  // var clientSubscribe = new Faye.Client('http://localhost:9292/faye');
  // console.log(clientSubscribe);

  // clientSubscribe.subscribe('/tweets/' + channel, function(tweet){

  //   var html = '<li class="media"><div class="media-left"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank"><img src="' + tweet.user.profile_image_url + '" class="media-object"/></a></div><div class="media-body"><h4 class="media-heading"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank">'+ tweet.user.name+'</a></h4>' + tweet.text + '</div></li>';
  //   $('#tweet-container').prepend(html);    
  //   $('#tweet-container').twitter_autolink();
  //   // $('#twitter .media-list').prepend(html);
  //   var $twittercounter = $('#toggle-twitter span');
  //   $twittercounter.text(Number($twittercounter.text())+1);
  //   // $('#toggle-twitter').addClass("btn btn-success");
  // });

  // $('#toggle-instagram, #toggle-official-twitter').on('click', function(){
  //   $('#instagram').slideToggle("slow");
  //   $('#twitter').slideToggle("slow");
  // });

  // $(".team-timeline-tweets").twitter_autolink();

  // $('#tweet-container').onePageNav({
  //          currentClass: 'active',
  //          changeHash: true,
  //          scrollSpeed: 1200
  //          });

// });

