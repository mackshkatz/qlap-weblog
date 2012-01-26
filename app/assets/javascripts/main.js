$(document).ready(function() {
	init();
});

function init() {
	openView();
	animateLogo();
	lastTweet();
	konamiCode();
}

function openView() {
	$('.content').fadeIn('slow');
}

function animateLogo() {
	$('h1').hover(
		function() {
			$(this).animate({
				top: '-=10'
			});
		},
		function() { 
			$(this).animate({
				top: '+=10'
			});
		}
	)
}

var success = function(data) {
	$('.content').append('<p class="last-tweet">' + data[0].text + '</p>');
};
var error = function(error) {
	console.log(error);
};
function lastTweet() {
	setInterval(	
		$.ajax({
			url: 'https://api.twitter.com/1/statuses/user_timeline.json?screen_name=maxjkatz&include_entities=true&count=1',
			success: success,
			error: error,
			dataType: 'jsonp'
		}) , 600000
	);
}

// my konami code:
// 8675309
var final_string = '';
window.final_string = final_string;
function konamiCode() {
  $(window).keypress(function(e) {
    var key = e.keyCode;
    console.log('key: ',key);
    final_string += String(key);
    console.log('final string: ',final_string);
    if (final_string == "56545553514857") {
        alert("konami!");
    } 
  });
}