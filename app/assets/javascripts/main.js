$(document).ready(function() {
	init();
	animateLogo();
});

function init() {
	openView();
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