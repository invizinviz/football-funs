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
//= require turbolinks
//= require faye
//= require_tree .

$(function(){

  var chelseafc = new Faye.Client('http://localhost:9292/faye');
  chelseafc.subscribe('/tweets/chelsea', function(tweet) {
    console.log('chelsea');
    var html = '<div class="row"><div class="col-md-6 col-md-offset-3 tweet"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank"><img src="' + tweet.user.profile_image_url + '" class="avatar pull-left"/></a><div class="names"><span class="full-name">' + tweet.user.name + ' </span><span class="username">@' +tweet.user.screen_name + '</span></div><div class="contents"><span class="text">' + tweet.text + '</span></div></div></div>';
     $('#tweet-container-chelsea').prepend(html);
  });

  var arsenalfc = new Faye.Client('http://localhost:9292/faye');
  arsenalfc.subscribe('/tweets/arsenal', function(tweet){
    console.log('ars');
    var html = '<div class="row"><div class="col-md-6 col-md-offset-3 tweet"><a href="https://twitter.com/'+tweet.user.screen_name+'" target="_blank"><img src="' + tweet.user.profile_image_url + '" class="avatar pull-left"/></a><div class="names"><span class="full-name">' + tweet.user.name + ' </span><span class="username">@' +tweet.user.screen_name + '</span></div><div class="contents"><span class="text">' + tweet.text + '</span></div></div></div>';
     $('#tweet-container-arcenal').prepend(html);
  });

});