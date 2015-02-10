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

$(function(){

  // var teamCannel = $('#tweet-container').data("team");

  var clientSubscribe = new Faye.Client('http://localhost:9292/faye');
  // console.log(clientSubscribe);

  clientSubscribe.subscribe('/tweets/apl', function(tweet){
    // console.log(tweet);
    var html = '<div class="row well"><div class="tweet"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank"><img src="' + tweet.user.profile_image_url + '" class="avatar pull-left"/></a><div class="names"><span class="full-name">' + tweet.user.name + ' </span><span class="username">@' +tweet.user.screen_name + '</span></div><div class="contents"><span class="text">' + tweet.text + '</span></div></div></div>';
        $('#tweet-container').prepend(html);
  } );

});