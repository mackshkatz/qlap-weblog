$(document).ready(function() {
	init();
});

function init() {
	openView();
	animateLogo();
	lastTweet();
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
	$.ajax({
		url: 'https://api.twitter.com/1/statuses/user_timeline.json?screen_name=maxjkatz&include_entities=true&count=1',
		success: success,
		error: error,
		dataType: 'jsonp'
	});
}