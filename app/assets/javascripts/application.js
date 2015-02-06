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
  console.log('hi');

  var client = new Faye.Client('http://localhost:9292/faye');

  var subscription = client.subscribe('/tweets/new', function(message) {
    console.log(message);
  });

  console.log('new subscription: ' + subscription);

  subscription.then(function() {
    console.log('Subscription is now active!');
  });

  var publication = client.publish('/tweets/new', {text: 'Hi there'});

  publication.then(function() {
    alert('Message received by server!');
  }, function(error) {
    alert('There was a problem: ' + error.message);
  });
});